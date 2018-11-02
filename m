From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:40 -0300
Subject: [Buildroot] [PATCH v2 11/12] support/testing: rename python* test
 cases
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-12-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TestPython[23] actually test the interpreter, so rename them to
TestPythonInterpreter[23].

There is no need to repeat "PythonPy" for test cases that test python
packages, so rename TestPythonPy[23]Autobahn to TestPython[23]Autobahn
and do the same for the other test cases.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - new patch (see review of http://patchwork.ozlabs.org/patch/984425/);
---
 .gitlab-ci.yml                                | 28 +++++++++----------
 support/testing/tests/package/test_python.py  |  4 +--
 .../tests/package/test_python_autobahn.py     |  4 +--
 .../tests/package/test_python_cryptography.py |  4 +--
 .../tests/package/test_python_incremental.py  |  4 +--
 .../tests/package/test_python_twisted.py      |  4 +--
 .../tests/package/test_python_txaio.py        |  4 +--
 .../tests/package/test_python_txtorcon.py     |  4 +--
 8 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a5fbdcb0d8..7addd64df8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -311,20 +311,20 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
-tests.package.test_python.TestPython2: *runtime_test
-tests.package.test_python.TestPython3: *runtime_test
-tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
-tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
-tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
-tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
-tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
-tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
-tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
-tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
-tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
-tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
-tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
-tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: *runtime_test
+tests.package.test_python.TestPythonInterpreter2: *runtime_test
+tests.package.test_python.TestPythonInterpreter3: *runtime_test
+tests.package.test_python_autobahn.TestPython2Autobahn: *runtime_test
+tests.package.test_python_autobahn.TestPython3Autobahn: *runtime_test
+tests.package.test_python_cryptography.TestPython2Cryptography: *runtime_test
+tests.package.test_python_cryptography.TestPython3Cryptography: *runtime_test
+tests.package.test_python_incremental.TestPython2Incremental: *runtime_test
+tests.package.test_python_incremental.TestPython3Incremental: *runtime_test
+tests.package.test_python_twisted.TestPython2Twisted: *runtime_test
+tests.package.test_python_twisted.TestPython3Twisted: *runtime_test
+tests.package.test_python_txaio.TestPython2Txaio: *runtime_test
+tests.package.test_python_txaio.TestPython3Txaio: *runtime_test
+tests.package.test_python_txtorcon.TestPython2Txtorcon: *runtime_test
+tests.package.test_python_txtorcon.TestPython3Txtorcon: *runtime_test
 tests.package.test_rust.TestRust: *runtime_test
 tests.package.test_rust.TestRustBin: *runtime_test
 tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index bc2e14a1ed..e35df8336c 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -67,11 +67,11 @@ class TestPythonInterpreter():
         self.zlib_test()
 
 
-class TestPython2(TestPythonInterpreter, TestPythonBase2):
+class TestPythonInterpreter2(TestPythonInterpreter, TestPythonBase2):
     version_string = "Python 2"
 
 
-class TestPython3(TestPythonInterpreter, TestPythonBase3):
+class TestPythonInterpreter3(TestPythonInterpreter, TestPythonBase3):
     version_string = "Python 3"
 
 
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index b32a428fd8..336e2af1d8 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -9,9 +9,9 @@ class TestPythonAutobahn(TestPythonPackageBase):
     sample_scripts = ["tests/package/sample_python_autobahn.py"]
 
 
-class TestPythonPy2Autobahn(TestPythonAutobahn, TestPythonBase2):
+class TestPython2Autobahn(TestPythonAutobahn, TestPythonBase2):
     pass
 
 
-class TestPythonPy3Autobahn(TestPythonAutobahn, TestPythonBase3):
+class TestPython3Autobahn(TestPythonAutobahn, TestPythonBase3):
     pass
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 5f380b2750..72d4a915cf 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -10,9 +10,9 @@ class TestPythonCryptography(TestPythonPackageBase):
     timeout = 40
 
 
-class TestPythonPy2Cryptography(TestPythonCryptography, TestPythonBase2):
+class TestPython2Cryptography(TestPythonCryptography, TestPythonBase2):
     pass
 
 
-class TestPythonPy3Cryptography(TestPythonCryptography, TestPythonBase3):
+class TestPython3Cryptography(TestPythonCryptography, TestPythonBase3):
     pass
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
index 22dde5e358..f45a681945 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -10,9 +10,9 @@ class TestPythonIncremental(TestPythonPackageBase):
     timeout = 30
 
 
-class TestPythonPy2Incremental(TestPythonIncremental, TestPythonBase2):
+class TestPython2Incremental(TestPythonIncremental, TestPythonBase2):
     pass
 
 
-class TestPythonPy3Incremental(TestPythonIncremental, TestPythonBase3):
+class TestPython3Incremental(TestPythonIncremental, TestPythonBase3):
     pass
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index fa83620e5e..30eab234ec 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -24,9 +24,9 @@ class TestPythonTwisted(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Twisted(TestPythonTwisted, TestPythonBase2):
+class TestPython2Twisted(TestPythonTwisted, TestPythonBase2):
     pass
 
 
-class TestPythonPy3Twisted(TestPythonTwisted, TestPythonBase3):
+class TestPython3Twisted(TestPythonTwisted, TestPythonBase3):
     pass
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index 76e5f5230f..2e00e40d16 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,7 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonPy2Txaio(TestPythonPackageBase, TestPythonBase2):
+class TestPython2Txaio(TestPythonPackageBase, TestPythonBase2):
     config_package = \
         """
         BR2_PACKAGE_PYTHON_TXAIO=y
@@ -10,7 +10,7 @@ class TestPythonPy2Txaio(TestPythonPackageBase, TestPythonBase2):
     sample_scripts = ["tests/package/sample_python_txaio_twisted.py"]
 
 
-class TestPythonPy3Txaio(TestPythonPackageBase, TestPythonBase3):
+class TestPython3Txaio(TestPythonPackageBase, TestPythonBase3):
     config_package = \
         """
         BR2_PACKAGE_PYTHON_TXAIO=y
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 2ac8130231..b211259531 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -10,9 +10,9 @@ class TestPythonTxtorcon(TestPythonPackageBase):
     timeout = 30
 
 
-class TestPythonPy2Txtorcon(TestPythonTxtorcon, TestPythonBase2):
+class TestPython2Txtorcon(TestPythonTxtorcon, TestPythonBase2):
     pass
 
 
-class TestPythonPy3Txtorcon(TestPythonTxtorcon, TestPythonBase3):
+class TestPython3Txtorcon(TestPythonTxtorcon, TestPythonBase3):
     pass
-- 
2.17.1
