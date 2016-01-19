From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:22:59 +0100
Subject: [Buildroot] [git commit] package/angularjs: use 'menuconfig'
	instead of 'config'+'menu'
Message-ID: <20160119212303.ACBA07FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aee8dc79a64aad5335f3a104f7ba139546f1fcd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and change the modules 'menuconfig' to a simple 'config'

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
