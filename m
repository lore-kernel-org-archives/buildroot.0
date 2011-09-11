From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] fuse: remove --program-prefix
Message-ID: <20110912052635.A24CC8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc32ba990a9f72579f34d24a742ba744ae4d5a58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fuse/libfuse.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 13a5194..45fb2f3 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -9,8 +9,7 @@ LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 
 LIBFUSE_INSTALL_STAGING = YES
-LIBFUSE_CONF_OPT= --program-prefix="" \
-		--disable-nls \
+LIBFUSE_CONF_OPT= --disable-nls \
 		--disable-example \
 		--disable-kernel-module \
 		--enable-lib \
-- 
1.7.3.4
