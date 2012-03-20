From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 23:51:10 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: cleanup
Message-ID: <20120320233159.AE89C95403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b671d477bc3154c1c72e2a770b8a97e4566a359
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add quoting and remove redundant command.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 908ce22..c741a63 100755
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
