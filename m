Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57FD81493;
	Tue,  3 May 2022 20:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlAOjqcwr8A3; Tue,  3 May 2022 20:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A456682BC3;
	Tue,  3 May 2022 20:27:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 265D21BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13D44416B5
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RM18NJ3wOgQg for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:27:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D06964169B
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:27:34 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh6so35639184ejb.0
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TXuwselPYYoea+GMZKrjhJt6aNHWBdieJerWysshEOo=;
 b=DZok1kOK0PIeOq7onBEZjLw9q1M3TAOvRpal8mW+RZll53YWgHz579V9DdHDDPPB49
 XEs/Rfu2XJQs0TIX40fzmzkanA9ptYPq3kFpYRIdr8h7itt5tXNEjB/nr5RUt8S9jXhM
 fUzbmp30XDuXbf+UQz8iH19SeAyG9VYJofTwUTld/qQ6ByCVZ3obCiMgn+9Rppt4qCA2
 2gmsPTWI4k1XPt4TdyrHxqAmMN+2HNqLTHz9FZ8rnnWxNj0YNrVXjXJGJpOh1eTmGOZ6
 ap2Y9Z3WDSoxhVC17PEweOnNCCyCokowWuWWDxW0VHTY3tdJVuuS4jsqMa5DjqiZykOz
 UKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TXuwselPYYoea+GMZKrjhJt6aNHWBdieJerWysshEOo=;
 b=1QD8qILXzzcMyg+a3CgGBamn41Qvl7J1DMrqE36c3Kh12zye6/CufC6af0MbBY5BaI
 gjiavJ5NoarU75n6u0N54kNUIeUIWHd6ttrD4tI7b1O2WAOY/TLHN7QngVl3JBEEcZWi
 AeP93xQVZlFJjUp/kp0ecScBdCjSY+o1BrvW0s5dHLMSem51TO1PoJe1NKSgdXjvlrCa
 7/ngpzgTu7Z1kAvgplII4B58n3odNDwARS31Q1+WB7ig4Xh2V0FB29fNpyUm+Vnq2Y2g
 uonalonRYJpFc5tm9J5XvhibsmGjGOxslJI9kMxMVqAX+OKwxhil80Hj4uPgpiEC572E
 vLDQ==
X-Gm-Message-State: AOAM530fBwZdaE4IbUW7Frj7zrVveFYSCuUOz4kEGDNvgWELxEZjGILx
 Pz5PMRluURFf7LcOH04ZBbVrlw==
X-Google-Smtp-Source: ABdhPJzzxl/9AlXfprSk0Oup1M38L7SPfb7sDA4Yl8cY0xueGhTQQgiMC93oDpUicwbDh/8no38vnQ==
X-Received: by 2002:a17:906:2bd7:b0:6cd:f89d:c828 with SMTP id
 n23-20020a1709062bd700b006cdf89dc828mr17175439ejg.232.1651609653046; 
 Tue, 03 May 2022 13:27:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 yl1-20020a17090693e100b006f3ef214dd1sm4906802ejb.55.2022.05.03.13.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:27:32 -0700 (PDT)
Message-ID: <18efec31-4d97-c43a-ba52-6ec1959a3e8b@mind.be>
Date: Tue, 3 May 2022 22:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220502223834.948086-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502223834.948086-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: bump to version 2.9.14
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 00:38, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libxml2/libxml2.hash | 4 ++--
>   package/libxml2/libxml2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 81ac3e3f31..e67d3b0b8a 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.13.sha256sum
> -sha256  276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e  libxml2-2.9.13.tar.xz
> +# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.14.sha256sum
> +sha256  60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee  libxml2-2.9.14.tar.xz
>   # License files, locally calculated
>   sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 5382f28ec4..3647549a4b 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBXML2_VERSION_MAJOR = 2.9
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).13
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).14
>   LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>   LIBXML2_SITE = \
>   	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
