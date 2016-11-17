From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 17 Nov 2016 15:42:50 +1100
Subject: [Buildroot] [PATCH 1/1] package/qemu: enable for powerpc64 and
	powerpc64le
Message-ID: <a6ab4bebbe3a4c9d7f3f4737525e1e66c5e64741.1479357769.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---

 package/qemu/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 8bae5f4..72252ac 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
 	default y if BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel \
-		|| BR2_x86_64 || BR2_arm
+		|| BR2_x86_64 || BR2_arm \
+		|| BR2_powerpc64 || BR2_powerpc64le
 
 comment "QEMU requires a toolchain with wchar, threads"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
-- 
2.10.0.297.gf6727b0
