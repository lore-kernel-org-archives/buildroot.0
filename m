Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B36AECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C689F82CCB;
	Sat, 27 Aug 2022 07:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C689F82CCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNG1Dm9XfPNs; Sat, 27 Aug 2022 07:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5CE82C3B;
	Sat, 27 Aug 2022 07:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5CE82C3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 539251BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FD88404EB
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD88404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQ4xOZ-c9T7w for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B8C040017
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B8C040017
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 33F5919F74B;
 Sat, 27 Aug 2022 09:51:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:51:41 +0200
Date: Sat, 27 Aug 2022 09:51:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075141.GG37358@scaer>
References: <20220826204604.15716-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826204604.15716-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586705;
 bh=Q1kutQPKXC6VXHnM4ZtuUVdynt4YBs+my6eTQsC5nTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dL2XSr/u29NoekcbzyE+wtehCof+QsKtpdCZ6TKGKch6fuiZiSynYqq/F/ZVqbnad
 h3+IFn60MW8/9B69j3A7GPQx1LAwkf9e8sw9lnWI5jMLKPfkv+J1BtZP4Dulq6+nNc
 eHdncV1CIiwl+bc9SRETSpTRkQKSwQeJsFOs0GeKzUtOYPp/TaTlXvNsyZCQ5elD0L
 jprBFHeAM/W2mDS+RG+R4OA3B7psqXbV28Qf2exrtFgkF3XvlNUFwI1flvfMrQlm6M
 /V7fheMMQwKXK2UidFHnrEr+rjtHQbL9cV4jDNCregqE4z2L921zX6o52QmoXtL8xA
 L8lsoh+NuALJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dL2XSr/u
Subject: Re: [Buildroot] [PATCH 1/1] package/zerofree: fix legal-info
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-26 22:46 +0200, Fabrice Fontaine spake thusly:
> Fix typo: ZEROFREE_LICENSE_FILE -> ZEROFREE_LICENSE_FILES
> added by commit 98ecdd1d1125f2529a8d61c01a2bec6d8dbc48d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zerofree/zerofree.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zerofree/zerofree.mk b/package/zerofree/zerofree.mk
> index f26280cc2a..3a9c16ee78 100644
> --- a/package/zerofree/zerofree.mk
> +++ b/package/zerofree/zerofree.mk
> @@ -8,7 +8,7 @@ ZEROFREE_VERSION = 1.1.1
>  ZEROFREE_SOURCE = zerofree-$(ZEROFREE_VERSION).tgz
>  ZEROFREE_SITE = https://frippery.org/uml
>  ZEROFREE_LICENSE = GPL-2.0
> -ZEROFREE_LICENSE_FILE = COPYING
> +ZEROFREE_LICENSE_FILES = COPYING
>  ZEROFREE_DEPENDENCIES = e2fsprogs
>  
>  # We use the same workaround as in https://bugs.gentoo.org/716136
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
