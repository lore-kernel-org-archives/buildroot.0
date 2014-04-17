From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:00:19 +0200
Subject: [Buildroot] [git commit] package/libevas: switch dependency from
	mesa3d to _HAS_LIBGL
Message-ID: <20140417210125.673349C80A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab1a236a0763c18d3990590940b6b3ab7c63131d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now have a virtual package that represents availability of
full OpenGL.

This should be the end of this dependency hell epic, now. :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
