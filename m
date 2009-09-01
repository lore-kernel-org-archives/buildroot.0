From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 17:00:29 +0200
Subject: [Buildroot] [git commit master] xdata_xcursor-themes: -source
	target should only download, not extract
Message-ID: <20090901150111.DF40E77749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b0d895f641b5309b000e7165c33daf01eefe7f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index ccaec82..59d9d49 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -68,7 +68,7 @@ xdata_xcursor-themes-dirclean:
 	rm -rf $(XDATA_XCURSOR_THEMES_DIR)
 
 xdata_xcursor-themes-depends:
-xdata_xcursor-themes-source: $(XDATA_XCURSOR_THEMES_DIR)/.extracted
+xdata_xcursor-themes-source: $(DL_DIR)/$(XDATA_XCURSOR_THEMES_SOURCE)
 xdata_xcursor-themes-patch: $(XDATA_XCURSOR_THEMES_DIR)/.patched
 xdata_xcursor-themes-configure: $(XDATA_XCURSOR_THEMES_DIR)/.configured
 xdata_xcursor-themes-build: $(XDATA_XCURSOR_THEMES_DIR)/.built
-- 
1.6.3.3
