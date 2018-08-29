From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 15:42:42 +0200
Subject: [Buildroot] [git commit] mender: fix ioctl build failure on
 powerpc64le / power8
Message-ID: <20180829134328.124B481789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad908f7330a5b26a691b7102e1611fb0e26cf14c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails due to missing // +build ppc64le in ioctl_64_bit.go

Add patch to append ppc64le to // +build list.

Fixes
http://autobuild.buildroot.net/results/f22/f222b4389f9308363c386da25ec22a0919bc29fb//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-FIX-Enabling-compiling-ppc64le.patch      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/mender/0001-FIX-Enabling-compiling-ppc64le.patch b/package/mender/0001-FIX-Enabling-compiling-ppc64le.patch
new file mode 100644
index 0000000000..3197a0ec01
--- /dev/null
+++ b/package/mender/0001-FIX-Enabling-compiling-ppc64le.patch
@@ -0,0 +1,37 @@
+From 2b13f9a50793fdc15199925000107cb0cc4e7bad Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Thu, 9 Aug 2018 09:28:06 +0200
+Subject: [PATCH] FIX: Enabling compiling ppc64le
+
+This patch enables Mender compilation on ppc64le
+
+Changelog: FIX: Enabling compiling ppc64le
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ ioctl_64_bit.go | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ioctl_64_bit.go b/ioctl_64_bit.go
+index 6f61a6c..f1e2dd8 100644
+--- a/ioctl_64_bit.go
++++ b/ioctl_64_bit.go
+@@ -1,4 +1,4 @@
+-// Copyright 2017 Northern.tech AS
++// Copyright 2018 Northern.tech AS
+ //
+ //    Licensed under the Apache License, Version 2.0 (the "License");
+ //    you may not use this file except in compliance with the License.
+@@ -12,7 +12,7 @@
+ //    See the License for the specific language governing permissions and
+ //    limitations under the License.
+ 
+-// +build amd64 arm64
++// +build amd64 arm64 ppc64le
+ 
+ package main
+ 
+-- 
+2.17.1
+
