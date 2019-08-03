From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 19:58:46 +0200
Subject: [Buildroot] [git commit] support/scripts/br2-external: drop help
 for internal helper script
Message-ID: <20190803175919.00948813E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=213090334722ba4f80d742afb0fe7f4fbd487829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not usually provide help for our internal scripts. Besides, such
help has a tendency to bitrot pretty quickly anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/br2-external | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 5097d617f3..26a5d230ab 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -16,9 +16,8 @@ main() {
     local OPT OPTARG
     local br2_ext ofile ofmt
 
-    while getopts :hkmo: OPT; do
+    while getopts :kmo: OPT; do
         case "${OPT}" in
-        h)  help; exit 0;;
         o)  ofile="${OPTARG}";;
         k)  ofmt="kconfig";;
         m)  ofmt="mk";;
@@ -188,36 +187,6 @@ do_kconfig() {
     printf "endmenu # User-provided options\n"
 }
 
-help() {
-    cat <<-_EOF_
-	Usage:
-	    ${my_name} <-m|-k> -o FILE PATH
-
-	With -m, ${my_name} generates the makefile fragment that defines
-	variables related to the br2-external trees passed as positional
-	arguments.
-
-	With -k, ${my_name} generates the kconfig snippet to include the
-	configuration options specified in the br2-external trees passed
-	as positional arguments.
-
-	Using -k and -m together is not possible. The last one wins.
-
-	Options:
-	    -m  Generate the makefile fragment.
-
-	    -k  Generate the kconfig snippet.
-
-	    -o FILE
-	        FILE in which to generate the kconfig snippet or makefile
-	        fragment.
-
-	Returns:
-	    0   If no error
-	    !0  If any error
-	_EOF_
-}
-
 error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
 
 my_name="${0##*/}"
