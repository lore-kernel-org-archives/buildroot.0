From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 17 Nov 2018 18:52:42 +0100
Subject: [Buildroot] [RFC 2/4] support/testing: add perl-time-hires test
In-Reply-To: <20181117175244.23594-1-francois.perrad@gadz.org>
References: <20181117175244.23594-1-francois.perrad@gadz.org>
Message-ID: <20181117175244.23594-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                       |  1 +
 .../testing/tests/package/test_perl_time_hires.py    | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_time_hires.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ae5d57026..b3d5616f1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -313,6 +313,7 @@ tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
+tests.package.test_perl_time_hires.TestPerlTimeHiRes: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl_time_hires.py b/support/testing/tests/package/test_perl_time_hires.py
new file mode 100644
index 000000000..2f7e1d119
--- /dev/null
+++ b/support/testing/tests/package/test_perl_time_hires.py
@@ -0,0 +1,12 @@
+from tests.package.test_perl import TestPerl
+
+
+class TestPerlTimeHiRes(TestPerl):
+    config = TestPerl.config + \
+        """
+        BR2_PACKAGE_PERL_TIME_HIRES=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Time::HiRes")
-- 
2.17.1
