From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:17:16 +0200
Subject: [Buildroot] [PATCH v2 21/25] package/perl-timedate: new package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                        |    1 +
 package/perl-timedate/Config.in          |    6 ++++++
 package/perl-timedate/perl-timedate.hash |    3 +++
 package/perl-timedate/perl-timedate.mk   |   13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/perl-timedate/Config.in
 create mode 100644 package/perl-timedate/perl-timedate.hash
 create mode 100644 package/perl-timedate/perl-timedate.mk

diff --git a/package/Config.in b/package/Config.in
index ad699ad..dd2fedb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -531,6 +531,7 @@ menu "Perl libraries/modules"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-time-hires/Config.in"
+	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-uri/Config.in"
 	source "package/perl-www-robotrules/Config.in"
diff --git a/package/perl-timedate/Config.in b/package/perl-timedate/Config.in
new file mode 100644
index 0000000..7ce9de1
--- /dev/null
+++ b/package/perl-timedate/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_TIMEDATE
+	bool "perl-timedate"
+	help
+	  Date formating subroutines
+
+	  https://metacpan.org/release/TimeDate
diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
new file mode 100644
index 0000000..28a9f07
--- /dev/null
+++ b/package/perl-timedate/perl-timedate.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b1d91153ac971347aee84292ed886c1c TimeDate-2.30.tar.gz
+sha256 75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86 TimeDate-2.30.tar.gz
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
new file mode 100644
index 0000000..f0c6714
--- /dev/null
+++ b/package/perl-timedate/perl-timedate.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-timedate
+#
+################################################################################
+
+PERL_TIMEDATE_VERSION = 2.30
+PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
+PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
+PERL_TIMEDATE_DEPENDENCIES = perl
+PERL_TIMEDATE_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
-- 
1.7.10.4
