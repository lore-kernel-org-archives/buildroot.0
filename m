From: Anssi Hannula <anssi.hannula@bitwise.fi>
Date: Thu,  5 Apr 2018 16:43:54 +0300
Subject: [Buildroot] [PATCH] kexec: allow selection on aarch64
Message-ID: <20180405134354.32694-1-anssi.hannula@bitwise.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kexec works fine on aarch64, so allow selecting it on that architecture.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index c24dff3..c8cdea5 100644
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
-- 
2.8.3
