From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:35 +0200
Subject: [Buildroot] [git commit] perl-net-ping: new package
Message-ID: <20180716113231.CA4158447D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4837ab94908164c7c0f8d5f1bfe0513c5f41c79e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/perl-net-ping/Config.in          |  6 ++++++
 package/perl-net-ping/perl-net-ping.hash |  6 ++++++
 package/perl-net-ping/perl-net-ping.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0cd6b6d03a..4c6eaffb09 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1927,6 +1927,7 @@ F:	package/perl-crypt-cbc/
 F:	package/perl-digest-md5/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
+F:	package/perl-net-ping/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index fe9175b42b..ace997cdb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
+	source "package/perl-net-ping/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
diff --git a/package/perl-net-ping/Config.in b/package/perl-net-ping/Config.in
new file mode 100644
index 0000000000..a0ba7b0de1
--- /dev/null
+++ b/package/perl-net-ping/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_NET_PING
+	bool "perl-net-ping"
+	help
+	  check a remote host for reachability
+
+	  https://metacpan.org/release/Net-Ping
diff --git a/package/perl-net-ping/perl-net-ping.hash b/package/perl-net-ping/perl-net-ping.hash
new file mode 100644
index 0000000000..363d095386
--- /dev/null
+++ b/package/perl-net-ping/perl-net-ping.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    0b01ada2bc588330456924393d47ed11 Net-Ping-2.68.tar.gz
+sha256 d01ac2fcdf684c4a23a07104fbb147cfbdbda47fd5b660912124258f29afd7e3 Net-Ping-2.68.tar.gz
+
+# computed by scancpan
+sha256 eb4ad254a468a977f29849efda0183f69b7f4ede0f7123e0dd5768207ee73c58 README
diff --git a/package/perl-net-ping/perl-net-ping.mk b/package/perl-net-ping/perl-net-ping.mk
new file mode 100644
index 0000000000..3cd4cd0b47
--- /dev/null
+++ b/package/perl-net-ping/perl-net-ping.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-net-ping
+#
+################################################################################
+
+PERL_NET_PING_VERSION = 2.68
+PERL_NET_PING_SOURCE = Net-Ping-$(PERL_NET_PING_VERSION).tar.gz
+PERL_NET_PING_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
+PERL_NET_PING_LICENSE_FILES = README
+
+$(eval $(perl-package))
