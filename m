From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 09:17:46 +0100
Subject: [Buildroot] [PATCH 1/1] liburcu: only some architectures are
	supported
In-Reply-To: <cover.1332231460.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332231460.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fc4890c5ea038002f049d4accc61c6274fd566d2.1332231460.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that liburcu (and the packages that select it) cannot be
enabled on the architectures that are not supported. At the moment,
only x86, x86-64, PowerPC and ARM are supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/Config.in      |    1 +
 package/lttng-libust/Config.in |    2 ++
 package/lttng-tools/Config.in  |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 5a6e4b2..ab39d63 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
+	depends on BR2_arm || BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
 	  synchronization mechanism. This library is mainly used by
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index ae74bed..a5e0211 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	# util-linux needs wchar and largefile
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
+	# liburcu only works on some architectures
+	depends on BR2_arm || BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Userspace tracing library for the Lttng tracing
 	  infrastructure. It allows userspace programs to create
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 3040af6..cc606d4 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
+	# liburcu only works on some architectures
+	depends on BR2_arm || BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
 	  infrastructure.
-- 
1.7.4.1
