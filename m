Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849B0C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 11:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31827402ED;
	Sat, 12 Sep 2026 11:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UohWe0FoDX_V; Sat, 12 Sep 2026 11:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2428040544
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789213196;
	b=q8RPC3FXJX975xnYvfk4h5KweKeiCK/frgxdMpvQHVX6Z9+xMkFslUjBitKSiEGmGV1X
	 YjJJeY9LpTNhazYPXfcFEqhfE7bbS7YI9XghoKekWqoLvUElrRa04RMnBDtn67YwZpTXO
	 i06L9aDSgaqd9BHCz5eifncm0g2pqZnqjQmdwykfuBoEjj26ehAQI/b2Z1Jl3XbNZgGVy
	 1tO8tdYdfZMBMyBmIxUnphFZDRnXU8tJU8R4rtpV76q2IuobMGQqsTbweW8EFbqA4VoY5
	 SwU8b75C4Tu7HUxTqDYdWQU324YX5EaPaSJRDNFC4zMiwWMik2n8c/Uq34zK1D8wD5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789213196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=66HSnkkCNKrzo5tkXDvwTPdIHcfa6B85ErZNjkhBT0U=;
	b=lSOKO0ob+XPYrQEo4BJVzrOfNbdSk+vulzjRuxLuexMP5LcMPQepa8gthgffTO0OHOjK
	 IWMVd6Ol0cx+FKCofDRGQwivSFwC1afDxQ0JeJPNI/mhiAqYXG0OQYm5I+pXvbdtez+aK
	 uMzHw5VAbdT2N7EKAPiczgZH4FV6qjij+8JnqTPJa6B7qQ1iVGXo120+vckTfpJ4YLO61
	 4Z7S8AOY/bBzogOTGfh2Ug/UoWyVa1aXAcNQqh8Qv12X/gOedlvetLClqF+Dk9p52GzV4
	 TXvVbqd0XOs7/N0SgbYy05OkLZYNkRST0FqUqbBiGrNQ037E72kru/3VzzGqdLpBs0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789213196;
	bh=66HSnkkCNKrzo5tkXDvwTPdIHcfa6B85ErZNjkhBT0U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U3kxSmTg99FDHVJFbnOFJJLD+n8TrDSAmDSiEqPhfKpopiwLsVHnbD/MYBGbyBIVt
	 ttzSV4N0I5vKWK2AN9GKzy6gdNLiB4IDmRdbRHJp7lWPB2z4KDHRzGckc8+CJmH+yY
	 mKg9c6UNutdN6AKUQvEd/bgAqJNZuZ/9xPG+0BIR4wEhkeKKtHNpZmr1/ZaS648r9O
	 /QYRKIz/k8dkOnrF7GbfPBne8DltoFiUYQUX1cbquGXGWYI18tJpl1DvkqcuqPtSNC
	 7K/ZzCiU8vzRZswMY0aUkY3yt6I8hs/OlsH54CBA9odpPaJiU/pq58eVgIowKoP2Of
	 v0c1TOSzfz/qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2428040544;
	Sat, 12 Sep 2026 11:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD73C49D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF1524007D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDaCjxxCjgC6 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 11:39:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 818ED40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789213193;
 b=fNZuRLms4hjFnG9MuHGDHNNZ1Xm4IBYuQjRQPY2YuYzUEPhWaGdMcNfYDWrrRQSDxIQL
 QE+Vez2LOdQlewY9af7E+uBXImal08HQo5gpnFmHlEEeFezxq4pRdPMfZk1qCbvPKwXmp
 9m8+VkkiigLhz9OM55UjS1Zjzn2ECxZxPW7rhLEN0Oks3E8ff2fryzNHl18uODU8VHx9j
 o1fkix422FgckBHsousnOfrpa8QhuqBoI03hs05eDwJ+JBcehkfHcbMtCbKDUuggSNJ33
 kYy55KbGVVPsQk8f/mIleC5dugeCFvM1L3WH6SZVrl78JOuy0k/XheLc+REmKSalWbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789213193;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lGTqyaNih8mQ+X2i3VI7dKsIymVQZU5GLwokN1L9QLQ=;
 b=m6at87/qYTEqNjF1D7Lcp6kCUhaNcOjqxUrJk85C5K6eRIiIG1BSMFelzBeuJMiSyyHY
 YxG4aBirf0s2bvYRpyvMh9epc4tnZuhhUHpEJ+5wIQ/HjDaEFWLuxTTwT1g5ijD/dcH0Y
 S2RAeti3QSiqoDS3NdTD66iaHQfd48fbrKeE3xGGAnINW2e68qB13H+Oc7fTbkY5eO0RP
 PdFmOPfUnDwVRcRcJo1aDrNq5ypb8PR65TXIEf79kBXhU+RDbChb430J0v+Hc5g29TA4q
 E1OgmeTPV3omP6PRJrRa1X2NVkFPYYvwWv3g+FiwOrOYAWhyd81XLQiTJ3EQY5PZ/OA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IO6VTnO9; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 818ED40068
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:39:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4A655B0056A;
 Sat, 12 Sep 2026 13:39:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 13:39:50 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 13:39:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904164927.188013-1-bernd@kuhls.net>
References: <20260904164927.188013-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <dfbd4e4f33f3b0e9f2896526f04860ff@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libcdio: bump version to 2.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 04/09/2026 18:49, Bernd Kuhls wrote:
> https://github.com/libcdio/libcdio/releases/tag/2.4.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/9a89d8eb86f6e88d00e5d6bb22773090ae6eff04
[...]
> diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
> index d5238e3aca..213d5cfa32 100644
> --- a/package/libcdio/libcdio.mk
> +++ b/package/libcdio/libcdio.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBCDIO_VERSION = 2.3.0
> +LIBCDIO_VERSION = 2.4.0

While this new version is working in the Buildroot Docker
reference image, it is failing on my Fedora 44 host which
has "help2man" (version 1.49.3) installed. I have the error:

help2man: can't get `--help' info from ./cd-read
Try `--no-discard-stderr' if option outputs to stderr
help2man: can't get `--help' info from ./cd-drive
Try `--no-discard-stderr' if option outputs to stderr
help2man: can't get `--help' info from ./cd-info
Try `--no-discard-stderr' if option outputs to stderr
help2man: can't get `--help' info from ./iso-info
Try `--no-discard-stderr' if option outputs to stderr
help2man: can't get `--help' info from ./iso-read
Try `--no-discard-stderr' if option outputs to stderr

Maybe we should always disabled the man pages?
Could you have a look please?

>  LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
>  LIBCDIO_SITE = 
> https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
>  LIBCDIO_INSTALL_STAGING = YES
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
