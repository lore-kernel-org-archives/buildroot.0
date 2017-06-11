From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:53:06 +0200
Subject: [Buildroot] [git commit] package/qt5base: enable static build for
	BR2_PACKAGE_QT5BASE_TSLIB
Message-ID: <20170611135321.7D8B480641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23e8630fd5ed2e755449f8dbef737983c2227e03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency on !BR2_STATIC_LIBS was here because of tslib not
supporting static builds. But since

   commit 05fadfea1 ("package/tslib: enable statically linked building")

it does and we can remove this dependecy.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 2610f6b..63c7f8f 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -273,12 +273,8 @@ comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
-	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_TSLIB
 	help
 	  This options enables the Tslib plugin
 
-comment "tslib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 endif
