From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 8 Jun 2017 09:46:42 +0200
Subject: [Buildroot] [PATCH] package/directfb: enable static build for
	BR2_PACKAGE_DIRECTFB_TSLIB
Message-ID: <20170608074642.26516-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on !BR2_STATIC_LIBS was here because of tslib not supporing
static builds. But since

   commit 05fadfea1 ("package/tslib: enable statically linked building")

it does and we can remove this dependecy.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/directfb/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 554abe289..aed6a170a 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -116,7 +116,6 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	default y
-	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_TSLIB
 
 comment "touchscreen support needs a toolchain w/ dynamic library"
-- 
2.11.0
