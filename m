From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:22:20 +0200
Subject: [Buildroot] [PATCH 5/5 v2] arc/bfin: remove 60x cores
In-Reply-To: <cover.1504430497.git.yann.morin.1998@free.fr>
References: <cover.1504430497.git.yann.morin.1998@free.fr>
Message-ID: <0335a8a1164bfeb7c006c7d248d8f1923069c98f.1504430497.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those cores are not supported in upstream gcc, not even in master.

The only toolchain that supported those core was the 2014R1 ADI
rebuilt toolchain, but we removed it in 311bc13 (toolchain: kill
ADI Blackfin toolchain) because there was too many issues with it.
ADI has not released any newer toolchain since then.

There is little hope for those cores now, so remove them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.bfin | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 9ad2dd7ef4..bd9589c71d 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -4,18 +4,6 @@ choice
 	default BR2_bf532
 	help
 	  Specify target CPU
-config BR2_bf606
-	bool "bf606"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-config BR2_bf607
-	bool "bf607"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-config BR2_bf608
-	bool "bf608"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-config BR2_bf609
-	bool "bf609"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 config BR2_bf512
 	bool "bf512"
 config BR2_bf514
-- 
2.11.0
