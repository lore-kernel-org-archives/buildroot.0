From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2015 23:03:42 +0100
Subject: [Buildroot] [git commit] qt5base: use 'depends on' for directfb
Message-ID: <20151118222837.EC499807C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=551cdaf2d2ab1325f06bfa8814df43b586be3d5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the only package where we select directfb. Change it to use depends
on to match what we do for the X11 backend.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 603df45..7cadcb2 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -178,11 +178,10 @@ config BR2_PACKAGE_QT5BASE_LINUXFB
 
 config BR2_PACKAGE_QT5BASE_DIRECTFB
 	bool "directfb support"
-	select BR2_PACKAGE_DIRECTFB
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # directfb
+	depends on BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a toolchain w/ gcc >= 4.5"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+comment "directfb backend if directb is enabled"
+	depends on !BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT5BASE_XCB
 	bool "X.org XCB support"
