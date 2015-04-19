From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:19 +0200
Subject: [Buildroot] [PATCH 06/20] perl-time-hires: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                            |    1 +
 package/perl-time-hires/Config.in            |    6 ++++++
 package/perl-time-hires/perl-time-hires.hash |    3 +++
 package/perl-time-hires/perl-time-hires.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/perl-time-hires/Config.in
 create mode 100644 package/perl-time-hires/perl-time-hires.hash
 create mode 100644 package/perl-time-hires/perl-time-hires.mk

diff --git a/package/Config.in b/package/Config.in
index 3e85dba..826bde9 100644
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
-- 
1.7.10.4
