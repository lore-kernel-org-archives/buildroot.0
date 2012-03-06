From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Mar 2012 09:10:43 -0300
Subject: [Buildroot] [PATCH] expat: add security patch for CVE-2009-3560
Message-ID: <1331035843-19694-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/expat/expat-2.0.1-CVE-2009-3560.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/expat/expat-2.0.1-CVE-2009-3560.patch

diff --git a/package/expat/expat-2.0.1-CVE-2009-3560.patch b/package/expat/expat-2.0.1-CVE-2009-3560.patch
new file mode 100644
index 0000000..7cadc47
--- /dev/null
+++ b/package/expat/expat-2.0.1-CVE-2009-3560.patch
@@ -0,0 +1,14 @@
+http://nvd.nist.gov/nvd.cfm?cvename=CVE-2009-3560
+
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3703,6 +3703,9 @@ doProlog(XML_Parser parser,
+         return XML_ERROR_UNCLOSED_TOKEN;
+       case XML_TOK_PARTIAL_CHAR:
+         return XML_ERROR_PARTIAL_CHAR;
++      case -XML_TOK_PROLOG_S:
++        tok = -tok;
++        break;
+       case XML_TOK_NONE:
+ #ifdef XML_DTD
+         /* for internal PE NOT referenced between declarations */
-- 
1.7.3.4
