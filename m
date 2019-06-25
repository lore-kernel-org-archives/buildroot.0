From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 11:02:40 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] utils/test-pkg: fix long
 option parsing
Message-ID: <20190625090301.2A1BC85278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8583e3657f6f20d73b7c74c8c111dd7da959ef6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The long option parsing of test-pkg is broken because:
- some long options are not declared
- there should be a comma between long options, the colon does not replace
it.

This change also revealed that the declaration of 'toolchains-dir' should
have been 'toolchains-csv', originally introduced in commit ed59f81a3cb4ddb.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 989cda12ba0a55142eb2303ecad0d2d3aca96b90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/test-pkg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cce4679b04..8ffeea34f5 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -12,13 +12,13 @@ do_clean() {
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_dir toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
     local pkg_br_name
 
     o='hac:d:n:p:r:t:'
-    O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
+    O='help,all,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
