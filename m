From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 09:56:47 +0100
Subject: [Buildroot] [git commit] package/libuv: bump to version 1.0.2
Message-ID: <20141211085851.CA23E801F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cebe3d25a0c0f4d4be66f3bc5c889a2cfadc38fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuv has moved to github.com/libuv/libuv

[Thomas: fix Config.in help text, as noticed by Baruch.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuv/Config.in |    2 +-
 package/libuv/libuv.mk  |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuv/Config.in b/package/libuv/Config.in
index 6083837..f6d7e5f 100644
--- a/package/libuv/Config.in
+++ b/package/libuv/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBUV
 	  libuv is a multi-platform support library with a focus
 	  on asynchronous I/O.
 
-	  https://github.com/joyent/libuv
+	  https://github.com/libuv/libuv
 
 comment "libuv needs a toolchain w/ IPv6, threads"
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 08bf8c5..33f8d2c 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v0.11.29
-LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
+LIBUV_VERSION = v1.0.2
+LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
