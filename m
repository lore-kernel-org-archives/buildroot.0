From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:29 +0200
Subject: [Buildroot] [PATCHv2 06/25] toolchain/helpers: ARM OABI is no
	longer supported
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
