From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun,  3 May 2009 13:41:55 +0200
Subject: [Buildroot] [PATCH 1/4] scripts/package wizard: make workable from
	TOPDIR
In-Reply-To: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
References: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
Message-ID: <1241350918-32451-2-git-send-email-markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before you to had to be in a subdirectory, for example package/
Now you can call it from anywhere.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/add_new_package.wizard |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/add_new_package.wizard b/scripts/add_new_package.wizard
index 4ad72c9..bbcd7f6 100755
--- a/scripts/add_new_package.wizard
+++ b/scripts/add_new_package.wizard
@@ -49,10 +49,11 @@ URL=${DOWNLOAD_LOC%/*}
 TARBALL=${DOWNLOAD_LOC##*/}
 EXTENSION=${TARBALL##*.tar.}
 NAME_UPPER=`echo ${PACKAGE_NAME} | tr a-z- A-Z_`
+PACKAGE_DIR=`dirname $0`/../package/${PACKAGE_NAME}
 
-mkdir ../package/${PACKAGE_NAME}
+mkdir ${PACKAGE_DIR}
 
-cat > ../package/${PACKAGE_NAME}/${PACKAGE_NAME}.mk <<EOF
+cat > ${PACKAGE_DIR}/${PACKAGE_NAME}.mk <<EOF
 #############################################################
 #
 # ${PACKAGE_NAME}
@@ -73,7 +74,7 @@ ${NAME_UPPER}_DEPENDENCIES = uclibc ${EXTRA_DEPS}
 
 EOF
 
-cat > ../package/${PACKAGE_NAME}/Config.in <<EOF
+cat > ${PACKAGE_DIR}/Config.in <<EOF
 config BR2_PACKAGE_${NAME_UPPER}
 	bool "${PACKAGE_NAME}"
 	help
-- 
1.6.3.rc4.11.g6eda9
