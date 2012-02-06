From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon,  6 Feb 2012 02:47:16 +0100
Subject: [Buildroot] [RFC PATCH 3/6] apply-patches.sh: cleanup
In-Reply-To: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <85f010a5eaa0fbe95d44ad0c79b2c07e1705f154.1328492511.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Add quoting and remove redundant command.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2667d04..2eab05d 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -54,8 +54,8 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
     esac fi
     echo ""
     echo "Applying ${i} using ${type}: " 
-	echo ${i} | cat >> ${builddir}/.applied_patches_list
-    ${uncomp} ${patchdir}/${i} ${uncomp_parm} | ${apply} ${builddir}
+	echo ${i} >> ${builddir}/.applied_patches_list
+    ${uncomp} "${patchdir}/${i}" ${uncomp_parm} | ${apply} "${builddir}"
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix $i!"
 	exit 1
-- 
1.7.5.4
