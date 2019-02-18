From: Artem Senichev <artemsen@gmail.com>
Date: Mon, 18 Feb 2019 11:15:56 +0300
Subject: [Buildroot] [PATCH v2] package/kexec: enable powerpc64le platforms
Message-ID: <20190218081556.fsdiur6kimxac7oe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kexec has fully support of ppc64 platform:
https://www.kernel.org/doc/Documentation/kdump/kdump.txt

Signed-off-by: Artem Senichev <artemsen@gmail.com>
---
 package/kexec/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index c8cdea5663..410e503d9e 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
-		BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_aarch64
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sh4 || BR2_sh4a || BR2_aarch64
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
-- 
2.20.1
