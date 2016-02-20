From: Jan Heylen <heyleke@gmail.com>
Date: Sat, 20 Feb 2016 10:33:55 +0100
Subject: [Buildroot] [PATCH 2/2] arch: define appropriate ld emulation
	values for the MIPS architecture
In-Reply-To: <1455960835-28709-1-git-send-email-heyleke@gmail.com>
References: <1455960835-28709-1-git-send-email-heyleke@gmail.com>
Message-ID: <1455960835-28709-2-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

based upon patch from Thomas Petazzoni:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942

Signed-off-by: Jan Heylen <heyleke@gmail.com>
---
 arch/Config.in.mips | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index fda1a1d..37e4bf6 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -83,3 +83,11 @@ config BR2_GCC_TARGET_ABI
 	default "32"		if BR2_MIPS_OABI32
 	default "n32"		if BR2_MIPS_NABI32
 	default "64"		if BR2_MIPS_NABI64
+
+config BR2_LD_TARGET_EMULATION
+	default "elf64ltsmip"		if  BR2_mips64el && BR2_MIPS_NABI64
+	default "elf64btsmip"		if  BR2_mips64   && BR2_MIPS_NABI64
+	default "elf32ltsmipn32"	if  BR2_mips64el && BR2_MIPS_NABI32
+	default "elf32btsmipn32"	if  BR2_mips64   && BR2_MIPS_NABI32
+	default "elf32ltsmip"		if (BR2_mips64el && BR2_MIPS_OABI32) || BR2_mipsel
+	default "elf32btsmip"		if (BR2_mips64   && BR2_MIPS_OABI32) || BR2_mips
-- 
2.5.0
