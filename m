From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Mar 2014 21:17:28 +0100
Subject: [Buildroot] [PATCH] support: do not depend on bash
Message-ID: <1395173848-15759-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We do want to work properly whatever the system shell or the
user's login shell are.

The current check is anyway broken, as it only checks if the
user's login shell is bash, not what the system shell is.

Remove the check altogether, since it is unneeded, and broken.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Andrew Barnes <andy@outsideglobe.com>
---
 support/dependencies/dependencies.sh | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a8261b3..8de1013 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -138,13 +138,6 @@ if [ ! -z "$CXXCOMPILER" ] ; then
 	fi
 fi
 
-# Check bash
-if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
-	echo
-	echo "You must install 'bash' on your build machine";
-	exit 1;
-fi;
-
 # Check that a few mandatory programs are installed
 missing_progs="no"
 for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
-- 
1.8.3.2
