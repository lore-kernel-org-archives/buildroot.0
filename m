From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:56:13 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 support/testing/infra/emulator: increase memory size used by Qemu
Message-ID: <20190624195738.25C6181E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9416689465dfd61e946ba0ee0779cb47dfaca6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

By default, Qemu emulates a system with 128 MB of RAM. This is not
sufficient for some test cases we have, such as TestPerlDBDmysql,
where the initramfs is quite large. Therefore, this commit extends the
RAM size emulated by Qemu to 256 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/237108668

Thanks to Arnout for the analysis of the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 345c29a4b7321952b916c1b4eb88a03e136919be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
