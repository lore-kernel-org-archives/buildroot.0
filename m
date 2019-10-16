From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Oct 2019 14:09:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] support/testing: provide
 entropy to lua tests
Message-ID: <20191016120450.7790C83768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf01b685ce19727484f44594a61de793ca7c8efe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit eb6b0fd87ab82a51ebcdcd0bc48a0b0dd43b6f35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
