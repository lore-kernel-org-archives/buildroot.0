From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:14:00 +0200
Subject: [Buildroot] [git commit] libgsm: bump version to 1.0.17
Message-ID: <20170728223914.AA40C821D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ac0b1e73edf9295d8d0d4a9036d4cf2f0cb93f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
- Refresh 0001-misc.patch to work with 1.0.17.
- Reformat 0001-misc.patch to git style patch.
- Rename 0001-misc.patch to 0001-misc-fixes-from-archlinux.patch.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ....patch => 0001-misc-fixes-from-archlinux.patch} | 41 ++++++++++++++--------
 package/libgsm/libgsm.hash                         |  2 +-
 package/libgsm/libgsm.mk                           |  2 +-
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/package/libgsm/0001-misc.patch b/package/libgsm/0001-misc-fixes-from-archlinux.patch
similarity index 81%
rename from package/libgsm/0001-misc.patch
rename to package/libgsm/0001-misc-fixes-from-archlinux.patch
index 735d744..86f4d42 100644
--- a/package/libgsm/0001-misc.patch
+++ b/package/libgsm/0001-misc-fixes-from-archlinux.patch
@@ -1,22 +1,32 @@
-Misc fixes from Archlinux
+From e8f43832d401ad1e071e6860b2bf4a1e796d4356 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Fri, 28 Jul 2017 08:18:22 -0400
+Subject: [PATCH] Misc fixes from Archlinux
 
 Patch from:
     https://git.archlinux.org/svntogit/packages.git/plain/gsm/trunk/gsm.patch
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 1.0.17
+---
+ Makefile | 84 ++++++++++++++++++++++++++++++++--------------------------------
+ 1 file changed, 42 insertions(+), 42 deletions(-)
 
---- a/Makefile	2006-04-26 15:14:26.000000000 -0400
-+++ b/Makefile	2010-06-19 16:53:25.000000000 -0400
-@@ -44,7 +44,7 @@
+diff --git a/Makefile b/Makefile
+index d5c0c90..ef61bd5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -44,7 +44,7 @@ WAV49	= -DWAV49
  # CCFLAGS 	= -c -O
  
  CC		= gcc -ansi -pedantic
--CCFLAGS 	= -c -O2 -DNeedFunctionPrototypes=1
-+CCFLAGS 	= -c -O2 -fPIC -DNeedFunctionPrototypes=1
+-CCFLAGS 	= -c -O2 -DNeedFunctionPrototypes=1 -Wall -Wno-comment
++CCFLAGS 	= -c -O2 -fPIC -DNeedFunctionPrototypes=1 -Wall -Wno-comment
  
  LD 		= $(CC)
  
-@@ -96,11 +96,11 @@
+@@ -96,11 +96,11 @@ TOAST_INSTALL_MAN = $(TOAST_INSTALL_ROOT)/man/man1
  #  Other tools
  
  SHELL		= /bin/sh
@@ -30,7 +40,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  FIND		= find
  COMPRESS 	= compress
  COMPRESSFLAGS 	= 
-@@ -139,7 +139,7 @@
+@@ -139,7 +139,7 @@ LFLAGS	= $(LDFLAGS) $(LDINC)
  
  # Targets
  
@@ -39,7 +49,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  
  TOAST	= $(BIN)/toast
  UNTOAST	= $(BIN)/untoast
-@@ -257,7 +257,7 @@
+@@ -257,7 +257,7 @@ STUFF = 	ChangeLog			\
  # Install targets
  
  GSM_INSTALL_TARGETS =	\
@@ -48,7 +58,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  		$(GSM_INSTALL_INC)/gsm.h		\
  		$(GSM_INSTALL_MAN)/gsm.3		\
  		$(GSM_INSTALL_MAN)/gsm_explode.3	\
-@@ -279,7 +279,7 @@
+@@ -279,7 +279,7 @@ TOAST_INSTALL_TARGETS =	\
  
  # Target rules
  
@@ -57,7 +67,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  		@-echo $(ROOT): Done.
  
  tst:		$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/test-result
-@@ -299,24 +299,23 @@
+@@ -299,24 +299,23 @@ install:	toastinstall gsminstall
  
  # The basic API: libgsm
  
@@ -90,7 +100,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  
  
  # The local bin and lib directories
-@@ -351,53 +350,54 @@
+@@ -351,53 +350,54 @@ toastuninstall:
  		fi
  
  $(TOAST_INSTALL_BIN)/toast:	$(TOAST)
@@ -161,7 +171,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  
  # Distribution
  
-@@ -425,7 +425,7 @@
+@@ -425,7 +425,7 @@ semi-clean:
  			-print | xargs rm $(RMFLAGS)
  
  clean:	semi-clean
@@ -170,7 +180,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  			$(TOAST) $(TCAT) $(UNTOAST)	\
  			$(ROOT)/gsm-1.0.tar.Z
  
-@@ -473,22 +473,22 @@
+@@ -473,22 +473,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
  $(TST)/test-result:	$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/run
  			( cd $(TST); ./run ) 
  
@@ -203,3 +213,6 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  			$(LD) $(LFLAGS) -o $(TST)/cod2lin \
 -				$(TST)/cod2lin.o $(LIBGSM) $(LDLIB)
 +				$(TST)/cod2lin.o $(LIBGSMSO) $(LDLIB)
+-- 
+2.13.3
+
diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index bcfb650..a73359d 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  725a3768a1e23ab8648b4df9d470aed38eb1635af3cbc8d0b64fef077236f4ce  gsm-1.0.16.tar.gz
+sha256  855a57d1694941ddf3c73cb79b8d0b3891e9c9e7870b4981613b734e1ad07601  gsm-1.0.17.tar.gz
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
index 8e8335a..0add45c 100644
--- a/package/libgsm/libgsm.mk
+++ b/package/libgsm/libgsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSM_VERSION = 1.0.16
+LIBGSM_VERSION = 1.0.17
 LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
 LIBGSM_SITE = http://www.quut.com/gsm
 LIBGSM_LICENSE = gsm
