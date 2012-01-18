From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:57 +0100
Subject: [Buildroot] [git commit] xutil_makedepend: cleanup, fix target deps
Message-ID: <20120118150408.C74C785779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a058d3415157b686127ca524b2f71f9bd93edf74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 5c7bfd3..a69d21f 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -7,10 +7,8 @@
 XUTIL_MAKEDEPEND_VERSION = 1.0.2
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
-XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 
-HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
+XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
