From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Dec 2018 05:37:52 +0100
Subject: [Buildroot] [PATCH 5/7] support/testing: add perl-encode-decode test
In-Reply-To: <20181204043754.24556-1-francois.perrad@gadz.org>
References: <20181204043754.24556-1-francois.perrad@gadz.org>
Message-ID: <20181204043754.24556-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../tests/package/test_perl_encode_detect.py  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_encode_detect.py

diff --git a/support/testing/tests/package/test_perl_encode_detect.py b/support/testing/tests/package/test_perl_encode_detect.py
new file mode 100644
index 000000000..4b33fee01
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
-- 
2.17.1
