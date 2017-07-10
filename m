From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jul 2017 18:26:20 +0200
Subject: [Buildroot] [PATCH 3/3] support/test: don't workaround squashfs
	padding
In-Reply-To: <cover.1499703968.git.yann.morin.1998@free.fr>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
Message-ID: <53358d256db8df549cb58e41ae6805b8e808b000.1499703968.git.yann.morin.1998@free.fr>
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
