From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:30 +0100
Subject: [Buildroot] [PATCH 61/84 RFC] package/poco: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <4f1a336e99667a33155b015388859cc34804b7da.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

poco has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/poco/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index dfdc8d1..1e7ca21 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_POCO
+menuconfig BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
@@ -15,8 +15,6 @@ config BR2_PACKAGE_POCO
 
 if BR2_PACKAGE_POCO
 
-comment "poco components"
-
 config BR2_PACKAGE_POCO_XML
 	bool "xml"
 	select BR2_PACKAGE_EXPAT
-- 
1.9.1
