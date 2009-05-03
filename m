From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun,  3 May 2009 13:41:56 +0200
Subject: [Buildroot] [PATCH 2/4] scripts/package wizard: delete trailing
	whitespace and empty lines
In-Reply-To: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
References: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
Message-ID: <1241350918-32451-3-git-send-email-markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this script and in the .mk output. Let's avoid unnecessary whitespace
issues in new packages created with this wizard.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/add_new_package.wizard |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/scripts/add_new_package.wizard b/scripts/add_new_package.wizard
index bbcd7f6..d4127f4 100755
--- a/scripts/add_new_package.wizard
+++ b/scripts/add_new_package.wizard
@@ -53,7 +53,7 @@ PACKAGE_DIR=`dirname $0`/../package/${PACKAGE_NAME}
 
 mkdir ${PACKAGE_DIR}
 
-cat > ${PACKAGE_DIR}/${PACKAGE_NAME}.mk <<EOF
+sed -e 's/ *$//g' > ${PACKAGE_DIR}/${PACKAGE_NAME}.mk <<EOF
 #############################################################
 #
 # ${PACKAGE_NAME}
@@ -71,7 +71,6 @@ ${NAME_UPPER}_CONF_OPT = ${CONFIG_OPTIONS}
 ${NAME_UPPER}_DEPENDENCIES = uclibc ${EXTRA_DEPS}
 
 \$(eval \$(call AUTOTARGETS,package,${PACKAGE_NAME}))
-
 EOF
 
 cat > ${PACKAGE_DIR}/Config.in <<EOF
@@ -90,4 +89,3 @@ echo
 echo "You are now ready to build ${PACKAGE_NAME}"
 echo "Just run make menuconfig and select your new"
 echo "package, then run make."
- 
-- 
1.6.3.rc4.11.g6eda9
