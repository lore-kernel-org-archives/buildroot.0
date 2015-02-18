From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Feb 2015 22:14:29 +0100
Subject: [Buildroot] [PATCH for buildroot-test 1/2] br-reproduce-build:
	support repository with non standard name
Message-ID: <1424294070-21508-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use "buildroot" as the name of the cloned repositoy so even if the
existing repository name isn't "buildroot" the script will works fine.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 utils/br-reproduce-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index c0dc530..10a2d13 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -36,7 +36,7 @@ fi
 wget -O ${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid
 
 cd ${BUILD_DIR}
-git clone ${BASE_GIT}
+git clone ${BASE_GIT} buildroot
 if [ $? -ne 0 ] ; then
     echo "Cannot clone Buildroot Git repository"
     rm -rf ${BUILD_DIR}
-- 
2.3.0
