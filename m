From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 25 Oct 2012 12:40:52 +0200
Subject: [Buildroot] [PATCH v2] fluxbox: select xmodmap
Message-ID: <1351161652-9231-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Fluxbox uses xmodmap in its startup script.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
v2: add comment to the Config.in (Thomas Petazzoni)

 package/fluxbox/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index e4d6c37..588e83b 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_FLUXBOX
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBX11
+	# Runtime dependency, needed by startup script
+	select BR2_PACKAGE_XAPP_XMODMAP
 	help
 	  The Fluxbox lightweight window manager for X
 
-- 
1.7.7
