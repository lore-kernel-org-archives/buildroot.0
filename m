From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 12:09:28 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: update glibc comment
	for noMMU
Message-ID: <20160408123252.6081F81E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6724b4f4733216aec251ab7744ad5277c4ff7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc is not available for noMMU platforms, so it doesn't make sense
to show the comment about glibc requiring dynamic libraries on noMMU
platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cb4fc18..ea290eb 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -83,6 +83,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	  http://www.gnu.org/software/libc/
 
 comment "(e)glibc only available with shared lib support"
+	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
