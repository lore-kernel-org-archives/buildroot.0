From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Fri, 15 Nov 2013 17:06:18 +0800
Subject: [Buildroot] [PATCH v2 2/3] e2fsprogs: flat: Add patch to append
	uuid link flag after the blkid link flags when checking the
	blkid library in the FLAT binary mode.
In-Reply-To: <1384506378-2818-1-git-send-email-Sonic.adi@gmail.com>
References: <1384506378-2818-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <1384506378-2818-2-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 ...ogs-0003-append-uuid-link-flag-for-flat-linker.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch

diff --git a/package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch b/package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch
new file mode 100644
index 0000000..d37e465
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch
@@ -0,0 +1,17 @@
+Append uuid link flag after the blkid link flags when checking the blkid
+library in the FLAT binary mode.
+
+Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
+
+--- e2fsprogs-1.42.4/configure	2012-05-29 09:29:48.000000000 +0800
++++ e2fsprogs-1.42.4.nommu/configure	2012-09-25 11:28:39.822106303 +0800
+@@ -5039,6 +5039,9 @@
+ else
+   ac_check_lib_save_LIBS=$LIBS
+ LIBS="-lblkid $LIBBLKID $LIBS"
++if test "x$ac_cv_lib_uuid_uuid_generate" = x""yes; then
++	LIBS="$LIBS -luuid"
++fi
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
-- 
1.8.2.3
