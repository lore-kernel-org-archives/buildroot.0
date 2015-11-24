From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 22:46:10 +0100
Subject: [Buildroot] [git commit] gstreamer: fix unaligned detection for
	nios2
Message-ID: <20151124214815.5AC548042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8362d11c55468c624e1edb2c495beb56db1b9f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/874/874c4da3ca7d27551f580994e016bcbd3597a107/
http://autobuild.buildroot.net/results/f8b/f8ba30408b5ce15022792e823a0c8fd3a004fb31/
http://autobuild.buildroot.net/results/bf2/bf2f374357ed7a36f072d89ed0687c942eb1ee6d/
http://autobuild.buildroot.net/results/14a/14aaac32b92939957a9f39ac2ba8a949f9ddd22a/

Similar to how we do it for arc/xtensa/microblaze.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 1dbd66f..d1e3282 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
