From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:27:33 +0200
Subject: [Buildroot] [git commit branch/next] webkitgtk24: depend on x11
	backend for gtk3
Message-ID: <20150808105653.500BA7FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba25711e80f05819b6199ddedb983e9f2a7681a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The other rendering backends aren't supported right now, so depend on
the X11 one to avoid build breakage. Fixes:
http://autobuild.buildroot.net/results/1b3/1b372dd04eaccd8a9d24390d509b0a49f692746c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkitgtk24/webkitgtk24.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 5c1bb5b..a58fed3 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -101,7 +101,7 @@ endif
 # webkit1 (old API) uses gtk2, webkit2 (new API) uses gtk3
 # Both can be built simultaneously, prefer "newer" for size/time savings
 # gtk2 is mandatory for plugin support
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK24_CONF_OPTS += \
 	--with-gtk=3.0 \
 	--disable-webkit1
