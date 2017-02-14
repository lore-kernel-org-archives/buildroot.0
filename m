From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 14 Feb 2017 14:26:52 +0100
Subject: [Buildroot] [PATCH] glmark2: add imx-drm driver support
Message-ID: <20170214132652.26487-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream status: pending
https://github.com/glmark2/glmark2/pull/29

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Tested on i.MX6Q Nitrogen6x.

Regards,
Gary
---
 ...NativeStateDRM-add-imx-drm-driver-support.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch

diff --git a/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch b/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
new file mode 100644
index 000000000..8eff81e62
--- /dev/null
+++ b/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
@@ -0,0 +1,25 @@
+From 05ec5e4411fe3188f72305050b11513cb153c5ff Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Tue, 14 Feb 2017 09:39:02 +0100
+Subject: [PATCH] NativeStateDRM: add imx-drm driver support
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ src/native-state-drm.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
+index 4df75ec..454a24d 100644
+--- a/src/native-state-drm.cpp
++++ b/src/native-state-drm.cpp
+@@ -201,6 +201,7 @@ NativeStateDRM::init()
+     // driver (udev?).
+     static const char* drm_modules[] = {
+         "i915",
++        "imx-drm",
+         "nouveau",
+         "radeon",
+         "vmgfx",
+-- 
+2.11.0
+
-- 
2.11.0
