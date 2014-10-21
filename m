From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:04 +0200
Subject: [Buildroot] [PATCH v2 17/30] x264: use the BR2_ARM_CPU_ARMV7A option
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.0.0
