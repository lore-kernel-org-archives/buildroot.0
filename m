Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BE5C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C6E40B74;
	Tue, 14 Jun 2022 16:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpP9O0fATPC3; Tue, 14 Jun 2022 16:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22B3140B72;
	Tue, 14 Jun 2022 16:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E63EE1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5AEB8331B
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtgX133ikBp1 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA4A2832B3
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 16:55:14 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id s12so18387039ejx.3
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3hzmxxsoCgRKCakFhuRXVVVpgFw4/Zzn+1jmac87NTg=;
 b=ZI7Le0c4CTYvYooqTJLjJIYfux1z7C2yF0Ca4dD5Sk/9nRGAaZ8Q4X8Li7pLnmiy6p
 nKBOiU3SSj1y0bxUvwLpOE62Kf85l5VnUJp0hZhkTyJjei+IzfzUdE2m675fzdVO/jjM
 zx3L5h5fGMWeb7UNsbn4PFNwtNUuAVBWkLx2cGW8xLnsnA5QjFA38GAay6je5VjL5qFm
 oZzWGaGrIJTvzlmX9J2Ui/s0bEnThUa5tNi+6qxNB0yTpU+Gr448LyMhPeXK7sBRusM9
 DL58sI5/p+Yj1wa/bPMPmYcPi93AqJNTsJdVY669+ubWZ3oyZFOjZSajw7MXcaDaGq4v
 z/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3hzmxxsoCgRKCakFhuRXVVVpgFw4/Zzn+1jmac87NTg=;
 b=Yblty6MinrzruOjHtYnXrcslgZEMFqKqVMf9AhBnWWVfmPHTDxL7O/bdB/io4cy2xS
 kBJacpnkcpav4aNDUwLxOc6iE8co9JW6d0NOl1uRm8zLTDWlmxXLL8HKLC9jz/JsptUF
 O9afhDAfOafBP01P1yXLKEA84HfAoyuUjjpDNEfVxzg4lhJM+NssBc/0XUb7vP/L9hq9
 VJ/XmvrysNxaGEA5mo7/ER1mbE2anUZp7tjBX1QouXQB7rL21gBJ9a2+5kXOz8ADSzH2
 UcpjgKYg8JDIP4tTNSAtu15U/sP3bJo/WJPVCGeXygGVUTfWQ6UnlcQhV+cgv/+M1esH
 2lFQ==
X-Gm-Message-State: AOAM530QjmLNY+MVYVhSqDD0kz8xvHiYjcW3iy76w6svUsyKEzAUW9dh
 1oFdZ+QTb+Ns0LLQkr2ffnuqmDf5nty7ng==
X-Google-Smtp-Source: AGRyM1vVOvA0T+4N2wJGhKSqqE2f4/Y8xgLZMJkTCs1E7gdzHueF/K6MTSgMqlL6FRoiieTA9R6RDQ==
X-Received: by 2002:a17:907:6e88:b0:707:ea6b:5e15 with SMTP id
 sh8-20020a1709076e8800b00707ea6b5e15mr5135132ejc.57.1655225713096; 
 Tue, 14 Jun 2022 09:55:13 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 zo19-20020a170906ff5300b0070b7875aa6asm5231915ejb.166.2022.06.14.09.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:12 -0700 (PDT)
Message-ID: <eb934421-ab30-4a55-1d7c-657eeffdd2b6@mind.be>
Date: Tue, 14 Jun 2022 18:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220610165641.2574429-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165641.2574429-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.2.1
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
>   package/htop/htop.hash | 4 ++--
>   package/htop/htop.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/htop/htop.hash b/package/htop/htop.hash
> index 908dd32c4..d43da1344 100644
> --- a/package/htop/htop.hash
> +++ b/package/htop/htop.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
> -sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783  htop-3.2.0.tar.xz
> +# From https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256
> +sha256  5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb  htop-3.2.1.tar.xz
>   
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index cb8170a0a..df2ec2590 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HTOP_VERSION = 3.2.0
> +HTOP_VERSION = 3.2.1
>   HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
>   HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
>   HTOP_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
