From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 19:13:28 +0200
Subject: [Buildroot] [PATCH 2/4] weston: add missing toolchain comments
In-Reply-To: <cover.1381770790.git.yann.morin.1998@free.fr>
References: <cover.1381770790.git.yann.morin.1998@free.fr>
Message-ID: <24b73c2313bfea930386c479bcc2fa9c7f44bacf.1381770790.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998 at free.fr: fix missing double-quote at end of comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 2cd5ced..b7f8468 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,5 @@
-comment "weston requires udev"
-	depends on !BR2_PACKAGE_UDEV
+comment "weston needs udev and a toolchain w/ threads"
+	depends on !BR2_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -33,6 +33,10 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
+comment "RPi compositor needs a toolchain w/ C++, largefile, threads"
+	depends on BR2_arm
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
 	depends on BR2_arm                      # rpi-userland
-- 
1.8.1.2
