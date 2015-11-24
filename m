From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 22:46:10 +0100
Subject: [Buildroot] [git commit] gstreamer1: fix unaligned detection for
	nios2
Message-ID: <20151124214817.CFC637FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=caca64ed5ffe62055b13326a62c9bd7605f7ad7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/cc6/cc6a6cab4f8c405941a71c6665a7dc2e34c39cb9/
http://autobuild.buildroot.net/results/2a3/2a350ac8be87a25d7f87f240943c816932f80a14/

Similar to how we do it for arc/xtensa/microblaze.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 526b0ec..d5982f9 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -14,7 +14,7 @@ GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
