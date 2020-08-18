From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:28:11 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/x11r7/xlib_libX11: security bump version to 1.6.10
Message-ID: <20200818153621.4F06A82671@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c35e7bc7ed175a443a057641b4dc2c397b1750c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2020-14344:
https://lists.x.org/archives/xorg-announce/2020-July/003050.html

Removed md5 & sha1 hashes, upstream does not provide them anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f81258db1fccb0f7000b580f25ab33d26bf5e4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 8 +++-----
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index defaa4c982..d383615457 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-October/003025.html
-md5 55adbfb6d4370ecac5e70598c4e7eed2  libX11-1.6.9.tar.bz2
-sha1 62456536411f2540fbd4a3f59ed8af94967124c2  libX11-1.6.9.tar.bz2
-sha256 9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1  libX11-1.6.9.tar.bz2
-sha512 fc18f0dc17ade1fc37402179f52e1f2b9c7b7d3a1a9590fea13046eb0c5193b4796289431cd99388eac01e8e59de77db45d2c9675d4f05ef8cf3ba6382c3dd31  libX11-1.6.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-July/003052.html
+sha256  af48626989b8515c994777896bd7b7ba2bd5b1ef4e1efaee0a55d8852bbe6226  libX11-1.6.10.tar.bz2
+sha512  ad384d8896fbe587f7fd99b0d3cc56fac6e2facbab52fa99174200d06b19dd163a483c998acf3834b3a4a3aa4de0dbbe13919a1c80e6797afe467c7075b403ff  libX11-1.6.10.tar.bz2
 # Locally computed
 sha256 2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 18949c604d..bfc1c4166e 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.9
+XLIB_LIBX11_VERSION = 1.6.10
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
