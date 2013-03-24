From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Mar 2013 23:50:46 +0100
Subject: [Buildroot] [PATCH 11/14] apply-patches.sh: applying xz-ed patches
In-Reply-To: <cover.1364165310.git.yann.morin.1998@free.fr>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
Message-ID: <96bf04321c5e4c983e0960e1c24df18572a7534c.1364165310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
[yann.morin.1998 at free.fr: space-damage]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/apply-patches.sh |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
1.7.2.5
