From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:13:34 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package: hide golang
 packages for toolchains with binutils bug 20006
Message-ID: <20181203221533.395238A6B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0b69bba8237d4b40c9e8fa427fe7695c01b879f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:
    http://autobuild.buildroot.org/results/020/02039969b16534d4020ecd4574bae71b91c1e6b8/ (flannel)
    http://autobuild.buildroot.org/results/e95/e9528b06b350ef84c1e2cb59fba87b4db77b4660/ (docker-engine)
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bcb8ef0fdcea6f60fefba8368b4c93048e837141)
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
