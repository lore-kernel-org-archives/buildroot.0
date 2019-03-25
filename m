From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:18:00 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/kexec: enable
 powerpc64le platforms
Message-ID: <20190325201614.615B482A1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=272a6677ff29c21841956c4dd2c6f05eee75bace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

kexec has fully support of ppc64 platform:
https://www.kernel.org/doc/Documentation/kdump/kdump.txt

Signed-off-by: Artem Senichev <artemsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 46a4af5214ccafa6cca39e2d9136f4822f40f3a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index c8cdea5663..c4a09be109 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
-		BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_aarch64
+		BR2_powerpc || BR2_powerpc64le || BR2_sh4 || BR2_sh4a || BR2_aarch64
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
