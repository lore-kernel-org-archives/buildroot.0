From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:30:40 +0100
Subject: [Buildroot] [git commit] support/testing: add
 perl-io-socket-multicast test
Message-ID: <20181206212823.0D6CC86DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35c858bd82b1a17422bc326b861b2716bbb1befc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/package/test_perl_io_socket_multicast.py  | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/support/testing/tests/package/test_perl_io_socket_multicast.py b/support/testing/tests/package/test_perl_io_socket_multicast.py
new file mode 100644
index 0000000000..48a086a6f7
--- /dev/null
+++ b/support/testing/tests/package/test_perl_io_socket_multicast.py
@@ -0,0 +1,21 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlIOSocketMulticast(TestPerlBase):
+    """
+    package:
+        IO-Socket-Multicast   XS
+    direct dependencies:
+        IO-Interface   XS
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_IO_SOCKET_MULTICAST=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("IO::Interface")
+        self.module_test("IO::Socket::Multicast")
