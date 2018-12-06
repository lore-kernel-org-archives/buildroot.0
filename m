From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:30:46 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-io-socket-ssl
 test
Message-ID: <20181206212823.135E486DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d1f32f0844241a6ad6f52c705b15aa4742b7e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/package/test_perl_io_socket_ssl.py        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/support/testing/tests/package/test_perl_io_socket_ssl.py b/support/testing/tests/package/test_perl_io_socket_ssl.py
new file mode 100644
index 0000000000..51663e837c
--- /dev/null
+++ b/support/testing/tests/package/test_perl_io_socket_ssl.py
@@ -0,0 +1,21 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlIOSocketSSL(TestPerlBase):
+    """
+    package:
+        IO-Socket-SSL
+    direct dependencies:
+        Net-SSLeay   XS
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_IO_SOCKET_SSL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Net::SSLeay")
+        self.module_test("IO::Socket::SSL")
