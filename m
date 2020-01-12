From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 11:33:48 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/opencv3:
 objdetect needs calib3d
Message-ID: <20200112104514.4821988933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a448bc9509b1363cbc02877ad7fabee095bd0969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

objdetect needs calib3d since version 3.4.4 and
https://github.com/opencv/opencv/commit/53ec8f286b7d475fa5a799023595bd4dc73e5c81

Fixes:
 - http://autobuild.buildroot.org/results/37d0a5ba57de4c52b6e0ec99aedaca71f3397fbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7c165e442f1803570fecc2b2cff82d44e3eee783)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index c308cd4d87..cf7763d4ae 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -140,6 +140,7 @@ config BR2_PACKAGE_OPENCV3_LIB_ML
 config BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 	bool "objdetect"
 	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_ML
 	help
