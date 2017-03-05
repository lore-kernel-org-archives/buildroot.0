From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:09:58 +0100
Subject: [Buildroot] [PATCH 3/9] package/darktable: add webp optional
	dependency
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 package/darktable/darktable.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/darktable/darktable.mk b/package/darktable/darktable.mk
index 53a8637..3cb83f9 100644
--- a/package/darktable/darktable.mk
+++ b/package/darktable/darktable.mk
@@ -52,8 +52,7 @@ DARKTABLE_CONF_OPTS = \
 	-DUSE_OPENCL=OFF \
 	-DUSE_OPENJPEG=OFF \
 	-DUSE_OPENMP=OFF \
-	-DUSE_OPENEXR=OFF \
-	-DUSE_WEBP=OFF
+	-DUSE_OPENEXR=OFF
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
 DARKTABLE_CONF_OPTS += -DBUILD_SSE2_CODEPATHS=ON
@@ -61,4 +60,11 @@ else
 DARKTABLE_CONF_OPTS += -DBUILD_SSE2_CODEPATHS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP),y)
+DARKTABLE_CONF_OPTS += -DUSE_WEBP=ON
+DARKTABLE_DEPENDENCIES += webp
+else
+DARKTABLE_CONF_OPTS += -DUSE_WEBP=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.9.3
