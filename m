Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9604C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 13:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1D54055E;
	Tue,  1 Feb 2022 13:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7eFtbKYnr9z; Tue,  1 Feb 2022 13:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2193840362;
	Tue,  1 Feb 2022 13:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0C61BF328
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 13:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74DA44035D
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 13:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5dR5kU-qkM2 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 13:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E30740362
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 13:49:49 +0000 (UTC)
Received: from opfednr03.francetelecom.fr (unknown [xx.xx.xx.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr26.francetelecom.fr (ESMTP service) with ESMTPS id 4Jp5s65dz9z1089
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 14:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1643723386;
 bh=XLvkPqS+0M1WroQ+5LbPBxcBxVw0zTcLDLrJM9L+5hc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=aBlH4Ws0N8XIm07oIJMZuCM3ErSYPeguUq+nszeQnbSnDi4QAlQLEaP8HcupKhFva
 BcXe+RtAIsnpSX+jaUAqOSWBJh66nI/bL6Ek/xEkQbGGi5spGmOhP/pm8g/Il7XjaM
 HPs00ERl5Y8MkGYI0UeQuiE3cnzlP5ICFbpusd30ZR2z/G+GD3uIffLfFEYhWGC9uy
 FeT/DoRL2LgghE7B2AXxWnQBnp8x8k/YAi7sMKh4Vhc5gxS2WLUXOJheUtke9DozOR
 blRPMrgr5wqzc51lBYyeZlhvfgW6vTUSKUH6c7/fCf/D7r9bcRAhtSpNwLnyHGBgGz
 QijY87G3/6dig==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 01 Feb 2022 14:49:44 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 1 Feb 2022 14:49:44 +0100
Message-ID: <11822_1643723386_61F93A7A_11822_315_1_f2cd4a063f756aa49d3dc715be368bd3738e5f1d.1643723384.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.52]
X-ClientProxiedBy: OPE16NORMBX401.corporate.adroot.infra.ftgroup
 (10.115.26.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/doc-asciidoc: fix build for out-of-tree
 documents
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Frederic GARDES <frederic.gardes@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The doc-asciidoc infra allows document to define sources and resources,
and those can only be local (there is no download support for documents).
The currently documented way to specify those is to use the $(pkgdir)
macro to point to the document sources and resources when they are along
the .mk.

However, this works only for sources and not for resources.

Indeed, sources are used to generate Makefile dependency rules, so
$(pkgdir) is expanded and evaluated during the call to $(doc-asciidoc),
while resources are expanded and evaluated when the rules are executed,
which always happen after all the parsing has be done, at which point
$(pkgdir) expands to the last Makefile that was parsed, which is always
Buildroot's own manual.

This went unnoticed so far because Buildroot's manual is 1) the last to
be parsed, and 2) not using $(pkgdir) anyway.

Additionally, $(pkgdir) is mostly an internal macro, that is, as this
change demonstrates, difficult to use, and thus should not be used, in
packages or in documents.

We fix that by introducing $(FOO_DOCDIR), similar to $(FOO_PKGDIR),
which points to the document directory. We choose not to name the
variable FOO_PKGDIR, because it semantically is not a package.

As a consequence, the last argument to the doc-asciidoc macro is now
superfluous, so it is removed, which causes a little bit of churn in
the main macro. As a further consequence, the third argument in the
inner macro is no longer needed either, so it too is removed, which
causes a bit more churn yet in the inner macro.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Frederic GARDES <frederic.gardes@orange.com>
---
 docs/manual/adding-packages-asciidoc.txt | 17 ++++-
 package/doc-asciidoc.mk                  | 90 ++++++++++++------------
 2 files changed, 59 insertions(+), 48 deletions(-)

diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index f9688b36c7..0bfe99d22e 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -39,7 +39,7 @@ Here is an example to render a simple AsciiDoc document.
 04: #
 05: ################################################################################
 06:
-07: FOO_SOURCES = $(sort $(wildcard $(pkgdir)/*))
+07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
 08: $(eval $(call asciidoc-document))
 ----
 
@@ -85,6 +85,17 @@ various steps:
 * +FOO_CHECK_DEPENDENCIES_<FMT>_HOOKS+, to run additional tests for
   the specified format +<FMT>+ (see the list of rendered formats, above).
 
+Buildroot sets the following variable that can be used in the definitions
+above:
+
+* +$(FOO_DOCDIR)+, similar to +$(FOO_PKGDIR)+, contains the path to the
+  directory containing +foo.mk+. It can be used to refer to the document
+  sources, and can be used in the hooks, especially the post-rsync hook
+  if parts of the documentation needs to be generated.
+
+* +$(@D)+, as for traditional packages, contains the path to the directory
+  where the document will be copied and built.
+
 Here is a complete example that uses all variables and all hooks:
 
 ----
@@ -94,8 +105,8 @@ Here is a complete example that uses all variables and all hooks:
 04: #
 05: ################################################################################
 06:
-07: FOO_SOURCES = $(sort $(wildcard $(pkgdir)/*))
-08: FOO_RESOURCES = $(sort $(wildcard $(pkgdir)/ressources))
+07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
+08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
 09:
 10: define FOO_GEN_EXTRA_DOC
 11:     /path/to/generate-script --outdir=$(@D)
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index be92496c2e..2bd761edfb 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -42,12 +42,11 @@ BR_ASCIIDOC_CONF = docs/conf/asciidoc.conf
 #  argument 1 is the name of the document and the top-level asciidoc file must
 #             have the same name
 #  argument 2 is the uppercase name of the document
-#  argument 3 is the directory containing the document
-#  argument 4 is the type of document to generate (-f argument of a2x)
-#  argument 5 is the document type as used in the make target
-#  argument 6 is the output file extension for the document type
-#  argument 7 is the human text for the document type
-#  argument 8 (optional) are extra arguments for a2x
+#  argument 3 is the type of document to generate (-f argument of a2x)
+#  argument 4 is the document type as used in the make target
+#  argument 5 is the output file extension for the document type
+#  argument 6 is the human text for the document type
+#  argument 7 (optional) are extra arguments for a2x
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 #
@@ -55,55 +54,55 @@ BR_ASCIIDOC_CONF = docs/conf/asciidoc.conf
 # all variable references except the arguments must be $$-quoted.
 ################################################################################
 define ASCIIDOC_INNER
-$(1): $(1)-$(5)
-.PHONY: $(1)-$(5)
-$(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
+$(1): $(1)-$(4)
+.PHONY: $(1)-$(4)
+$(1)-$(4): $$(O)/docs/$(1)/$(1).$(5)
 
-asciidoc-check-dependencies-$(5):
-.PHONY: $(1)-check-dependencies-$(5)
+asciidoc-check-dependencies-$(4):
+.PHONY: $(1)-check-dependencies-$(4)
 # Single line, because splitting a foreach is not easy...
-$(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
-	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
+$(1)-check-dependencies-$(4): asciidoc-check-dependencies-$(4)
+	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(4))_HOOKS),$$(call $$(hook))$$(sep))
 
 # Include Buildroot's AsciiDoc configuration first:
 #  - generic configuration,
 #  - then output-specific configuration
 ifneq ($$(wildcard $$(BR_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$(BR_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$(BR_ASCIIDOC_CONF)
 endif
-BR_$(4)_ASCIIDOC_CONF = docs/conf/asciidoc-$(4).conf
-ifneq ($$(wildcard $$(BR_$(4)_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$(BR_$(4)_ASCIIDOC_CONF)
+BR_$(3)_ASCIIDOC_CONF = docs/conf/asciidoc-$(3).conf
+ifneq ($$(wildcard $$(BR_$(3)_ASCIIDOC_CONF)),)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$(BR_$(3)_ASCIIDOC_CONF)
 endif
 
 # Then include the document's AsciiDoc configuration:
 #  - generic configuration,
 #  - then output-specific configuration
 ifneq ($$(wildcard $$($(2)_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
 endif
-$(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
-ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc-$(3).conf
+ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
 # - use the --destination-dir option if possible (html and split-html),
 # - otherwise copy the generated document to the output directory
-$(2)_$(4)_A2X_OPTS =
-ifneq ($$(filter $(5),html split-html),)
-$(2)_$(4)_A2X_OPTS += --destination-dir="$$(@D)"
+$(2)_$(3)_A2X_OPTS =
+ifneq ($$(filter $(4),html split-html),)
+$(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
 else
-define $(2)_$(4)_INSTALL_CMDS
-	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(6) $$(@D)
+define $(2)_$(3)_INSTALL_CMDS
+	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(5) $$(@D)
 endef
 endif
 
-$$(O)/docs/$(1)/$(1).$(6): export TZ=UTC
+$$(O)/docs/$(1)/$(1).$(5): export TZ=UTC
 
-ifeq ($(6)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
-$$(O)/docs/$(1)/$(1).$(6):
+ifeq ($(5)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
+$$(O)/docs/$(1)/$(1).$(5):
 	$$(warning PDF generation is disabled because of a bug in \
 		xsltproc. To be able to generate a PDF, you should \
 		build xsltproc from the libxslt sources >=1.1.29 and pass it \
@@ -112,20 +111,20 @@ $$(O)/docs/$(1)/$(1).$(6):
 else
 # -r $(@D) is there for documents that use external filters; those filters
 # generate code at the same location it finds the document's source files.
-$$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
+$$(O)/docs/$(1)/$(1).$(5): $$($(2)_SOURCES) \
 			   $(1)-check-dependencies \
-			   $(1)-check-dependencies-$(5) \
+			   $(1)-check-dependencies-$(4) \
 			   $(1)-prepare-sources
-	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
+	$$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(8) -f $(4) -d book -L \
+	$$(Q)a2x $(7) -f $(3) -d book -L \
 		$$(foreach r,$$($(2)_RESOURCES) $$(@D), \
 			--resource="$$(abspath $$(r))") \
-		$$($(2)_$(4)_A2X_OPTS) \
-		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
+		$$($(2)_$(3)_A2X_OPTS) \
+		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
 # install the generated document
-	$$($(2)_$(4)_INSTALL_CMDS)
+	$$($(2)_$(3)_INSTALL_CMDS)
 endif
 endef
 
@@ -135,13 +134,14 @@ endef
 # argument 1 is the lowercase name of the document; the document's main file
 #            must have the same name, with the .txt extension
 # argument 2 is the uppercase name of the document
-# argument 3 is the directory containing the document's sources
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 # The variable <DOCUMENT_NAME>_RESOURCES defines where the document's
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define ASCIIDOC
+$(2)_DOCDIR = $(pkgdir)
+
 # Single line, because splitting a foreach is not easy...
 .PHONY: $(1)-check-dependencies
 $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
@@ -153,29 +153,29 @@ $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
 $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)rsync -a $(3) $$(@D)
+	$$(Q)rsync -a $$($(2)_DOCDIR) $$(@D)
 	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
 .PHONY: $(1)-prepare-sources
 $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
-$(2)_ASCIIDOC_CONF = $(3)/asciidoc.conf
+$(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),xhtml,html,html,HTML,\
+$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),chunked,split-html,chunked,split HTML,\
+$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
 # package table and bailing out.
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),pdf,pdf,pdf,PDF,\
+$(call ASCIIDOC_INNER,$(1),$(2),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),text,text,text,text)
+$(call ASCIIDOC_INNER,$(1),$(2),text,text,text,text)
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),epub,epub,epub,ePUB)
+$(call ASCIIDOC_INNER,$(1),$(2),epub,epub,epub,ePUB)
 
 clean: $(1)-clean
 $(1)-clean:
@@ -187,4 +187,4 @@ endef
 # asciidoc-document -- the target generator macro for asciidoc documents
 ################################################################################
 
-asciidoc-document = $(call ASCIIDOC,$(pkgname),$(call UPPERCASE,$(pkgname)),$(pkgdir))
+asciidoc-document = $(call ASCIIDOC,$(pkgname),$(call UPPERCASE,$(pkgname)))
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
