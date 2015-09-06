From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Sep 2015 21:54:19 +0200
Subject: [Buildroot] [PATCH 2/5] package/weston: restore the freerdp backend
In-Reply-To: <cover.1441569038.git.yann.morin.1998@free.fr>
References: <cover.1441569038.git.yann.morin.1998@free.fr>
Message-ID: <34e2e215f8ea40ab0d223fc555bde8289937b878.1441569038.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we've switched to using FreeRDP from master, we can build the
weston's FreeRDP backend again.

Propagate the new dependencies of FreeRDP.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index f530e22..3fd7981 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -41,13 +41,11 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
-# RDP backend needs FreeRDP master, while we only have stable-1.1
-comment "RDP backend is broken"
-
+# FreeRDP needs threads and !static, already the case for weston
 config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
-	depends on BROKEN # needs FreeRDP master
 	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_USE_MMU # freerdp, libglib2
 	select BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
-- 
1.9.1
