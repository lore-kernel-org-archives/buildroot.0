From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Dec 2018 05:37:54 +0100
Subject: [Buildroot] [PATCH 7/7] support/testing: add perl-io-socket-ssl test
In-Reply-To: <20181204043754.24556-1-francois.perrad@gadz.org>
References: <20181204043754.24556-1-francois.perrad@gadz.org>
Message-ID: <20181204043754.24556-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../tests/package/test_perl_io_socket_ssl.py  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_io_socket_ssl.py

diff --git a/support/testing/tests/package/test_perl_io_socket_ssl.py b/support/testing/tests/package/test_perl_io_socket_ssl.py
new file mode 100644
index 000000000..51663e837
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
-- 
2.17.1
