From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:30:36 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-encode-decode
 test
Message-ID: <20181206212823.0731586DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5196b8ee90f985d38a0a62d4c5b0c95673e9327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/test_perl_encode_detect.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/support/testing/tests/package/test_perl_encode_detect.py b/support/testing/tests/package/test_perl_encode_detect.py
new file mode 100644
index 0000000000..4b33fee011
--- /dev/null
+++ b/support/testing/tests/package/test_perl_encode_detect.py
@@ -0,0 +1,20 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlEncodeDetect(TestPerlBase):
+    """
+    package:
+        Encode-Detect   XS
+    direct dependencies:
+        Module-Build
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_ENCODE_DETECT=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Encode::Detect")
