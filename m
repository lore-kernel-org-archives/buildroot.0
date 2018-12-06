From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:19:59 +0100
Subject: [Buildroot] [git commit]
 support/testing/tests/packages/test_perl_*: regeneration
Message-ID: <20181206212822.E65DB8B4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe4b91db57393e1577d5a9549fa9e059f8a8d8e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_perl_class_load.py  | 4 ++--
 support/testing/tests/package/test_perl_gdgraph.py     | 2 +-
 support/testing/tests/package/test_perl_libwww_perl.py | 2 +-
 support/testing/tests/package/test_perl_mail_dkim.py   | 6 +++---
 support/testing/tests/package/test_perl_x10.py         | 2 +-
 support/testing/tests/package/test_perl_xml_libxml.py  | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/package/test_perl_class_load.py b/support/testing/tests/package/test_perl_class_load.py
index 1e86c03743..fbcd904aaf 100644
--- a/support/testing/tests/package/test_perl_class_load.py
+++ b/support/testing/tests/package/test_perl_class_load.py
@@ -6,14 +6,14 @@ class TestPerlClassLoad(TestPerlBase):
     package:
         Class-Load
     direct dependencies:
-        Data-OptList *
+        Data-OptList
         Module-Implementation
         Module-Runtime
         Package-Stash
         Try-Tiny
     indirect dependencies:
         Dist-CheckConflicts
-        Params-Util
+        Params-Util   XS
         Sub-Install
     """
 
diff --git a/support/testing/tests/package/test_perl_gdgraph.py b/support/testing/tests/package/test_perl_gdgraph.py
index 16cd8cb8ec..23ddbca4ae 100644
--- a/support/testing/tests/package/test_perl_gdgraph.py
+++ b/support/testing/tests/package/test_perl_gdgraph.py
@@ -6,7 +6,7 @@ class TestPerlGDGraph(TestPerlBase):
     package:
         GDGraph
     direct dependencies:
-        GD
+        GD   XS
         GDTextUtil
     """
 
diff --git a/support/testing/tests/package/test_perl_libwww_perl.py b/support/testing/tests/package/test_perl_libwww_perl.py
index e777071bb5..af9f7c7ed4 100644
--- a/support/testing/tests/package/test_perl_libwww_perl.py
+++ b/support/testing/tests/package/test_perl_libwww_perl.py
@@ -8,7 +8,7 @@ class TestPerllibwwwperl(TestPerlBase):
     direct dependencies:
         Encode-Locale
         File-Listing
-        HTML-Parser
+        HTML-Parser   XS
         HTTP-Cookies
         HTTP-Daemon
         HTTP-Date
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
index dc4d4bb3a7..7affce82b2 100644
--- a/support/testing/tests/package/test_perl_mail_dkim.py
+++ b/support/testing/tests/package/test_perl_mail_dkim.py
@@ -6,13 +6,13 @@ class TestPerlMailDKIM(TestPerlBase):
     package:
         Mail-DKIM
     direct dependencies:
-        Crypt-OpenSSL-RSA
+        Crypt-OpenSSL-RSA   XS
         MailTools
         Net-DNS
         Net-DNS-Resolver-Mock
-        YAML-LibYAML
+        YAML-LibYAML   XS
     indirect dependencies:
-        Crypt-OpenSSL-Random
+        Crypt-OpenSSL-Random   XS
         Digest-HMAC
         TimeDate
     """
diff --git a/support/testing/tests/package/test_perl_x10.py b/support/testing/tests/package/test_perl_x10.py
index 46f247f2d4..84feb74e69 100644
--- a/support/testing/tests/package/test_perl_x10.py
+++ b/support/testing/tests/package/test_perl_x10.py
@@ -7,7 +7,7 @@ class TestPerlX10(TestPerlBase):
         X10
     direct dependencies:
         Astro-SunTime
-        Device-SerialPort
+        Device-SerialPort   XS
         Time-ParseDate
     """
 
diff --git a/support/testing/tests/package/test_perl_xml_libxml.py b/support/testing/tests/package/test_perl_xml_libxml.py
index 76eacfaea1..faace5dd03 100644
--- a/support/testing/tests/package/test_perl_xml_libxml.py
+++ b/support/testing/tests/package/test_perl_xml_libxml.py
@@ -4,7 +4,7 @@ from tests.package.test_perl import TestPerlBase
 class TestPerlXMLLibXML(TestPerlBase):
     """
     package:
-        XML-LibXML
+        XML-LibXML   XS
     direct dependencies:
         XML-NamespaceSupport
         XML-SAX
