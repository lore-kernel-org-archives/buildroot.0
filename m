From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun,  3 May 2009 13:41:58 +0200
Subject: [Buildroot] [PATCH 4/4] scripts/package wizard: clarify the steps
	after the wizard
In-Reply-To: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
References: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
Message-ID: <1241350918-32451-5-git-send-email-markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/add_new_package.wizard |   30 +++++++++++++++++++++---------
 1 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/scripts/add_new_package.wizard b/scripts/add_new_package.wizard
index 902718d..4ee02df 100755
--- a/scripts/add_new_package.wizard
+++ b/scripts/add_new_package.wizard
@@ -92,17 +92,29 @@ config BR2_PACKAGE_${NAME_UPPER}
 	  ${URL}
 EOF
 
-echo "Just add: source \"${CATEGORY_DIR}/${PACKAGE_NAME}/Config.in\""
-echo "to the file ${CATEGORY_DIR}/Config.in in an appropriate"
-echo "location."
+echo
+echo "**** Manual steps to integrate your new package ****"
+echo
+
+echo "Add the following line to ${CATEGORY_DIR}/Config.in"
+echo "in an appropriate location:"
+echo "source \"${CATEGORY_DIR}/${PACKAGE_NAME}/Config.in\""
 
 if [ -n "$SUB_DIR" ]; then
-	echo "Additionally add: source \"${CATEGORY_DIR}/Config.in\""
-	echo "to the file package/Config.in in an appropriate"
-	echo "location."
+	echo
+	echo "Additionally add the following line to package/Config.in"
+	echo "in an appropriate location:"
+	echo "source \"${CATEGORY_DIR}/Config.in\""
+fi
+
+if [ -n "$EXTRA_DEPS" ]; then
+	echo
+	echo "You need to add \"depends on\" and/or \"select\" lines"
+	echo "to ${CATEGORY_DIR}/${PACKAGE_NAME}/Config.in"
+	echo "corresponding to the \"${NAME_UPPER}_DEPENDENCIES\" line"
+	echo "in ${CATEGORY_DIR}/${PACKAGE_NAME}/${PACKAGE_NAME}.mk"
 fi
 
 echo
-echo "You are now ready to build ${PACKAGE_NAME}"
-echo "Just run make menuconfig and select your new"
-echo "package, then run make."
+echo "After that run \"make menuconfig\", select your new package"
+echo "and run \"make\" to build \"${PACKAGE_NAME}\"."
-- 
1.6.3.rc4.11.g6eda9
