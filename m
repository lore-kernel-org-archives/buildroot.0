From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2015 22:45:32 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/mosh: fix dependencies
Message-ID: <1439325932-14400-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mosh selects protobuf, so it needs to propagate *all* its dependencies.

Fixes:
    http://autobuild.buildroot.org/results/1e7/1e7d28018252fa48ee1ccd68d0a21afb3e0f072f/
    http://autobuild.buildroot.org/results/a91/a91ea29454a6f8eefc0bf4f0eb137dd8e061f028/
    http://autobuild.buildroot.org/results/ecb/ecb67c1d1b04a79ad9fbe4a09121ec492fe1501c/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@paral.in>
---
 package/mosh/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 4ad7d61..feba023 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -5,7 +5,8 @@ comment "mosh needs a toolchain w/ threads"
 config BR2_PACKAGE_MOSH
 	bool "mosh"
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS #protobuf
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
-- 
1.9.1
