From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 18 Jul 2009 01:17:31 +0200
Subject: [Buildroot] [git commit] xutil_makedepend: install to target,
	not staging
Message-ID: <20090717231900.9F2D97778E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2de62ac5ad4af39575642318edd97006a591b494
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


makedepend is a program, not a library - So makedepend for the target
should get installed to target_dir and not to staging_dir.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index f562f5d..88754d8 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -8,8 +8,8 @@ XUTIL_MAKEDEPEND_VERSION = 1.0.1
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_AUTORECONF = NO
-XUTIL_MAKEDEPEND_INSTALL_STAGING = YES
-XUTIL_MAKEDEPEND_INSTALL_TARGET = NO
+XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
+XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
 
-- 
1.6.3.3
