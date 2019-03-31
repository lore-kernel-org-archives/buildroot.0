From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:01:50 +0200
Subject: [Buildroot] [git commit] support/testing/tests/package/test_perl_*:
 regeneration
Message-ID: <20190331115901.0CAF98A539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47db24b93a2e520f55e37171dc5903e6481627f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_perl_class_load.py  | 1 +
 support/testing/tests/package/test_perl_libwww_perl.py | 1 +
 support/testing/tests/package/test_perl_mail_dkim.py   | 2 ++
 support/testing/tests/package/test_perl_x10.py         | 1 +
 4 files changed, 5 insertions(+)

diff --git a/support/testing/tests/package/test_perl_class_load.py b/support/testing/tests/package/test_perl_class_load.py
index fbcd904aaf..0422970027 100644
--- a/support/testing/tests/package/test_perl_class_load.py
+++ b/support/testing/tests/package/test_perl_class_load.py
@@ -25,4 +25,5 @@ class TestPerlClassLoad(TestPerlBase):
 
     def test_run(self):
         self.login()
+        self.module_test("Params::Util")
         self.module_test("Class::Load")
diff --git a/support/testing/tests/package/test_perl_libwww_perl.py b/support/testing/tests/package/test_perl_libwww_perl.py
index af9f7c7ed4..7b30e4b94c 100644
--- a/support/testing/tests/package/test_perl_libwww_perl.py
+++ b/support/testing/tests/package/test_perl_libwww_perl.py
@@ -36,6 +36,7 @@ class TestPerllibwwwperl(TestPerlBase):
         self.module_test("LWP::UserAgent")
         self.module_test("LWP::Authen::Basic")
         self.module_test("LWP::Authen::Digest")
+        self.module_test("HTML::Parser")
         self.module_test("HTTP::Message")
         self.module_test("HTTP::Daemon")
         self.module_test("WWW::RobotRules")
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
index 7affce82b2..cd9e75795b 100644
--- a/support/testing/tests/package/test_perl_mail_dkim.py
+++ b/support/testing/tests/package/test_perl_mail_dkim.py
@@ -25,4 +25,6 @@ class TestPerlMailDKIM(TestPerlBase):
 
     def test_run(self):
         self.login()
+        self.module_test("Crypt::OpenSSL::Random")
+        self.module_test("Crypt::OpenSSL::RSA")
         self.module_test("Mail::DKIM")
diff --git a/support/testing/tests/package/test_perl_x10.py b/support/testing/tests/package/test_perl_x10.py
index 84feb74e69..b587804a99 100644
--- a/support/testing/tests/package/test_perl_x10.py
+++ b/support/testing/tests/package/test_perl_x10.py
@@ -19,4 +19,5 @@ class TestPerlX10(TestPerlBase):
 
     def test_run(self):
         self.login()
+        self.module_test("Device::SerialPort")
         self.module_test("X10")
