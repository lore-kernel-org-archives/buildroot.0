From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:21:34 +0100
Subject: [Buildroot] [git commit] kmscube: move to the new repository
Message-ID: <20170306202219.A284F81DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8ae08baa1cc6e58151a34fe8dd0a060ce9e525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As announced by Rob Clark at:
https://lists.freedesktop.org/archives/mesa-dev/2017-February/145745.html

, the kmscube repository has been moved from github to freedesktop.org,
so change it to the new location.

With the newest code the local patch for adding imx-drm support
is no longer needed.

Also, on imx6q we need to explicitily pass the card device now:

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmscube/0001-addimxdrm.patch | 27 ---------------------------
 package/kmscube/kmscube.hash         |  2 +-
 package/kmscube/kmscube.mk           |  4 ++--
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/package/kmscube/0001-addimxdrm.patch b/package/kmscube/0001-addimxdrm.patch
deleted file mode 100644
index 3eb7959..0000000
--- a/package/kmscube/0001-addimxdrm.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 23186149100dd9c871f65132edce67db0b1ce3c3 Mon Sep 17 00:00:00 2001
-From: XoD <xoddark@gmail.com>
-Date: Mon, 13 Feb 2017 16:43:35 -0200
-Subject: [PATCH] Add imx-drm management
-
-Add imx-drm in the list of kms modules.
-
-Signed-off-by: XoD <xoddark@gmail.com>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- kmscube.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kmscube.c b/kmscube.c
-index ca2c266..95bd77f 100644
---- a/kmscube.c
-+++ b/kmscube.c
-@@ -122,6 +122,7 @@ static int init_drm(void)
-	static const char *modules[] = {
-		"exynos",
-		"i915",
-+		"imx-drm",
-		"msm",
-		"nouveau",
-		"omapdrm",
---
-2.7.4
diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index d3e9858..0c9e414 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 73cf923f915f9f7ee46f9f03bd24254fc04b5f166270c0d37c6f2bc3881186ec kmscube-8c6a20901f95e1b465bbca127f9d47fcfb8762e6.tar.gz
+sha256 aee8375da730c2e59e8644d6bd5e011f06c88f723a8f8934bd5dac67d94a3b8a  kmscube-87e3ff5683ee54228b3e6e75f7d4de83901fadb0.tar.gz
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 88db868..9d3074a 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KMSCUBE_VERSION = 8c6a20901f95e1b465bbca127f9d47fcfb8762e6
-KMSCUBE_SITE = $(call github,robclark,kmscube,$(KMSCUBE_VERSION))
+KMSCUBE_VERSION = 87e3ff5683ee54228b3e6e75f7d4de83901fadb0
+KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
 KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
 KMSCUBE_AUTORECONF = YES
