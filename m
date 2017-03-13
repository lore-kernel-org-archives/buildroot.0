From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Mar 2017 15:24:25 -0300
Subject: [Buildroot] [PATCH] kmscube: Remove the manually creation of m4
	directory
Message-ID: <1489429465-19719-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since kmscube upstream commit a2dc60cf05b704 ("Add m4/.gitignore")
there is no need to manually create the m4 directory anymore, so
simply remove KMSCUBE_POST_PATCH_HOOKS.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/kmscube/kmscube.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 901c747..f04b882 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -10,10 +10,4 @@ KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
 KMSCUBE_AUTORECONF = YES
 
-# Autoreconf requires an existing m4 directory
-define KMSCUBE_PATCH_M4
-	mkdir -p $(@D)/m4
-endef
-KMSCUBE_POST_PATCH_HOOKS += KMSCUBE_PATCH_M4
-
 $(eval $(autotools-package))
-- 
2.7.4
