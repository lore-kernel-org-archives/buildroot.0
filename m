From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2020 16:47:29 +0100
Subject: [Buildroot] [PATCH] package/opencv3: do not detect ccache
Message-ID: <20201226154729.2507761-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenCV-3's buildsystem will try to detect ccache and use it if
available. This may yield a system-installed ccache.

However, in Buildroot, ccache is entirely hidden away and handled in the
toolchain wrapper.

Forcibly disable detection of ccache.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv3/opencv3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3e3e5987a5..f836562acf 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -46,6 +46,7 @@ endif
 # OpenCV build options
 OPENCV3_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_CCACHE=OFF \
 	-DENABLE_COVERAGE=OFF \
 	-DENABLE_FAST_MATH=ON \
 	-DENABLE_IMPL_COLLECTION=OFF \
-- 
2.25.1
