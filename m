From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:57 -0700
Subject: [Buildroot] [PATCH 13/18] perl-number-bytes-human: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-14-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                                           |  1 +
 package/perl-number-bytes-human/Config.in                   |  6 ++++++
 .../perl-number-bytes-human/perl-number-bytes-human.hash    |  6 ++++++
 package/perl-number-bytes-human/perl-number-bytes-human.mk  | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-number-bytes-human/Config.in
 create mode 100644 package/perl-number-bytes-human/perl-number-bytes-human.hash
 create mode 100644 package/perl-number-bytes-human/perl-number-bytes-human.mk

diff --git a/package/Config.in b/package/Config.in
index a20dfe57d7..6410a5b233 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -719,6 +719,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-net-telnet/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
+	source "package/perl-number-bytes-human/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-timedate/Config.in"
diff --git a/package/perl-number-bytes-human/Config.in b/package/perl-number-bytes-human/Config.in
new file mode 100644
index 0000000000..ca43873d49
--- /dev/null
+++ b/package/perl-number-bytes-human/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_NUMBER_BYTES_HUMAN
+	bool "perl-number-bytes-human"
+	help
+	  Convert byte count to human readable format
+
+	  https://metacpan.org/release/Number-Bytes-Human
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.hash b/package/perl-number-bytes-human/perl-number-bytes-human.hash
new file mode 100644
index 0000000000..af7a6b65a1
--- /dev/null
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    43d2c86a55924aa71535a41de0311efd Number-Bytes-Human-0.11.tar.gz
+sha256 5fc79c49b0b40df780479c43696381343e2b6ad1fe52859f60bc65b66ebe6f2c Number-Bytes-Human-0.11.tar.gz
+
+# computed by scancpan
+sha256 d42143fe4b63cb5d488d65a44e6c55769b098ea447462ff33316b33a837b7cf9 README
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.mk b/package/perl-number-bytes-human/perl-number-bytes-human.mk
new file mode 100644
index 0000000000..e10c550eed
--- /dev/null
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-number-bytes-human
+#
+################################################################################
+
+PERL_NUMBER_BYTES_HUMAN_VERSION = 0.11
+PERL_NUMBER_BYTES_HUMAN_SOURCE = Number-Bytes-Human-$(PERL_NUMBER_BYTES_HUMAN_VERSION).tar.gz
+PERL_NUMBER_BYTES_HUMAN_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FE/FERREIRA
+PERL_NUMBER_BYTES_HUMAN_LICENSE = Artistic or GPL-1.0+
+PERL_NUMBER_BYTES_HUMAN_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.14.4
