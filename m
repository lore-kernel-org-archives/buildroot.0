From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Jun 2019 10:13:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/xorgproto: enable legacy
Message-ID: <20190623081342.6098-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xproxymngproto is needed by xfindproxy but it is now disabled by default
Enable it thanks to --enable-legacy

Fixes:
 - http://autobuild.buildroot.org/results/4b21400c36e8ba7a8222f9da962f79e42c6146d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xorgproto/xorgproto.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 9e8abd4c6a..458efbc731 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -47,6 +47,8 @@ XORGPROTO_LICENSE_FILES = \
 	COPYING-xineramaproto
 XORGPROTO_INSTALL_STAGING = YES
 XORGPROTO_INSTALL_TARGET = NO
+# xproxymngproto is needed by xfindproxy
+XORGPROTO_CONF_OPTS += --enable-legacy
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
