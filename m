From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:54:50 +0100
Subject: [Buildroot] [git commit] x264: use the BR2_ARM_CPU_ARMV7A option
Message-ID: <20141106233446.BAC31A3309@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe417778514594f1acb526b2842ba103961e45bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index ac8fe94..1846f04 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -14,7 +14,7 @@ X264_INSTALL_STAGING = YES
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X264_DEPENDENCIES += host-yasm
-else ifeq ($(BR2_cortex_a5)$(BR2_cortex_a7)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a12)$(BR2_cortex_a15),y)
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed
 X264_CONF_ENV += AS="$(TARGET_CC)"
