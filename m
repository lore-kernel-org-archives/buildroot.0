From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 19:21:47 +0200
Subject: [Buildroot] [git commit] pkg-utils.mk: fix/clean indentation
Message-ID: <20120722182025.C8CC996B3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=736ce2f3da29558544a38b0404e0c4ff4d41c9ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk |   40 ++++++++++++++++------------------------
 1 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 35abb17..293bf4f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -17,11 +17,11 @@
 [TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
 
 UPPERCASE = $(strip $(eval __tmp := $1) \
-     $(foreach c, $(join $(addsuffix :,$([FROM])),$([TO])), \
-	$(eval __tmp :=	\
+	$(foreach c, $(join $(addsuffix :,$([FROM])),$([TO])), \
+		$(eval __tmp :=	\
 		$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),\
-			$(__tmp)))) \
-     $(__tmp))
+	$(__tmp)))) \
+	$(__tmp))
 
 #
 # Manipulation of .config files based on the Kconfig
@@ -30,18 +30,18 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
 #
 
 define KCONFIG_ENABLE_OPT
-       $(SED) "/\\<$(1)\\>/d" $(2)
-       echo "$(1)=y" >> $(2)
+	$(SED) "/\\<$(1)\\>/d" $(2)
+	echo "$(1)=y" >> $(2)
 endef
 
 define KCONFIG_SET_OPT
-       $(SED) "/\\<$(1)\\>/d" $(3)
-       echo "$(1)=$(2)" >> $(3)
+	$(SED) "/\\<$(1)\\>/d" $(3)
+	echo "$(1)=$(2)" >> $(3)
 endef
 
 define KCONFIG_DISABLE_OPT
-       $(SED) "/\\<$(1)\\>/d" $(2)
-       echo "# $(1) is not set" >> $(2)
+	$(SED) "/\\<$(1)\\>/d" $(2)
+	echo "# $(1) is not set" >> $(2)
 endef
 
 # Helper functions to determine the name of a package and its
@@ -50,17 +50,9 @@ endef
 # automagically find where the package is located. Note that the
 # pkgdir macro is carefully written to handle the case of the Linux
 # package, for which the package directory is an empty string.
-define pkgdir
-$(dir $(lastword $(MAKEFILE_LIST)))
-endef
-
-define pkgname
-$(lastword $(subst /, ,$(call pkgdir)))
-endef
-
-define pkgparentdir
-$(patsubst %$(call pkgname)/,%,$(call pkgdir))
-endef
+pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
+pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
+pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
@@ -72,15 +64,15 @@ INFLATE.xz   = $(XZCAT)
 INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
-TERM_BOLD := $(shell tput smso)
+MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+TERM_BOLD  := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
 # Utility functions for 'find'
 # findfileclauses(filelist) => -name 'X' -o -name 'Y'
 findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
 # finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
-finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
+finddirclauses  = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 
 # Miscellaneous utility functions
 # notfirstword(wordlist): returns all but the first word in wordlist
