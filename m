From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 17:21:53 -0300
Subject: [Buildroot] [PATCH] configs/{ea3250, fdi3250,
	phy3250}: lock down kernel headers version
Message-ID: <1360182113-23743-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update {ea3250,fdi3250,phy3250}_defconfig to lock down kernel headers to
an appropiate version.
Otherwise the target is building with, at the moment of this writing,
version 3.7 headers and a 2.6.34 kernel which usually isn't wise.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/ea3250_defconfig  | 4 ++++
 configs/fdi3250_defconfig | 4 ++++
 configs/phy3250_defconfig | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
index 9cd7b34..2574dde 100644
--- a/configs/ea3250_defconfig
+++ b/configs/ea3250_defconfig
@@ -11,6 +11,10 @@ BR2_ARM_EABI=y
 # that will compile a kernel with ethernet working correctly
 BR2_GCC_VERSION_4_3_X=y
 
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
 
 #
 # Host utilities
diff --git a/configs/fdi3250_defconfig b/configs/fdi3250_defconfig
index 1fd0b05..b1c6684 100644
--- a/configs/fdi3250_defconfig
+++ b/configs/fdi3250_defconfig
@@ -11,6 +11,10 @@ BR2_ARM_EABI=y
 # that will compile a kernel with ethernet working correctly
 BR2_GCC_VERSION_4_3_X=y
 
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
 
 #
 # Host utilities
diff --git a/configs/phy3250_defconfig b/configs/phy3250_defconfig
index bc17d5c..e95546f 100644
--- a/configs/phy3250_defconfig
+++ b/configs/phy3250_defconfig
@@ -11,6 +11,10 @@ BR2_ARM_EABI=y
 # that will compile a kernel with ethernet working correctly
 BR2_GCC_VERSION_4_3_X=y
 
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
 
 #
 # Host utilities
-- 
1.7.12.4
