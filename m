Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6A1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29DB88331B;
	Sun, 10 Apr 2022 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDkicrpc-BKw; Sun, 10 Apr 2022 14:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA4D82F20;
	Sun, 10 Apr 2022 14:50:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D753E1BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C578860D55
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wuLcdvKkzyLP for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F16C360D54
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:50:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d10so15413751edj.0
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyQhHgn1wfNhraV01ROPwhbNkVR5MrqWmHzQoBZzcso=;
 b=g176BisCUY/brdKVbeBehdi/CBHtmg9qsJkdqvXsoiqkx0zVKfdzoHF4SoYHwZPwsN
 zLS+4PgqjKlkEIdqE5rc764ILBHEHSAyFLmqDuHTDU4BZhVbH/4KSGbYvjo+gJSvqfM8
 YJQoIC0+2+/vMII6j2ZmCPVJW9oQgCtm+5PSGEHm0jPChTI4ZZdGQkg37ejqeVVSo50/
 6CjidUKy7ka4mKJFvQISdqfNVSamlS/hrRAlrLB0ZBvNLpT2yS9USm2g2VMLruhL9am3
 hNztBVH40Nezq968D2A/w+MzPEaPMIFPdIF7ZgQllrEegk8HkzEi9Hl9/5C5IpDGK184
 EW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyQhHgn1wfNhraV01ROPwhbNkVR5MrqWmHzQoBZzcso=;
 b=3+jYMp3CKnLj8rj5qbpa4me8uFjD55N5ecyT8ubWEBJYehSQ7wh+LV5uF3kxjC0T0r
 6ZAwdkTZvBbAKHbQYI0Ekc+0KbycwN6l5Q4ds6qZfgC/5eqycyqZxr8C1NIC52KhnAs5
 boRBrPPqI/CelYtVfqsZd30q6R9CRrp2TSFjO74jrwrBJvU1X7VeJlb+kj9CX76aJ2kn
 d/ApxvEAX+Mp7zblsP/1jg83fIg8Cw6txrDF+r6Wi4WJsHRLcJ9LE4Gw9yAHoeHoKrcl
 PmmnaTBN4yUsMqi+iZMMneeT6ZKopi4lYuk55nBvL+yaLCsVE2wbsa4M8Ozk1qzNiFXl
 QDAQ==
X-Gm-Message-State: AOAM532Kb5nv+jOVBP167mNtVJ/P4TMj//MbQNk0XtrftemqSipZigkv
 TuzgRiq6Zse06xruiMz808jqSA==
X-Google-Smtp-Source: ABdhPJw8GLXBt1qBY2Ii8UAeM4c/t6tas5N0eP8Zuz7m57SBuqjC43cawqQy4qxLNcuvWwfJIuHJmA==
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id
 u19-20020aa7d553000000b004164dfc126dmr28719939edr.213.1649602243119; 
 Sun, 10 Apr 2022 07:50:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a50bf0d000000b0041cdd9c9147sm8489341edk.40.2022.04.10.07.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:50:42 -0700 (PDT)
Message-ID: <cb239a9b-836e-5e69-c4b2-6435a5a9ca50@mind.be>
Date: Sun, 10 Apr 2022 16:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220405073603.496103-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405073603.496103-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 09:35, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/spdlog/spdlog.hash | 2 +-
>   package/spdlog/spdlog.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
> index 02756fc98c..866d1d6d02 100644
> --- a/package/spdlog/spdlog.hash
> +++ b/package/spdlog/spdlog.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  6fff9215f5cb81760be4cc16d033526d1080427d236e86d70bb02994f85e3d38  spdlog-1.9.2.tar.gz
> +sha256  697f91700237dbae2326b90469be32b876b2b44888302afbc7aceb68bcfe8224  spdlog-1.10.0.tar.gz
>   sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
> index b5dfc0c7b4..9c5e76a9e8 100644
> --- a/package/spdlog/spdlog.mk
> +++ b/package/spdlog/spdlog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SPDLOG_VERSION = 1.9.2
> +SPDLOG_VERSION = 1.10.0
>   SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
>   SPDLOG_LICENSE = MIT
>   SPDLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
