From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:41:41 +0100
Subject: [Buildroot] [git commit] kmscube: Remove the manually creation of
	m4 directory
Message-ID: <20170314224149.D421D82586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=978b5adf61f6d72d1de6eaa9c70f6bd882d325ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since kmscube upstream commit a2dc60cf05b704 ("Add m4/.gitignore")
there is no need to manually create the m4 directory anymore, so
simply remove KMSCUBE_POST_PATCH_HOOKS.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
