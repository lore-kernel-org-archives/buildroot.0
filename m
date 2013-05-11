From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 23:00:23 +0200
Subject: [Buildroot] [git commit] Unhide lttng-tools and lttng-modules
Message-ID: <20130511210154.A6A309A0E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5ef6f7f71c0773af1f35b8a4e78669a8c3c8bf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using lttng-tools for userland tracing with lttng-libust lttng-modules
is not required, thus a dependency on building lttng-modules and a kernel is
overkill for lttng-tools.  It also hides it from a user not wanting to build
a kernel.  A comment has been added to lttng-modules to show a user that
lttng-modules is dependent on a kernel build.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-modules/Config.in |    3 +++
 package/lttng-tools/Config.in   |    1 -
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
index 2a0f938..fb5947f 100644
--- a/package/lttng-modules/Config.in
+++ b/package/lttng-modules/Config.in
@@ -16,3 +16,6 @@ config BR2_PACKAGE_LTTNG_MODULES
 	  http://lttng.org/files/bundles/20111214/README.compatible.kernels.txt
 
 	  http://lttng.org
+
+comment "lttng-modules requires a linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 3d95eeb..4f86e77 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
-	depends on BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
 	# liburcu only works on some architectures and requires thread support
