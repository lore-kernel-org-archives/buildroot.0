From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 11:51:46 +0100
Subject: [Buildroot] [git commit] orc: disable for uclinux
Message-ID: <20141103105348.D7F89B3051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d5310409f09ef47219e8fb2a248eb6bee05ccb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/445/4456e49a6c33a80570b4f59ec9799a8d4a314af1/

The orc configure script doesn't recognize uclinux, so builds using
BR2_BINFMT_FLAT fails.  While this could be patched, orc doesn't have any
acceleration for blackfin and orc isn't a hard dependency of any other
package, so just disable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/orc/Config.in b/package/orc/Config.in
index 663d4d3..2470d99 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ORC
 	bool "orc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_BINFMT_FLAT # configure doesn't know uclinux
 	help
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
@@ -9,3 +10,4 @@ config BR2_PACKAGE_ORC
 
 comment "orc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_BINFMT_FLAT
