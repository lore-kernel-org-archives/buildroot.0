From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 29 Dec 2013 13:30:55 +0200
Subject: [Buildroot] [PATCH] gstreamer1: fix xtensa configure
Message-ID: <41082d0245c6e32e5aea85b4879057c4f2b47665.1388316655.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable unaligned access to avoid configure run test.

Fixes
http://autobuild.buildroot.net/results/1fb/1fb5bde77ea84f13fe8db7dedda5b8a29671b939/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 82b15bc..40102b2 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -14,7 +14,7 @@ GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
-- 
1.8.5.2
