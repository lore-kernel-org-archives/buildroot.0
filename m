From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Nov 2018 20:58:18 +0100
Subject: [Buildroot] [PATCH 4/8] support/testing: add perl-gdgraph test
In-Reply-To: <20181121195822.15379-1-francois.perrad@gadz.org>
References: <20181121195822.15379-1-francois.perrad@gadz.org>
Message-ID: <20181121195822.15379-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_gdgraph.py        | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
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
index 000000000..07b0e2f56
--- /dev/null
+++ b/support/testing/tests/package/test_perl_gdgraph.py
@@ -0,0 +1,21 @@
+from tests.package.test_perl import TestPerl
+
+
+class TestPerlGDGraph(TestPerl):
+    """
+    package:
+        GDGraph
+    direct dependencies:
+        GD
+        GDTextUtil
+    """
+
+    config = TestPerl.config + \
+        """
+        BR2_PACKAGE_PERL_GDGRAPH=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("GD")
+        self.module_test("GD::Graph")
-- 
2.17.1
