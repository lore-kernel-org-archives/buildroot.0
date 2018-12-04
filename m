From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Dec 2018 05:37:51 +0100
Subject: [Buildroot] [PATCH 4/7] support/testing: add perl-dbd-mysql test
In-Reply-To: <20181204043754.24556-1-francois.perrad@gadz.org>
References: <20181204043754.24556-1-francois.perrad@gadz.org>
Message-ID: <20181204043754.24556-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../tests/package/test_perl_dbd_mysql.py      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_dbd_mysql.py

diff --git a/support/testing/tests/package/test_perl_dbd_mysql.py b/support/testing/tests/package/test_perl_dbd_mysql.py
new file mode 100644
index 000000000..f8fe832b4
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
-- 
2.17.1
