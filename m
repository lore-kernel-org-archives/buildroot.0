From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:08:07 +0200
Subject: [Buildroot] [git commit] package/x264: needs host-nasm instead of
	host-yasm
Message-ID: <20170624100720.77CE97F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=929ddf4de92a38c90abe1dcf68c572e366a86b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream switched to nasm >= 2.13
http://git.videolan.org/?p=x264.git;a=commitdiff;h=d2b5f4873e2147452a723b61b14f030b2ee760a5#patch2

Fixes
http://autobuild.buildroot.net/results/3f5/3f5759a1fd6aaa0394229cdfce278752d4a01ddc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 69ec4cc..a5a967b 100644
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
