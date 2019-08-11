From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Aug 2019 22:35:38 -0300
Subject: [Buildroot] [PATCH 4/4] support/testing: provide entropy to perl
 tests
In-Reply-To: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
References: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
Message-ID: <20190811013538.26614-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer versions of perl-io-socket-ssl require entropy.
Switch to use armv5 builtin kernel that already provides entropy for all
perl tests.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139402

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/270022909

full run:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/75770319
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
-- 
2.17.1
