From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 13 Feb 2013 16:46:32 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh : applying xz compressed
	patches
Message-ID: <1360770393-2864-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 support/scripts/apply-patches.sh |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7a6c1fa..7d5856c 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -23,8 +23,8 @@
 # files than series file and archives are considered as a patch.
 #
 # Once a patch is found, the script will try to apply it. If its name doesn't
-# end with '.gz', '.bz', '.bz2', '.zip', '.Z', '.diff*' or '.patch*', it will
-# be skipped. If necessary, the patch will be uncompressed before being
+# end with '.gz', '.bz', '.bz2', '.xz', '.zip', '.Z', '.diff*' or '.patch*',
+# it will be skipped. If necessary, the patch will be uncompressed before being
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
@@ -59,6 +59,8 @@ function apply_patch {
 	type="bzip"; uncomp="bunzip -dc"; ;; 
 	*.bz2)
 	type="bzip2"; uncomp="bunzip2 -dc"; ;; 
+	*.xz)
+	type="xz"; uncomp="unxz -dc"; ;;
 	*.zip)
 	type="zip"; uncomp="unzip -d"; ;; 
 	*.Z)
-- 
1.7.9.5
