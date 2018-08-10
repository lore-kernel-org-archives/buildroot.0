From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:15:01 -0700
Subject: [Buildroot] [PATCH 17/18] perl-sys-mmap: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-18-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                        |  1 +
 package/perl-sys-mmap/Config.in          | 10 ++++++++++
 package/perl-sys-mmap/perl-sys-mmap.hash |  7 +++++++
 package/perl-sys-mmap/perl-sys-mmap.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/perl-sys-mmap/Config.in
 create mode 100644 package/perl-sys-mmap/perl-sys-mmap.hash
 create mode 100644 package/perl-sys-mmap/perl-sys-mmap.mk

diff --git a/package/Config.in b/package/Config.in
index dd3da6ebe6..5b9c47aa79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ menu "Perl libraries/modules"
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
-- 
2.14.4
