From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 May 2021 09:34:19 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Config.in.legacy: fix
 BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
Message-ID: <20210507071029.EA2C081290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b94be894e57b79c071330dae731e85d54701881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit fdb6fc2b4a5be747e7695f594cbbb1a941ceb05b forgot to select
BR2_LEGACY

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0c4c76759b440595c90d189ddfd2aabae844e681)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index af0c1ba50c..530c2ba82b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,6 +148,7 @@ comment "Legacy options removed in 2021.02"
 
 config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 	bool "sconeserver http::sconesite::image removed"
+	select BR2_LEGACY
 	help
 	  Sconeserver cannot be built with ImageMagick - it uses the
 	  "transofrm" function which is removed from public API.
