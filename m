From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 May 2021 21:47:09 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: fix
 BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
Message-ID: <20210501192027.6BB3D8650B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c4c76759b440595c90d189ddfd2aabae844e681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fdb6fc2b4a5be747e7695f594cbbb1a941ceb05b forgot to select
BR2_LEGACY

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0387967311..629d02dbf2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,6 +148,7 @@ comment "Legacy options removed in 2021.05"
 
 config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 	bool "sconeserver http::sconesite::image removed"
+	select BR2_LEGACY
 	help
 	  Sconeserver cannot be built with ImageMagick - it uses the
 	  "transofrm" function which is removed from public API.
