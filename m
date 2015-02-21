From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 16:50:59 +0100
Subject: [Buildroot] [git commit] package/efl/libevas: explicitly disable
	GL/GLES2 support
Message-ID: <20150221155344.E99C67FD15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc42daf98a1fd56814c5c90851e76829d975edb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 30d9f7c..4868050 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -107,16 +107,25 @@ LIBEVAS_CONF_ENV += \
 	GL_EET_LIBS='-leet'
 endif
 
+# libevas OpenGL flavor
 ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
 LIBEVAS_DEPENDENCIES += mesa3d libeet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
 LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-sgx
+else
+LIBEVAS_CONF_OPTS += --disable-gles-variety-sgx
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
 LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
+else
+LIBEVAS_CONF_OPTS += --disable-gles-variety-s3c6410
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX)$(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),)
+LIBEVAS_CONF_OPTS += --disable-gl-flavor-gles
 endif
 
 # code options
