Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97000C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36DE4404AA;
	Thu, 24 Mar 2022 21:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKf_8MEcff52; Thu, 24 Mar 2022 21:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BBF401E1;
	Thu, 24 Mar 2022 21:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6FB1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B77F81454
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCMoRifikyYX for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3F3E81451
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:13:43 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id r13so11681811ejd.5
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i+SwXoa1kYgeWDl3RT+OBudwYo7yG5plLDcPhvt/FO8=;
 b=eG/Fp3P1MUMjk613H3C/Auq5ck7b2gAwrhwEfVa1u/tzZS7nL4T2VchGXlztzFGVgc
 R+JxO/922SC3gvXELyrU0472YZbgf4O/VGOgNx++Tl+lZp8o0xpNidSWEsQTgQKZi2Dj
 XuPsclGkH3eAd0HoPTrNYnvApflma0Qir1wNjaLPf5bVwbiEDli78tbkDI8aKviZr6Zd
 1Oct8e7D77BA3UPFND8axsuMqrmwxiOMMOKJKTEO6locpBw0wjyaTf8gejEqREkChErM
 NASftDMMSYWKOqpzDkm6hADzLkTZjR8PXsSca1DtP0AnKd9eO1Y+cu18ZX+jj5tMVBnf
 rt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i+SwXoa1kYgeWDl3RT+OBudwYo7yG5plLDcPhvt/FO8=;
 b=EGxI21BQbU8TlDrb3kDhao3SJEma/fHFGeI3C9Ri0evedzRP2/U4YS3obq4lCE6xnx
 jX6uhjQ5v2R/fbkntFCrrrwRKV5eRBuPTrwTuavgG5BQLflTlnQVMg0X0ISWcNP6n/2V
 jKCERZ4FKOEPyrGT6Y7zmiX6ejZfA5LKh8Oj+6QGFvCTmiNXtcM9gKYT8rDyTHD49b2S
 g/mDImif8glKhhqXqygyAAFa2P6ezbNmsShvbYzpBmJHie+i0ujIM707fv5A++hmCGB2
 y8r7ziDCDTDQFDLMVb7zDvAVGd36vQrT8MaIkmmuTpys2sO/r/Sxy7DAmLxBica00BnL
 oDKQ==
X-Gm-Message-State: AOAM530C5UznWRE9CfPjqA3E11uwnBSzrJnafVfYR+5KRqgd2R/R4i0f
 QnI3lO+vEPb9tO8Vn97rH+lU4w==
X-Google-Smtp-Source: ABdhPJyQZHqOY6jFSl61O14jDz8uoJCupBA+CO5Pzs07MlwT91lfi7ur1GbJ0YgJo22GGYVPPrgOUw==
X-Received: by 2002:a17:907:6d0b:b0:6df:e54c:ad1d with SMTP id
 sa11-20020a1709076d0b00b006dfe54cad1dmr8324801ejc.734.1648156422113; 
 Thu, 24 Mar 2022 14:13:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056402120b00b004196059efd1sm1871051edw.75.2022.03.24.14.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:13:41 -0700 (PDT)
Message-ID: <8a6e08bc-1832-0be0-2d68-189330b0b6e2@mind.be>
Date: Thu, 24 Mar 2022 22:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220315211653.2297582-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315211653.2297582-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-avro: renumber patch
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 22:16, Fabrice Fontaine wrote:
> Commit 77704462c9e2422b6f9a07d35d88918e790e6940 forgot to renumber
> patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  A bit useless if you're anyway removing it in the next patch, but OK. For 
backporting, I guess.


  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   ...h => 0001-drop-install-time-linting-and-imports-sorting.patch} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename package/python-avro/{0002-drop-install-time-linting-and-imports-sorting.patch => 0001-drop-install-time-linting-and-imports-sorting.patch} (100%)
> 
> diff --git a/package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch b/package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
> similarity index 100%
> rename from package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch
> rename to package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
