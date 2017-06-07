From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 7 Jun 2017 16:07:38 +0200
Subject: [Buildroot] [PATCH] package/xf86-input-tslib: enable static build
In-Reply-To: <20170607070100.10344-1-martin.kepplinger@ginzinger.com>
References: <20170607070100.10344-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170607140738.6147-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since tslib now supports static builds the dependency on !BR2_STATIC_LIBS
can be removed from xf86-input-tslib too.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---

I'll look at the rest of the possible candidates later


 package/x11r7/xdriver_xf86-input-tslib/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 08d790ca4..4e77abcb1 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
-	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -9,6 +8,3 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	  Touch screen library input driver
 
 	  https://github.com/merge/xf86-input-tslib
-
-comment "xf86-input-tslib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-- 
2.11.0
