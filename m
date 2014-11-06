From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:46:20 +0100
Subject: [Buildroot] [git commit] qt5: use the BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.818DEB12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05c06b758a588ae94663338a7fb18a6bc904c386
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index c34bec2..0b97374 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	# Javascript engine is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !BR2_ARM_CPU_ARMV4
 	default y
 
 comment "Qt5 needs a toolchain w/ wchar, IPv6, NPTL, C++"
