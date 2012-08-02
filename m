From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:54:21 -0000
Subject: [Buildroot] [git commit branch/next] Revert "dependencies: ensure
	that DESTDIR isn't set when running Buildroot"
Message-ID: <20120802195247.DB9D496EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69b236024113da1eadc0b7d2d297308cec48bf65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We should instead simply unset it at runtime, like we do for
PKG_CONFIG_PATH.

This reverts commit 9910eba33adb2b783b0df5d90a857816e82fbd55.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 43ec3cc..c47ffcf 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -48,12 +48,6 @@ if test -n "$PERL_MM_OPT" ; then
     exit 1
 fi
 
-if test -n "$DESTDIR" ; then
-    /bin/echo -e "\nYou have the DESTDIR environment variable set. Please"
-    /bin/echo -e "unset it so that Buildroot can work properly."
-    exit 1
-fi
-
 # Verify that which is installed
 if ! which which > /dev/null ; then
 	/bin/echo -e "\nYou must install 'which' on your build machine\n";
