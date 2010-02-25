From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Feb 2010 20:07:24 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: fix call of
	post-install-sh
Message-ID: <20100225190754.49BBE776A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2e0614d919127f3cb42ebce829b205590300517
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xfont_font-util/xfont_font-util.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 82e220f..cd777af 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -12,7 +12,7 @@ XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
 define XFONT_FONT_UTIL_POST_INSTALL_FIXES
- $(@D)/post-install.sh $(STAGING_DIR)
+ package/x11r7/xfont_font-util/post-install.sh $(STAGING_DIR)
 endef
 
 XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
-- 
1.6.3.3
