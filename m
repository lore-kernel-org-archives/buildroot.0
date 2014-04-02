From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:45 +0200
Subject: [Buildroot] [PATCH v2 31/41] xbmc: Fix Java dependency check (v2)
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-31-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

A check for Java has been implemented in dependencies.sh, but during the
review, the name of the variable had been changed from:
BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA
as it is more accurate.

The change was not made in XBMC and as such, you could start the build
of XBMC without Java on your system.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased http://patchwork.ozlabs.org/patch/335219/ (Maxime)

 package/xbmc/Config.in |    2 +-
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
1.7.10.4
