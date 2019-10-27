From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 10:00:29 +0100
Subject: [Buildroot] [git commit] docs/manual: bump our gcc/g++ requirements
 to 4.8
Message-ID: <20191027085730.6E49988EA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ee815ab6a9a2f93f4260126b80aec3ba27e6598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we only require a gcc 4.4 version, which now is pretty old
(released in April 2009).  This requirement is not even tested nowadays,
with our oldest autobuilder having a 4.7 version only.

And even then, 4.7 is still old enough that it prevents us from
upgrading some packages. For example cmake 3.10+ requires C++11
constructs that were only added in gcc 4.8 (when C++11 support was
finally completed in gcc).

So, update our requirements for gcc to at least 4.8.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt         | 4 ++--
 support/dependencies/dependencies.sh | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index a32fdbfbc6..1f67e72a24 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -23,8 +23,8 @@ between distributions).
 ** +make+ (version 3.81 or any later)
 ** +binutils+
 ** +build-essential+ (only for Debian based systems)
-** +gcc+ (version 4.4 or any later)
-** `g++` (version 4.4 or any later)
+** +gcc+ (version 4.8 or any later)
+** `g++` (version 4.8 or any later)
 ** +bash+
 ** +patch+
 ** +gzip+
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 1b66fb6e7d..972f055e32 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -112,9 +112,9 @@ if [ -z "$COMPILER_VERSION" ] ; then
 fi;
 COMPILER_MAJOR=$(echo $COMPILER_VERSION | sed -e "s/\..*//g")
 COMPILER_MINOR=$(echo $COMPILER_VERSION | sed -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
-if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ] ; then
+if [ $COMPILER_MAJOR -lt 4 -o $COMPILER_MAJOR -eq 4 -a $COMPILER_MINOR -lt 8 ] ; then
 	echo
-	echo "You have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required"
+	echo "You have gcc '$COMPILER_VERSION' installed.  gcc >= 4.8 is required"
 	exit 1;
 fi;
 
@@ -140,9 +140,9 @@ fi
 if [ -n "$CXXCOMPILER_VERSION" ] ; then
 	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
 	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
-	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
+	if [ $CXXCOMPILER_MAJOR -lt 4 -o $CXXCOMPILER_MAJOR -eq 4 -a $CXXCOMPILER_MINOR -lt 8 ] ; then
 		echo
-		echo "You have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required"
+		echo "You have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 4.8 is required"
 		exit 1
 	fi
 fi
