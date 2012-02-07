From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 23:19:21 +0100
Subject: [Buildroot] [git commit] libevas: generic opengl option needs mesa
Message-ID: <20120207223219.B19B290A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79f22504d7b5be45170063837d551c099e0c75d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in  |    1 +
 package/efl/libevas/libevas.mk |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index e2f5349..3afba1b 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -134,6 +134,7 @@ choice
 	default BR2_PACKAGE_LIBEVAS_GL
 
 config BR2_PACKAGE_LIBEVAS_GL
+       select BR2_PACKAGE_MESA3D
        bool "generic OpenGL"
 
 config BR2_PACKAGE_LIBEVAS_GLES_SGX
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 14f49bb..9f1cf79 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -98,6 +98,10 @@ LIBEVAS_CONF_OPT += --enable-gl-sdl
 LIBEVAS_DEPENDENCIES += sdl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
+LIBEVAS_DEPENDENCIES += mesa3d
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
 LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-sgx
 endif
