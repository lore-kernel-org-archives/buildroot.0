From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 15:53:05 +0100
Subject: [Buildroot] [PATCH 1/7 v4] supprt/test-pkg: fix code style
In-Reply-To: <cover.1486911180.git.yann.morin.1998@free.fr>
References: <cover.1486911180.git.yann.morin.1998@free.fr>
Message-ID: <22f1d6982cb72bde788f2ea5d9c91f791c73e217.1486911180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index b867da8..9066fa0 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -10,7 +10,7 @@ main() {
 
     o='hc:d:p:r:'
     O='help,config-snippet:build-dir:package:,random:'
-    opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
+    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
     random=0
@@ -46,14 +46,14 @@ main() {
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=( $( curl -s "${TOOLCHAINS_URL}" \
-                    |sed -r -e 's/,.*//; /internal/d;' \
-                    |if [ ${random} -gt 0 ]; then \
-                        sort -R |head -n ${random}
-                     else
-                        cat
-                     fi |sort
-                  )
+    toolchains=($(curl -s "${TOOLCHAINS_URL}" \
+                  |sed -r -e 's/,.*//; /internal/d;' \
+                  |if [ ${random} -gt 0 ]; then \
+                      sort -R |head -n ${random}
+                   else
+                      cat
+                   fi |sort
+                 )
                )
 
     if [ ${#toolchains[@]} -eq 0 ]; then
@@ -73,7 +73,7 @@ build_one() {
     local toolchain line skip
 
     # Using basename(1) on a URL works nicely
-    toolchain="$( basename "${url}" .config )"
+    toolchain="$(basename "${url}" .config)"
 
     printf "%40s: " "${toolchain}"
 
-- 
2.7.4
