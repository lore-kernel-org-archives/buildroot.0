From: Artem Senichev <artemsen@gmail.com>
Date: Wed, 13 Feb 2019 11:51:11 +0300
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64le platforms
Message-ID: <20190213085111.uuar2ehi7k2htdfg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kexec has fully support of ppc64 platform:
https://www.kernel.org/doc/Documentation/kdump/kdump.txt

Signed-off-by: Artem Senichev <artemsen@gmail.com>
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
-- 
2.20.1
