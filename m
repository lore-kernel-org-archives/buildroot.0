From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Feb 2015 22:14:30 +0100
Subject: [Buildroot] [PATCH for buildroot-test 2/2] br-reproduce-build: do a
	fetch instead of a pull
In-Reply-To: <1424294070-21508-1-git-send-email-fabio.porcedda@gmail.com>
References: <1424294070-21508-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1424294070-21508-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pull is not needed so use a cheaper fetch, also it will work even if
the existing repository doesn't point to branches of the official
repository.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 utils/br-reproduce-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index 10a2d13..01d1b7a 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -47,9 +47,9 @@ cd buildroot
 
 git remote set-url origin git://git.busybox.net/buildroot
 
-git pull
+git fetch
 if [ $? -ne 0 ] ; then
-    echo "Cannot pull Buildroot Git repository"
+    echo "Cannot fetch Buildroot official Git repository"
     rm -rf ${BUILD_DIR}
     exit 1
 fi
-- 
2.3.0
