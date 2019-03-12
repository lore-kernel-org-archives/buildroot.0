From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Mar 2019 00:08:37 +0100
Subject: [Buildroot] [PATCH 3/5] package/binutils: use the default binutils
 version (2.31) for ARM with thumb mode enabled.
In-Reply-To: <20190312230839.23307-1-romain.naour@gmail.com>
References: <20190312230839.23307-1-romain.naour@gmail.com>
Message-ID: <20190312230839.23307-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binutils 2.29 and 2.30 are affected by a bug in ADR and ADRL
pseudo-instruction [1] that was fixed in Binutils 2.31 [2].

  * The ADR and ADRL pseudo-instructions supported by the ARM assembler
    now only set the bottom bit of the address of thumb function symbols
    if the -mthumb-interwork command line option is active.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=21458
[2] https://sourceware.org/ml/binutils/2018-07/msg00213.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/Config.in.host | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8485568170..ec1e0d8dd7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,8 +8,6 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB
-	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
 	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
-- 
2.14.5
