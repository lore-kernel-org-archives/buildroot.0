From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:09:59 +0100
Subject: [Buildroot] [PATCH 4/9] package/darktable: add libsecret optional
	dependency
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-4-romain.naour@gmail.com>
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
index 3cb83f9..d46032ca 100644
--- a/package/darktable/darktable.mk
+++ b/package/darktable/darktable.mk
@@ -45,7 +45,6 @@ DARKTABLE_CONF_OPTS = \
 	-DUSE_FLICKR=OFF \
 	-DUSE_GRAPHICSMAGICK=OFF \
 	-DUSE_KWALLET=OFF \
-	-DUSE_LIBSECRET=OFF \
 	-DUSE_LUA=OFF \
 	-DUSE_MAP=OFF \
 	-DUSE_NLS=ON \
@@ -60,6 +59,13 @@ else
 DARKTABLE_CONF_OPTS += -DBUILD_SSE2_CODEPATHS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECRET),y)
+DARKTABLE_CONF_OPTS += -DUSE_LIBSECRET=ON
+DARKTABLE_DEPENDENCIES += libsecret
+else
+DARKTABLE_CONF_OPTS += -DUSE_LIBSECRET=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBP),y)
 DARKTABLE_CONF_OPTS += -DUSE_WEBP=ON
 DARKTABLE_DEPENDENCIES += webp
-- 
2.9.3
