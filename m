From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Dec 2019 23:49:34 +0100
Subject: [Buildroot] [git commit] support/testing: add python-gobject test
Message-ID: <20191203224209.58898870DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=600132f8c08a5ae3d399559dd9c17d3b7b4c6ae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                             |  1 +
 support/testing/tests/package/sample_python_gobject.py |  1 +
 support/testing/tests/package/test_python_gobject.py   | 11 +++++++++++
 3 files changed, 13 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1f94df951..a030be7890 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,7 @@ F:	package/setools/
 F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
+F:	support/testing/tests/package/test_python_gobject.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
new file mode 100644
index 0000000000..84ebee7362
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -0,0 +1 @@
+import gobject  # noqa
diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
new file mode 100644
index 0000000000..0a59447adb
--- /dev/null
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Gobject(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_GOBJECT=y
+        """
+    sample_scripts = ["tests/package/sample_python_gobject.py"]
