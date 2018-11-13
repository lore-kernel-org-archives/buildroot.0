From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 13 Nov 2018 17:02:24 -0600
Subject: [Buildroot] [PATCH 3/5] support/testing/infra/emulator.py: support
 aarch64
In-Reply-To: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542150146-12188-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Add the condition under the -kernel assignment for aarch64
 - Tested with a defconfig simliar to qemu_aarch64_virt_defconfig

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/testing/infra/emulator.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 802e89d..8e5a7e9 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -62,7 +62,9 @@ class Emulator(object):
                     kernel = infra.download(self.downloaddir,
                                             "kernel-versatile")
                     qemu_cmd += ["-M", "versatilepb"]
-
+            elif arch == "aarch64":
+                kernel_cmdline.append("console=ttyAMA0")
+                qemu_cmd += ["-M", "virt", "-cpu", "cortex-a53"]
             qemu_cmd += ["-kernel", kernel]
 
         if kernel_cmdline:
-- 
1.9.1
