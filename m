From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 14:46:02 +0100
Subject: [Buildroot] [git commit master] package: show packages with busybox
	alternatives if busybox is disabled
Message-ID: <20091027134636.B1731777A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bbbdf45f0e387fdc95fa63626025abca832bedef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index ca7264f..7438a8d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -71,8 +71,8 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 	  Most people will just use the default BusyBox configuration file.
 
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	bool "Show packages that are also provided by busybox"
-	depends on BR2_PACKAGE_BUSYBOX
+	bool "Show packages that are also provided by busybox" if BR2_PACKAGE_BUSYBOX
+	default y if !BR2_PACKAGE_BUSYBOX
 	help
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
-- 
1.6.3.3
