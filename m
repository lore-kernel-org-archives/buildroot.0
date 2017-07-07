From: Andre Renaud <andre@ignavus.net>
Date: Fri, 07 Jul 2017 02:00:01 +0000
Subject: [Buildroot] [PATCH] opencv: Enable NEON flags
Message-ID: <CAEj2-1O-xw2ZJoSY=GXj2FBJp_oc7Z81ri3Xe2n_rezP5uhfZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opencv: Enable NEON optimizations if available

Signed-off-by: Andre Renaud <andre@ignavus.net>

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 92cfd43..b5b1253 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -79,7 +79,8 @@ OPENCV_CONF_OPTS += \
        -DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
        -DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
        -DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
-       -DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+       -DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
+       -DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)

 # Cuda stuff
 OPENCV_CONF_OPTS += \
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170707/b3d93515/attachment.html>
