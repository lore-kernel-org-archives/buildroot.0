From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jun 2021 16:14:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/luvi: requires DES support in
 openssl
Message-ID: <20210613141421.1390478-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/d8452e2de1bd866953d3bb0cb951e9f877f9a6e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luvi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index c9fd417394..6e96f85f32 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LUVI
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  A project in-between luv and luvit. The goal of this is to
 	  make building luvit and derivatives much easier.
-- 
2.30.2
