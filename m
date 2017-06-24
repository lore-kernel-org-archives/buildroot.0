From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Jun 2017 09:35:14 +0200
Subject: [Buildroot] [PATCH 2/2] package/x264: needs host-nasm instead of
	host-yasm
In-Reply-To: <20170624073514.20975-1-bernd.kuhls@t-online.de>
References: <20170624073514.20975-1-bernd.kuhls@t-online.de>
Message-ID: <20170624073514.20975-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream switched to nasm >= 2.13
http://git.videolan.org/?p=x264.git;a=commitdiff;h=d2b5f4873e2147452a723b61b14f030b2ee760a5#patch2

Fixes
http://autobuild.buildroot.net/results/3f5/3f5759a1fd6aaa0394229cdfce278752d4a01ddc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/x264.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 69ec4ccea..a5a967b3f 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -13,9 +13,9 @@ X264_INSTALL_STAGING = YES
 X264_CONF_OPTS = --disable-avs --disable-lavf --disable-swscale
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-# yasm needed for assembly files
-X264_DEPENDENCIES += host-yasm
-X264_CONF_ENV += AS="$(HOST_DIR)/usr/bin/yasm"
+# nasm needed for assembly files
+X264_DEPENDENCIES += host-nasm
+X264_CONF_ENV += AS="$(HOST_DIR)/usr/bin/nasm"
 else ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_aarch64),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed
-- 
2.11.0
