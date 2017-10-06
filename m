From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:06:05 +0200
Subject: [Buildroot] [git commit] support/testing: fix remaining code style
Message-ID: <20171006165925.C927280489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=022d8df1b5e2c5daf3b5b6d0ed8f740164d3be81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the remaining code style warnings from flake8:
 - properly indent continuation lines;
 - use proper code to test a parameter is not None.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/init/base.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index dea46a4..75cfbe9 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -18,7 +18,7 @@ class InitSystemBase(infra.basetest.BRTest):
         else:
             kernel = os.path.join(self.builddir, "images", kernel)
             options.extend(["-dtb", os.path.join(self.builddir, "images",
-                                             "{}.dtb".format(dtb))])
+                                                 "{}.dtb".format(dtb))])
 
         kernel_cmdline = ["root=/dev/mmcblk0",
                           "rootfstype={}".format(fs_type),
@@ -26,7 +26,7 @@ class InitSystemBase(infra.basetest.BRTest):
                           "ro",
                           "console=ttyAMA0"]
 
-        if not init is None:
+        if init is not None:
             kernel_cmdline.extend(["init={}".format(init)])
 
         self.emulator.boot(arch="armv7",
