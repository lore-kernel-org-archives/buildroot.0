Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F86C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F69141296;
	Sun, 23 Jul 2023 17:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F69141296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3f0qk7JB5HmU; Sun, 23 Jul 2023 17:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59DB341369;
	Sun, 23 Jul 2023 17:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59DB341369
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDE81BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAA3840111
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAA3840111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZQpM2RXogx7 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:46:13 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6749400CF
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6749400CF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7F1565FF33;
 Sun, 23 Jul 2023 19:46:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 19:46:05 +0200
Date: Sun, 23 Jul 2023 19:46:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230723174605.GO2503916@scaer>
References: <20230721032102.782318-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721032102.782318-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690134369;
 bh=Hixijq2YoV1ErVlG95cz7ITwgWXjCbJ9pskzzLx4hDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2GlCvOh4akjSSRJTCDN2HcKu3B5+qCrfdEduCxT9P+xaerdyPLx2j2M2Fg5Nz8Gj
 DRW71kkvnbI/wn+TgWU3vnpPmUctzpe1zCwhEV3K3Ox3p6vmC2sF5S64bHVQlaIEIV
 DuQYD86VrN0WZfjxY9PvCu9TJYz36GBtdSSrAuz8Hw/r861p4qq8X+ZVFIjEwxCCQC
 RSwkPtR7XJMFSH+wdsyHxLOaQ4QOIBxmQElE2N4m/73zw+tuSI8wLPg76rp3986qsm
 uCORbEokSxywU0t7QceuzGQr2K3Woxx8ca1vsUH4jouMoB5aaGuLlZ/fSLIntsZysQ
 x88sk1Ju21rnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d2GlCvOh
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: Copy the crypto
 include files
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alistair, All,

On 2023-07-21 13:21 +1000, Alistair Francis spake thusly:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  package/libopenssl/libopenssl.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 7a4e0dfca2..9d44098063 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -127,6 +127,10 @@ endef
>  
>  define LIBOPENSSL_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	mkdir -p $(STAGING_DIR)/usr/include/crypto
> +	$(INSTALL) -m 644 $(@D)/include/crypto/* $(STAGING_DIR)/usr/include/crypto/
> +	mkdir -p $(STAGING_DIR)/usr/include/internal
> +	$(INSTALL) -m 644 $(@D)/include/internal/* $(STAGING_DIR)/usr/include/internal/

You will have to provide some explanations for this change.

Indeed, as far as I can see, those headers are private headers for
openssl, and are not meant to be installed.

For example, they are not available at all in my Ubuntu 20.04, and I
could not find them in an Ubuntu 23.04 either:

    $ apt-file search /usr/include/crypto/
    [nada]

So, this commit will need some more details as to why private headers
need to be installed. Or why they are not private but not installed by
default.

Yes, I see that patch 2/2 adding libspdm will probably want those
headers, but that at the very least should be mentioned.

Regards,
Yann E. MORIN.

>  endef
>  
>  define HOST_LIBOPENSSL_INSTALL_CMDS
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
