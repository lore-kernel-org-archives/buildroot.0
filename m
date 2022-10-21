Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D9BC38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 19:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 229354196C;
	Fri, 21 Oct 2022 19:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 229354196C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvrPtGE7fyzX; Fri, 21 Oct 2022 19:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9CB741953;
	Fri, 21 Oct 2022 19:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9CB741953
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88A3C1BF846
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 645BB4018F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 645BB4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjPxev_j7Np5 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 19:07:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AD7240104
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AD7240104
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 19:07:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e722:2033:afe6:a970])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3BB935FF7A;
 Fri, 21 Oct 2022 21:07:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 21:07:31 +0200
Date: Fri, 21 Oct 2022 21:07:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20221021190731.GC2992523@scaer>
References: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666379255;
 bh=1Wi1kg7qpjKAysrvh+CVA1ipmEl8acFvZ+cT+XvjioQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RapI6iKtB4NyhEnqS2dVGXT/ukxzBjeyZV9E8L+S8wuDsmW72vf8U3wWcerDSz6it
 M1ZCQtKT8Vi+1Uq1E0kSN3b2KRYd12LQNXYBWYjQGm9czpsfUu1KcQfPQWsn/O0uSq
 aNyi0IYmk9yHRP8Pcg1S8wXGNeq7LyMZLLq8lvgc43RMkN9GgmA05Tnl6rqF3u1VJK
 R/L1y5RRzWL7Bmrml5pS5p+Ps9PlMi+inzpeKc2zK/4xPxyQZfG4VrxmtGGmtFvmRY
 cKmldDSoi+7IE5UrsSSsCUPskX4eEd7b+x31NX5Nfh/gDhI0QyUp6XZc48q8xbcVDE
 tNgqisjKKQHTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RapI6iKt
Subject: Re: [Buildroot] [PATCH 1/3] Makefile: really generate glibc locales
 in parallel
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 2022-10-14 13:18 +0200, yann.morin@orange.com spake thusly:
> To generate the glibc locale data, we call into a recursive Makefile,
> so as to generate locales in parallel. This is done as part of a
> target-fialize hook.

*finalize

> However, that hook is registered after all packages have been parsed,
> and as such, it maye be registered after hooks defined in packages.
> 
> Furthermore, the expansion of target-finalize hooks is done in a recipe,
> so it is not easy to understand whether this generates a "simple" rule
> or not.
> 
> As a consequence, despite the use of $(MAKE), make may not notice that
> the command is a recursive call, and will decide to close the jobserver
> file-descriptors, yieldiong warnings like:

*yielding

>     make[2]: warning: jobserver unavailable: using -j1.  Add '+' to
>     parent make rule.
> 
> This causes the lcoale data to not be generated in parallel, which is

*locale (damn, I forgot to fix that one when applying)

> initially all the fuss about using a sub-makefile...
> 
> So, do as suggested, and prepend the hook with a '+', so that it
> isexplicit to make that it should not close its jobserver fds.

*is explicit

> Fixes: 6fbdf5159607 (Makefile: Parallelize glibc locale generation)
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Gleb Mazovetskiy <glex.spb@gmail.com>

Applied to master with the typoes fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ec7c034ac1..ededfa491d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -653,7 +653,7 @@ ifneq ($(GLIBC_GENERATE_LOCALES),)
>  PACKAGES += host-localedef
>  
>  define GENERATE_GLIBC_LOCALES
> -	$(MAKE) -f support/misc/gen-glibc-locales.mk \
> +	+$(MAKE) -f support/misc/gen-glibc-locales.mk \
>  		ENDIAN=$(call LOWERCASE,$(BR2_ENDIAN)) \
>  		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
>  		Q=$(Q)
> -- 
> 2.25.1
> 
> 
> _________________________________________________________________________________________________________________________
> 
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
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
