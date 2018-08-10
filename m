From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:15:00 -0700
Subject: [Buildroot] [PATCH 16/18] perl-sys-meminfo: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-17-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                              |  1 +
 package/perl-sys-meminfo/Config.in             | 10 ++++++++++
 package/perl-sys-meminfo/perl-sys-meminfo.hash |  6 ++++++
 package/perl-sys-meminfo/perl-sys-meminfo.mk   | 12 ++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-sys-meminfo/Config.in
 create mode 100644 package/perl-sys-meminfo/perl-sys-meminfo.hash
 create mode 100644 package/perl-sys-meminfo/perl-sys-meminfo.mk

diff --git a/package/Config.in b/package/Config.in
index 4f6d6dede6..dd3da6ebe6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -723,6 +723,7 @@ menu "Perl libraries/modules"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-sub-install/Config.in"
+	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
diff --git a/package/perl-sys-meminfo/Config.in b/package/perl-sys-meminfo/Config.in
new file mode 100644
index 0000000000..3e3155d6cb
--- /dev/null
+++ b/package/perl-sys-meminfo/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_SYS_MEMINFO
+	bool "perl-sys-meminfo"
+	depends on !BR2_STATIC_LIBS
+	help
+	  query the total free and used physical memory
+
+	  https://metacpan.org/release/Sys-MemInfo
+
+comment "perl-sys-meminfo needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-sys-meminfo/perl-sys-meminfo.hash b/package/perl-sys-meminfo/perl-sys-meminfo.hash
new file mode 100644
index 0000000000..207cfad2bf
--- /dev/null
+++ b/package/perl-sys-meminfo/perl-sys-meminfo.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    88f0632691d7de91cbed95ba1ff29025 Sys-MemInfo-0.99.tar.gz
+sha256 0786319d3a3a8bae5d727939244bf17e140b714f52734d5e9f627203e4cf3e3b Sys-MemInfo-0.99.tar.gz
+
+# computed by scancpan
+sha256 62854ade112a6782f476bdc7dc9603776c4e064782623d999f966dba131a15de LICENSE
diff --git a/package/perl-sys-meminfo/perl-sys-meminfo.mk b/package/perl-sys-meminfo/perl-sys-meminfo.mk
new file mode 100644
index 0000000000..ed35f411be
--- /dev/null
+++ b/package/perl-sys-meminfo/perl-sys-meminfo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-sys-meminfo
+#
+################################################################################
+
+PERL_SYS_MEMINFO_VERSION = 0.99
+PERL_SYS_MEMINFO_SOURCE = Sys-MemInfo-$(PERL_SYS_MEMINFO_VERSION).tar.gz
+PERL_SYS_MEMINFO_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SC/SCRESTO
+PERL_SYS_MEMINFO_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
