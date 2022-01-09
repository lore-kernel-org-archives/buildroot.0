Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6FAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F4A481A3B;
	Sun,  9 Jan 2022 22:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xc8PHmiTIR8E; Sun,  9 Jan 2022 22:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD39181A16;
	Sun,  9 Jan 2022 22:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C26CF1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD83B4010E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKSsin5d4RC3 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76B88400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:45:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r10so15746380wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OZNzkbaU0KKWNokNOnlD5HEdqRBSofsxXnYoCFohIZs=;
 b=Dq0eEsla7iQu0erEvQXki9t9LdRKD8iF4NQu79iY1CldMOgXKepxaIWu77Sc5wvXur
 prsvo0OcQek8xMvA55T7sGc/1ioBZi22ZhnxyWV9/Obf6pX/TW+pRNDNiIRb1oSHMc/j
 DatQTre7dO7XcFGCrnL6r5vPbDMmcm5W1KLKSFu0Bmg1DUuU9DC5hGaYlxagCIcQpQ4v
 NAC30yyVDEG06ai/Dv4sjNRjZNJggel9VWdgsLcLhPxwy8YP4jOrAerxP7AwqSAc22vw
 Z4/0kfKwnGMxOXPpZ5Yt+Hc+7zkQGnK8fgJVbskzPuOf88w9gFMF0XCcGPtbK5oal9UG
 RDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OZNzkbaU0KKWNokNOnlD5HEdqRBSofsxXnYoCFohIZs=;
 b=5cLrsHGTeqbbMwAEGWMyVf6g57BRaE0KMZQ6I3atXJmxe5WUQjxNtQqV9DSfcS3clQ
 mc4xTRA3gxOkzJHdiIPqqo2WGwE1/CDdSFjh/KojGQeK2RPOdvZ5x/HbVVh6L0DGMYqq
 pdOocFrjdzpX+rRM16z7SEy3IDUy4bufppOJBF31LayVoaLuYltWQGImVO1HAv4DmPed
 EhLz0MlY2FCjvAZHEh5OBIfA2HvpAc1OwCO6J98tY9xM4OEnq5lbQ9JsJI9eskUQjvbD
 p+Biu4W6ke2KcBqQTeIzVvridH3kZiYJ6hrCAqxhDMQctr8uGPq8gSQU/q544wwZQn7m
 CimQ==
X-Gm-Message-State: AOAM531nV0NjI94hHF+X9ETGWzp8naBvqGm/xGerfAQdAPKtiNaaa077
 L00IkMf/oKol0Pv5+EC/2kZD7g==
X-Google-Smtp-Source: ABdhPJybcZFYHKAMdtDrcUo31uILoGoNbgmitjPQ0o7TdxCkcc2a9Bv0hhHeU3m5UG/zvX1EQSmdeA==
X-Received: by 2002:adf:f611:: with SMTP id t17mr18136791wrp.631.1641768354762; 
 Sun, 09 Jan 2022 14:45:54 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id x21sm4972014wmc.24.2022.01.09.14.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:45:54 -0800 (PST)
Message-ID: <3a7818ff-a958-0bce-2d08-10fe8f000721@mind.be>
Date: Sun, 9 Jan 2022 23:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20220109205946.14456-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109205946.14456-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/avrdude: add support for hidapi
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 21:59, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> If BR2_PACKAGE_HIDAPI is selected, add it to avrdude build
> dependencies.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/avrdude/avrdude.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 5bbbc4e8c2..63cc3bbc7e 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -28,6 +28,10 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
>   AVRDUDE_DEPENDENCIES += libftdi
>   endif
>   
> +ifeq ($(BR2_PACKAGE_HIDAPI),y)
> +AVRDUDE_DEPENDENCIES += hidapi
> +endif
> +
>   # if /etc/avrdude.conf exists, the installation process creates a
>   # backup file, which we do not want in the context of Buildroot.
>   define AVRDUDE_REMOVE_BACKUP_FILE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
