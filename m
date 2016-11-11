From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 21:35:29 +0100
Subject: [Buildroot] [git commit] go: remove powerpc64 big-endian from
	supported architectures
Message-ID: <20161111203825.2F43881922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1a2f09e6956f880c9f56d8be27e38adaca3179f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cgo currently doesn't properly support powerpc64 big-endian, as noted
in https://github.com/golang/go/issues/13192, and indeed, we have a
large number of build failures of Go packages on this
architecture. This commit therefore disables Go on PowerPC64
big-endian (PowerPC64 little-endian is fine).

Fixes:

  http://autobuild.buildroot.net/results/a6e9bac0a735f48d0ba0af081aeac4ed9fdfaca7/
  (flannel)

  http://autobuild.buildroot.net/results/230f52bc35f437836c7a76d4b58ef454635ee0d3/
  (docker-containerd)

  http://autobuild.buildroot.net/results/77c31d6e8f5efe3e024e27a160cf5d1d1952719e/
  (runc)

  http://autobuild.buildroot.net/results/a87b07417ea8bd81ffe27e5661b4359ddc0149ab/
  (docker-engine)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 8d4d346..a210033 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
-		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le \
+		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
