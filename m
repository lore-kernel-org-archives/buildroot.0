From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 20 Sep 2010 23:26:07 +0200
Subject: [Buildroot] [PATCH 2/4] skeleton: fix atstk1005,
	ststk100x and atngw100 for POSIX compliance
In-Reply-To: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1285017969-32280-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using two '=' for string comparison is a bashism.
Revert to using one, as stated in POSIX 1003.1-2008.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../atngw100/target_skeleton/etc/init.d/S99gpio    |    6 +++---
 .../atstk1005/target_skeleton/etc/init.d/S99gpio   |    6 +++---
 .../atstk100x/target_skeleton/etc/init.d/S99gpio   |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S99gpio b/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S99gpio
index ea07784..3a17740 100755
--- a/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S99gpio
+++ b/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S99gpio
@@ -8,9 +8,9 @@ fi
 
 BOARD=`cat /etc/release | cut -d ' ' -f1`
 
-if [ "${BOARD}" == "" ]; then
+if [ "${BOARD}" = "" ]; then
 	echo "none";
-elif [ "${BOARD}" == "NGW100" ]; then
+elif [ "${BOARD}" = "NGW100" ]; then
 	echo "'${BOARD}'"
 
 	echo -n "  boot LED: "
@@ -111,7 +111,7 @@ elif [ "${BOARD}" == "NGW100" ]; then
 		echo "failed"
 		exit 1
 	fi
-elif [ "${BOARD}" == "STK1000" ]; then # end NGW100
+elif [ "${BOARD}" = "STK1000" ]; then # end NGW100
 	echo "'${BOARD}'"
 
 	echo -n "  switches: "
diff --git a/target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S99gpio b/target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S99gpio
index 967761a..7c07f28 100644
--- a/target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S99gpio
+++ b/target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S99gpio
@@ -8,9 +8,9 @@ fi
 
 BOARD=`cat /etc/release | cut -d ' ' -f1`
 
-if [ "${BOARD}" == "" ]; then
+if [ "${BOARD}" = "" ]; then
 	echo "none";
-elif [ "${BOARD}" == "NGW" ]; then
+elif [ "${BOARD}" = "NGW" ]; then
 	echo "'${BOARD}'"
 
 	echo -n "  boot LED: "
@@ -111,7 +111,7 @@ elif [ "${BOARD}" == "NGW" ]; then
 		echo "failed"
 		exit 1
 	fi
-elif [ "${BOARD}" == "STK1000" ]; then # end NGW
+elif [ "${BOARD}" = "STK1000" ]; then # end NGW
 	echo "'${BOARD}'"
 
 	echo -n "  switches: "
diff --git a/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99gpio b/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99gpio
index 967761a..7c07f28 100644
--- a/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99gpio
+++ b/target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99gpio
@@ -8,9 +8,9 @@ fi
 
 BOARD=`cat /etc/release | cut -d ' ' -f1`
 
-if [ "${BOARD}" == "" ]; then
+if [ "${BOARD}" = "" ]; then
 	echo "none";
-elif [ "${BOARD}" == "NGW" ]; then
+elif [ "${BOARD}" = "NGW" ]; then
 	echo "'${BOARD}'"
 
 	echo -n "  boot LED: "
@@ -111,7 +111,7 @@ elif [ "${BOARD}" == "NGW" ]; then
 		echo "failed"
 		exit 1
 	fi
-elif [ "${BOARD}" == "STK1000" ]; then # end NGW
+elif [ "${BOARD}" = "STK1000" ]; then # end NGW
 	echo "'${BOARD}'"
 
 	echo -n "  switches: "
-- 
1.7.1
