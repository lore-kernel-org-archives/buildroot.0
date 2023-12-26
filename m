Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A6C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465AC80BE3;
	Tue, 26 Dec 2023 20:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465AC80BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmtHmsGj-l1G; Tue, 26 Dec 2023 20:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDEB8130C;
	Tue, 26 Dec 2023 20:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DDEB8130C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D40601BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB0A401A1
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB0A401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eU8pnIOq0dBQ for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:29:07 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA4E4016E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA4E4016E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0C1B4B00535;
 Tue, 26 Dec 2023 21:29:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 21:29:03 +0100
Date: Tue, 26 Dec 2023 21:29:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYs3j7PEh8y9v-LP@landeda>
References: <20231226173349.941794-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226173349.941794-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703622546;
 bh=g/TQEI3CrF79ZE4M8xpzKQdzx0i+iklQD/F7p052yEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p/aWd5C6z6QVxGi2OKAGKTDcGIuvHRdZr3PQrXCTjkJVlBlVmQu8sqfrvjnLzlivc
 YnYKXkboRU+ylQ1osq7E3UGad8llQqFjzY9MtZS1ECx8Td1+0WokU9wVah4b3tCxtg
 VaJOReLAG7UWjAAckYiLy66R3kXET5+8tqwk0jkp9DsFRGA4E10j6d+ueijDXsfNO2
 4Smc84vCAcekU2vas6OXyogSu2wMV99LDrJm0/L+yeAw0H6555KPMfe9txg3/ZUyIm
 0hZN3drthtXDzqMZ/wSBLv6sl90cajjZvtPaPCNJUGxHswT9R62RLWtkpmst38bzZh
 wDZNgP02/r82g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p/aWd5C6
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.5.1
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

On 2023-12-26 18:33 +0100, Fabrice Fontaine spake thusly:
> Fix potential NULL deference errors.
> 
> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.1
> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ksmbd-tools/ksmbd-tools.hash | 2 +-
>  package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
> index 6f7064c6eb..c3e6ebefe5 100644
> --- a/package/ksmbd-tools/ksmbd-tools.hash
> +++ b/package/ksmbd-tools/ksmbd-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  418c7d87e8359355d150bdde6784612cd2ebd48ec87765852169e289d9de67e6  ksmbd-tools-3.4.9.tar.gz
> +sha256  ab377b3044c48382303f3f7ec95f2e1a17592c774d70b2a11f32952099dbb214  ksmbd-tools-3.5.1.tar.gz
>  sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
> index c758c17bf2..c56c6e10bb 100644
> --- a/package/ksmbd-tools/ksmbd-tools.mk
> +++ b/package/ksmbd-tools/ksmbd-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KSMBD_TOOLS_VERSION = 3.4.9
> +KSMBD_TOOLS_VERSION = 3.5.1
>  KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
>  KSMBD_TOOLS_LICENSE = GPL-2.0+
>  KSMBD_TOOLS_LICENSE_FILES = COPYING
> -- 
> 2.43.0
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
