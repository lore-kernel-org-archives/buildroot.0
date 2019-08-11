From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:17:28 +0200
Subject: [Buildroot] [git commit] support/testing: provide entropy to lua
 tests
Message-ID: <20190811121425.1D32F8E60C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb6b0fd87ab82a51ebcdcd0bc48a0b0dd43b6f35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of lua-http require entropy.
Switch to use armv5 builtin kernel that already provides entropy for all
lua tests.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139374
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139376

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_lua.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
index 77358ba138..66ae85c999 100644
--- a/support/testing/tests/package/test_lua.py
+++ b/support/testing/tests/package/test_lua.py
@@ -12,7 +12,7 @@ class TestLuaBase(infra.basetest.BRTest):
 
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv7",
+        self.emulator.boot(arch="armv5",
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
