From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 12:01:38 +0200
Subject: [Buildroot] [git commit branch/next] perl-sys-mmap: new package
Message-ID: <20180813095522.EE0798CA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad4b3569161d4dcc3a5477fc4775ffd9d209e81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/perl-sys-mmap/Config.in          | 10 ++++++++++
 package/perl-sys-mmap/perl-sys-mmap.hash |  7 +++++++
 package/perl-sys-mmap/perl-sys-mmap.mk   | 13 +++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 64864f3788..4379b24da1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -496,6 +496,7 @@ F:	package/perl-number-bytes-human/
 F:	package/perl-params-util/
 F:	package/perl-sub-install/
 F:	package/perl-sys-meminfo/
+F:	package/perl-sys-mmap/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 02775a5129..a50eb2d561 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -723,6 +723,7 @@ menu "Perl libraries/modules"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
+	source "package/perl-sys-mmap/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
diff --git a/package/perl-sys-mmap/Config.in b/package/perl-sys-mmap/Config.in
new file mode 100644
index 0000000000..56725f2faa
--- /dev/null
+++ b/package/perl-sys-mmap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_SYS_MMAP
+	bool "perl-sys-mmap"
+	depends on !BR2_STATIC_LIBS
+	help
+	  uses mmap to map in a file as a Perl variable
+
+	  https://metacpan.org/release/Sys-Mmap
+
+comment "perl-sys-mmap needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-sys-mmap/perl-sys-mmap.hash b/package/perl-sys-mmap/perl-sys-mmap.hash
new file mode 100644
index 0000000000..caeea3d965
--- /dev/null
+++ b/package/perl-sys-mmap/perl-sys-mmap.hash
@@ -0,0 +1,7 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    990c9106a88dc843035f7bcb109e6c0e Sys-Mmap-0.19.tar.gz
+sha256 09295e25cc9b0599d9009d19b2be89fcecaecc62ce594f873d7f70d7c10900fa Sys-Mmap-0.19.tar.gz
+
+# computed by scancpan
+sha256 51c144e9a67644fa8eea0ea63dedb4e837587305b22f073eb5e279e39e7325a8 Copying
+sha256 4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c Artistic
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
new file mode 100644
index 0000000000..ed2ca79b02
--- /dev/null
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-sys-mmap
+#
+################################################################################
+
+PERL_SYS_MMAP_VERSION = 0.19
+PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
+PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
+PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
+PERL_SYS_MMAP_LICENSE_FILES = Copying Artistic
+
+$(eval $(perl-package))
