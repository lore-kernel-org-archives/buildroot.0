From: Richard Braun <rbraun@sceen.net>
Date: Fri, 28 Sep 2012 14:20:01 +0200
Subject: [Buildroot] [PATCH] pkg-infra: produce legal info for proprietary
	packages
In-Reply-To: <20120928121758.GA2362@mail.sceen.net>
References: <20120928121758.GA2362@mail.sceen.net>
Message-ID: <1348834801-2672-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 package/pkg-generic.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffe7dfb..1bfaed2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -444,7 +444,6 @@ $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
 # legal-info: declare dependencies and set values used later for the manifest
-ifneq ($$($(2)_LICENSE),PROPRIETARY)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded and extracted beforehand
@@ -455,7 +454,6 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
 endif
 endif
 endif
-endif
 # defaults for packages without tarball or license files
 $(2)_MANIFEST_TARBALL ?= not saved
 $(2)_MANIFEST_LICENSE_FILES ?= not saved
@@ -464,9 +462,7 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
 $(1)-legal-info:
 # Packages without a source are assumed to be part of Buildroot, skip them.
 ifneq ($(call qstrip,$$($(2)_SOURCE)),)
-ifeq ($$($(2)_LICENSE),PROPRIETARY)
-# Proprietary packages: nothing to save
-else ifeq ($$($(2)_SITE_METHOD),local)
+ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
 else ifeq ($$($(2)_SITE_METHOD),override)
-- 
1.7.2.5
