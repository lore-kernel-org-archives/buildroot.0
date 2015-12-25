From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:38 +0100
Subject: [Buildroot] [PATCH 09/84 RFC] package/angularjs: use 'menuconfig'
	instad of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <5f02ca34aa8e4fd1d58aa80217f251512f7cd522.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and change the modules 'menuconfig' to a simple 'config'

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/angularjs/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
index 2b563f7..206b3d8 100644
--- a/package/angularjs/Config.in
+++ b/package/angularjs/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_ANGULARJS
+menuconfig BR2_PACKAGE_ANGULARJS
 	bool "angularjs"
 	help
 	  AngularJS web application framework.
@@ -7,7 +7,7 @@ config BR2_PACKAGE_ANGULARJS
 
 if BR2_PACKAGE_ANGULARJS
 
-menuconfig BR2_ANGULARJS_MODULES
+config BR2_ANGULARJS_MODULES
 	bool "angularjs modules"
 	help
 	  Select which modules to install. If disabled, all modules
-- 
1.9.1
