From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:13:12 +0200
Subject: [Buildroot] [git commit] perl-time-parsedate: new package
Message-ID: <20180912202007.5A2C286ED8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e90fc5f2ac9070fab3f8ea07b996b68421f2577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
[Thomas: adjust license information.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/perl-time-parsedate/Config.in                |  6 ++++++
 package/perl-time-parsedate/perl-time-parsedate.hash |  7 +++++++
 package/perl-time-parsedate/perl-time-parsedate.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b9a3e741b..5c9d7fa616 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -508,6 +508,7 @@ F:	package/perl-params-util/
 F:	package/perl-sub-install/
 F:	package/perl-sys-meminfo/
 F:	package/perl-sys-mmap/
+F:	package/perl-time-parsedate/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index b981df7879..f0a02d14a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ menu "Perl libraries/modules"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
 	source "package/perl-time-hires/Config.in"
+	source "package/perl-time-parsedate/Config.in"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-uri/Config.in"
diff --git a/package/perl-time-parsedate/Config.in b/package/perl-time-parsedate/Config.in
new file mode 100644
index 0000000000..cea5d2941e
--- /dev/null
+++ b/package/perl-time-parsedate/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_TIME_PARSEDATE
+	bool "perl-time-parsedate"
+	help
+	  Parse and format time values
+
+	  https://metacpan.org/release/Time-ParseDate
diff --git a/package/perl-time-parsedate/perl-time-parsedate.hash b/package/perl-time-parsedate/perl-time-parsedate.hash
new file mode 100644
index 0000000000..39ce6b93f4
--- /dev/null
+++ b/package/perl-time-parsedate/perl-time-parsedate.hash
@@ -0,0 +1,7 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9143d075278857d21c77467d26f1603b Time-ParseDate-2015.103.tar.gz
+sha256 2c1a06235bf811813caac9eaa9daa71af758667cdf7b082cb59863220fcaeed1 Time-ParseDate-2015.103.tar.gz
+
+# locally calculated
+sha256 6d8de888d0662f75cfa3bf21b261741d5634ac9cdd8604d6173850546a3d40a9 lib/Time/JulianDay.pm
+sha256 9ae411fbaf87add414e7357417032dfedce652c393643bc5cb5b7698041a1dca lib/Time/Timezone.pm
diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
new file mode 100644
index 0000000000..39f687d402
--- /dev/null
+++ b/package/perl-time-parsedate/perl-time-parsedate.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-time-parsedate
+#
+################################################################################
+
+PERL_TIME_PARSEDATE_VERSION = 2015.103
+PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
+PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
+PERL_TIME_PARSEDATE_LICENSE = Time Parse Date License, Public Domain
+PERL_TIME_PARSEDATE_LICENSE_FILES = lib/Time/JulianDay.pm lib/Time/Timezone.pm
+
+$(eval $(perl-package))
