From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:24 +0200
Subject: [Buildroot] [PATCH 12/14] package/libevas: switch dependency from
	mesa3d to _HAS_LIBGL
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <30e240d2f38905a002fcd45f333c91eadc03dcf8.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We now have a virtual package that represents availability of
full OpenGL.

This should be the end of this dependency hell epic, now. :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 package/efl/libevas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 8eea23d..febc115 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -148,7 +148,7 @@ choice
 
 config BR2_PACKAGE_LIBEVAS_GL
 	bool "generic OpenGL"
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBEET
 
 config BR2_PACKAGE_LIBEVAS_GLES_SGX
-- 
1.8.3.2
