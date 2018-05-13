From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:09:34 +0200
Subject: [Buildroot] [git commit] toolchain/buildroot: fix default of C
 library choice
Message-ID: <20180513200917.339A589141@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0527483fae228c31c3bb36aeba347c0a8df4eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_TOOLCHAIN_UCLIBC symbol doesn't exist, it was meant to be
BR2_TOOLCHAIN_BUILDROOT_UCLIBC.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2f6624d217..75e8191f46 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,7 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 choice
 	prompt "C library"
-	default BR2_TOOLCHAIN_UCLIBC
+	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
