From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:33:01 +0100
Subject: [Buildroot] [git commit] mxs-bootloader: Barebox entry point symbol
	changed in 2012.08
Message-ID: <20121117083404.6FE6499ECF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f72b561789032b69e7fa62479abd34259731605c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/mxs-bootlets/barebox_ivt.bd |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
