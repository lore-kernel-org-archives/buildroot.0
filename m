From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:57:32 +0200
Subject: [Buildroot] [git commit] opencv: enable SSE4.1 SSE4.2 support when
	available
Message-ID: <20140716210452.E13D19D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=deae1b8c8919c71f79680e6bab6e2f1f25b42f5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index d1620a2..c3a6bea 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -77,6 +77,8 @@ OPENCV_CONF_OPT += \
 	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
 	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
+	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)  \
+	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
 # Cuda stuff
