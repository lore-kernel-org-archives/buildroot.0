From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:10:00 +0100
Subject: [Buildroot] [PATCH 5/9] package/darktable: add flickcurl optional
	dependency
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-5-romain.naour@gmail.com>
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
index d46032ca..0e7aa9a 100644
--- a/package/darktable/darktable.mk
+++ b/package/darktable/darktable.mk
@@ -42,7 +42,6 @@ DARKTABLE_CONF_OPTS = \
 	-DCUSTOM_CFLAGS=ON \
 	-DUSE_CAMERA_SUPPORT=OFF \
 	-DUSE_COLORD=OFF \
-	-DUSE_FLICKR=OFF \
 	-DUSE_GRAPHICSMAGICK=OFF \
 	-DUSE_KWALLET=OFF \
 	-DUSE_LUA=OFF \
@@ -59,6 +58,13 @@ else
 DARKTABLE_CONF_OPTS += -DBUILD_SSE2_CODEPATHS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FLICKCURL),y)
+DARKTABLE_CONF_OPTS += -DUSE_FLICKR=ON
+DARKTABLE_DEPENDENCIES += flickcurl
+else
+DARKTABLE_CONF_OPTS += -DUSE_FLICKR=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 DARKTABLE_CONF_OPTS += -DUSE_LIBSECRET=ON
 DARKTABLE_DEPENDENCIES += libsecret
-- 
2.9.3
