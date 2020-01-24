From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jan 2020 18:11:05 +0100
Subject: [Buildroot] [PATCH 4/6] package/perl-sys-cpu: bump to version 0.61
In-Reply-To: <20200124171107.26086-1-francois.perrad@gadz.org>
References: <20200124171107.26086-1-francois.perrad@gadz.org>
Message-ID: <20200124171107.26086-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-remove-extraneous-include.patch           | 14 +++++++-------
 package/perl-sys-cpu/perl-sys-cpu.hash             |  2 +-
 package/perl-sys-cpu/perl-sys-cpu.mk               |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/perl-sys-cpu/0001-remove-extraneous-include.patch b/package/perl-sys-cpu/0001-remove-extraneous-include.patch
index eb7d8f76a..885b64410 100644
--- a/package/perl-sys-cpu/0001-remove-extraneous-include.patch
+++ b/package/perl-sys-cpu/0001-remove-extraneous-include.patch
@@ -11,10 +11,10 @@ Index: b/CPU.xs
 --- a/CPU.xs
 +++ b/CPU.xs
 @@ -24,7 +24,6 @@
-  #include <winreg.h>
- #else                /* other (try unix) */
-  #include <unistd.h>
-- #include <sys/unistd.h>
- #endif
- #if defined(__sun) || defined(__sun__) 
-  #include <sys/processor.h>
+  #include <winreg.h>
+ #else                /* other (try unix) */
+  #include <unistd.h>
+- #include <sys/unistd.h>
+ #endif
+ #if defined(__sun) || defined(__sun__)
+  #include <sys/processor.h>
diff --git a/package/perl-sys-cpu/perl-sys-cpu.hash b/package/perl-sys-cpu/perl-sys-cpu.hash
index 0977606b1..933a1bd80 100644
--- a/package/perl-sys-cpu/perl-sys-cpu.hash
+++ b/package/perl-sys-cpu/perl-sys-cpu.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 ca0ec47ab24070e3040e5075337cfc69721362d9bef50f6992072efe644d4d26  Sys-CPU-0.52.tar.gz
+sha256 250a86b79c231001c4ae71d2f66428092a4fbb2070971acafd471aa49739c9e4  Sys-CPU-0.61.tar.gz
diff --git a/package/perl-sys-cpu/perl-sys-cpu.mk b/package/perl-sys-cpu/perl-sys-cpu.mk
index 8402bef8f..013de1b0d 100644
--- a/package/perl-sys-cpu/perl-sys-cpu.mk
+++ b/package/perl-sys-cpu/perl-sys-cpu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_SYS_CPU_VERSION = 0.52
+PERL_SYS_CPU_VERSION = 0.61
 PERL_SYS_CPU_SOURCE = Sys-CPU-$(PERL_SYS_CPU_VERSION).tar.gz
-PERL_SYS_CPU_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MK/MKODERER
+PERL_SYS_CPU_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MZ/MZSANFORD
 PERL_SYS_CPU_LICENSE = Artistic or GPL-1.0+
 PERL_SYS_CPU_LICENSE_FILES = README
 
-- 
2.20.1
