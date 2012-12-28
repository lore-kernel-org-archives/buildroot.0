From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 23:17:01 +0100
Subject: [Buildroot] [PATCH] libplayer: propagate 'depends on' from mplayer
Message-ID: <1356733021-15222-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_LIBPLAYER_MPLAYER should not select BR2_PACKAGE_MPLAYER
without having the 'depends on' that BR2_PACKAGE_MPLAYER has.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplayer/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index fe851ac..5391b8b 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -11,6 +11,10 @@ config BR2_PACKAGE_LIBPLAYER
 if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
+	# mplayer
+	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
+	# mplayer
+	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
-- 
1.7.9.5
