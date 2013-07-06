From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:44 +0200
Subject: [Buildroot] [PATCH 05/12] toolchain/helpers: ARM OABI is no longer
	supported
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <786c4e1f1dd6043e11563d535916248e68b297ca.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/helpers.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1509ff8..0398b63 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -285,10 +285,6 @@ check_arm_abi = \
 	else \
 		EXT_TOOLCHAIN_ABI="oabi" ; \
 	fi ; \
-	if [ x$(BR2_ARM_OABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabi" ] ; then \
-		echo "Incorrect ABI setting" ; \
-		exit 1 ; \
-	fi ; \
 	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "oabi" ] ; then \
 		echo "Incorrect ABI setting" ; \
 		exit 1 ; \
-- 
1.8.1.2
