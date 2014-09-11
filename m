From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Sep 2014 08:56:32 -0300
Subject: [Buildroot] [PATCH 2/2] arch/powerpc: default to soft-float for SPE
	ABI
In-Reply-To: <1410436592-1990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410436592-1990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410436592-1990-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It really is the way forward so switch the default.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.powerpc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 239f5dc..4c21739 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -141,6 +141,7 @@ endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
 	bool "Use soft-float"
+	default y if BR2_powerpc_SPE
 	select BR2_SOFT_FLOAT
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU)
-- 
1.8.5.5
