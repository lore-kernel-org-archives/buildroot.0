From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  5 Oct 2017 18:42:12 -0300
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix remaining code style
In-Reply-To: <20171005214212.27613-1-ricardo.martincoski@gmail.com>
References: <20171005214212.27613-1-ricardo.martincoski@gmail.com>
Message-ID: <20171005214212.27613-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the remaining code style warnings from flake8:
 - properly indent continuation lines;
 - use proper code to test a parameter is not None.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
   - renumbered 4 -> 6;
   - keep only a small part of the old patch;
   - use 'if x is not None' instead of 'if x:' (Yann E. MORIN);
   - update commit log.

Number of warnings reported by flake8 for the test infra:
before:   2
after:    0
---
 support/testing/tests/init/base.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index dea46a4473..75cfbe9c59 100644
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
-- 
2.13.0
