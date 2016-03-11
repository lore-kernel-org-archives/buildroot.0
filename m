From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:16 +0100
Subject: [Buildroot] [PATCH 8/9 v2] package/uclibc: use the generic help
	rules
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <88a0bf742e1fca93763c8620b6a957eb8da99597.1457717002.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that the uclibc-menuconfig rule was guarded behind
BR2_TOOLCHAIN_BUILDROOT, which is wrong ince we can build glibc or musl
toolchains too...

This is de facto fixed by moving the help text to the uClibc package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                 | 3 ---
 package/uclibc/uclibc.mk | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ca7a02e..c0f8701 100644
--- a/Makefile
+++ b/Makefile
@@ -935,9 +935,6 @@ help-internal:
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
 	@$(call print-help,$(PACKAGE_HELP))
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
-endif
 ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-menuconfig     - Run barebox menuconfig'
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 200de04..c685828 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,6 +11,8 @@ UCLIBC_LICENSE = LGPLv2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
 UCLIBC_INSTALL_STAGING = YES
 
+UCLIBC_HELP = "uclibc-menuconfig : Run uClibc menuconfig"
+
 # uclibc is part of the toolchain so disable the toolchain dependency
 UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
1.9.1
