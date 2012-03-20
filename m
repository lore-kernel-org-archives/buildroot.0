From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 00:22:24 +0100
Subject: [Buildroot] [git commit] liburcu: only some architectures are
	supported
Message-ID: <20120320233200.049D8953F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=832b1ef746e7df252ff42b19f6083f3716f70eb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure that liburcu (and the packages that select it) cannot be
enabled on the architectures that are not supported. At the moment,
only x86, x86-64, PowerPC and ARM are supported.

[Peter: add armeb as well]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liburcu/Config.in      |    1 +
 package/lttng-libust/Config.in |    2 ++
 package/lttng-tools/Config.in  |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 5a6e4b2..69878b1 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
 	  synchronization mechanism. This library is mainly used by
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index ae74bed..ab12963 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	# util-linux needs wchar and largefile
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
+	# liburcu only works on some architectures
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Userspace tracing library for the Lttng tracing
 	  infrastructure. It allows userspace programs to create
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 3040af6..b854757 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
+	# liburcu only works on some architectures
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
 	  infrastructure.
