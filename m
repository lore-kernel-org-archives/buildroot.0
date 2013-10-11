From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2013 23:00:12 +0200
Subject: [Buildroot] [PATCH 2/3] weston: add missing toolchain comments
In-Reply-To: <1381525213-14034-1-git-send-email-arnout@mind.be>
References: <1381525213-14034-1-git-send-email-arnout@mind.be>
Message-ID: <1381525213-14034-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/weston/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index fd48fb3..ea0e87e 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,5 @@
-comment "weston requires udev"
-	depends on !BR2_PACKAGE_UDEV
+comment "weston needs udev and a toolchain w/ threads"
+	depends on !BR2_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -30,6 +30,10 @@ if BR2_PACKAGE_WESTON
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
 
+comment "RPi compositor needs a toolchain w/ C++, largefile, threads
+	depends on BR2_arm
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
 	depends on BR2_arm                      # rpi-userland
-- 
1.8.4.rc3
