From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:39 +0200
Subject: [Buildroot] [PATCH 23/30] package/checkpolicy: re-enable on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-24-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux is now available on ARC, so we can re-enable checkpolicy as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/checkpolicy/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index f7b03df11d..ad769d22b7 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on !BR2_arc # libselinux
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_FLEX
 	help
@@ -15,5 +14,4 @@ config BR2_PACKAGE_CHECKPOLICY
 	  http://selinuxproject.org/page/Main_Page
 
 comment "checkpolicy needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.21.0
