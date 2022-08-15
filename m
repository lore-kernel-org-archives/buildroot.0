Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E27C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89794088D;
	Mon, 15 Aug 2022 19:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89794088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ-BEVnueopO; Mon, 15 Aug 2022 19:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA55A40881;
	Mon, 15 Aug 2022 19:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA55A40881
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEDBC1BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6E8B401B2
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6E8B401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3yL0plxVaTM for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:46:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C1F40207
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5C1F40207
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:46:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CA17B6012A;
 Mon, 15 Aug 2022 21:46:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:46:46 +0200
Date: Mon, 15 Aug 2022 21:46:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815194646.GL2854108@scaer>
References: <20220815164811.93697-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815164811.93697-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660592808;
 bh=P6KFVULFVkzhT6Z9mm0kZB10gt5Vi01yZFtfFsRSFqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sdEwQxpY5JgIthD4Ds/dWs+ZMgAan6IrequMnJXOVbumb/uPLgxO+uDNt3cguLAF6
 JsgvQwEnfPQr7zEd556bjWBAHjZT8M1asLwSiioWVQuNH+nNLAQZSfkDrAYfzzq9rB
 vm1ZViuSFFAiNFHv/rj8aqxS8NdC7FES1m9KYyjTO85Ao9oc7GlyydFuQLao0MieuC
 pgLuPfwxYDu9KPvEJoF7yPY7fJviO7xXQeATwwDARJ+ikSX9oXj+gajNOD5aguLup+
 EpMO8bfa1s1VufCL/Yuz3tdFGk2ebveOUPVx1FU4WN6Mr5Ws8W1dqSjcDW5bu3IRQA
 EHRZpJaqmZ82Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sdEwQxpY
Subject: Re: [Buildroot] [PATCH/next 1/2] package/lshw: add sqlite optional
 dependency
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

Fabrice, All,

On 2022-08-15 18:48 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lshw/lshw.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
> index c6c1ac671d..46fd654afd 100644
> --- a/package/lshw/lshw.mk
> +++ b/package/lshw/lshw.mk
> @@ -28,6 +28,13 @@ LSHW_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	LIBS=$(TARGET_NLS_LIBS)
>  
> +ifeq ($(BR2_PACKAGE_SQLITE),y)
> +LSHW_DEPENDENCIES += host-pkgconf sqlite
> +LSHW_MAKE_OPTS += SQLITE=1
> +else
> +LSHW_MAKE_OPTS += SQLITE=0
> +endif
> +
>  define LSHW_BUILD_CMDS
>  	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
>  		$(LSHW_MAKE_OPTS) \
> -- 
> 2.35.1
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
