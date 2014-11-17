From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 17 Nov 2014 20:14:51 -0300
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
	support
In-Reply-To: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Freescale E5500 and E6500 core support.
These can go in 32 or 64-bit mode.
I'm not aware of these being able to boot in LE mode so filter that out
until we get some feedback on it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.powerpc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index f7f3ab1..c1142f2 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -109,6 +109,13 @@ config BR2_powerpc_e300c3
 config BR2_powerpc_e500mc
 	bool "e500mc"
 	depends on !BR2_ARCH_IS_64
+config BR2_powerpc_e5500
+	bool "e5500"
+	depends on !BR2_powerpc64le
+config BR2_powerpc_e6500
+	bool "e6500"
+	depends on !BR2_powerpc64le
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
 config BR2_powerpc_power5
-- 
2.0.4
