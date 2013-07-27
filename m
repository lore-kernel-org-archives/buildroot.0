From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 17:15:53 +0200
Subject: [Buildroot] [git commit] usb_modeswitch_data: requires thread
	support
Message-ID: <20130727213153.F3AE39ACCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af1528af6385e19d0c351172701f3adb017c06f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usb_modeswitch_data unconditionally selects usb_modeswitch, but
usb_modeswitch depends on thread support. This commit has the thread
support dependency to usb_modeswitch_data.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usb_modeswitch_data/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index 6df408f..e0e8f4c 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
 	select BR2_PACKAGE_USB_MODESWITCH
+	depends on BR2_TOOLCHAIN_HAS_THREADS # usb_modeswitch -> libusb
 	help
 	  USB mode switch data
 	  Contains udev rules and events to allow usb_modeswitch to
 	  function automatically
 
 	  http://www.draisberghof.de/usb_modeswitch/
+
+comment "usb_modeswitch_data needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
