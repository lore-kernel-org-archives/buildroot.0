From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:23:57 +0200
Subject: [Buildroot] [PATCH 01/12] support/scripts: drop help for internal
 helper script
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <bb5ad2a6f24344f64e91d353c990054a26b01f6a.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do not usually provide help or --help options for our internal
scripts. Besides, such help has a tendency to bitrot pretty quickly
anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/br2-external | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 00cb57d1ed..dfb3cc8bcc 100755
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
-- 
2.14.1
