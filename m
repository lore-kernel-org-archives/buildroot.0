Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA316C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 571AA60C29;
	Wed, 16 Feb 2022 21:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7Mj2I8b3v-U; Wed, 16 Feb 2022 21:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E44060BEA;
	Wed, 16 Feb 2022 21:47:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED4C61BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF3883408
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QfOjZDYfmWYf for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:47:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B4288333E
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:47:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x5so6204089edd.11
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sXkogVyTxTqxqcy7PfI2bsEnwgk9g5vm9cvOFdvXYtA=;
 b=Mqy0imy3ExzjCaF/ij1iKlDDChk6c2vZ9Jzxs2wSUjsKg2SZiX7ESKZQUjgIQTSjbQ
 WteOkwSUuD5Z+8OwJQuqG0E0aotC4GclXfzW8WLPkx5JR2/XLHkzJiQyymrtX1wu93f8
 IJuF27t3da9aeeUhNsLczNoRoXwuyFTEuYEb/DDJdimGcnGprl2o5PbNecSQH7Rs/r4I
 doCI/ojqbaz30kwexw2QGANe7JcaX7gfdSfuRgZuP17rb6bEb3gD9J1tMgYxFsoBlo94
 sfHhiOQMrhCG03SHZuXIl53T6HItLjpFIypIKMQSb5vlWgOfH4s9HXD0nPA2RjZMYQfu
 Ueiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sXkogVyTxTqxqcy7PfI2bsEnwgk9g5vm9cvOFdvXYtA=;
 b=YNVQnkhZaUpfVZ4fosSDt574mSyVgNVfTdcVM267o4gZLv/7yUXrMdeqjU54PtCSk4
 v6i25q+uClBDZqzDnkpnZTe46kkwORwVFplESke7M3SPQn4r0KyyRG3++jCkdb5HLmpw
 znaiHqDeGxsj3CVrCjvZaSt+62JsZDvlC8qQyjGprPpG7dKAaoRzLH4Gk/hPhGUc6S6K
 /PiAyscT7CNyFS7c6RogVXa38C80XR9w9SQjo2kiB1iG45bnhezenl0fpurhsRioJzDm
 ZH6WYR1phjtfpZWvV9ahvEBRJ4ZkN9kQLuwcBtjbQKtTZxj8m8Goj4GNMuFPZWxFiUGO
 zClg==
X-Gm-Message-State: AOAM531GxFEe+TQmlMdGhGQ7bGv8qI5ubzcUsZWlTu2VkT0oD+v80w7M
 JzLlT7gWSgs1qF4sSr7nPBtYcElsNnYY6Q==
X-Google-Smtp-Source: ABdhPJzmx5WQW3ueXOTZjHQ/J1cJzvVKjPNcRfqD04UyUQcJVWqA2HGjVy0yIajRXGhOfGdLjC2jwA==
X-Received: by 2002:a05:6402:168a:b0:3fb:600e:4cc3 with SMTP id
 a10-20020a056402168a00b003fb600e4cc3mr5209206edv.32.1645048061442; 
 Wed, 16 Feb 2022 13:47:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l9sm355414ejn.164.2022.02.16.13.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:47:41 -0800 (PST)
Message-ID: <ea414961-b6ca-c524-fbe4-66857c678ba9@mind.be>
Date: Wed, 16 Feb 2022 22:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220212184155.4188927-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220212184155.4188927-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] support/pkg-stats: fix regression after
 cleanup in show-info
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2022 19:41, Yann E. MORIN wrote:
> Commit 471ecea5eeb0 (core/show-info: 'name' only applies to packages)
> removed the 'name' field for rootfs (really, for non-package) entries,
> thus breaking the pkg-stats processing.
> 
> We fix that by excluding any entry that has no 'name', on the assumption
> that if it has no name, it is not a package.
> 
> Reported-by: Xogium on IRC
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index abd36a3dd5..c235d99407 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -371,7 +371,7 @@ def get_pkglist(npackages, package_list):
>   def get_config_packages():
>       cmd = ["make", "--no-print-directory", "show-info"]
>       js = json.loads(subprocess.check_output(cmd))
> -    return set([v["name"] for v in js.values()])
> +    return set([v["name"] for v in js.values() if 'name' in v])
>   
>   
>   def package_init_make_info():
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
