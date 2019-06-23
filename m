From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:42:35 +0200
Subject: [Buildroot] [git commit] package/xorgproto: enable legacy
Message-ID: <20190623104321.D15D780359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5534a166fb947a1bef517a2110018168e5dd59aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xproxymngproto is needed by xfindproxy but it is now disabled by default
Enable it thanks to --enable-legacy

Fixes:
 - http://autobuild.buildroot.org/results/4b21400c36e8ba7a8222f9da962f79e42c6146d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
