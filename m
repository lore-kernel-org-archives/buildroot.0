From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 17:08:30 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: add missing select
	BR2_PACKAGE_POPT
Message-ID: <20151230160920.C62A682532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60d5a23a9a5468c7871e96c40d88733f3dbb6518
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lttng-babeltrace unconditionally uses "popt" in its <pkg>_DEPENDENCIES
variable, but does not select it. This commit fixes this
inconsistency.

Fixes:

  http://autobuild.buildroot.org/results/274/2748a02b090ce078fc880bd821df3c913b8c8dfd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-babeltrace/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 0eaaa20..633ea3d 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_POPT
 	depends on BR2_USE_WCHAR # libglib2, util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
