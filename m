From: Andi Shyti <andi@etezian.org>
Date: Tue,  5 Nov 2013 14:00:30 +0100
Subject: [Buildroot] [PATCH] scripts: apply-patches: don't stop if no patch
	is found for a package
Message-ID: <1383656430-29160-1-git-send-email-andi@etezian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If no patch is available for a specific package it doesn't mean
that is necessarily an error, perhaps there is no need to apply
any patches. Therefore, don't stop the build by returning '1',
but go ahead.

Signed-off-by: Andi Shyti <andi@etezian.org>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index ff72b45..aabab4f 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -43,7 +43,7 @@ if [ ! -d "${builddir}" ] ; then
 fi
 if [ ! -d "${patchdir}" ] ; then
     echo "Aborting.  '${patchdir}' is not a directory."
-    exit 1
+    exit
 fi
 
 # Remove any rejects present BEFORE patching - Because if there are
-- 
1.8.4.2
