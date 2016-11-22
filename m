From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:41:50 +0100
Subject: [Buildroot] [git commit branch/next] package/qemu: enable for
	powerpc64 and powerpc64le
Message-ID: <20161122094153.6964881D80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79573562fd5e9c455ebd9061b2370e886ee2da29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ea6b946..e935ef9 100644
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
