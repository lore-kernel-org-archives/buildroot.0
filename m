From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:18 +0200
Subject: [Buildroot] [PATCH 11/20 v3] package/libatasmart: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <ae8586b4ee9368f340c1ad6bd25577364428f249.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do as the comment says: it's only libudev that is required.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libatasmart/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
index 9db3b09..e218c6d 100644
--- a/package/libatasmart/Config.in
+++ b/package/libatasmart/Config.in
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_LIBATASMART
 	bool "libatasmart"
-	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	help
 	  The libatasmart package is a disk reporting library.
 	  It only supports a subset of the ATA S.M.A.R.T. functionality.
 
 	  http://0pointer.de/blog/projects/being-smart.html
-
-comment "libatasmart requires udev to be enabled"
-	depends on !BR2_PACKAGE_HAS_UDEV
-- 
1.9.1
