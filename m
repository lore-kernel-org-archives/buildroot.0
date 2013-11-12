From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 14:26:15 +0100
Subject: [Buildroot] [PATCH 2/7] binutils: arc: Use git instead of website
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384262780-12743-3-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/binutils/Config.in.host |    2 +-
 package/binutils/binutils.mk    |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8f19597..77daffc 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -44,7 +44,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.23.2-arc"	if BR2_arc
+	default "0c824ba511"	if BR2_arc
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f1723b2..53364cc 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -27,7 +27,8 @@ ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 ifeq ($(BR2_arc),y)
-BINUTILS_SITE = $(BR2_ARC_SITE)
+BINUTILS_SITE = git://github.com/foss-for-synopsys-dwc-arc-processors/binutils.git
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-- 
1.7.9.5
