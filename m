From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:54:31 +0200
Subject: [Buildroot] [git commit] package/qt: enable static build for
	BR2_PACKAGE_QT_MOUSE_TSLIB
Message-ID: <20170611135444.B467F818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a3accb72cd36271b0eb3a683f6a9301253654d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency on !BR2_STATIC_LIBS was here because of tslib not
supporting static builds. But since

   commit 05fadfea1 ("package/tslib: enable statically linked building")

it does and we can remove this dependecy.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.mouse.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 07573eb..1062fac 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -11,12 +11,8 @@ config BR2_PACKAGE_QT_MOUSE_LINUXINPUT
 
 config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
-	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_TSLIB
 
-comment "tslib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_QT_MOUSE_QVFB
 	bool "qvfb"
 
