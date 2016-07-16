From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 10:12:04 +0200
Subject: [Buildroot] [git commit] package/acpica: disable -Werror
Message-ID: <20160716081210.247B37FAAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a74cbfd759489511d9945179364b3502b4fbae37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/d17/d1728c29e90d978405d24bb97f5c8687dc5a6165/
    http://autobuild.buildroot.org/results/2ec/2ecdf0e87a76781b66098d034768fc8de657faaa/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acpica/0001-build-do-not-use-Werror.patch | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/acpica/0001-build-do-not-use-Werror.patch b/package/acpica/0001-build-do-not-use-Werror.patch
new file mode 100644
index 0000000..4ccb4d4
--- /dev/null
+++ b/package/acpica/0001-build-do-not-use-Werror.patch
@@ -0,0 +1,62 @@
+From 9382ae2431d2962c430e7149302c8690f5bc159c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 10 Jul 2016 15:06:15 +0200
+Subject: [PATCH] build: do not use -Werror
+
+Warnings come and go with various compiler versions, so using -Werror is
+prone to cause build failures with various compiler versions, especially
+newer versions that introduce new warnings.
+
+Remove use of -Werror.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ generate/unix/Makefile.config |  1 -
+ generate/unix/iasl/Makefile   | 12 ++++++------
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
+index da0f61d..1476e27 100644
+--- a/generate/unix/Makefile.config
++++ b/generate/unix/Makefile.config
+@@ -185,7 +185,6 @@ CWARNINGFLAGS = \
+     -Wall\
+     -Wbad-function-cast\
+     -Wdeclaration-after-statement\
+-    -Werror\
+     -Wformat=2\
+     -Wmissing-declarations\
+     -Wmissing-prototypes\
+diff --git a/generate/unix/iasl/Makefile b/generate/unix/iasl/Makefile
+index a3759cc..c2dc8f0 100644
+--- a/generate/unix/iasl/Makefile
++++ b/generate/unix/iasl/Makefile
+@@ -320,19 +320,19 @@ $(OBJDIR)/prparserparse.c $(OBJDIR)/prparser.y.h :       $(ASL_COMPILER)/prparse
+ # by the utilities above and they are not necessarily ANSI C, etc.
+ #
+ $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+-- 
+2.7.4
+
