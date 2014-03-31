From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 31 Mar 2014 10:27:12 +0200
Subject: [Buildroot] [PATCH] xbmc: Fix Java dependency check
Message-ID: <1396254432-22594-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A check for Java has been implemented in dependencies.sh, but during the
review, the name of the variable had been changed from:
BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA
as it is more accurate.

The change was not made in XBMC and as such, you could start the build
of XBMC without Java on your system.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index e078d2f..cf6a6b9 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -9,7 +9,7 @@ comment "xbmc requires an OpenGL ES and EGL backend"
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
-	select BR2_HOST_NEEDS_JAVA
+	select BR2_NEEDS_HOST_JAVA
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_BZIP2
-- 
1.9.1
