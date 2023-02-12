Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D451DC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 09:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D21F40135;
	Sun, 12 Feb 2023 09:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D21F40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNc6NqSADW6g; Sun, 12 Feb 2023 09:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A704401A1;
	Sun, 12 Feb 2023 09:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A704401A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1E01BF332
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 09:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07D41415E4
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 09:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D41415E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucc7eQTfA-Qa for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 09:19:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBFFF410A6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBFFF410A6
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 09:19:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A37935FF9D;
 Sun, 12 Feb 2023 10:19:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 10:19:14 +0100
Date: Sun, 12 Feb 2023 10:19:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230212091914.GJ2796@scaer>
References: <20230211184346.1192333-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211184346.1192333-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676193556;
 bh=neDyEAGYEEag115HFe0AWBTyWi6P1b2CGXQUAEPFnnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gXqwhgYONqYHIb5cLdj1zGac2sRhJqqL1GUAM6yJfRpf5IMKaNirEu4qPHMgfCpDJ
 QDB5vWMUY97j+s1bE0PP0YUjck9JNYeEQAJyRUl7oCDJfxakwd7GfLATlyv8vuW32i
 5GXyvOa/e+ZD2m2prP/oSIMT6vlAI9n+2sq58ZOD84GnMTq43cOAyalkZU4TmkoehC
 kiEsXn2E/dIyfN0v0K9MSGSvV7J4ES7aq05cixyjOETMJ5OSj3diFQGtmtWNAazbvX
 VYauueXONo6U7hGJL5ZyPg03f3CxcaBx6t8qhBNuWpslMf7JHybBSLsrOl7o8vHbZY
 m9x6LJI+CGHgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gXqwhgYO
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: fix rule order for legal-info
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

James, All,

On 2023-02-11 11:43 -0700, James Hilliard spake thusly:
> This command relies on the clean/prepare operations being in a
> specific order.
> 
> Currently the execution ordering of the clean/prepare operations may
> change, for example if --shuffle=reversed is set.
> 
> To ensure the evaluation order is always correct use double colon
> rules to make the evaluation order explicit as per make docs:
> 
> The double-colon rules for a target are executed in the order they
> appear in the makefile.

Thanks for this patch!

What bothers me a bit about using double-colon, is that the make manual
explicitly state that "[d]ouble-colon rules are somewhat obscure and not
often very useful; they provide a mechanism for cases in which the
method used to update a target differs depending on which prerequisite
files caused the update, and such cases are rare."

So, I understand that it does fix the issue, but I'm afraid that it is
going to be so easy to forget about that issue, and what I get from the
make manual is that we should not use them unless as a last resort in
very special corner cases, and the case at hand is not identified by the
manual, which somewhat implies that double-colon rules were written
specifically to handle the case where "the method used to update a
target differs depending on which prerequisite files caused the update",
not specifically to ensure that the order is guarantedd. It even goes as
far as suggesting that this should not really be relied upon:

    The double-colon rules for a target are executed in the order they
    appear in the makefile. However, the cases where double-colon rules
    really make sense are those where the order of executing the recipes
    would not matter.

So, to me, the ordering is only a side-effect of the original goal,
which is to have different commands to generate a target, based on what
prerequisite caused the the update...

I am also afraid that there are so many other places around where we
implicitly rely on the order the prerequisites are listed, and that we
can't easily spot (that I spotted the legal-info issue and asked you
about it, is pure chance, as I was looking at something completely
different).

However, in the legal-info case, the rule is definitely not
parallel-safe, and we do really want it and its dependencies *not* to
execute in parallel in fact.

Indeed, all PKG-legal-info rules will emit a little blurb that is
appended to the manisfest.csv, with commands like:
    echo 'PKG,VERSION,blablsablab' >> manifest.csv

So, if we run that in parallel, this is going to explode [1].

So, I believe in this case, we do not want to use :: rules, but really
ensure that legal-info and all PKG-legal-info rules are never run in
parallel, *and* that they are executed in the order they are listed in
the prerequisites.

We probably want to just add in the top-level Makefile:

    .NOTPARALLEL: legal-info

and in package/pkg-generic.mk, something along the lines of:

    .NOTPARALLEL: $(2)-legal-info #(2)-all-legal-info

Thoughts?

[0] https://www.gnu.org/software/make/manual/make.html#Double_002dColon
[1] with very nice and bright colors, but a bit too loud still

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 4880b426b5..09575a5e3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -839,7 +839,9 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>  
>  .PHONY: legal-info
> -legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
> +legal-info:: legal-info-clean
> +legal-info:: legal-info-prepare
> +legal-info:: $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
>  		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
>  	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
>  	@if [ -r $(LEGAL_WARNINGS) ]; then \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
