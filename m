From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun,  7 Jan 2018 17:02:53 -0600
Subject: [Buildroot] [PATCH] test-pkg: always run legal-info
Message-ID: <1515366173-49820-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try to catch more of the hash updates required
when bumping or on the initial new package creation
by having the package testing tools always check.

CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 utils/test-pkg | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 1b7046e..cd7b9da 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -127,10 +127,8 @@ build_one() {
 
     # legal-info done systematically, because some packages have different
     # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
-    if [ -n "${pkg}" ]; then
-        if ! make O="${dir}" "${pkg}-legal-info" >> "${dir}/logfile" 2>&1; then
-            return 3
-        fi
+    if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
+        return 3
     fi
 }
 
-- 
1.9.1
