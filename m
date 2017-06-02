From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 13:33:39 +0200
Subject: [Buildroot] [git commit] acpica: bump version to 20170531
Message-ID: <20170602113408.51DC37FF10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb75d8167fc53daaef2cac8748854c4b4a785c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/0001-build-do-not-use-Werror.patch | 45 +++++++++++++----------
 package/acpica/acpica.hash                        |  2 +-
 package/acpica/acpica.mk                          |  2 +-
 3 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/package/acpica/0001-build-do-not-use-Werror.patch b/package/acpica/0001-build-do-not-use-Werror.patch
index 4ccb4d4..e7449e9 100644
--- a/package/acpica/0001-build-do-not-use-Werror.patch
+++ b/package/acpica/0001-build-do-not-use-Werror.patch
@@ -9,17 +9,20 @@ newer versions that introduce new warnings.
 
 Remove use of -Werror.
 
+[Vincent: tweak patch for 20170531 release]
+
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>
 ---
  generate/unix/Makefile.config |  1 -
  generate/unix/iasl/Makefile   | 12 ++++++------
  2 files changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
-index da0f61d..1476e27 100644
+index 4d4f182..a7120e3 100644
 --- a/generate/unix/Makefile.config
 +++ b/generate/unix/Makefile.config
-@@ -185,7 +185,6 @@ CWARNINGFLAGS = \
+@@ -194,7 +194,6 @@ CWARNINGFLAGS = \
      -Wall\
      -Wbad-function-cast\
      -Wdeclaration-after-statement\
@@ -28,35 +31,37 @@ index da0f61d..1476e27 100644
      -Wmissing-declarations\
      -Wmissing-prototypes\
 diff --git a/generate/unix/iasl/Makefile b/generate/unix/iasl/Makefile
-index a3759cc..c2dc8f0 100644
+index 156c23a..28ffc06 100644
 --- a/generate/unix/iasl/Makefile
 +++ b/generate/unix/iasl/Makefile
-@@ -320,19 +320,19 @@ $(OBJDIR)/prparserparse.c $(OBJDIR)/prparser.y.h :       $(ASL_COMPILER)/prparse
- # by the utilities above and they are not necessarily ANSI C, etc.
+@@ -335,24 +335,24 @@ $(OBJDIR)/prparserparse.c $(OBJDIR)/prparser.y.h :       $(ASL_COMPILER)/prparse
  #
  $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
--- 
-2.7.4
-
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index d69279e..4942fe4 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 b2d81e84107ac9a02be86ea43cbea7afa8fd4b4150270bc88c2d4c9fea0b8aad acpica-unix2-20170303.tar.gz
+sha256 0b979b778bcf711a2b8702b1831affd7dac4a776235d7877fd185651b6a390a3  acpica-unix2-20170531.tar.gz
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index c80989a..8cfe793 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20170303
+ACPICA_VERSION = 20170531
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
