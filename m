From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:58 -0700
Subject: [Buildroot] [PATCH 14/18] perl-params-util: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-15-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                              |  1 +
 package/perl-params-util/Config.in             | 10 ++++++++++
 package/perl-params-util/perl-params-util.hash |  6 ++++++
 package/perl-params-util/perl-params-util.mk   | 13 +++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/perl-params-util/Config.in
 create mode 100644 package/perl-params-util/perl-params-util.hash
 create mode 100644 package/perl-params-util/perl-params-util.mk

diff --git a/package/Config.in b/package/Config.in
index 6410a5b233..fece804e81 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -720,6 +720,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-telnet/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-number-bytes-human/Config.in"
+	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-timedate/Config.in"
diff --git a/package/perl-params-util/Config.in b/package/perl-params-util/Config.in
new file mode 100644
index 0000000000..b155899b06
--- /dev/null
+++ b/package/perl-params-util/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_PARAMS_UTIL
+	bool "perl-params-util"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Simple, compact and correct param-checking functions
+
+	  https://metacpan.org/release/Params-Util
+
+comment "perl-params-util needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-params-util/perl-params-util.hash b/package/perl-params-util/perl-params-util.hash
new file mode 100644
index 0000000000..0c247ebfe5
--- /dev/null
+++ b/package/perl-params-util/perl-params-util.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    02db120c0eef87aae1830cc62bdec37b Params-Util-1.07.tar.gz
+sha256 30f1ec3f2cf9ff66ae96f973333f23c5f558915bb6266881eac7423f52d7c76c Params-Util-1.07.tar.gz
+
+# computed by scancpan
+sha256 71b5fb95de1ba013a517c926feaa2a7d0fb0e8f132818e8529e0da5ec01187cd LICENSE
diff --git a/package/perl-params-util/perl-params-util.mk b/package/perl-params-util/perl-params-util.mk
new file mode 100644
index 0000000000..71868ddff4
--- /dev/null
+++ b/package/perl-params-util/perl-params-util.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-params-util
+#
+################################################################################
+
+PERL_PARAMS_UTIL_VERSION = 1.07
+PERL_PARAMS_UTIL_SOURCE = Params-Util-$(PERL_PARAMS_UTIL_VERSION).tar.gz
+PERL_PARAMS_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
+PERL_PARAMS_UTIL_LICENSE = Artistic or GPL-1.0+
+PERL_PARAMS_UTIL_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
