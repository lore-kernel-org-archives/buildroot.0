From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:02:49 +0200
Subject: [Buildroot] [git commit] package/luvi: requires DES support in
 openssl
Message-ID: <20210613193436.642CA7FA97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cda5ea6d4338b0cd8e686122b9be4315a8057028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/d8452e2de1bd866953d3bb0cb951e9f877f9a6e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
