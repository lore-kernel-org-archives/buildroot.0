Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32041E8FDB3
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A00EF611A8;
	Tue,  3 Oct 2023 20:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A00EF611A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGm_gqG3hL80; Tue,  3 Oct 2023 20:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E7EE610E4;
	Tue,  3 Oct 2023 20:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E7EE610E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B37C1BF3D2
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24AFA81586
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24AFA81586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0GROn6B0hiK for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:34:58 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE1A48145E
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1A48145E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c4b3:c81e:8436:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E7E9F780372;
 Tue,  3 Oct 2023 22:34:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Oct 2023 22:34:52 +0200
Date: Tue, 3 Oct 2023 22:34:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231003203452.GF2957@scaer>
References: <20231003185841.3613075-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003185841.3613075-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696365296;
 bh=DN2kNdKde0n6WZXACnZmBbmeHq1ZgA+HW+RkBOX9a+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8iklWEk28WNEUtr6P3fH4jEzyTKV9KZjI3Kv7bbNBnIQz+hdwwlCMJE/gWrQ+Ja/
 qMufBjZyS81h+5z3CNnHEAvVxm3uDe/dPT6SYN1Efl5qtV3mS2UTPRQhn/u6S93pSZ
 yQLQbGQZl+UZzlKkCIy5d/LSpA6HilMLeBEyULZ85RK14OgwpkYAIjOOEVHGkONEj0
 7ck9MKhWwwLHuSXAfqFXdAMqGHhC3KxaWtWUkFBq6cKt//rxssBIr9SRTXSFvszOkV
 BjOk7miJUo0L64TAskHLm0FWZYue1Hnubt98ramy4+t3sc269PlLSCc52hcm5J+TP2
 vpkJyJXuVI2Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c8iklWEk
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.94
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-10-03 20:58 +0200, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index a3b98b0f8c..50889f8d13 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_93_RTM/src/SHA256SUMS
> -sha256  15f54bb72048eb105f8c0e936a04b899e74c3db9a19bbc1e00acee2af9476a8a  nss-3.93.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_94_RTM/src/SHA256SUMS
> +sha256  463ae180ee9e5ee9e3ad4f629326657e236780cc865572a930a16520abad9dd8  nss-3.94.tar.gz
>  # Locally calculated
>  sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index abdce32efb..51694c77bf 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNSS_VERSION = 3.93
> +LIBNSS_VERSION = 3.94
>  LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>  LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>  LIBNSS_DISTDIR = dist
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
