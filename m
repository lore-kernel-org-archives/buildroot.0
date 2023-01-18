Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF2C004D4
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 07:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E7960BBF;
	Wed, 18 Jan 2023 07:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E7960BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsAFg_j-SYjm; Wed, 18 Jan 2023 07:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F33E60AAD;
	Wed, 18 Jan 2023 07:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F33E60AAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 406391BF3D2
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 07:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28ECC40377
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 07:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28ECC40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFrImsDXKTHG for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 07:14:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC0BF40253
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC0BF40253
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 07:14:22 +0000 (UTC)
Received: from opfednr06.francetelecom.fr (unknown [xx.xx.xx.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr25.francetelecom.fr (ESMTP service) with ESMTPS id 4NxcSr1TDZzCr83
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 08:14:20 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 08:14:13 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 18 Jan 2023 08:14:11 +0100
Message-ID: <5608_1674026060_63C79C4C_5608_450_1_3268e156530869e8fea307493cc0ee3d8d8df679.1674025553.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e5a79e14d6b9a1d81047cdd6605184ecae6803f8.1674025553.git.yann.morin@orange.com>
References: <e5a79e14d6b9a1d81047cdd6605184ecae6803f8.1674025553.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX102.corporate.adroot.infra.ftgroup (10.115.26.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1674026060;
 bh=uFjVsG1OVv9amXHAmAcxKsAeAo3ZCOv9G6FIZ7lp4vw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=azPK7Mo/oEbUHNRfPC60jQGXR+8TaDpj7PzeqfXPdhyuP/OnEZymNYWjlTpY9oSys
 4aC2e1xvY/Bd7HBnUzj+rPMd4K8eLxFf49CxAlDtRnvmnAI9U1Bk9nb1fICsZYtx/R
 eCVSXgsVbVa7Un4muQzPTE4gMBMKLHRsmuOA0yReWX0bvq/H42G1Tn8S6H7OFIeCe2
 Ftbg5Xe3Udwiva9Qu63EClUgFWMLtYwz6srhyBk7vCmErKyeaEFMdruwLJsc8dTnT6
 0LgLTl7x7XmyrPl9x48yQh0b9JPyMT58tZ/CQdrb5tE34/M/RvEvU7m5ocdERYPTA0
 Zs332R6p4RBIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=azPK7Mo/
Subject: [Buildroot] [PATCH 2/2] package/doc-ssciidoc: allow docs to request
 a specific TOC depth
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For some documents, we may want a terse or deeper TOC depth. For
example, short documents may want just the level-0 in the TOC, while
longer documents may want depth 1 or 2, or even deeper; also, some
documents may not use the document-title levels [0], only section
levels [1], and so may want to increase the TOC depth.

Additioanlly, allow per-format depth. For example, split-html has a
single page dedicated to the TOC, so there we may want a deeper TOC,
while on the html output, where the TOC is on the same page as the
whole document, a shorter TOC is preferred.

[0] https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/#document-header
[1] https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/#section-titles

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 docs/manual/adding-packages-asciidoc.txt | 54 ++++++++++++++----------
 package/doc-asciidoc.mk                  |  3 +-
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index 0bfe99d22e..d68978b1cb 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -66,6 +66,12 @@ information is (assuming the document name is +foo+) :
 * +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
   host-packages) that must be built before building this document.
 
+* +FOO_TOC_DEPTH+, +FOO_TOC_DEPTH_<FMT>+, optionals, the depth of the
+  table of content for this document, which can be overridden for the
+  specified format +<FMT>+  (see the list of rendered formats, above,
+  but in uppercase, and with dash replaced by underscore; see example,
+  below). By default: +1+.
+
 There are also additional hooks (see xref:hooks[] for general information
 on hooks), that a document may set to define extra actions to be done at
 various steps:
@@ -108,26 +114,30 @@ Here is a complete example that uses all variables and all hooks:
 07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
 08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
 09:
-10: define FOO_GEN_EXTRA_DOC
-11:     /path/to/generate-script --outdir=$(@D)
-12: endef
-13: FOO_POST_RSYNC_HOOKS += FOO_GEN_EXTRA_DOC
-14:
-15: define FOO_CHECK_MY_PROG
-16:     if ! which my-prog >/dev/null 2>&1; then \
-17:         echo "You need my-prog to generate the foo document"; \
-18:         exit 1; \
-19:     fi
-20: endef
-21: FOO_CHECK_DEPENDENCIES_HOOKS += FOO_CHECK_MY_PROG
-22:
-23: define FOO_CHECK_MY_OTHER_PROG
-24:     if ! which my-other-prog >/dev/null 2>&1; then \
-25:         echo "You need my-other-prog to generate the foo document as PDF"; \
-26:         exit 1; \
-27:     fi
-28: endef
-29: FOO_CHECK_DEPENDENCIES_PDF_HOOKS += FOO_CHECK_MY_OTHER_PROG
-30:
-31: $(eval $(call asciidoc-document))
+10: FOO_TOC_DEPTH = 2
+11: FOO_TOC_DEPTH_HTML = 1
+12: FOO_TOC_DEPTH_SPLIT_HTML = 3
+13:
+14: define FOO_GEN_EXTRA_DOC
+15:     /path/to/generate-script --outdir=$(@D)
+16: endef
+17: FOO_POST_RSYNC_HOOKS += FOO_GEN_EXTRA_DOC
+18:
+19: define FOO_CHECK_MY_PROG
+20:     if ! which my-prog >/dev/null 2>&1; then \
+21:         echo "You need my-prog to generate the foo document"; \
+22:         exit 1; \
+23:     fi
+24: endef
+25: FOO_CHECK_DEPENDENCIES_HOOKS += FOO_CHECK_MY_PROG
+26:
+27: define FOO_CHECK_MY_OTHER_PROG
+28:     if ! which my-other-prog >/dev/null 2>&1; then \
+29:         echo "You need my-other-prog to generate the foo document as PDF"; \
+30:         exit 1; \
+31:     fi
+32: endef
+33: FOO_CHECK_DEPENDENCIES_PDF_HOOKS += FOO_CHECK_MY_OTHER_PROG
+34:
+35: $(eval $(call asciidoc-document))
 ----
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 931c5136d4..6b8eaa81b3 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -87,7 +87,7 @@ $(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
 $(2)_$(3)_A2X_OPTS = \
-	--xsltproc-opts "--stringparam toc.section.depth 1"
+	--xsltproc-opts "--stringparam toc.section.depth $$(or $$($(2)_TOC_DEPTH_$$(call UPPERCASE,$(4))),$$($(2)_TOC_DEPTH))"
 
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
@@ -161,6 +161,7 @@ $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 .PHONY: $(1)-prepare-sources
 $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
+$(2)_TOC_DEPTH ?= 1
 $(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
 
 $(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML)
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
