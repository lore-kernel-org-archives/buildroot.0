From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Sep 2009 09:03:40 +0200
Subject: [Buildroot] [git commit master] dependencies: check for >= make 3.81
Message-ID: <20090930070558.E18CA7766A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=44c10ff6b48e3597b8778199bba203bfc68beec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Andrew Dyer <amdyer@gmail.com> and
Lionel Landwerlin <lionel.landwerlin@openwide.fr>.

Seems like make 3.80 has problems with our Makefile.autotools.in
infrastructure.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/dependencies.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 98a9d6f..9e2e50b 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -165,8 +165,8 @@ if [ -z "$MAKE_VERSION" ] ; then
 fi;
 MAKE_MAJOR=$(echo $MAKE_VERSION | $XSED -e "s/\..*//g")
 MAKE_MINOR=$(echo $MAKE_VERSION | $XSED -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
-if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 80 ] ; then
-	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.80 is required"
+if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
+	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required"
 	exit 1;
 fi;
 echo "GNU make version '$MAKE_VERSION':			Ok"
-- 
1.6.3.3
