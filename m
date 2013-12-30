From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Dec 2013 12:20:32 +0200
Subject: [Buildroot] [PATCH] gstreamer: fix xtensa configure
Message-ID: <c86637e25b88581c012c8032b8a9b54cf78881c3.1388398832.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable unaligned access to avoid configure run test.

Fixes
http://autobuild.buildroot.net/results/a0c/a0cca019b0b2f33b6c2be17e5a44a807bbb4dac1/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gstreamer/gstreamer/gstreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index f7919ea..0667e38 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
-- 
1.8.5.2
