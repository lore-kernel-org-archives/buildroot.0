From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:29:36 +0200
Subject: [Buildroot] [git commit] ffmpeg: adjust ARM optimizations
Message-ID: <20130411081132.F318D9AE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=383932277e91f87bbcf473758452a5b5dec68c4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support ARM less than v3 so kill dead code.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index b018ea0..2e88b6b 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -136,7 +136,7 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_generic_arm)$(BR2_arm7tdmi)$(BR2_arm610)$(BR2_arm710)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t),y)
+ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
 FFMPEG_CONF_OPT += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s),y)
