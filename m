From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 10:25:48 +0100
Subject: [Buildroot] [PATCH 1/3] gstreamer: fix unaligned detection for or1k
Message-ID: <20170218092550.29810-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to how we do it for the other niche/new architectures.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index f2bde30d2..cde7f8f62 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -15,7 +15,7 @@ GSTREAMER_LICENSE_FILES = COPYING
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2),y)
+ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2)$(BR2_or1k),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
-- 
2.11.0
