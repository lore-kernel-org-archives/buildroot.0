From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:17:15 +0200
Subject: [Buildroot] [PATCH v2 20/25] package/perl-digest-sha1: new package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                              |    1 +
 package/perl-digest-sha1/Config.in             |   10 ++++++++++
 package/perl-digest-sha1/perl-digest-sha1.hash |    3 +++
 package/perl-digest-sha1/perl-digest-sha1.mk   |   13 +++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-digest-sha1/Config.in
 create mode 100644 package/perl-digest-sha1/perl-digest-sha1.hash
 create mode 100644 package/perl-digest-sha1/perl-digest-sha1.mk

diff --git a/package/Config.in b/package/Config.in
index f15614e..ad699ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
+	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
 	source "package/perl-file-util/Config.in"
diff --git a/package/perl-digest-sha1/Config.in b/package/perl-digest-sha1/Config.in
new file mode 100644
index 0000000..b72a4ae
--- /dev/null
+++ b/package/perl-digest-sha1/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_DIGEST_SHA1
+	bool "perl-digest-sha1"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Perl interface to the SHA-1 algorithm
+
+	  https://metacpan.org/release/Digest-SHA1
+
+comment "perl-digest-sha1 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-digest-sha1/perl-digest-sha1.hash b/package/perl-digest-sha1/perl-digest-sha1.hash
new file mode 100644
index 0000000..d24d5ab
--- /dev/null
+++ b/package/perl-digest-sha1/perl-digest-sha1.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    bd22388f268434f2b24f64e28bf1aa35 Digest-SHA1-2.13.tar.gz
+sha256 68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc Digest-SHA1-2.13.tar.gz
diff --git a/package/perl-digest-sha1/perl-digest-sha1.mk b/package/perl-digest-sha1/perl-digest-sha1.mk
new file mode 100644
index 0000000..d3224e1
--- /dev/null
+++ b/package/perl-digest-sha1/perl-digest-sha1.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-digest-sha1
+#
+################################################################################
+
+PERL_DIGEST_SHA1_VERSION = 2.13
+PERL_DIGEST_SHA1_SOURCE = Digest-SHA1-$(PERL_DIGEST_SHA1_VERSION).tar.gz
+PERL_DIGEST_SHA1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DIGEST_SHA1_DEPENDENCIES = perl
+PERL_DIGEST_SHA1_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
-- 
1.7.10.4
