From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 18:37:07 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix Linaro ARM URL
Message-ID: <1365871027-23808-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 79828fc01d92cee84f8703d25f72121f52880ee9 (toolchain-external:
update ARM Linaro toolchains) accidently broke the URL for the Linaro
2013.01 toolchain by replacing a .bz2 extension by .bz. This patch
fixes this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 5c5935c..7a7844d 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -194,7 +194,7 @@ TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2013.01/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux.tar.bz
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.02/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.02-01-20130221_linux.tar.xz
-- 
1.7.9.5
