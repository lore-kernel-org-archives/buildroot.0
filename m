From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 15:48:02 +0100
Subject: [Buildroot] [git commit] gstreamer: fix unaligned detection for or1k
Message-ID: <20170218145007.DC2A78041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a97307259343fe6f0b94d04fb345a69a8008bc37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for the other niche/new architectures.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index f2bde30..cde7f8f 100644
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
