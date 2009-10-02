From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 09:06:51 +0200
Subject: [Buildroot] [git commit master] dependencies: check for 'patch'
Message-ID: <20091002070925.8F6137775E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7f7bf9637e2a9c32292d350a3155ce5301261ed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need patch for patch-kernel.sh, so verify that it's available
before building.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/dependencies.sh |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 9e2e50b..a3ee111 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -297,6 +297,12 @@ fi;
 echo "gettext installed:				Ok"
 
 
+#############################################################
+#
+# check build system 'makeinfo'
+#
+#############################################################
+
 if ! which makeinfo > /dev/null ; then \
 	echo "makeinfo installed:		    FALSE"
 	/bin/echo -e "\n\nMost likely some packages will fail to build their documentation"
@@ -306,6 +312,17 @@ else
 	echo "makeinfo installed:				Ok"
 fi
 
+#############################################################
+#
+# check build system 'patch'
+#
+#############################################################
+if ! which patch > /dev/null ; then \
+	echo "patch installed:				FALSE"
+	/bin/echo -e "\n\nYou must install 'patch' on your build machine\n"; \
+	exit 1; \
+fi;
+echo "patch installed:				Ok"
 
 #############################################################
 #
-- 
1.6.3.3
