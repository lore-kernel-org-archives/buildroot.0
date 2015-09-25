From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 25 Sep 2015 22:30:46 +0200
Subject: [Buildroot] [PATCH v1] linux-ext: add fbtft hint for linux kernel
	>= v4.0
Message-ID: <1443213046-30680-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since v4.0 the fbtft drivers are included in the linux kernel
staging area.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 linux/Config.ext.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index ea79aa1..755c23b 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -50,7 +50,9 @@ config BR2_LINUX_KERNEL_EXT_FBTFT
 	select BR2_PACKAGE_FBTFT
 	help
 	  Linux Framebuffer drivers for small TFT LCD display modules,
-	  e.g. Adafruit PiTFT displays for Raspberry Pi.
+	  e.g. Adafruit PiTFT displays for Raspberry Pi (this extra
+	  package is only needed for linux kernels until v3.19, since
+	  v4.0 the drivers are included in the staging area).
 
 	  To enable fbtft, e.g. for Adafruit 2.8 PiTFT, enable the
 	  following kernel configurations:
-- 
2.1.4
