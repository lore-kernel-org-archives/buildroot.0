From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 12:22:12 +0100
Subject: [Buildroot] [git commit] freetype: fix host headers as well
Message-ID: <20131206112343.489879BEBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0d938385b339f03b985b5c63e6046497c654f8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like on 0a9cedbcf49641b2569e0a137818ad9f8c539edd we also need to fix the
headers for the host variant.
Fixes:
http://autobuild.buildroot.net/results/261/261d6a59f144e44e51b38de98a7355a9eb8ac791/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 0f1bb88..c97cc1a 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -63,6 +63,10 @@ define FREETYPE_FIX_FREETYPE_INCLUDE
 	ln -sf . $(STAGING_DIR)/usr/include/freetype2/freetype
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
+define HOST_FREETYPE_FIX_FREETYPE_INCLUDE
+	ln -sf . $(HOST_DIR)/usr/include/freetype2/freetype
+endef
+HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
