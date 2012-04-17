From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:13 +0200
Subject: [Buildroot] [PATCH 01/22] Remove the DATE variable
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3a993084fda775e7a2c37371225c124fd620a244.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable was only used by uboot.mk to add a #define DATE into the
U-Boot .h configuration file. But such a definition does not seem to
be used by the mainline U-Boot, so there's no reason to keep it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |    1 -
 boot/uboot/uboot.mk |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3a09417..f56c8ee 100644
--- a/Makefile
+++ b/Makefile
@@ -39,7 +39,6 @@ endif
 TOPDIR:=$(shell pwd)
 CONFIG_CONFIG_IN=Config.in
 CONFIG=support/kconfig
-DATE:=$(shell date +%Y%m%d)
 
 # Compute the full local version string so packages can use it as-is
 # Need to export it, so it can be got from environment in children (eg. mconf)
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..83696be 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -69,7 +69,6 @@ define UBOOT_CONFIGURE_CMDS
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
-	$(call insert_define,DATE,$(DATE))
 	$(call insert_define,CONFIG_LOAD_SCRIPTS,1)
 	$(call insert_define,CONFIG_IPADDR,$(BR2_TARGET_UBOOT_IPADDR))
 	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_TARGET_UBOOT_GATEWAY))
-- 
1.7.4.1
