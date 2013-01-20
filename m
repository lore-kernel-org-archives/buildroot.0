From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jan 2013 11:31:14 +0100
Subject: [Buildroot] [PATCH 1/2] xapp_xinit: only makes sense if there is an
	X server
Message-ID: <1358677875-29889-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xinit/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 9ac2817..30981c3 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XINIT
 	bool "xinit"
+	# Runtime dependency: can't start an X server unless there is one
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-- 
1.7.10.4
