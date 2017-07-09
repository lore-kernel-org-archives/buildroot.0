From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 17:28:58 +0200
Subject: [Buildroot] [git commit] opencv: enable NEON optimizations if
	possible
Message-ID: <20170709160002.92AF0820E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a37d6b8024832216db233f625b5ec98f36bceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andre Renaud <andre@ignavus.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 92cfd43..b5b1253 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -79,7 +79,8 @@ OPENCV_CONF_OPTS += \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
 	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
 	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
-	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
+	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)
 
 # Cuda stuff
 OPENCV_CONF_OPTS += \
