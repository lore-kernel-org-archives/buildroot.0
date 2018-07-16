From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:37 +0200
Subject: [Buildroot] [git commit] perl-net-snmp: new package
Message-ID: <20180716113231.D53EA8447D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b78743d1513858489daaa72e169869675208351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/perl-net-snmp/Config.in          |  6 ++++++
 package/perl-net-snmp/perl-net-snmp.hash |  6 ++++++
 package/perl-net-snmp/perl-net-snmp.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c6eaffb09..df88e516db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1928,6 +1928,7 @@ F:	package/perl-digest-md5/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-net-ping/
+F:	package/perl-net-snmp/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index ace997cdb8..302a01c0e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
 	source "package/perl-net-ping/Config.in"
+	source "package/perl-net-snmp/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
diff --git a/package/perl-net-snmp/Config.in b/package/perl-net-snmp/Config.in
new file mode 100644
index 0000000000..e509292cd8
--- /dev/null
+++ b/package/perl-net-snmp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_NET_SNMP
+	bool "perl-net-snmp"
+	help
+	  Object oriented interface to SNMP
+
+	  https://metacpan.org/release/Net-SNMP
diff --git a/package/perl-net-snmp/perl-net-snmp.hash b/package/perl-net-snmp/perl-net-snmp.hash
new file mode 100644
index 0000000000..0b162e6dcc
--- /dev/null
+++ b/package/perl-net-snmp/perl-net-snmp.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    6137f04f9942d703f66179f890e3d096 Net-SNMP-v6.0.1.tar.gz
+sha256 14c37bc1cbb3f3cdc7d6c13e0f27a859f14cdcfd5ea54a0467a88bc259b0b741 Net-SNMP-v6.0.1.tar.gz
+
+# computed by scancpan
+sha256 a038159be54a2807dc48e2b946514d59fceab6737d5461d93d55297a98e6e24e LICENSE
diff --git a/package/perl-net-snmp/perl-net-snmp.mk b/package/perl-net-snmp/perl-net-snmp.mk
new file mode 100644
index 0000000000..a9daa13d7f
--- /dev/null
+++ b/package/perl-net-snmp/perl-net-snmp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-net-snmp
+#
+################################################################################
+
+PERL_NET_SNMP_VERSION = v6.0.1
+PERL_NET_SNMP_SOURCE = Net-SNMP-$(PERL_NET_SNMP_VERSION).tar.gz
+PERL_NET_SNMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DT/DTOWN
+PERL_NET_SNMP_DEPENDENCIES = host-perl-module-build
+PERL_NET_SNMP_LICENSE = Artistic or GPL-1.0+
+PERL_NET_SNMP_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
