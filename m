Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD63C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E875440B74;
	Tue, 14 Jun 2022 16:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U00YnqhqJNn3; Tue, 14 Jun 2022 16:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 204AB40B70;
	Tue, 14 Jun 2022 16:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD1B1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B28D83312
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTdjjxbemyeF for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D48358330B
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 16:55:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m20so18320168ejj.10
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wZuRhr88SIfWvkSdzy/Jki52AfDNPEDjBYWESjhXOeM=;
 b=InBGuYXGhGjdUeX2c1qswT1sItyBIGitxmqCulP6/3P+4Zd+dBLIUeIVYP3kh46uKC
 VHKO7nq+sUyYnDH1kMmBjDG2zT0xSR+Ap2LZtgofICtmkal4VZiygU2QuAiJpu+8qGkw
 /fIbS9pwcLMWJZpvz/IxFlvDwJhDyU4RL/LuJv5Op74vq2FYMkrCe4vbrp8fVqjwB2v1
 vtB8T9yeFbMVTxXtaYzb2pWc3qrOp6Ht2TyQI5YMJrbRrHPpTZckLSMsu9TJOwaVPl84
 mQFgKtcj8nROkah84bvPGa6vmsk1yOTwry8KayAVyJ0eS77qwR2rPsMjey0DS17yyOqo
 JMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wZuRhr88SIfWvkSdzy/Jki52AfDNPEDjBYWESjhXOeM=;
 b=i2BMGVhh7vqDadggfpLAnCgF2gYDTzC0U4imH7QgOW53McFeRBB9HGYkG6Xwktr6bg
 qvRW4iERqG93hA7Xs0iJ2hC1pncKrsHtQMYYrrzKUIFqMNzaCW34qpY5/ltnNL7WBWm2
 X5BY0xcEM4OFMgOID3mBE5bU/AgtmqVVlo9dFZ10bXxJZB5cqcX6/IYeFVhYZuEWfa6q
 1ePlWDcg1a3FadKt0c79GxrIzos8VeFOwABTYGk91dpybL4QrWWyETXXiUMPlAs0OTGi
 xMjf9a7VECAeGffHb1zBU5MN1lVL6EmmuBSu/rMjJdJv6T4u+Y6hbsc4eYGwRGWmYE52
 9ZRQ==
X-Gm-Message-State: AJIora9s6rgMgsEY+wX6n9/ICqw+jXlSO1dVvGfLZ+65wnD4L8iUaOmH
 sZmsR/7HqYbiGZPtxeYvWjmj9Q==
X-Google-Smtp-Source: AGRyM1uzfmUNl0KlxmUWG2DN7IsWucXDQUMMahvUbnhiCLWsnpm6Y9b2GyS5iqOuDsBtMhKEPbN8BA==
X-Received: by 2002:a17:906:c834:b0:6ff:4275:1e4e with SMTP id
 dd20-20020a170906c83400b006ff42751e4emr5055632ejb.121.1655225717084; 
 Tue, 14 Jun 2022 09:55:17 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 h16-20020a1709060f5000b00711d0b41bcfsm5302055ejj.0.2022.06.14.09.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:16 -0700 (PDT)
Message-ID: <fa410401-4dbf-e3e7-ac16-5006300c4055@mind.be>
Date: Tue, 14 Jun 2022 18:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220610165654.2574448-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165654.2574448-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/iptables: bump to version 1.8.8
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



On 10/06/2022 18:56, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/iptables/iptables.hash | 2 +-
>   package/iptables/iptables.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
> index 7f1441393..f4e5ae159 100644
> --- a/package/iptables/iptables.hash
> +++ b/package/iptables/iptables.hash
> @@ -1,4 +1,4 @@
>   # From https://netfilter.org/projects/iptables/downloads.html
> -sha256  c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0  iptables-1.8.7.tar.bz2
> +sha256  71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f  iptables-1.8.8.tar.bz2
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index 555bb384f..a54194a8c 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPTABLES_VERSION = 1.8.7
> +IPTABLES_VERSION = 1.8.8
>   IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
>   IPTABLES_SITE = https://netfilter.org/projects/iptables/files
>   IPTABLES_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
