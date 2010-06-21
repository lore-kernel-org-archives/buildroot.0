From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] check-host-sed.sh: use mktemp
	for temporary file
Message-ID: <20100621210812.53FA7817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bec3480a4403d8b666e7b04348306b49202ffac5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/check-host-sed.sh |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/toolchain/dependencies/check-host-sed.sh b/toolchain/dependencies/check-host-sed.sh
index 188b721..ed9a1d4 100755
--- a/toolchain/dependencies/check-host-sed.sh
+++ b/toolchain/dependencies/check-host-sed.sh
@@ -12,9 +12,10 @@ do
 		fi
 	fi
 
-	echo "HELLO" > .sedtest
-	$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
-	RESULT=$(cat .sedtest)
+	tmp=$(mktemp)
+	echo "HELLO" > $tmp
+	$SED -i -e "s/HELLO/GOODBYE/" $tmp >/dev/null 2>&1
+	RESULT=$(cat $tmp)
 
 	if test $? != 0 ; then
 		SED=""
@@ -26,7 +27,7 @@ do
 		SED=""
 	fi
 
-	rm -f .sedtest
+	rm -f $tmp
 	if [ ! -z "$SED" ] ; then
 		break
 	fi
-- 
1.7.1
