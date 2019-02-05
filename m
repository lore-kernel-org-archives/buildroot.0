From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 22:21:41 +0100
Subject: [Buildroot] [PATCHv3 1/2] utils/test-pkg: fix long option parsing
Message-ID: <20190205212142.2244-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The long option parsing of test-pkg is broken because:
- some long options are not declared
- there should be a comma between long options, the colon does not replace
it.

This change also revealed that the declaration of 'toolchains-dir' should
have been 'toolchains-csv', originally introduced in commit ed59f81a3cb4ddb.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 utils/test-pkg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

v3: unchanged
v2: new patch

diff --git a/utils/test-pkg b/utils/test-pkg
index 1995fa8578..087f9ddca9 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -5,12 +5,12 @@ TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_dir toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
 
     o='hac:d:n:p:r:t:'
-    O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
+    O='help,all,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
-- 
2.19.2
