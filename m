Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AD6C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E8161375;
	Sat,  6 May 2023 14:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E8161375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vAjuY_k9OGJ; Sat,  6 May 2023 14:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0D7361162;
	Sat,  6 May 2023 14:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D7361162
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 040371BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1C56817A4
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C56817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EbhvAwMLliD for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:43:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B989B815CF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B989B815CF
 for <buildroot@busybox.net>; Sat,  6 May 2023 14:43:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ED3AFB00576;
 Sat,  6 May 2023 16:43:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:43:38 +0200
Date: Sat, 6 May 2023 16:43:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230506144338.GH2661@scaer>
References: <20230315090742.399240-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315090742.399240-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384221;
 bh=tvm6sbswkVEISeP/HayxCqI+Nfv8X1Hxw8sFaG38S6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ad3mjyDsaKKFCeHW4LqrArzpfPHiidyEqr5+ZWpnp57yTz7Dy63HdD7GFpuOf0Awn
 z/qIUgJ/4SVATJfeoSNITfksZGDWLl17NB19Xn9usdmBPG0BQLaUG2KRt8qUg9tflv
 0mpU2f66JHZfGsD8aBAHc4gW5q4mJPUeP6rLkO/h18HOLDVcRPPy9Tnj9TjOQdeaPn
 6zjKOweu6Xk8sAwZHbYihNEAmi3QE+ypJt4wEyD9V37pICXrEccoYGtPNn9/fPxtYY
 iSs6b6MGKimN/VipToPacj7/J/MErMTgx1t7k/dhTzgeH0eDCkuxP12+O8e2hnQo8L
 J+Oxpx6u2RSRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ad3mjyDs
Subject: Re: [Buildroot] [PATCH] package/lualdap: bump to version 1.3.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francois, All,

On 2023-03-15 10:07 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lualdap/lualdap.hash | 2 +-
>  package/lualdap/lualdap.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
> index 15ca840f1..97aa3b570 100644
> --- a/package/lualdap/lualdap.hash
> +++ b/package/lualdap/lualdap.hash
> @@ -1,3 +1,3 @@
>  # computed by luarocks/buildroot
> -sha256  49c253f540187c61850c856b8e70e45dca904b81720a760f6a94e4eb474958ad  lualdap-1.3.0-1.src.rock
> +sha256  c1772077ebfd02e082e89583701ef27dd348dc76ae015247f21a2756f5fac0ae  lualdap-1.3.1-1.src.rock
>  sha256  b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
> diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
> index 5dfba8b7a..375754180 100644
> --- a/package/lualdap/lualdap.mk
> +++ b/package/lualdap/lualdap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LUALDAP_VERSION = 1.3.0-1
> +LUALDAP_VERSION = 1.3.1-1
>  LUALDAP_SUBDIR = lualdap
>  LUALDAP_LICENSE = MIT
>  LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
> -- 
> 2.37.2
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
