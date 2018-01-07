From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jan 2018 23:50:05 +0100
Subject: [Buildroot] [PATCH] utils/test-pkg: always run a global legal-info
Message-ID: <20180107225005.29898-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of limiting it to the package under test, we run it globally.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 utils/test-pkg | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 1b7046eac4..cd7b9dad7b 100755
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
2.14.1
