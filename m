Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C6CC7619A
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 05:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31F5D410C7;
	Tue, 11 Apr 2023 05:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31F5D410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzTMYPlI0_fo; Tue, 11 Apr 2023 05:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C0B410CF;
	Tue, 11 Apr 2023 05:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C0B410CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F04E1BF303
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 05:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5456361422
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 05:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5456361422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDTuUKULK_NU for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 05:26:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB2A61429
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AB2A61429
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 05:26:18 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4PwZ7q6db1z4wq6; 
 Tue, 11 Apr 2023 07:26:15 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 11 Apr 2023 07:26:07 +0200
Date: Tue, 11 Apr 2023 07:26:07 +0200
From: <yann.morin@orange.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <9715_1681190775_6434EF77_9715_314_1_20230411052607.GA3697@tl-lnx-nyma7486>
References: <7653_1674026058_63C79C4A_7653_242_1_e5a79e14d6b9a1d81047cdd6605184ecae6803f8.1674025553.git.yann.morin@orange.com>
 <61711366-1626-c45b-8083-ea967cdb30b4@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61711366-1626-c45b-8083-ea967cdb30b4@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1681190775;
 bh=mHYeCa60O/ZnEOApxESUgKtXvXHLdH3Op5tBgk1ssIw=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=nctg+ptgSJeYo1mOw+89SahLrtVbdWLPDIXSX7Xc0pQqdVhqDhHMV8kqXzSj5VLuS
 2ucddIxcgHZX/nzJZuNyM68mjEz1KMJsT8/+w/ozMoETC2k+bLIpNTR+SDT8f+TXve
 6ykdKdmTKt3vWOFC+8QVANdT7MHxmPygCbtL9mHi/weevWxWs4SkxbRLn5flFmKSN3
 Gd8/InY+ypdIKNXjZ/0sNHHtIkE1IOmQPUfbui5IwD4l+H2CoENIfjNndisB3FCjya
 6VZ4rHws/Kdnf1BNIB/7Eg+Q87xmsjW0IkS4Q7tv75ETuonF6p4wLcPxLNuln0gVDp
 ZxGGjiwz9quoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=nctg+ptg
Subject: Re: [Buildroot] [PATCH 1/2] package/doc-asciidoc: specify TOC depth
 for all formats
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-04-10 22:05 +0200, Arnout Vandecappelle spake thusly:
> On 18/01/2023 08:14, yann.morin@orange.com wrote:
> >Commit 17feaf00160d (manual: set toc depth to 4 for html outputs) did
> >not explain why it set the depth of the table of content (TOC) only for
> >the html and split-html formats.
> >
> > From memory, but it is a bit fuzzy after all those years, the TOC for
> >HTML documentation was by default deeper than for the other formats, so
> >it was really useless to expand it more than one-level deep, while for
> >other formats, the default was acceptable.
> >
> >However, it does not make much sense to limit/enforce the depth of the
> >TOC only for specific formats, and keep the default for the others;
> >indeed, there is nothing that prevents the default to change with
> >various versions of asciidoc and the rendering backends.
> >
> >Render all the formats with the same, explicit level of TOC.
> >
> >We move the assignment of _A2X_OPTS above the comment, because the
> >comment does not apply to the TOC setting. Also note that the previous
> >assignment to an empty value was completely superfluous...
> >
> >Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> 
>  Applied to master, thanks.

Thanks!

>  I did fix up the Author entry, though - for some reason, your name dropped
> from it. I guess there's a mailserver somewhere that borks the From line...
> I think it's sufficient to pass --from to git-format-patch to fix this.

Yup, sorry, no idea where that happens in the chain... I've fixed my
~/.gitconfig appropriately now.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >---
> >  package/doc-asciidoc.mk | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> >index 2bd761edfb..931c5136d4 100644
> >--- a/package/doc-asciidoc.mk
> >+++ b/package/doc-asciidoc.mk
> >@@ -86,11 +86,13 @@ ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
> >  $(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
> >  endif
> >+$(2)_$(3)_A2X_OPTS = \
> >+	--xsltproc-opts "--stringparam toc.section.depth 1"
> >+
> >  # Handle a2x warning about --destination-dir option only applicable to HTML
> >  # based outputs. So:
> >  # - use the --destination-dir option if possible (html and split-html),
> >  # - otherwise copy the generated document to the output directory
> >-$(2)_$(3)_A2X_OPTS =
> >  ifneq ($$(filter $(4),html split-html),)
> >  $(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
> >  else
> >@@ -161,11 +163,9 @@ $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
> >  $(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
> >-$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML,\
> >-	--xsltproc-opts "--stringparam toc.section.depth 1")
> >+$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML)
> >-$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML,\
> >-	--xsltproc-opts "--stringparam toc.section.depth 1")
> >+$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML)
> >  # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
> >  # from reaching the template recursion limit when processing the (long) target

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


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
