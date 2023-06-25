Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C9CEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF0D60BD6;
	Sun, 25 Jun 2023 19:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF0D60BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9g5SFH-CuhL; Sun, 25 Jun 2023 19:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB6860758;
	Sun, 25 Jun 2023 19:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB6860758
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E8021BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37E0D606EC
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E0D606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThugNPC2d7hY for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A445606C0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A445606C0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:13:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98e1c6a687fso72974066b.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687720405; x=1690312405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VqEVsT7Dt7FeL6x6VZzqzFrUW3yBPH21G2NGGTXgA6U=;
 b=BUZb/ZZ3Tui2JFjrVsgZ/ETGbmv2quKgTQlw5xAoSubgKcGGYf+XeEz3PeGGFMkslW
 Dc6CQrGdm7plzw0TqSJVa76rqF7onnlQXvL3ZrqDMMiWcnkh5Wl3DLRD8QB47cUyUW1P
 nfML8SZoAEz8tFnX8Ak6lcBRqov8HcEKyFKpSaTMNMKg+L6dKJzNdTXknHAPiI4Wwm4s
 OJnjFZt5nknSjqdEH1Sc5VJWrYeNu10+JkGqNyTTwZV7D/k2q4CuvFRuIX+5yOOFx9HE
 jYIKG3xhzt/mvGqLRGCmF2bZ+LdVu7wYN5fPKPuEHzee4YFZJ2+SxNGwW/oI5ONQbjNN
 Dn5A==
X-Gm-Message-State: AC+VfDyP22fZzjORkEnv7cM869UNTOF7OoKK5I4FEPcwLNU4371wS8Nr
 8wl3JLEB6EwoRYfsxqEf2FDpMjFV7S29jww8V6w=
X-Google-Smtp-Source: ACHHUZ6SIUUc71CP4E/AG5HJYneVj+NbL1T7PrEh0GXk+ZX76bz2ZqMkGKyC8U0xz2Z7YTiVGTIx9A==
X-Received: by 2002:a17:907:7e95:b0:987:350e:771c with SMTP id
 qb21-20020a1709077e9500b00987350e771cmr18212792ejc.51.1687720405244; 
 Sun, 25 Jun 2023 12:13:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bu5-20020a170906a14500b0096f6a131b9fsm2383682ejb.23.2023.06.25.12.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:13:24 -0700 (PDT)
Message-ID: <c1fd9398-77bb-4f75-e9b6-a9c5395e0a96@mind.be>
Date: Sun, 25 Jun 2023 21:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622051047.2907590-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622051047.2907590-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687720405; x=1690312405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VqEVsT7Dt7FeL6x6VZzqzFrUW3yBPH21G2NGGTXgA6U=;
 b=VD1IIYMctS7iFPDN4+8wwowCKCcEfnchaEzpv9H8yh3i2dATEnbUoNnPMlXr+zNtUB
 jppkIg3zRXWLRoRplIh2e0gcWoYSrKsiX0f+BvfYB3D74GWA3QizM2fBbkE7C8qYccVN
 A5nW2NXqr8bl8loa72lInvI+Nmn0GlHUXsZtSfjdlxDt7IDR3uHC+dsw58DQ+x1EirOA
 u6EnBl9PrmCq1C4CyxE+mcSeh9eC41Sknyfmo9qaM3Lwo+kmrCVM2KFbGXKVPniZ/T6b
 se0Yi0YUr3U8zwzijSxZanlImzheyVLPae8rTYRdPaCG4mz1nSoHqy66bfdLOczAWB4h
 hIKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VD1IIYMc
Subject: Re: [Buildroot] [PATCH] package/python-bleak: bump to version 0.20.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2023 07:10, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-bleak/python-bleak.hash | 4 ++--
>   package/python-bleak/python-bleak.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
> index 2cd038cb68..aae230dac2 100644
> --- a/package/python-bleak/python-bleak.hash
> +++ b/package/python-bleak/python-bleak.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/bleak/json
> -md5  6f9881cc85648683927ab0b9c58a1a52  bleak-0.20.0.tar.gz
> -sha256  7f6fe69454ad5d4c0ab05ae4a9aa1aabd6926d7128eab2fac4ef8a58a72999ee  bleak-0.20.0.tar.gz
> +md5  97e2987748f1def21e1910a258027c17  bleak-0.20.2.tar.gz
> +sha256  6c92a47abe34e6dea8ffc5cea9457cbff6e1be966854839dbc25cddb36b79ee4  bleak-0.20.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
> diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
> index 7d3dc2831f..9532774ae8 100644
> --- a/package/python-bleak/python-bleak.mk
> +++ b/package/python-bleak/python-bleak.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BLEAK_VERSION = 0.20.0
> +PYTHON_BLEAK_VERSION = 0.20.2
>   PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
> -PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/aa/86/5084561ed4f31aec0322bef015db949a9f2bf0b4f6bd72b16479cf03f459
> +PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/95/a6f614fae12a6fe1cf517f8600004dd6abd4af0e0e1177c03164d0637e81
>   PYTHON_BLEAK_SETUP_TYPE = setuptools
>   PYTHON_BLEAK_LICENSE = MIT
>   PYTHON_BLEAK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
