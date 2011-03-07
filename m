From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:38 +0100
Subject: [Buildroot] [PATCH 5/9] Rename BR2_ENABLE_LOCALE_{PURGE,
	WHITELIST} to BR2_LOCALE_{PURGE, WHITELIST}
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <99064393819295f960348f260e17d37ebcd8ee18.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                      |    6 +++---
 toolchain/toolchain-common.in |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 7ae3787..200f9d5 100644
--- a/Makefile
+++ b/Makefile
@@ -327,7 +327,7 @@ include linux/linux.mk
 
 TARGETS+=target-finalize
 
-ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+ifeq ($(BR2_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
@@ -479,9 +479,9 @@ ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
 endif
 
-ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+ifeq ($(BR2_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
-LOCALE_NOPURGE=$(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
+LOCALE_NOPURGE=$(call qstrip,$(BR2_LOCALE_WHITELIST))
 
 target-purgelocales:
 	rm -f $(LOCALE_WHITELIST)
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index acabb02..837237c 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -29,16 +29,16 @@ config BR2_INSTALL_LIBSTDCPP
 config BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
-config BR2_ENABLE_LOCALE_PURGE
+config BR2_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
 	  Explicitly specify what locales to install on target. If N
 	  then all locales supported by packages are installed.
 
-config BR2_ENABLE_LOCALE_WHITELIST
+config BR2_LOCALE_WHITELIST
 	string "Locales to keep"
 	default "C en_US de fr"
-	depends on BR2_ENABLE_LOCALE_PURGE
+	depends on BR2_LOCALE_PURGE
 	help
 	  Whitespace seperated list of locales to allow on target.
 	  Locales not listed here will be removed from the target.
-- 
1.7.0.4
