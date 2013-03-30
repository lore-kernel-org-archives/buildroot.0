From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:47:44 +0100
Subject: [Buildroot] [git commit] libpthsem: needs mmu
Message-ID: <20130330194756.0AC119B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3a1037bb62a2ab877e9443fbb15ec66a0adfef8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The need can be patched out by disabling the tests, however the only
package that uses libpthsem (bcusdk) needs a fork-enabled libpthsem so
there's not much point. Fixes:

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bcusdk/Config.in    |    1 +
 package/libpthsem/Config.in |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index cf082e7..c9a1947 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BCUSDK
 	bool "bcusdk"
+	depends on BR2_USE_MMU # libpthsem
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPTHSEM
 	help
diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index 9ab13c3..ae1c78f 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPTHSEM
 	bool "libpthsem"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ARGP_STANDALONE
 	help
 	  GNU pth is a user mode multi threading library. pthsem is an extend
