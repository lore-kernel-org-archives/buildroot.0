Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10094C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C240760B9D;
	Sun, 27 Mar 2022 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gtj-3MQ3vN6j; Sun, 27 Mar 2022 16:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0380606C6;
	Sun, 27 Mar 2022 16:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6351B1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 611E281AAD
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2L-5w4gHv_6S for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:31:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1AEC818CD
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 16:31:37 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bq8so10175875ejb.10
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=alaqXhj85UNLaEt2klN7tPxkuB/xcthVEDBps9VvwaU=;
 b=ZMHGc1TJugl0tyufR1+mO+XxyZxTlXN7UPai3nKJaNIYjAGhchl89V9npKt9LBMTDu
 O1wHVlXaCy14cc++P1HNTWxqVZjgKYPhgOXgibt4KYb657UDOg0Md3+uQWJXkbGh22NC
 39qp52RNqpKb8hoUAW9kciN0JZAXf68U/BnekoTbwVwmbYrryw/CvyUOols8eA0uxEjb
 O39QezNX8At7pQN3svjqCbyKDs5TbJIDIzX6TSDfByCNMJaRgbVFi+q+ysUzyjUrzd9O
 qAImT3lfptHA80ZEoTIpHwrbe9GNISs8ZI4q7Vl/EQCtOvM900quVTllgEiwsZqT3bpf
 hbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=alaqXhj85UNLaEt2klN7tPxkuB/xcthVEDBps9VvwaU=;
 b=j3iLS0JFDCTl7bya4vCRTca2LjFqWWtI/0f5WSU/1VVLLscP+Cc+jNy6SWnNERy/FD
 1kiu2/GSmd9jlhaZtbh5uFyzOA+AxnUdQ7GZCjJpgWQUAvrqd3tae+KgKKAyPW8Fopkg
 qnEDe2oDpeYLjxo4wwLKLX2zqws7YkBdtSwmiN8M9rgvB/oCoAFUdyaJZHfcA5daVroW
 7bwIXS3JsIbiraf+rbtRcSb6T6Qb8oxGdx6n9itRqEeV2h2MoAEN+U42QB9rZvE7vRpl
 QkISW1nlkpCJCe0ufRsxrT46/Bj+hjfG7upiuq6gywryIMErRWYmUm6Iqa2+DORH6P/H
 6h1Q==
X-Gm-Message-State: AOAM530NvgoW7sh1iKq3O/tYkYPF7Nwpd8ODA42pMMThTARt28ICgE/r
 0q2TP9JKIVU7YhdJVy+svgAbVvlaQVyFwA==
X-Google-Smtp-Source: ABdhPJwsKN8aQwtuxtUCx0MAGkFs8gzOfF4b5t57IkrdMHGlrscQg77xvY85vyQf63LaidgAWUq4jQ==
X-Received: by 2002:a17:906:58d6:b0:6da:bc08:af7 with SMTP id
 e22-20020a17090658d600b006dabc080af7mr22476435ejs.537.1648398695960; 
 Sun, 27 Mar 2022 09:31:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b00413c824e422sm5844363edw.72.2022.03.27.09.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:31:35 -0700 (PDT)
Message-ID: <74c2bcf3-61df-6077-1609-f4867379ebb3@mind.be>
Date: Sun, 27 Mar 2022 18:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220327142048.1477306-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327142048.1477306-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/luasec: bump to version 1.0.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 16:20, Francois Perrad wrote:
> diff LICENSE:
> -LuaSec 1.0 license
> +LuaSec 1.0.2 license
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/luasec/luasec.hash | 4 ++--
>   package/luasec/luasec.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
> index 1ea422aa9..1e381612b 100644
> --- a/package/luasec/luasec.hash
> +++ b/package/luasec/luasec.hash
> @@ -1,3 +1,3 @@
>   # computed by luarocks/buildroot
> -sha256  b7e18f475c64896fe4921d367adabae765914f7526a68487a5fa6831040e7138  luasec-1.0-1.src.rock
> -sha256  0d3431dad143f41c8902e4ee867e386a702ebad856c45239fb86460e27dabfbf  luasec/LICENSE
> +sha256  7ed5d08aad8f0e8659abb3f43c935da1c898474d4dc121e9edfbeae5c4c67fb0  luasec-1.0.2-1.src.rock
> +sha256  84376baf33cefbcc1e9adbca23fcf87f51c1107956660cda2880feaef86d6075  luasec/LICENSE
> diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
> index 3ef0c14da..4ace94d16 100644
> --- a/package/luasec/luasec.mk
> +++ b/package/luasec/luasec.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUASEC_VERSION = 1.0-1
> +LUASEC_VERSION = 1.0.2-1
>   LUASEC_SUBDIR = luasec
>   LUASEC_LICENSE = MIT
>   LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
