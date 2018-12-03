From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:52:10 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-x10 test
Message-ID: <20181203194907.88B658A560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9f5748a07301ec6d4609f554705cfc4429c17f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872334]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  1 +
 support/testing/tests/package/test_perl_x10.py | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1390c25316..9b2a55ebb5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -320,6 +320,7 @@ tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
+tests.package.test_perl_x10.TestPerlX10: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_x10.py b/support/testing/tests/package/test_perl_x10.py
new file mode 100644
index 0000000000..46f247f2d4
--- /dev/null
+++ b/support/testing/tests/package/test_perl_x10.py
@@ -0,0 +1,22 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlX10(TestPerlBase):
+    """
+    package:
+        X10
+    direct dependencies:
+        Astro-SunTime
+        Device-SerialPort
+        Time-ParseDate
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_X10=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("X10")
