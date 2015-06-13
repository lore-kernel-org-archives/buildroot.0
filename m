From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Jun 2015 09:44:48 -0300
Subject: [Buildroot] [PATCH] bc: patch makeinfo logic
Message-ID: <1434199488-11466-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses a hardcoded "makeinfo" command invocation instead of the usual
MAKEINFO variable with the missing logic for docs. Fixes:
http://autobuild.buildroot.net/results/b0b/b0b9dced0014a5a8026fa972f95085e8bd16a07b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bc/03_use_appropiate_makeinfo.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/bc/03_use_appropiate_makeinfo.patch

diff --git a/package/bc/03_use_appropiate_makeinfo.patch b/package/bc/03_use_appropiate_makeinfo.patch
new file mode 100644
index 0000000..e6f9262
--- /dev/null
+++ b/package/bc/03_use_appropiate_makeinfo.patch
@@ -0,0 +1,17 @@
+Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
+command directly, otherwise missing logic never works.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura bc-1.06.95.orig/doc/Makefile.in bc-1.06.95/doc/Makefile.in
+--- bc-1.06.95.orig/doc/Makefile.in	2015-06-13 09:39:46.946620294 -0300
++++ bc-1.06.95/doc/Makefile.in	2015-06-13 09:40:10.019407630 -0300
+@@ -96,7 +96,7 @@
+ LIBOBJS = @LIBOBJS@
+ LIBS = @LIBS@
+ LTLIBOBJS = @LTLIBOBJS@
+-MAKEINFO = makeinfo --no-split
++MAKEINFO = @MAKEINFO@ --no-split
+ OBJEXT = @OBJEXT@
+ PACKAGE = @PACKAGE@
+ PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
-- 
2.3.6
