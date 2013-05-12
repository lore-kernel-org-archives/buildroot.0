From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 10:53:38 +0200
Subject: [Buildroot] [git commit] matchbox-lib: pango backend needs Xft
	support in pango
Message-ID: <20130512085504.A6C269A10F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8008c961c8db3a8b3b922f7222072f3dad9587b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/7f5e56790028b96626e6f0a69ddce08667b712eb/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/matchbox/matchbox-lib/matchbox-lib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index d18df6b..9855c8a 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -42,7 +42,7 @@ else
   MATCHBOX_LIB_CONF_OPT+=--disable-png
 endif
 
-ifeq ($(BR2_PACKAGE_PANGO),y)
+ifeq ($(BR2_PACKAGE_PANGO)$(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yyy)
   MATCHBOX_LIB_CONF_OPT+=--enable-pango
   MATCHBOX_LIB_DEPENDENCIES+=pango
 else
