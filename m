Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6F4CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C1A40860;
	Sun, 24 Sep 2023 18:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C1A40860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGrLxHlhS4oJ; Sun, 24 Sep 2023 18:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B21AD40600;
	Sun, 24 Sep 2023 18:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21AD40600
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35A771BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BFA81E0E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BFA81E0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_eYrmSI9hJn for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:23:24 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1011181DE9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1011181DE9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:2d77:ae6d:70e:6233])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0185619F5C2;
 Sun, 24 Sep 2023 20:23:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 20:23:17 +0200
Date: Sun, 24 Sep 2023 20:23:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230924182317.GR1469982@scaer>
References: <20230924162909.1019467-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230924162909.1019467-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695579801;
 bh=Zlb4hysxkVeMMtcasknbCXKoJLmsefdiEbbhrnbaeJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P4Rrm3Ih9f5DOhOmlPckipDT3Bxe1S81iSWosdTGFYV3DV9xUzXcZdlUVbmGpFYpd
 UY55dShDtQGEO8JYPEjgZxHMI2r5pHhTEcom3HnuUJAMrwFJCeWRcM0DiNNW2LZTYd
 SNiyes710x3fVGsLbSJHROlTFwxTvFNakK2IdnUKhHnpEgTp6FdGaAtQd60MxyxIkL
 6O8Zocy38DwuruRNLJHYVVT5lhaFSOblJU5ShoZU9JsvCDN2QA9uLYyNhFYhBIwm/Z
 VANDlTRyJBz+EyuoFRqTiSEkVJ5VheIbiQ90K9ECftcDtugmkrLgSqD5tGOFsMy8Y2
 c1AQbent8ZvHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P4Rrm3Ih
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: drop
 PPPD_DROP_INTERNAL_IF_PPOL2TP_H
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-24 18:29 +0200, Fabrice Fontaine spake thusly:
> PPPD_DROP_INTERNAL_IF_PPOL2TP_H is not needed since bump to version
> 2.4.6 in commit 49b239ab20e632792a6c61173ba830cdc2128ebf and
> https://github.com/ppp-project/ppp/commit/c41092dd4c49267f232f6cba3d31c6c68bfdf68d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pppd/pppd.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
> index d9d6244f10..25d017a84f 100644
> --- a/package/pppd/pppd.mk
> +++ b/package/pppd/pppd.mk
> @@ -37,15 +37,6 @@ PPPD_DEPENDENCIES += libpcap
>  PPPD_MAKE_OPTS += FILTER=y
>  endif
>  
> -# pppd bundles some but not all of the needed kernel headers. The embedded
> -# if_pppol2tp.h is unfortunately not compatible with kernel headers > 2.6.34,
> -# and has been part of the kernel headers since 2.6.23, so drop it
> -define PPPD_DROP_INTERNAL_IF_PPOL2TP_H
> -	$(RM) $(@D)/include/linux/if_pppol2tp.h
> -endef
> -
> -PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
> -
>  # pppd defaults to /etc/ppp/resolv.conf, which not be writable and is
>  # definitely not useful since the C library only uses
>  # /etc/resolv.conf. Therefore, we change pppd to use /etc/resolv.conf
> -- 
> 2.40.1
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
