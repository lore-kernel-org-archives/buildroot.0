From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:52:04 +0100
Subject: [Buildroot] [git commit] vo-aacenc: use the BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.9518DB1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=352bb9269504df2e460b4fa179bffb65b0c00daf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The vo-aacenc package has an option to enable ARMv5 optimizations. It
was enabled based on per ARM core options, but now that we have per
ARM architecture options, this commit switches to using them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vo-aacenc/vo-aacenc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
index e35ac42..23d7e62 100644
--- a/package/vo-aacenc/vo-aacenc.mk
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -26,7 +26,7 @@ VO_AACENC_CFLAGS += -mfpu=neon
 else
 VO_AACENC_CONF_OPTS += --disable-armv7neon
 
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),)
+ifeq ($(BR2_ARM_CPU_ARMV4),)
 VO_AACENC_CONF_OPTS += --enable-armv5e
 else
 VO_AACENC_CONF_OPTS += --disable-armv5e
