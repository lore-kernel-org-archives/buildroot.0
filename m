From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Nov 2018 10:19:50 +0100
Subject: [Buildroot] [PATCH 3/3 v2] package: hide golang packages for
 toolchains with binutils bug 20006
In-Reply-To: <cover.1543137559.git.yann.morin.1998@free.fr>
References: <cover.1543137559.git.yann.morin.1998@free.fr>
Message-ID: <d64c03d07584a8f48ab309fff66d2ee5661d5ee3.1543137559.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/020/02039969b16534d4020ecd4574bae71b91c1e6b8/ (flannel)
    http://autobuild.buildroot.org/results/e95/e9528b06b350ef84c1e2cb59fba87b4db77b4660/ (docker-engine)
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>

---
Changes v1 -> v2:
  - drop per-package dependency, move it to BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
    (Thomas)
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
-- 
2.14.1
