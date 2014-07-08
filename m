From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 11:30:16 +0200
Subject: [Buildroot] [git commit] package/freetype: Fix removal of wrong
	include/freetype2/freetype link by host-freetype
Message-ID: <20140708101017.B68AC9D1BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fa9cf998efea8b0c3537d9e132302b59c169dae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Broken by http://git.buildroot.net/buildroot/commit/package/freetype/freetype.mk?id=cc5b8e72308f523b3826ada5fe7009b722bf9a79

Fixes
http://autobuild.buildroot.net/results/b77/b770d495115f25f182463eb4623cf9ee0a0f5d68/
http://autobuild.buildroot.net/results/5b4/5b449a9120d4ece020e22c36299489e80ab094b9/
http://autobuild.buildroot.net/results/fb9/fb9ec94fc4e2dcdf894ec774bd1e5809611c56fb/
http://autobuild.buildroot.net/results/b12/b12989ec1c57f8cf3a2f743cc94de082692b7de6/
http://autobuild.buildroot.net/results/f25/f255f64c210b04368069f80402da8afaecb9464b/
http://autobuild.buildroot.net/results/d66/d66e80b5caab1661e1661922933a963c989d02cc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 19dbd86..52a8fb4 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -89,7 +89,7 @@ FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
 define HOST_FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
 	$(RM) -f $(HOST_DIR)/usr/include/freetype2/freetype
 endef
-HOST_FREETYPE_PRE_INSTALL_HOOKS += FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
+HOST_FREETYPE_PRE_INSTALL_HOOKS += HOST_FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
 define HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 	ln -sf . $(HOST_DIR)/usr/include/freetype2/freetype
 endef
