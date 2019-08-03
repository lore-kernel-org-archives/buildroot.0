From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 19:58:17 +0200
Subject: [Buildroot] [git commit] support/scripts/br2-external: declare
 missing local variables
Message-ID: <20190803175918.EDB4F813F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3617f1350a6aafd5f39e9590d22317fa01a2621f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b14b02698 (core/br2-external: restore compatibility with old
distros) switched to using 'eval' to emulate associative arrays, for
those distros too old to have bash-4+.

In so doing, it forgot to declare the new local variables in the
respective helper functions.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/br2-external | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 00cb57d1ed..5097d617f3 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -119,7 +119,7 @@ do_validate_one() {
 # Generate the .mk snippet that defines makefile variables
 # for the br2-external tree
 do_mk() {
-    local br2_name br2_ext
+    local br2_name br2_desc br2_ext
 
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
@@ -155,7 +155,7 @@ do_mk() {
 
 # Generate the kconfig snippet for the br2-external tree.
 do_kconfig() {
-    local br2_name br2_ext
+    local br2_name br2_desc br2_ext
 
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
