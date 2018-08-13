From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 11:51:22 +0200
Subject: [Buildroot] [git commit branch/next] perl-params-util: new package
Message-ID: <20180813094530.209D781245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=276c59c7c526906b1a902b919402b8d74a53d6bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-params-util/Config.in             | 10 ++++++++++
 package/perl-params-util/perl-params-util.hash |  6 ++++++
 package/perl-params-util/perl-params-util.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b55b679c3..95611897c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -493,6 +493,7 @@ F:	package/perl-io-interface/
 F:	package/perl-json-maybexs/
 F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
+F:	package/perl-params-util/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index feaa289aa0..ccc79090d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -719,6 +719,7 @@ menu "Perl libraries/modules"
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
