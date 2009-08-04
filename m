From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 17:17:07 +0200
Subject: [Buildroot] [PATCH 1/2] webkit: only show the rendering backend
	choice when webkit is enabled
In-Reply-To: <cover.1249399026.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249399026.git.thomas.petazzoni@free-electrons.com>
Message-ID: <83cc37a0b234970cad2fe6d028cb1c00642e7ec3.1249399026.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index e436f9a..ecf8694 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -18,6 +18,8 @@ config BR2_PACKAGE_WEBKIT
 comment "webkit requires a toolchain with C++ support and WCHAR enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
+if BR2_PACKAGE_WEBKIT
+
 choice
 	prompt "Rendering target"
 	default BR2_PACKAGE_WEBKIT_X
@@ -32,3 +34,5 @@ config BR2_PACKAGE_WEBKIT_DIRECTFB
 	select BR2_PACKAGE_DIRECTFB
 
 endchoice
+
+endif
-- 
1.6.0.4
