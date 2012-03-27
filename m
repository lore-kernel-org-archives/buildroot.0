From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Mar 2012 19:58:07 -0300
Subject: [Buildroot] [PATCH] expat: security bump to version 2.1.0
Message-ID: <1332889087-26867-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes for CVE-2012-1147, CVE-2009-3720, CVE-2009-3560, CVE-2012-1148 and
CVE-2012-0876.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/expat/expat-2.0.1-CVE-2009-3560.patch |   14 --------------
 package/expat/expat.mk                        |    4 ++--
 2 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 package/expat/expat-2.0.1-CVE-2009-3560.patch

diff --git a/package/expat/expat-2.0.1-CVE-2009-3560.patch b/package/expat/expat-2.0.1-CVE-2009-3560.patch
deleted file mode 100644
index 7cadc47..0000000
--- a/package/expat/expat-2.0.1-CVE-2009-3560.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-http://nvd.nist.gov/nvd.cfm?cvename=CVE-2009-3560
-
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -3703,6 +3703,9 @@ doProlog(XML_Parser parser,
-         return XML_ERROR_UNCLOSED_TOKEN;
-       case XML_TOK_PARTIAL_CHAR:
-         return XML_ERROR_PARTIAL_CHAR;
-+      case -XML_TOK_PROLOG_S:
-+        tok = -tok;
-+        break;
-       case XML_TOK_NONE:
- #ifdef XML_DTD
-         /* for internal PE NOT referenced between declarations */
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index b179383..ea008db 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-EXPAT_VERSION = 2.0.1
-EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
+EXPAT_VERSION = 2.1.0
+EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
-- 
1.7.3.4
