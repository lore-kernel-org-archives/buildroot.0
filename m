From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:54:00 +0200
Subject: [Buildroot] [git commit] package/directfb: enable static build for
	BR2_PACKAGE_DIRECTFB_TSLIB
Message-ID: <20170611135408.A293381674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbb8c663cc6416a7d7c7caed5c364ada794fb1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency on !BR2_STATIC_LIBS was here because of tslib not
supporting static builds. But since

   commit 05fadfea1 ("package/tslib: enable statically linked building")

it does and we can remove this dependecy.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 554abe2..20481f5 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -116,12 +116,8 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	default y
-	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_TSLIB
 
-comment "touchscreen support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
