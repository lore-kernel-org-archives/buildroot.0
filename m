From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:31:55 +0200
Subject: [Buildroot] [git commit] board/freescale/imx6-sabresd: improve Qt5
 Cinematic Demo instructions
Message-ID: <20191010203129.C5C928CA03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9ccd8f0fc206805deca4ce6ae6b81480a1ead95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QT_QPA_EGLFS_ALWAYS_SET_MODE=1 needs to be exported, otherwise the Qt5
Cinematic demo throws a storm of the following messages:

Could not queue DRM page flip on screen LVDS1 (Invalid argument)

Improve the instructions by mentioning such requirement.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx6-sabresd/readme.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/freescale/imx6-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
index f09ff5caf4..292dab72c4 100644
--- a/board/freescale/imx6-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -80,6 +80,7 @@ Running kmscube application:
 Running Qt5 Cinematic Demo:
 
 # export QT_QPA_EGLFS_KMS_CONFIG=/root/sabresd.json
+# export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
 # /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience
 
 Running gl2mark benchmark:
