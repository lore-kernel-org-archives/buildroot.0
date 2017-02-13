From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 21:26:20 +0100
Subject: [Buildroot] [git commit] xfsprogs: needs thread support
Message-ID: <20170213202649.792DE802FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c557a22438647890e27c77bbf76f3a9f16d6d103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.net/results/57975f401f39b673eeec304b4738cfb41a19ece7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xfsprogs/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index ccb3214..9f0d250 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,11 +1,12 @@
-comment "xfsprogs needs a glibc or uClibc toolchain"
+comment "xfsprogs needs a glibc or uClibc toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
