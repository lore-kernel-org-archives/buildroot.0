From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 14 Mar 2012 16:33:55 +0100
Subject: [Buildroot] [PATCH 4/6] apply-patches.sh: directories are no more
	considered as overlays
In-Reply-To: <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1331739237-29872-5-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

When a directory is found in patchdir, it is skipped.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
---
 support/scripts/apply-patches.sh |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 8c38007..25cf8ce 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -31,10 +31,7 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
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
-- 
1.7.5.4
