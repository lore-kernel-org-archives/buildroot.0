From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:17:28 +0200
Subject: [Buildroot] [git commit] support/testing: provide entropy to perl
 tests
Message-ID: <20190811121425.25887812E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a565917046fee3a45180c132f311d1d573536eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of perl-io-socket-ssl require entropy.
Switch to use armv5 builtin kernel that already provides entropy for all
perl tests.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139402

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_perl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_perl.py b/support/testing/tests/package/test_perl.py
index 033b7cf347..37e7390a4b 100644
--- a/support/testing/tests/package/test_perl.py
+++ b/support/testing/tests/package/test_perl.py
@@ -12,7 +12,7 @@ class TestPerlBase(infra.basetest.BRTest):
 
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv7",
+        self.emulator.boot(arch="armv5",
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
