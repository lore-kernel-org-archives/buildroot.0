From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 23:40:10 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/protobuf: disable
 package if binutils is affected from bug 21464
Message-ID: <20210320221846.9E771814BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aad439be45943b6f655d2a4ea111996c470dbf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e71b6e2cb28a66e116019bf8808fb48cef1d7b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 46c820b9cf..30050950aa 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
