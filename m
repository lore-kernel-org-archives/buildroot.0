From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 09:26:56 +0200
Subject: [Buildroot] [git commit] package/uclibc: fixup e500mc support
Message-ID: <20131025073057.EA3409BBAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f3575c3ac4b28c64aa44058866a648bf555f036
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The e500mc core has a classic FPU, SPE is a bad word.
See: http://en.wikipedia.org/wiki/PowerPC_e500#e500mc

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index acf736a..2de0270 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -244,8 +244,8 @@ config BR2_UCLIBC_SPARC_TYPE
 config BR2_UCLIBC_POWERPC_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
-	default CLASSIC if !BR2_powerpc_8540 && !BR2_powerpc_8548 && !BR2_powerpc_e500mc
-	default E500    if BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc
+	default CLASSIC if !BR2_powerpc_8540 && !BR2_powerpc_8548
+	default E500    if BR2_powerpc_8540 || BR2_powerpc_8548
 
 config BR2_UCLIBC_X86_TYPE
 	string
