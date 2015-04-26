From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 11:37:15 +0200
Subject: [Buildroot] [PATCH v2 2/6] package/perl-encode-detect: new package
In-Reply-To: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430041039-13905-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
v2: depends on c++

 package/Config.in                                  |    1 +
 package/perl-encode-detect/Config.in               |   11 +++++++++++
 package/perl-encode-detect/perl-encode-detect.hash |    3 +++
 package/perl-encode-detect/perl-encode-detect.mk   |   14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-encode-detect/Config.in
 create mode 100644 package/perl-encode-detect/perl-encode-detect.hash
 create mode 100644 package/perl-encode-detect/perl-encode-detect.mk

diff --git a/package/Config.in b/package/Config.in
index fadb050..d2ee5a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,7 @@ menu "Perl libraries/modules"
 	source "package/perl-db_file/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
+	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
 	source "package/perl-file-util/Config.in"
diff --git a/package/perl-encode-detect/Config.in b/package/perl-encode-detect/Config.in
new file mode 100644
index 0000000..049eae0
--- /dev/null
+++ b/package/perl-encode-detect/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_ENCODE_DETECT
+	bool "perl-encode-detect"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  An Encode::Encoding subclass that detects the encoding of data
+
+	  https://metacpan.org/release/Encode-Detect
+
+comment "perl-encode-detect needs a toolchain w/ C++, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/perl-encode-detect/perl-encode-detect.hash b/package/perl-encode-detect/perl-encode-detect.hash
new file mode 100644
index 0000000..c727a44
--- /dev/null
+++ b/package/perl-encode-detect/perl-encode-detect.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    ee9faf55d7105c97b02b8ebe590819c7 Encode-Detect-1.01.tar.gz
+sha256 834d893aa7db6ce3f158afbd0e432d6ed15a276e0940db0a74be13fd9c4bbbf1 Encode-Detect-1.01.tar.gz
diff --git a/package/perl-encode-detect/perl-encode-detect.mk b/package/perl-encode-detect/perl-encode-detect.mk
new file mode 100644
index 0000000..53b882b
--- /dev/null
+++ b/package/perl-encode-detect/perl-encode-detect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-encode-detect
+#
+################################################################################
+
+PERL_ENCODE_DETECT_VERSION = 1.01
+PERL_ENCODE_DETECT_SOURCE = Encode-Detect-$(PERL_ENCODE_DETECT_VERSION).tar.gz
+PERL_ENCODE_DETECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JG/JGMYERS
+PERL_ENCODE_DETECT_DEPENDENCIES = perl host-perl-module-build
+PERL_ENCODE_DETECT_LICENSE = open_source
+PERL_ENCODE_DETECT_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.7.10.4
