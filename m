From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:13:40 +0200
Subject: [Buildroot] [git commit] weston: add missing toolchain comments
Message-ID: <20131014203036.CEC559A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d56d8a7f55442eeacad73c2085c7b3003d97be8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998 at free.fr: fix missing double-quote at end of comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

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
