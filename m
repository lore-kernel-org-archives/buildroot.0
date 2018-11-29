From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:22:45 +0100
Subject: [Buildroot] [git commit] package: hide golang packages for
 toolchains with binutils bug 20006
Message-ID: <20181129202131.C8D2188F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcb8ef0fdcea6f60fefba8368b4c93048e837141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/020/02039969b16534d4020ecd4574bae71b91c1e6b8/ (flannel)
    http://autobuild.buildroot.org/results/e95/e9528b06b350ef84c1e2cb59fba87b4db77b4660/ (docker-engine)
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index c871ac4196..f619ca0073 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
