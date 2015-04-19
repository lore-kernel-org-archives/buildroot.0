From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:44 +0200
Subject: [Buildroot] [git commit] package/perl-time-hires: New package
Message-ID: <20150419114640.1EC107FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe2df45c0900f9940a526ada6f54bc9a0a286bb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/perl-time-hires/Config.in            |    6 ++++++
 package/perl-time-hires/perl-time-hires.hash |    3 +++
 package/perl-time-hires/perl-time-hires.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a6d5dcf..36a4915 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -517,6 +517,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
+	source "package/perl-time-hires/Config.in"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
diff --git a/package/perl-time-hires/Config.in b/package/perl-time-hires/Config.in
new file mode 100644
index 0000000..e10c18a
--- /dev/null
+++ b/package/perl-time-hires/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_TIME_HIRES
+	bool "perl-time-hires"
+	help
+	  High resolution alarm, sleep, gettimeofday, interval timers
+
+	  http://search.cpan.org/dist/Time-HiRes/HiRes.pm
diff --git a/package/perl-time-hires/perl-time-hires.hash b/package/perl-time-hires/perl-time-hires.hash
new file mode 100644
index 0000000..1852340
--- /dev/null
+++ b/package/perl-time-hires/perl-time-hires.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    077e5d7eda1349f98c564026603f8a0a Time-HiRes-1.9726.tar.gz
+sha256 ff662ad9b1f6c75a149db7fa1bfc7a161ac8b271e5f3980345e08b734769109e Time-HiRes-1.9726.tar.gz
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
new file mode 100644
index 0000000..79207c9
--- /dev/null
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-time-hires
+#
+################################################################################
+
+PERL_TIME_HIRES_VERSION = 1.9726
+PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
+PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
+PERL_TIME_HIRES_DEPENDENCIES = perl
+PERL_TIME_HIRES_LICENSE = Artistic or GPLv1+
+PERL_TIME_HIRES_LICENSE_FILES = README
+
+$(eval $(perl-package))
