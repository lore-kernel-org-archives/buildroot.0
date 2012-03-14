From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 14 Mar 2012 16:33:54 +0100
Subject: [Buildroot] [PATCH 3/6] apply-patches.sh: cleanup
In-Reply-To: <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1331739237-29872-4-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Add quoting and remove redundant command.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7cd8abe..8c38007 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -55,8 +55,8 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
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
