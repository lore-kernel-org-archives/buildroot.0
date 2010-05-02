From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] scripts: force copy of files to
	erase already present and readonly files
Message-ID: <20100502074444.297BB8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6660b7dc3fd34de25de64d1cf983d097939b47c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
