From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  9 May 2018 18:33:22 +0200
Subject: [Buildroot] [PATCH v2 1/2] toolchain/buildroot: Fix symbol for
 uClibc
Message-ID: <20180509163323.30172-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Symbol BR2_TOOLCHAIN_UCLIBC doesn't exist, it was meant to be
BR2_TOOLCHAIN_BUILDROOT_UCLIBC.

Fixes: 493b1177b9 toolchain/buildroot: default to uClibc

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
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
-- 
2.16.3
