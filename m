From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 18 Nov 2015 13:13:44 +0000
Subject: [Buildroot] [PATCH] board: readme.txt for Intel Galileo Gen 1/2
Message-ID: <1447852425.2751.31.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Created a readme.txt for the Intel Galileo Gen 1/2 that describes,

 * How to build for the Intel Galileo Gen 1/2
 * How to access the console on the Intel Galileo Gen 1/2

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 board/intel/galileo/readme.txt | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 board/intel/galileo/readme.txt

diff --git a/board/intel/galileo/readme.txt b/board/intel/galileo/readme.txt
new file mode 100644
index 0000000..7a3abd4
--- /dev/null
+++ b/board/intel/galileo/readme.txt
@@ -0,0 +1,52 @@
+
+Intel Galileo Gen 1/2
+
+Intro
+============
+
+These instructions apply to both the Intel Galileo Gen 1/2 development boards
+based on the Intel Quark X1000.
+
+How to build
+============
+
+Apply the defconfig for the Intel Galileo Gen 1/2
+
+ $ make galileo_defconfig
+
+Add any additional packages required and build.
+
+ $ make
+
+The build process will create a SD card image and place it in output/images.
+
+ $ ls -lh output/images/sdcard.img
+ -rw-r--r--. 1 foo foo 11M Nov 17 16:19 output/images/sdcard.img
+
+Write the image to an mSD card, insert into the Galileo and power on.
+
+ $ dd if=output/images/sdcard.img of=/dev/mmcblk0; sync
+
+Accessing the console
+=====================
+
+During power-on the console will become available on the Galileo's ttyS1. This 
+may be accessed as follows.
+
+ * Galileo Gen 1
+
+	http://clayskits.com/products/galileo-gen-1-serial-cable
+
+	A USB to RS-232 to 3.5mm Jack cable is required. Connect to the 3.5mm
+	Jack next to the Ethernet Header.
+
+ * Galileo Gen 2
+
+	http://www.ftdichip.com/Products/Cables/USBTTLSerial.htm
+
+	A FTDI TTL-232R-3V3 cable may be used to connect to the FTDI header 
+	next to the Ethernet connector on the Galileo Gen 2. 
+
+The console should now be visible at 115200 baud.
+
+ $ picocom -b 115200 /dev/ttyUSB0
-- 
2.1.0
