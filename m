From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xcb-util to 0.3.6 and remove
 gperf dependency since it depends on host's gperf and not target's one.
Message-ID: <20100308133623.19E1F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89e2024bd820175edd3879a595a1160308942f1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xcb-util/xcb-util.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index cca26dd..51b753e 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -3,11 +3,10 @@
 # xcb-util
 #
 #############################################################
-XCB_UTIL_VERSION = 0.2
+XCB_UTIL_VERSION = 0.3.6
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
-
-XCB_UTIL_DEPENDENCIES += gperf
+XCB_UTIL_LIBTOOL_PATCH = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xcb-util))
 
-- 
1.6.3.3
