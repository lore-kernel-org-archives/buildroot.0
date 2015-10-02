From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 22:24:36 +0200
Subject: [Buildroot] [git commit] package/weston: restore the freerdp backend
Message-ID: <20151003071223.03305818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e58885258e7fb499bbdd7a66ea62cb5016e35ac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we've switched to using FreeRDP from master, we can build weston's
FreeRDP backend again.

Propagate the new dependencies of FreeRDP.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

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
