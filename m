From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:22 +0200
Subject: [Buildroot] [PATCH 13/16] midori: make sure it can't be selected if
	webkit can't be enabled
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <77df7c138ac9cdd6ec53b2f765deea5ade30faf9.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index f9117ea..b0557db 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -3,7 +3,12 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_INSTALL_LIBSTDCPP # webkit
+	depends on BR2_USE_WCHAR	 # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
+
+comment "midori requires a toolchain with C++ support and WCHAR enabled"
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-- 
1.7.0.4
