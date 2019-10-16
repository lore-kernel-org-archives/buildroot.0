From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Oct 2019 14:07:04 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] support/testing: provide
 entropy to perl tests
Message-ID: <20191016120450.6B65C83768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8335c0097991c94e208896f6609ad09d2fc1363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Newer versions of perl-io-socket-ssl require entropy.
Switch to use armv5 builtin kernel that already provides entropy for all
perl tests.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139402

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a565917046fee3a45180c132f311d1d573536eef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
