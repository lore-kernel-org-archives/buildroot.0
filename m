From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  9 Oct 2019 13:56:00 -0300
Subject: [Buildroot] [PATCH 3/4] imx6-sabresd/readme.txt: Improve Qt5
 Cinematic Demo instructions
In-Reply-To: <20191009165601.3424-1-festevam@gmail.com>
References: <20191009165601.3424-1-festevam@gmail.com>
Message-ID: <20191009165601.3424-3-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QT_QPA_EGLFS_ALWAYS_SET_MODE=1 needs to be exported, otherwise the Qt5
Cinematic demo throws a storm of the following messages:

Could not queue DRM page flip on screen LVDS1 (Invalid argument)

Improve the instructions by mentioning such requirement.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.17.1
