From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Sat,  6 Jan 2018 18:15:53 +0100
Subject: [Buildroot] [PATCH] numactl: enable for aarch64
Message-ID: <20180106171553.5585-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

numactl works on aarch64 so enable it for that architecture.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Will Newton <will.newton@imgtec.com>
---


Hi,

I also checked with test-pkg and it is still happy after this patch.

Best regards,

Vincent.


 package/numactl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index f18e28d9ff..95057d3c33 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_NUMACTL
 	bool "numactl"
 	# numactl uses some system calls that are not available on all
 	# architectures.
-	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
+	depends on BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
 	help
 	  numactl allows you to run your application on specific cpus
-- 
2.15.1
