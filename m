From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:16:07 +0200
Subject: [Buildroot] [git commit] toolchain/helpers: ARM OABI is no longer
	supported
Message-ID: <20130714204246.8EE6B9A4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3923dd1bfe854afc010636ee2aada0161ed97a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
