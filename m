From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 09:19:18 +0100
Subject: [Buildroot] [git commit] gstreamer{,
	1}: fix unaligned access detection for microblaze
Message-ID: <20140227082146.D794E9B1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f623e4696474357075279769548a13a37ebbd0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f49/f4914bb3999c8a7a0c0a2afdac5de40fb9058372/

Similar to the existing handling for avr32 and xtensa. Also add it for
gstreamer1 for good measure as it was missing there as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk    |    2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 0667e38..4696876 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index cf2a86d..fe158cf 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -14,7 +14,7 @@ GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
