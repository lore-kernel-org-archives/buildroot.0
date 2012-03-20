From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 23:52:29 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: directories are no more
	considered as overlays
Message-ID: <20120320233159.BCD3E953F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b58957a9637d3b3d1ae13ec26096d737fdd1a45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a directory is found in patchdir, it is skipped.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index c741a63..3d655f1 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -30,10 +30,7 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
     apply="patch -g0 -p1 -E -d"
     uncomp_parm=""
     if [ -d "${patchdir}/$i" ] ; then
-	type="directory overlay"
-	uncomp="tar cf - --exclude=.svn --no-anchored -C"
-	uncomp_parm="."
-	apply="tar xvf - -C"
+	echo "${patchdir}/$i skipped"
     else case "$i" in
 	*.gz)
 	type="gzip"; uncomp="gunzip -dc"; ;; 
