From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Apr 2018 21:04:31 +0200
Subject: [Buildroot] [git commit] kexec: allow selection on aarch64
Message-ID: <20180405190755.DAE8985EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caeef1fc1ba699ac387717a7e9a16190565a3689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kexec works fine on aarch64, so allow selecting it on that architecture.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index c24dff38ec..c8cdea5663 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
-		BR2_powerpc || BR2_sh4 || BR2_sh4a
+		BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_aarch64
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
