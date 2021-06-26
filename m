From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 22:17:07 +0200
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_ext: add
 missing "format" option for Qemu
Message-ID: <20210626194802.2CA3E812F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f37e811cd1b25d2be6aecc3a3bf185a0bb3cdb1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Will avoid the following warning:

   WARNING: Image format was not specified for
   '/home/thomas/projets/outputs/TestExt3/images/rootfs.ext3' and
   probing guessed raw. Automatically detecting the format is
   dangerous for raw images, write operations on block 0 will be
   restricted. Specify the 'raw' format explicitly to remove the
   restrictions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
