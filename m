Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A37C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 07:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BC081E7D;
	Wed, 18 Jan 2023 07:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BC081E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_rAWh1PGRkw; Wed, 18 Jan 2023 07:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C69381E51;
	Wed, 18 Jan 2023 07:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C69381E51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 631081BF3D2
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 07:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A4614160B
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 07:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4614160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQpkRUSwdlcj for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 07:14:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D510341606
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D510341606
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 07:14:20 +0000 (UTC)
Received: from opfednr06.francetelecom.fr (unknown [xx.xx.xx.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4NxcSp3RYrz4wyv
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 08:14:18 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 08:14:11 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 18 Jan 2023 08:14:10 +0100
Message-ID: <7653_1674026058_63C79C4A_7653_242_1_e5a79e14d6b9a1d81047cdd6605184ecae6803f8.1674025553.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1674026058;
 bh=bQ/qs9k4cunkErcTsjMxMW0iMW0CtxCsLZy7eqNMh7Q=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=hE4NRv8C+n7idnMxbmJNwIvwfMVsNS6Kr+V+fWgLHyz/OebBKaMTYSg3lM637jNef
 OcSuEi7g7eyeJ0t4gE1TXSBW2YlNJ34tGgdB+IzFM1YUexoPLLE+4a0N8uH85ssYGy
 5B6hyBLMfGltXHgTfjNiO+uJYWAocefFG7gWtoHydxFokXIkDbbI0jhhR3NbZReRIN
 HRPVDs5qbFZSvDc74bnrRLJqxG2rw+pGH7ZNOB+anW8mcgqUg7JDYAuMnQfR/qtxdw
 5kuEKagABzusFu5mPHBVg3ySVhXofxmSbCRe60TnJ/llo2QgotXYkmkc3/3/WmXTls
 6CNepqkZp70cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=hE4NRv8C
Subject: [Buildroot] [PATCH 1/2] package/doc-asciidoc: specify TOC depth for
 all formats
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

Commit 17feaf00160d (manual: set toc depth to 4 for html outputs) did
not explain why it set the depth of the table of content (TOC) only for
the html and split-html formats.

From memory, but it is a bit fuzzy after all those years, the TOC for
HTML documentation was by default deeper than for the other formats, so
it was really useless to expand it more than one-level deep, while for
other formats, the default was acceptable.

However, it does not make much sense to limit/enforce the depth of the
TOC only for specific formats, and keep the default for the others;
indeed, there is nothing that prevents the default to change with
various versions of asciidoc and the rendering backends.

Render all the formats with the same, explicit level of TOC.

We move the assignment of _A2X_OPTS above the comment, because the
comment does not apply to the TOC setting. Also note that the previous
assignment to an empty value was completely superfluous...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/doc-asciidoc.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 2bd761edfb..931c5136d4 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -86,11 +86,13 @@ ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
 $(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
+$(2)_$(3)_A2X_OPTS = \
+	--xsltproc-opts "--stringparam toc.section.depth 1"
+
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
 # - use the --destination-dir option if possible (html and split-html),
 # - otherwise copy the generated document to the output directory
-$(2)_$(3)_A2X_OPTS =
 ifneq ($$(filter $(4),html split-html),)
 $(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
 else
@@ -161,11 +163,9 @@ $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
 $(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
 
-$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML,\
-	--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML)
 
-$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML,\
-	--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML)
 
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
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
