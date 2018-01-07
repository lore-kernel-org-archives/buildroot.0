From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:13:53 +0100
Subject: [Buildroot] [git commit] numactl: enable for aarch64
Message-ID: <20180107141357.549D0839EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c28d4e8fcd8bd651c47cf769676a7a4ffb354d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

numactl works on aarch64 so enable it for that architecture.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Will Newton <will.newton@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/numactl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index f18e28d..95057d3 100644
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
