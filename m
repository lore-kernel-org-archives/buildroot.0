From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:10:01 +0100
Subject: [Buildroot] [PATCH 6/9] package/darktable: add openjpeg optional
	dependency
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 package/darktable/darktable.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/darktable/darktable.mk b/package/darktable/darktable.mk
index 0e7aa9a..bd2d079 100644
--- a/package/darktable/darktable.mk
+++ b/package/darktable/darktable.mk
@@ -48,7 +48,6 @@ DARKTABLE_CONF_OPTS = \
 	-DUSE_MAP=OFF \
 	-DUSE_NLS=ON \
 	-DUSE_OPENCL=OFF \
-	-DUSE_OPENJPEG=OFF \
 	-DUSE_OPENMP=OFF \
 	-DUSE_OPENEXR=OFF
 
@@ -72,6 +71,13 @@ else
 DARKTABLE_CONF_OPTS += -DUSE_LIBSECRET=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+DARKTABLE_CONF_OPTS += -DUSE_OPENJPEG=ON
+DARKTABLE_DEPENDENCIES += openjpeg
+else
+DARKTABLE_CONF_OPTS += -DUSE_OPENJPEG=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBP),y)
 DARKTABLE_CONF_OPTS += -DUSE_WEBP=ON
 DARKTABLE_DEPENDENCIES += webp
-- 
2.9.3
