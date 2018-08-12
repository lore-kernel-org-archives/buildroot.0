From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:13:13 +0200
Subject: [Buildroot] [git commit branch/next] perl-astro-suntime: new package
Message-ID: <20180812210706.3FE968C899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdda32a0087f3733b19f237cba5aded03d7d0376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: use SPDX tag for license.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/perl-astro-suntime/Config.in               |  6 ++++++
 package/perl-astro-suntime/perl-astro-suntime.hash |  6 ++++++
 package/perl-astro-suntime/perl-astro-suntime.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b0af622c4..a7530b312d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -482,6 +482,7 @@ F:	package/targetcli-fb/
 
 N:	Christopher McCrory <chrismcc@gmail.com>
 F:	package/perl-appconfig/
+F:	package/perl-astro-suntime/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index d3b7c5b0d7..1092c692c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -666,6 +666,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
+	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
diff --git a/package/perl-astro-suntime/Config.in b/package/perl-astro-suntime/Config.in
new file mode 100644
index 0000000000..22e2cb1aa2
--- /dev/null
+++ b/package/perl-astro-suntime/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_ASTRO_SUNTIME
+	bool "perl-astro-suntime"
+	help
+	  A functional module for calculating sunrise/sunset times
+
+	  https://metacpan.org/release/Astro-SunTime
diff --git a/package/perl-astro-suntime/perl-astro-suntime.hash b/package/perl-astro-suntime/perl-astro-suntime.hash
new file mode 100644
index 0000000000..e75293d4fb
--- /dev/null
+++ b/package/perl-astro-suntime/perl-astro-suntime.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    42cb8c94de8a111ed652196925c22a45 Astro-SunTime-0.06.tar.gz
+sha256 b4a44fddfc055cc42ee67bfd8939354793da7512ea04f30578d42dc6a701112a Astro-SunTime-0.06.tar.gz
+
+# computed by scancpan
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
diff --git a/package/perl-astro-suntime/perl-astro-suntime.mk b/package/perl-astro-suntime/perl-astro-suntime.mk
new file mode 100644
index 0000000000..3bd421eec5
--- /dev/null
+++ b/package/perl-astro-suntime/perl-astro-suntime.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-astro-suntime
+#
+################################################################################
+
+PERL_ASTRO_SUNTIME_VERSION = 0.06
+PERL_ASTRO_SUNTIME_SOURCE = Astro-SunTime-$(PERL_ASTRO_SUNTIME_VERSION).tar.gz
+PERL_ASTRO_SUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
+PERL_ASTRO_SUNTIME_DEPENDENCIES = host-perl-module-build
+PERL_ASTRO_SUNTIME_LICENSE = GPL-3.0
+PERL_ASTRO_SUNTIME_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
