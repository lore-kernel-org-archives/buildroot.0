From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:08:16 +0200
Subject: [Buildroot] [git commit] package/perl-encode-detect: new package
Message-ID: <20150426100841.85FFC80E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eadface39e0cf57e3fa48c4c2b5d3df727d1881b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rewrap Config.in help text
 - fix license, it's MPL-1.1, not 'open_source'.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/perl-encode-detect/Config.in               |   12 ++++++++++++
 package/perl-encode-detect/perl-encode-detect.hash |    3 +++
 package/perl-encode-detect/perl-encode-detect.mk   |   14 ++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6ca4276..da185be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ menu "Perl libraries/modules"
 	source "package/perl-db-file/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
+	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
 	source "package/perl-file-util/Config.in"
diff --git a/package/perl-encode-detect/Config.in b/package/perl-encode-detect/Config.in
new file mode 100644
index 0000000..63ea432
--- /dev/null
+++ b/package/perl-encode-detect/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_ENCODE_DETECT
+	bool "perl-encode-detect"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  An Encode::Encoding subclass that detects the encoding of
+	  data.
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
index 0000000..de9c2ff
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
+PERL_ENCODE_DETECT_LICENSE = MPL-1.1
+PERL_ENCODE_DETECT_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
