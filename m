From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 May 2012 09:50:10 +0200
Subject: [Buildroot] [PATCH] Remove redundant $(call...) from pkgname and
	pkgparentdir
In-Reply-To: <1336857045-10679-1-git-send-email-arnout@mind.be>
Message-ID: <1336981810-24649-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This doesn't really save time like the previous patch, but it makes things
more consistent and slightly more readable.
 package/pkg-autotargets.mk  |    4 ++--
 package/pkg-cmaketargets.mk |    4 ++--
 package/pkg-gentargets.mk   |    4 ++--
 package/pkg-utils.mk        |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index ff022f3..751e9a4 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -305,5 +305,5 @@ endef
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-AUTOTARGETS = $(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-AUTOTARGETS_HOST = $(call AUTOTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+AUTOTARGETS = $(call AUTOTARGETS_INNER,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+AUTOTARGETS_HOST = $(call AUTOTARGETS_INNER,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index a627375..785a9c3 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -190,8 +190,8 @@ endef
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-CMAKETARGETS_HOST = $(call CMAKETARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-CMAKETARGETS = $(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+CMAKETARGETS_HOST = $(call CMAKETARGETS_INNER,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
+CMAKETARGETS = $(call CMAKETARGETS_INNER,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index 98c5547..eb6b243 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -444,8 +444,8 @@ endef # GENTARGETS_INNER
 ################################################################################
 
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-GENTARGETS_HOST = $(call GENTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+GENTARGETS_HOST = $(call GENTARGETS_INNER,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
 # In the case of target packages, keep the package name "pkg"
-GENTARGETS = $(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+GENTARGETS = $(call GENTARGETS_INNER,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
 
 # :mode=makefile:
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 953dbc9..e3bfa9a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -55,11 +55,11 @@ $(dir $(lastword $(MAKEFILE_LIST)))
 endef
 
 define pkgname
-$(lastword $(subst /, ,$(call pkgdir)))
+$(lastword $(subst /, ,$(pkgdir)))
 endef
 
 define pkgparentdir
-$(patsubst %$(call pkgname)/,%,$(call pkgdir))
+$(patsubst %$(pkgname)/,%,$(pkgdir))
 endef
 
 # Define extractors for different archive suffixes
-- 
tg: (befd184..) t/remove-pkg-call (depends on: t/autotargets)
