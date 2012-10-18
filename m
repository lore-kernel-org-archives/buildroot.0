From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 18 Oct 2012 10:02:06 +0200
Subject: [Buildroot] [PATCH] mxs-bootloader: Barebox entry point symbol
	changed in 2012.08
Message-ID: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 boot/mxs-bootlets/barebox_ivt.bd |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/mxs-bootlets/barebox_ivt.bd b/boot/mxs-bootlets/barebox_ivt.bd
index e02ddd6..0c67e9c 100644
--- a/boot/mxs-bootlets/barebox_ivt.bd
+++ b/boot/mxs-bootlets/barebox_ivt.bd
@@ -28,7 +28,7 @@ section (0) {
 	//----------------------------------------------------------
 
         load barebox;
-        load ivt (entry = barebox:exception_vectors) > 0x8000;
+        load ivt (entry = barebox:start) > 0x8000;
 	hab call 0x8000;
 
 }
-- 
1.7.9.5
