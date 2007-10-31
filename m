From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Wed, 31 Oct 2007 08:30:35 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: add check for libtool and
	libtoolize
Message-ID: <11938158351147-git-send-email-hcegtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch checks if libtool and libtoolize is installed on the build system,
if not a warning is generated recommending the user to install the libtool
package.

Libtool is used by some packages to fix broken ltmain.sh scripts.

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 toolchain/dependencies/dependencies.sh |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 60b9b65..04885cd 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -260,6 +260,33 @@ echo "flex installed:					Ok"
 
 #############################################################
 #
+# check build system 'libtool'
+#
+#############################################################
+if ! which libtool > /dev/null ; then
+	echo "libtools installed:			     FALSE"
+	echo
+	echo "Most likely some packages will fail to configure."
+	echo "Either install 'libtool' on your host or fix the respective packages."
+	echo
+else
+	echo "libtool installed:				Ok"
+fi
+
+if ! which libtoolize > /dev/null ; then
+	echo "libtoolize installed:			     FALSE"
+	echo
+	echo "Most likely some packages will fail to configure."
+	echo "Either install 'libtoolize' on your host or fix the respective packages."
+	echo "Libtoolize can usually be found in the libtool package for your host."
+	echo
+else
+	echo "libtoolize installed:				Ok"
+fi
+
+
+#############################################################
+#
 # check build system 'gettext'
 #
 #############################################################
-- 
1.5.2.5
