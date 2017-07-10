From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 00:14:53 +0200
Subject: [Buildroot] [PATCH 3/3 v2] support/test: don't workaround squashfs
	padding
In-Reply-To: <cover.1499724881.git.yann.morin.1998@free.fr>
References: <cover.1499724881.git.yann.morin.1998@free.fr>
Message-ID: <d93a18bd0729d35c7b7e3ce7e810d8fbf69af522.1499724881.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now create properly-padded squashfs images, so we need not do it
in the testing infra, In fact, we want to catch such a change as a
regression (the system won't boot).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/fs/test_squashfs.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index b205b6a55a..228a8179fd 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -23,7 +23,6 @@ BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
         self.assertEqual(out[3], "Compression lz4")
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
 
         self.emulator.boot(arch="armv7",
                            kernel="builtin",
-- 
2.11.0
