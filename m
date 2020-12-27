From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 14:20:27 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/opencv3: do not
 detect ccache
Message-ID: <20201227133021.E50DB82B84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1420d5bcca306036e11b9510a9b239ff499cb919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

OpenCV-3's buildsystem will try to detect ccache and use it if
available. This may yield a system-installed ccache.

However, in Buildroot, ccache is entirely hidden away and handled in the
toolchain wrapper.

Forcibly disable detection of ccache.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 505e7f47715c77d8586444a4fefe4a190b77aaad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 4e24f886bf..d98e0e19f4 100644
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
