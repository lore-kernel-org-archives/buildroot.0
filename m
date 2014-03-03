From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 23:55:05 +0100
Subject: [Buildroot] [PATCH] toolchain/wrapper: rename BR_DEBUG_WRAPPER
Message-ID: <1393887305-2252-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The user-facing variables should be prefixed with BR2_, not BR_.

Also quote the variable in the manual.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-toolchain.txt                  | 2 +-
 toolchain/toolchain-external/ext-toolchain-wrapper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 4f3fe23..55a0480 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -21,7 +21,7 @@ When using an external toolchain, Buildroot generates a wrapper program,
 that transparently passes the appropriate options (according to the
 configuration) to the external toolchain programs. In case you need to
 debug this wrapper to check exactly what arguments are passed, you can
-set the environment variable BR_DEBUG_WRAPPER to either one of:
+set the environment variable +BR2_DEBUG_WRAPPER+ to either one of:
 
 * +0+, empty or not set: no debug
 
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 81c6ed1..db49784 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -191,7 +191,7 @@ int main(int argc, char **argv)
 	 * set to 1          : trace all arguments on a single line
 	 * set to 2          : trace one argument per line
 	 */
-	if ((env_debug = getenv("BR_DEBUG_WRAPPER"))) {
+	if ((env_debug = getenv("BR2_DEBUG_WRAPPER"))) {
 		debug = atoi(env_debug);
 		if (debug > 0) {
 			fprintf(stderr, "Toolchain wrapper executing:");
-- 
1.8.3.2
