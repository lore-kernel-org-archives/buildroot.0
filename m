From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:27:24 +0200
Subject: [Buildroot] [PATCH] support/testing/infra/emulator: increase memory
 size used by Qemu
Message-ID: <20190621202724.19242-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, Qemu emulates a system with 128 MB of RAM. This is not
sufficient for some test cases we have, such as TestPerlDBDmysql,
where the initramfs is quite large. Therefore, this commit extends the
RAM size emulated by Qemu to 256 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/237108668

Thanks to Arnout for the analysis of the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/emulator.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 802e89d4b4..3d3e1750c6 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -38,7 +38,8 @@ class Emulator(object):
 
         qemu_cmd = ["qemu-system-{}".format(qemu_arch),
                     "-serial", "stdio",
-                    "-display", "none"]
+                    "-display", "none",
+                    "-m", "256"]
 
         if options:
             qemu_cmd += options
-- 
2.21.0
