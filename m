From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:51 -0000
Subject: [Buildroot] [git commit] perl-class-std-fast: new package
Message-ID: <20180907111457.88CE48019E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b434dc40baf9836331fbafd1e91aa602f90e37ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/perl-class-std-fast/Config.in                |  7 +++++++
 package/perl-class-std-fast/perl-class-std-fast.hash |  6 ++++++
 package/perl-class-std-fast/perl-class-std-fast.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4379b24da1..46c0f06637 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -484,6 +484,7 @@ N:	Christopher McCrory <chrismcc@gmail.com>
 F:	package/perl-appconfig/
 F:	package/perl-astro-suntime/
 F:	package/perl-class-std/
+F:	package/perl-class-std-fast/
 F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
 F:	package/perl-dbi/
diff --git a/package/Config.in b/package/Config.in
index a50eb2d561..858b781251 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -668,6 +668,7 @@ menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-class-std/Config.in"
+	source "package/perl-class-std-fast/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
diff --git a/package/perl-class-std-fast/Config.in b/package/perl-class-std-fast/Config.in
new file mode 100644
index 0000000000..10b1e0d786
--- /dev/null
+++ b/package/perl-class-std-fast/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_CLASS_STD_FAST
+	bool "perl-class-std-fast"
+	select BR2_PACKAGE_PERL_CLASS_STD
+	help
+	  faster but less secure than Class::Std
+
+	  https://metacpan.org/release/Class-Std-Fast
diff --git a/package/perl-class-std-fast/perl-class-std-fast.hash b/package/perl-class-std-fast/perl-class-std-fast.hash
new file mode 100644
index 0000000000..07e830a5ee
--- /dev/null
+++ b/package/perl-class-std-fast/perl-class-std-fast.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d06d084cb84f295b0aabf2eee78ef746 Class-Std-Fast-v0.0.8.tar.gz
+sha256 1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780 Class-Std-Fast-v0.0.8.tar.gz
+
+# computed by scancpan
+sha256 aa1ab90c498aee078076e9a1f83e5f14bbfd841509582795ab5a9571428c0c38 README
diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
new file mode 100644
index 0000000000..7c008622dd
--- /dev/null
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-class-std-fast
+#
+################################################################################
+
+PERL_CLASS_STD_FAST_VERSION = v0.0.8
+PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
+PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
+PERL_CLASS_STD_FAST_DEPENDENCIES = perl-class-std
+PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
+PERL_CLASS_STD_FAST_LICENSE_FILES = README
+
+$(eval $(perl-package))
