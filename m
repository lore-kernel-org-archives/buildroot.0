From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 12:09:10 -0800
Subject: [Buildroot] [git commit] dependencies.sh: only javac and jar are
	needed by classpath
Message-ID: <20121204201924.445EA99932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=694050ffa2f3cbbfe7234b434f16f02cb93fa940
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 1b79b23..7a02512 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -159,7 +159,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
    fi
 fi
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
-    for prog in java javac jar; do
+    for prog in javac jar; do
 	if ! which $prog > /dev/null ; then
 	    /bin/echo -e "\nYou must install '$prog' on your build machine\n" >&2
 	    exit 1
