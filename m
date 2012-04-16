From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 23:19:08 +0200
Subject: [Buildroot] [git commit] apply-patches.sh: patch pattern was
	expanded prematurely
Message-ID: <20120416211945.411E996AEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c717bbfffea0c55d348435e9b98e492b11b9177
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch pattern was expanded before being into the patch directory so the
expansion can add incorrect files.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index e4b98bc..f82be86 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -87,7 +87,7 @@ function scan_patchdir {
     fi
 }
 
-scan_patchdir $patchdir $patchpattern
+scan_patchdir "$patchdir" "$patchpattern"
 
 # Check for rejects...
 if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
