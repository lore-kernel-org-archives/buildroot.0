From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Feb 2012 20:52:05 +0100
Subject: [Buildroot] [git commit] libecore: fix build error when X support
	is disabled but host has X headers
Message-ID: <20120212195611.65CCF90A6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=342a3d8dab64c00a6132a1bb1adeab032ee344ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forcibly disable imf-xim as it requires the X support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 8c46269..2b668ab 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -62,7 +62,7 @@ ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
 LIBECORE_CONF_OPT += --enable-ecore-x
 LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
 else
-LIBECORE_CONF_OPT += --disable-ecore-x
+LIBECORE_CONF_OPT += --disable-ecore-x --disable-ecore-imf-xim
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
