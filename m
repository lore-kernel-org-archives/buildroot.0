From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 12:26:35 +0100
Subject: [Buildroot] [PATCHv2 12/12] support/testing: add missing test file
 for perl-html-parser
In-Reply-To: <20200210112636.8155-1-patrickdepinguin@gmail.com>
References: <20200210112636.8155-1-patrickdepinguin@gmail.com>
Message-ID: <20200210112636.8155-13-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

This file was created by utils/scancpan while adding other packages but
apparently not yet added in the repo.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../tests/package/test_perl_html_parser.py    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_html_parser.py

diff --git a/support/testing/tests/package/test_perl_html_parser.py b/support/testing/tests/package/test_perl_html_parser.py
new file mode 100644
index 0000000000..6431633482
--- /dev/null
+++ b/support/testing/tests/package/test_perl_html_parser.py
@@ -0,0 +1,20 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlHTMLParser(TestPerlBase):
+    """
+    package:
+        HTML-Parser   XS
+    direct dependencies:
+        HTML-Tagset
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_HTML_PARSER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("HTML::Parser")
-- 
2.24.1
