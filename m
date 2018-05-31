From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 31 May 2018 10:17:09 +0000
Subject: [Buildroot] [PATCH 3/4] package/binutils: Cortex-M targets require
 version <2.29
In-Reply-To: <1527761825-26682-1-git-send-email-christophe.priouzeau@st.com>
References: <1527761825-26682-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <1527761825-26682-3-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent GONZALEZ <br22@gezedo.com>

binutils 2.29 changed the implementation of adr pseudo instruction
it breaks linux kernel and impacts Cortex-M targets (eg. stm32)

Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 package/binutils/Config.in.host | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 03b2281..9a4caad 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,9 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
-	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M
+	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc && !BR2_ARM_CPU_ARMV7M
+	default BR2_BINUTILS_VERSION_ARC if BR2_arc && !BR2_ARM_CPU_ARMV7M
 	help
 	  Select the version of binutils you wish to use.
 
-- 
2.7.4
