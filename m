From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:13:54 +0100
Subject: [Buildroot] [git commit] glmark2: add imx-drm driver support
Message-ID: <20170301221358.57DDA817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a10b15ebeb5fd82fdb0530d485095f5800103a49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream status: pending
https://github.com/glmark2/glmark2/pull/29

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...NativeStateDRM-add-imx-drm-driver-support.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch b/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
new file mode 100644
index 0000000..8eff81e
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
