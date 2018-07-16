From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:39 +0200
Subject: [Buildroot] [git commit] perl-net-ssh2: new package
Message-ID: <20180716113231.E1405881FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=352ca28d2dcbb5d4c1fc4fbbbffc69aa1861f2f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/perl-net-ssh2/Config.in          | 11 +++++++++++
 package/perl-net-ssh2/perl-net-ssh2.hash |  6 ++++++
 package/perl-net-ssh2/perl-net-ssh2.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index df88e516db..f509041441 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1929,6 +1929,7 @@ F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-net-ping/
 F:	package/perl-net-snmp/
+F:	package/perl-net-ssh2/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 302a01c0e7..40547760fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -702,6 +702,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-http/Config.in"
 	source "package/perl-net-ping/Config.in"
 	source "package/perl-net-snmp/Config.in"
+	source "package/perl-net-ssh2/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
diff --git a/package/perl-net-ssh2/Config.in b/package/perl-net-ssh2/Config.in
new file mode 100644
index 0000000000..07c42ee5b1
--- /dev/null
+++ b/package/perl-net-ssh2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_NET_SSH2
+	bool "perl-net-ssh2"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBSSH2
+	help
+	  Support for the SSH 2 protocol via libssh2.
+
+	  https://metacpan.org/release/Net-SSH2
+
+comment "perl-net-ssh2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
new file mode 100644
index 0000000000..7a84949a6e
--- /dev/null
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    94ed21d4557a6bbc3cb6bfd7c3479ef0 Net-SSH2-0.69.tar.gz
+sha256 2fc85e1434b8a6e77142d85e3cea5a081ca71da5d02c4212b9970d3a3924baa6 Net-SSH2-0.69.tar.gz
+
+# computed by scancpan
+sha256 6db904d7c8127a33df4666961088c97586c24644a4980dc50d0676ef4c0509f7 README
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
new file mode 100644
index 0000000000..6d84deb284
--- /dev/null
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-net-ssh2
+#
+################################################################################
+
+PERL_NET_SSH2_VERSION = 0.69
+PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
+PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
+PERL_NET_SSH2_LICENSE_FILES = README
+PERL_NET_SSH2_DEPENDENCIES = libssh2
+
+$(eval $(perl-package))
