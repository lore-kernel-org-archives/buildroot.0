From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon, 16 Apr 2012 18:02:53 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: patch pattern was expanded
	prematurely
In-Reply-To: <4F8C4224.6040500@atmel.com>
References: <4F8C4224.6040500@atmel.com>
Message-ID: <1334592173-12495-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

The patch pattern was expanded before being into the patch directory so the
expansion add incorrect files.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
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
-- 
1.7.5.4
