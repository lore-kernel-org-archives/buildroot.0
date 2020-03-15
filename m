From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 21:38:56 +0100
Subject: [Buildroot] [git commit] support/testing: add missing test file for
 perl-html-parser
Message-ID: <20200315203842.531E7803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c839dc11caef4d243bc5e32ecff38828a680dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file was created by utils/scancpan while adding other packages but
apparently not yet added in the repo.

Assign this test case to Bernd in the DEVELOPERS file since he is
listed as the maintainer for this package.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 .../testing/tests/package/test_perl_html_parser.py   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f0a5041a03..bcd293b4fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -463,6 +463,7 @@ F:	package/x264/
 F:	package/x265/
 F:	package/ytree/
 F:	package/znc/
+F:	support/testing/tests/package/test_perl_html_parser.py
 
 N:	Biagio Montaruli <biagio.hkr@gmail.com>
 F:	board/acmesystems/
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
