From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Fri, 15 Nov 2013 16:31:32 +0800
Subject: [Buildroot] [PATCH 2/3] e2fsprogs: flat: Add patch to append uuid
	link flag after the blkid link flags when checking the blkid
	library in the FLAT binary mode.
In-Reply-To: <1384504293-2067-1-git-send-email-Sonic.adi@gmail.com>
References: <1384504293-2067-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <1384504293-2067-3-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/e2fsprogs/e2fsprogs-flat.patch | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/e2fsprogs/e2fsprogs-flat.patch

diff --git a/package/e2fsprogs/e2fsprogs-flat.patch b/package/e2fsprogs/e2fsprogs-flat.patch
new file mode 100644
index 0000000..5abd696
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-flat.patch
@@ -0,0 +1,12 @@
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
