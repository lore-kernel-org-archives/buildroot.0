From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 19:53:11 +0200
Subject: [Buildroot] [git commit] package/supertuxkart: remove libglu
 dependency
Message-ID: <20200503173843.3CF02814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88017c295c7c0607ef7a8e0eae1d4f5373df425d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"The inclusion of GLU is historical. [...] It's not needed for GLEW to
 build or run, but it's opt-out that reason. I'd recommend using
 -DGLEW_NO_GLU since GLU is rarely seen in modern codebases nowadays."
https://github.com/nigels-com/glew/issues/192#issuecomment-411641657

Supertuxkart already uses -DGLEW_NO_GLU:
https://github.com/supertuxkart/stk-code/blob/master/CMakeLists.txt#L224

This patch only removes the dependency to libglu and depends on the
previous patch of this series which removes glu from glew.pc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/supertuxkart/Config.in       | 1 -
 package/supertuxkart/supertuxkart.mk | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index fcb27445da..e00d98d2a4 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_SUPERTUXKART
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLEW
-	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSQUISH
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 4427ddd1ee..97cd2a40b8 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -24,7 +24,6 @@ SUPERTUXKART_DEPENDENCIES = \
 	libfribidi \
 	libgl \
 	libglew \
-	libglu \
 	libogg \
 	libpng \
 	libsquish \
