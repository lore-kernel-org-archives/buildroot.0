From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:30:30 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-dbd-mysql test
Message-ID: <20181206212823.016C186DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7046c20476db9e3da1f3af8ea4a18765968ca1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/test_perl_dbd_mysql.py    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/support/testing/tests/package/test_perl_dbd_mysql.py b/support/testing/tests/package/test_perl_dbd_mysql.py
new file mode 100644
index 0000000000..f8fe832b41
--- /dev/null
+++ b/support/testing/tests/package/test_perl_dbd_mysql.py
@@ -0,0 +1,21 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlDBDmysql(TestPerlBase):
+    """
+    package:
+        DBD-mysql   XS
+    direct dependencies:
+        DBI   XS
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_DBD_MYSQL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("DBI")
+        self.module_test("DBD::mysql")
