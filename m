From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 09:16:50 +0100
Subject: [Buildroot] [git commit] utils/test-pkg: always run a global
 legal-info
Message-ID: <20180108081841.50D8583BE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17cd914917307c11e3cbeab03becadc16854ae23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of limiting it to the package under test, we run it globally.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
