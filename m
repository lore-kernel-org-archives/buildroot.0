From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 23:19:37 +0200
Subject: [Buildroot] [git commit] linux-ext: add fbtft hint for linux kernel
	>= v4.0
Message-ID: <20150927211944.A7FC580812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b4ac9b9855eaa4f9f9e5126ac6242275d3ce604
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v4.0 the fbtft drivers are included in the linux kernel
staging area.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.ext.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
