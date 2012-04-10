From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:10:47 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain: add m68k to the list of arch
	that can work without MMU
In-Reply-To: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
Message-ID: <881ef065c0099160e74e9fe8da3b3a5cafefa685.1334074065.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The early m68k had no MMU, later m68k had MMUs, but Coldfires don't
have MMU.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index fb87a88..f29ccae 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -75,7 +75,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
+	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa || BR2_m68k
 	default y if !BR2_bfin
 	help
 	  If your target has a MMU, you should say Y here.  If you
-- 
1.7.4.1
