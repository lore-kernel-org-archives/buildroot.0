From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Nov 2018 05:31:06 +0100
Subject: [Buildroot] [PATCH/next v2 4/8] support/testing: add perl-gdgraph
 test
In-Reply-To: <20181123043110.5353-1-francois.perrad@gadz.org>
References: <20181123043110.5353-1-francois.perrad@gadz.org>
Message-ID: <20181123043110.5353-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_gdgraph.py        | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_gdgraph.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 16eb134c3..fd3724178 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -314,6 +314,7 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
+tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl_gdgraph.py b/support/testing/tests/package/test_perl_gdgraph.py
new file mode 100644
index 000000000..16cd8cb8e
--- /dev/null
+++ b/support/testing/tests/package/test_perl_gdgraph.py
@@ -0,0 +1,22 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlGDGraph(TestPerlBase):
+    """
+    package:
+        GDGraph
+    direct dependencies:
+        GD
+        GDTextUtil
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_GDGRAPH=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("GD")
+        self.module_test("GD::Graph")
-- 
2.17.1
