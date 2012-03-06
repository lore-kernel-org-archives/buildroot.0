From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Mar 2012 16:11:34 +0100
Subject: [Buildroot] [git commit] expat: add security patch for CVE-2009-3560
Message-ID: <20120306151234.F122C90D15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e482a430ec4f8507f5a5caf06b3e72f4c30edfea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/expat/expat-2.0.1-CVE-2009-3560.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

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
