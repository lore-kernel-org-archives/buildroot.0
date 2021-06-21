From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:25:46 +0200
Subject: [Buildroot] [PATCH 4/4] support/testing/tests/fs/test_ext: add
 missing "format" option for Qemu
In-Reply-To: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
References: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210621202547.360391-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will avoid the following warning:

   WARNING: Image format was not specified for
   '/home/thomas/projets/outputs/TestExt3/images/rootfs.ext3' and
   probing guessed raw. Automatically detecting the format is
   dangerous for raw images, write operations on block 0 will be
   restricted. Specify the 'raw' format explicitly to remove the
   restrictions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_ext.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 0fe8af7e6d..2a6e0c4274 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -31,7 +31,7 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
                   kernel="builtin",
                   kernel_cmdline=["root=/dev/mmcblk0",
                                   "rootfstype={}".format(fs_type)],
-                  options=["-drive", "file={},if=sd".format(img)])
+                  options=["-drive", "file={},if=sd,format=raw".format(img)])
     emulator.login()
     _, exit_code = emulator.run(CHECK_FS_TYPE_CMD.format(fs_type))
     return exit_code
-- 
2.31.1
