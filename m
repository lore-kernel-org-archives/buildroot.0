From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:24:08 +0200
Subject: [Buildroot] [PATCH 3/8] scripts: force copy of files to erase
	already present and readonly files
In-Reply-To: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
References: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272587053-19535-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 scripts/copy.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/copy.sh b/scripts/copy.sh
index 410606d..508ed56 100755
--- a/scripts/copy.sh
+++ b/scripts/copy.sh
@@ -5,7 +5,7 @@ TARGET_DIR=$2
 
 echo "Copying development files to target..."
 
-cp -a ${STAGING_DIR}/usr/include ${TARGET_DIR}/usr
+cp -af ${STAGING_DIR}/usr/include ${TARGET_DIR}/usr
 
 for LIBSDIR in /lib /usr/lib; do
 	for WILDCARD in *.a *.la; do
@@ -13,7 +13,7 @@ for LIBSDIR in /lib /usr/lib; do
 			STAGING_STRIPPED=${FILE_PATH##${STAGING_DIR}}
 			EXTENDED_DIR=${STAGING_STRIPPED%/${WILDCARD}}
 			mkdir -p ${TARGET_DIR}${EXTENDED_DIR}
-			cp ${FILE_PATH} ${TARGET_DIR}${STAGING_STRIPPED}
+			cp -fa ${FILE_PATH} ${TARGET_DIR}${STAGING_STRIPPED}
 			#echo ${TARGET_DIR}${STAGING_STRIPPED}
 		done
 	done
-- 
1.7.0.4
