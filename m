From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:05 -0700
Subject: [Buildroot] [PATCH 04/18] perl-time-parsedate: new package
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-5-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/perl-time-parsedate/Config.in                |  6 ++++++
 package/perl-time-parsedate/perl-time-parsedate.hash |  6 ++++++
 package/perl-time-parsedate/perl-time-parsedate.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/perl-time-parsedate/Config.in
 create mode 100644 package/perl-time-parsedate/perl-time-parsedate.hash
 create mode 100644 package/perl-time-parsedate/perl-time-parsedate.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 023bddbce0..105fae199c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -505,6 +505,7 @@ F:	package/perl-params-util/
 F:	package/perl-sub-install/
 F:	package/perl-sys-meminfo/
 F:	package/perl-sys-mmap/
+F:	package/perl-time-parsedate/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index f412ff673b..7629cf6c46 100644
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
index 0000000000..97d0009850
--- /dev/null
+++ b/package/perl-time-parsedate/perl-time-parsedate.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9143d075278857d21c77467d26f1603b Time-ParseDate-2015.103.tar.gz
+sha256 2c1a06235bf811813caac9eaa9daa71af758667cdf7b082cb59863220fcaeed1 Time-ParseDate-2015.103.tar.gz
+
+# computed by scancpan
+sha256 a8f6d313ecc680934da33872f69e6f4fa64ad9840b016d4d4822e952e518a964 README
diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
new file mode 100644
index 0000000000..e866e0decc
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
+PERL_TIME_PARSEDATE_LICENSE_FILES = README
+PERL_TIME_PARSEDATE_LICENSE = unknown
+
+$(eval $(perl-package))
-- 
2.14.4
