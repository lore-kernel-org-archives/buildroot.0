From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 11:59:59 +0200
Subject: [Buildroot] [git commit branch/next] perl-sys-meminfo: new package
Message-ID: <20180813095333.8933B8A5CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=befb60b547a3339274b5b2583b5808c2e852d070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add LICENSE variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-sys-meminfo/Config.in             | 10 ++++++++++
 package/perl-sys-meminfo/perl-sys-meminfo.hash |  6 ++++++
 package/perl-sys-meminfo/perl-sys-meminfo.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9905d9dd5d..64864f3788 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -495,6 +495,7 @@ F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
 F:	package/perl-params-util/
 F:	package/perl-sub-install/
+F:	package/perl-sys-meminfo/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 3541451840..02775a5129 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -722,6 +722,7 @@ menu "Perl libraries/modules"
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
index 0000000000..43e0995aa0
--- /dev/null
+++ b/package/perl-sys-meminfo/perl-sys-meminfo.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-sys-meminfo
+#
+################################################################################
+
+PERL_SYS_MEMINFO_VERSION = 0.99
+PERL_SYS_MEMINFO_SOURCE = Sys-MemInfo-$(PERL_SYS_MEMINFO_VERSION).tar.gz
+PERL_SYS_MEMINFO_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SC/SCRESTO
+PERL_SYS_MEMINFO_LICENSE = Artistic or GPL-1.0+
+PERL_SYS_MEMINFO_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
