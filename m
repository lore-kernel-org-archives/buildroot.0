Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E6FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 06:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8744C40658;
	Mon, 25 Mar 2024 06:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBqGsfEQWAGR; Mon, 25 Mar 2024 06:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4488640659
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4488640659;
	Mon, 25 Mar 2024 06:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C91D1BF41C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 06:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69ADB81E14
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 06:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fau2YSUfFkuv for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 06:06:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0929D81E0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0929D81E0E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0929D81E0E
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 06:06:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43E43240002;
 Mon, 25 Mar 2024 06:05:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rodT4-008OmW-1v;
 Mon, 25 Mar 2024 07:05:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240323160120.1276293-1-fancp2007@gmail.com>
 <8f04fa2e-4c65-4de6-8507-14dea3bb9649@mind.be>
 <CAFkzVZbQHeSGPZsLH3NgKTZJ2iciKmDYuNx7BfXKW3YjCy=4_A@mail.gmail.com>
 <a50a06cd-040f-4d4c-be25-099b314d0f7d@mind.be>
Date: Mon, 25 Mar 2024 07:05:58 +0100
In-Reply-To: <a50a06cd-040f-4d4c-be25-099b314d0f7d@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 24 Mar 2024 16:20:11
 +0100")
Message-ID: <87r0fyhmm1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-generic: remove trailing
 slash in the package-specific PKGDIR variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

Hi,

 >>>> Signed-off-by: Scott Fan <fancp2007@gmail.com>
 >>>> ---
 >>>> package/pkg-generic.mk | 2 +-
 >>>> 1 file changed, 1 insertion(+), 1 deletion(-)
 >>>> 
 >>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 >>>> index 577a148c1e..f9cb8722b8 100644
 >>>> --- a/package/pkg-generic.mk
 >>>> +++ b/package/pkg-generic.mk
 >>>> @@ -489,7 +489,7 @@ PACKAGES_ALL += $(1)
 >>>> $(2)_TYPE                       =  $(4)
 >>>> $(2)_NAME                   =  $(1)
 >>>> $(2)_RAWNAME                        =  $$(patsubst host-%,%,$(1))
 >>>> -$(2)_PKGDIR                  =  $(pkgdir)
 >>>> +$(2)_PKGDIR                  =  $$(patsubst %/,%,$(pkgdir))

 >  $(pkgdir) is used in a number of other places, and we don't want the
 >  trailing slash either in any of them. So I moved this to the
 >  definition of pkgdir instead, and applied to master, thanks.

This unfortunately broke building the manual:

make manual-html
>>>   Preparing the manual sources...
>>>   Generating HTML manual...
a2x: ERROR: missing ASCIIDOC_FILE: /home/peko/source/buildroot/output/build/docs/manual/manual.adoc

make: *** [docs/manual/manual.mk:12: /home/peko/source/buildroot/output/docs/manual/manual.html] Error 1

(It ended up putting it in ../docs/manual/manual/manual.adoc)

Adding a trailing slash to _DOCDIR fixes it:

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 40c9a725d1..5b4b86d463 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -142,7 +142,7 @@ endef
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define ASCIIDOC
-$(2)_DOCDIR = $(pkgdir)
+$(2)_DOCDIR = $(pkgdir)/

 # Single line, because splitting a foreach is not easy...
 .PHONY: $(1)-check-dependencies

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
