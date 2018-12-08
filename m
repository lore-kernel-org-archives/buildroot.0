From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Dec 2018 15:36:15 +0100
Subject: [Buildroot] [PATCH] support/testing: drop docstring in
 TestPythonPackageBase::test_run()
Message-ID: <20181208143615.31534-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having a docstring in the test_run() method clutters the "run-tests
-l" output:

test_run (tests.package.test_python_crossbar.TestPythonPy3Crossbar)
Test a python package. ... ok
[...]
test_run (tests.package.test_python_pexpect.TestPythonPy2Pexpect)
Test a python package. ... ok
test_run (tests.package.test_python_pexpect.TestPythonPy3Pexpect)
Test a python package. ... ok
test_run (tests.package.test_python_twisted.TestPythonPy2Twisted)
Test a python package. ... ok
test_run (tests.package.test_python_twisted.TestPythonPy3Twisted)
Test a python package. ... ok
test_run (tests.package.test_python_pynacl.TestPythonPy2Pynacl)
Test a python package. ... ok
test_run (tests.package.test_python_pynacl.TestPythonPy3Pynacl)
Test a python package. ... ok

So let's simply drop this docstring that is not particularly useful.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index c422bdbf50..bcd363ad1e 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -120,7 +120,6 @@ class TestPythonPackageBase(TestPythonBase):
             self.assertEqual(exit_code, 0)
 
     def test_run(self):
-        """Test a python package."""
         self.login()
         self.check_sample_scripts_exist()
         self.run_sample_scripts()
-- 
2.19.2
