From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:16 +0200
Subject: [Buildroot] [PATCH 65/83 v2] package/poco: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <7edf1023b0eb364d942b004d253c9f7792c82b1b.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

poco has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.7.4
