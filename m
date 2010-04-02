From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 12:40:32 +0200
Subject: [Buildroot] [git commit master] graphics: remove comment about
	fbset broken in busybox, sort order
Message-ID: <20100402104211.5D7F48A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=42a889b7efa707025fed34640d111c731e9a4119
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 047dce9..35c6d9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,10 @@ source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
 source "package/divine/Config.in"
 source "package/fbdump/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/fbset/Config.in"
+endif
+source "package/fbv/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
@@ -103,11 +107,6 @@ source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"
 
-comment "busybox graphic applications"
-comment "--> May be broken in busybox"
-source "package/fbv/Config.in"
-source "package/fbset/Config.in"
-
 comment "other GUIs"
 source "package/qt/Config.in"
 
-- 
1.6.3.3
