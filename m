From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 Jun 2021 22:42:18 +0200
Subject: [Buildroot] [PATCH v5 3/5] support/testing/infra/emulator.py:
 update pre-built kernels
In-Reply-To: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210607204221.124908-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pre-built vexpress kernel used by the testing infrastructure is a
4.0.0 kernel, which is getting old to be used with reasonably recent
toolchains.

This commit updates the pre-built kernels for both the versatile and
vexpress machines to 5.10.7 (they have already been put online).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/emulator.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 5611ec96e8..0a77eb80fc 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -54,16 +54,16 @@ class Emulator(object):
 
                 if arch == "armv7":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-vexpress")
+                                            "kernel-vexpress-5.10.7")
                     dtb = infra.download(self.downloaddir,
-                                         "vexpress-v2p-ca9.dtb")
+                                         "vexpress-v2p-ca9-5.10.7.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "vexpress-a9"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-versatile-4.19")
+                                            "kernel-versatile-5.10.7")
                     dtb = infra.download(self.downloaddir,
-                                         "versatile-pb-4.19.dtb")
+                                         "versatile-pb-5.10.7.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "versatilepb"]
                     qemu_cmd += ["-device", "virtio-rng-pci"]
-- 
2.31.1
