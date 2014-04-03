From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:21:03 +0200
Subject: [Buildroot] [git commit] xbmc: Fix Java dependency check
Message-ID: <20140403182128.509529C533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1f92422575645e5e81b4026eb42e758da4821e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A check for Java has been implemented in dependencies.sh, but during the
review, the name of the variable had been changed from:
BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA
as it is more accurate.

The change was not made in XBMC and as such, you could start the build
of XBMC without Java on your system.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
