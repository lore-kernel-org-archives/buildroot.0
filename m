From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 8 Jun 2017 12:15:37 +0200
Subject: [Buildroot] [PATCH v2] package/directfb: enable static build for
	BR2_PACKAGE_DIRECTFB_TSLIB
In-Reply-To: <20170608074642.26516-1-martin.kepplinger@ginzinger.com>
References: <20170608074642.26516-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170608101537.32705-1-martin.kepplinger@ginzinger.com>
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

v2:
I forgot to remove the comment and dependecy on BR2_STATIC_LIBS


 package/directfb/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 554abe289..20481f56d 100644
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
-- 
2.11.0
