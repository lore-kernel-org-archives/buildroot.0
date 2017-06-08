From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 8 Jun 2017 12:03:12 +0200
Subject: [Buildroot] [PATCH v2] package/qt: enable static build for
	BR2_PACKAGE_QT_MOUSE_TSLIB
In-Reply-To: <20170608095112.f7z7hnyi4m7vmzta@tarshish>
References: <20170608095112.f7z7hnyi4m7vmzta@tarshish>
Message-ID: <20170608100312.31806-1-martin.kepplinger@ginzinger.com>
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
Thanks Baruch Siach for reviewing. I missed removing the dependecy on
BR2_STATIC_LIBS


 package/qt/Config.mouse.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 07573ebb8..1062facb6 100644
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
 
-- 
2.11.0
