From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:11:51 +0200
Subject: [Buildroot] [git commit] package/acpica: bump version to 20191018
Message-ID: <20191026131448.013AE883B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e9cf0040258acf319f3e6164336c1b56142a98d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch due to upstream commit
https://github.com/acpica/acpica/commit/36037bdaf0ab843b7304d538d4e5cbc0c9524024

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/0001-build-do-not-use-Werror.patch | 27 ++++++++++++++++++-----
 package/acpica/acpica.hash                        |  2 +-
 package/acpica/acpica.mk                          |  2 +-
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/package/acpica/0001-build-do-not-use-Werror.patch b/package/acpica/0001-build-do-not-use-Werror.patch
index e7449e982b..f905e552bd 100644
--- a/package/acpica/0001-build-do-not-use-Werror.patch
+++ b/package/acpica/0001-build-do-not-use-Werror.patch
@@ -10,19 +10,21 @@ newer versions that introduce new warnings.
 Remove use of -Werror.
 
 [Vincent: tweak patch for 20170531 release]
+[Bernd: tweak patch for 20191018 release]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  generate/unix/Makefile.config |  1 -
- generate/unix/iasl/Makefile   | 12 ++++++------
- 2 files changed, 6 insertions(+), 7 deletions(-)
+ generate/unix/iasl/Makefile   | 16 ++++++++--------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
-index 4d4f182..a7120e3 100644
+index c28e8a9b1..7064bed97 100644
 --- a/generate/unix/Makefile.config
 +++ b/generate/unix/Makefile.config
-@@ -194,7 +194,6 @@ CWARNINGFLAGS = \
+@@ -204,7 +204,6 @@ CWARNINGFLAGS = \
      -Wall\
      -Wbad-function-cast\
      -Wdeclaration-after-statement\
@@ -31,10 +33,10 @@ index 4d4f182..a7120e3 100644
      -Wmissing-declarations\
      -Wmissing-prototypes\
 diff --git a/generate/unix/iasl/Makefile b/generate/unix/iasl/Makefile
-index 156c23a..28ffc06 100644
+index 47ea73cab..2c756af79 100644
 --- a/generate/unix/iasl/Makefile
 +++ b/generate/unix/iasl/Makefile
-@@ -335,24 +335,24 @@ $(OBJDIR)/prparserparse.c $(OBJDIR)/prparser.y.h :       $(ASL_COMPILER)/prparse
+@@ -360,32 +360,32 @@ $(OBJDIR)/prparserparse.c $(OBJDIR)/prparser.y.h :       $(ASL_COMPILER)/prparse
  #
  $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
  	@echo "- " "Intermediate" $<
@@ -44,6 +46,16 @@ index 156c23a..28ffc06 100644
  $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
  	@echo "- " "Intermediate" $<
 -	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtcompilerparserlex.o :      $(OBJDIR)/dtcompilerparserlex.c
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtcompilerparserparse.o :    $(OBJDIR)/dtcompilerparserparse.c
+ 	@echo "- " "Intermediate" $<
+-	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
 +	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
@@ -65,3 +77,6 @@ index 156c23a..28ffc06 100644
  	@echo "- " "Intermediate" $<
 -	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
 +	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
+-- 
+2.20.1
+
diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 20d7e0fdfa..ac2201d570 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 9f539986b91749947dfc32b3b00d338ba565ee1a394b95c049dd393aac8ae34e  acpica-unix2-20190703.tar.gz
+sha256 edb9a886455d22955c93753e2de61b780bed94fb434079e844dc5e4376cadd4c  acpica-unix2-20191018.tar.gz
 sha256 65464cea6ee2f7a5d38e2b5f1050a4b39a15358a09b8e36119416d4e2c5031b8  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 03d1c45e06..68b948c86d 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20190703
+ACPICA_VERSION = 20191018
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
