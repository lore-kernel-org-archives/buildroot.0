Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3290C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92516610C0;
	Tue, 12 Apr 2022 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCoh5CE8ugR0; Tue, 12 Apr 2022 19:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902F1610B5;
	Tue, 12 Apr 2022 19:51:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0AE21BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF66140B47
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsflPbZWtPdE for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 334B940B48
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:51:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9823E13F838;
 Tue, 12 Apr 2022 21:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793063;
 bh=2omMYFjdB2uoZBPIILlZlRFXov5qlkReLPM8Qvx/EMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QM6qz0a48aZR4WOcJXm1g+vh7mq5e+yAfzl7XWQr1Atr1jzTbS0Bg8hiHF7OJhhXy
 5ctlWhjxmmU9pPebiGQY9qAuhvAaXxHIKOdEn7+0GGMeV4CE2QgPehNwlBTViC32Jv
 ncqvFkOyh9c0v5HIpfLPcaMMeK18jzV69YJnmQ+0MyhXn1lbRPnl4jbpsdRcSJ407Y
 TviXtPrEX2YrYNcJHHKJLqbiZh7FHNNP9teMA1kdxLAG7Whft6YNIduZvkOw6Nz0ZZ
 zWeq39FQShJuzGHNRtxvTkff7WwgPAaWlzsV1wNc1YJEtzr67JdE1xB2hL7iIVRtTe
 +6+bk32JcSURQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:51:01 +0200
Date: Tue, 12 Apr 2022 21:51:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johannes Agricola <johannes.agricola@work-microwave.com>
Message-ID: <20220412195101.GC4029883@scaer>
References: <20220411082308.1528455-1-johannes.agricola@work-microwave.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411082308.1528455-1-johannes.agricola@work-microwave.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/libwebsockets: bump to version
 4.3.1
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

Johannes, All,

On 2022-04-11 10:23 +0200, Johannes Agricola spake thusly:
> This is quite a version jump, so there are a lot of individual changes,
> see: https://github.com/warmcat/libwebsockets/blob/v4.3.1/changelog
> 
> LICENSE has also changed:
> 
> - More items with license "MIT" were added:
>   - lib/misc/base64-decode.c
>   - lib/plat/windows/windows-resolv.c
> - One more item with a 2-Clause BSD license was added:
>   - lib/misc/ieeehalfprecision.c
> - Sublicense texts were copied into LICENSE
> 
> These should still be compatible with "MIT with exceptions" stated in
> `libwebsockets.mk`.
> 
> Signed-off-by: Johannes Agricola <johannes.agricola@work-microwave.com>

Thanks for the detailed analysis of the licensing changes.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Update LICENSE hash
>   - Add changelog and LICENSE changes to commit message
> ---
>  package/libwebsockets/libwebsockets.hash | 4 ++--
>  package/libwebsockets/libwebsockets.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
> index 1761a7658a..e39d6e1853 100644
> --- a/package/libwebsockets/libwebsockets.hash
> +++ b/package/libwebsockets/libwebsockets.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  6ece1f422c6d38aabedec2476f2ac12e9aede8691b08137068ad85545ce3ff78  libwebsockets-4.0.21.tar.gz
> -sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE
> +sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
> +sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index c25686d385..152659cee6 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBWEBSOCKETS_VERSION = 4.0.21
> +LIBWEBSOCKETS_VERSION = 4.3.1
>  LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
>  LIBWEBSOCKETS_LICENSE = MIT with exceptions
>  LIBWEBSOCKETS_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
