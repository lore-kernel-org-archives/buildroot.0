From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:49 +0200
Subject: [Buildroot] [PATCH 15/31] vo-aacenc: use the BR2_ARM_CPU_ARM*
	options
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The vo-aacenc package has an option to enable ARMv5 optimizations. It
was enabled based on per ARM core options, but now that we have per
ARM architecture options, this commit switches to using them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vo-aacenc/vo-aacenc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
index e35ac42..7ba8cb5 100644
--- a/package/vo-aacenc/vo-aacenc.mk
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -26,7 +26,7 @@ VO_AACENC_CFLAGS += -mfpu=neon
 else
 VO_AACENC_CONF_OPTS += --disable-armv7neon
 
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),)
+ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV4T),)
 VO_AACENC_CONF_OPTS += --enable-armv5e
 else
 VO_AACENC_CONF_OPTS += --disable-armv5e
-- 
2.0.0
