Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A819AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28CCF81D7C;
	Sun, 27 Mar 2022 16:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfywPOKADv7n; Sun, 27 Mar 2022 16:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D9B81D65;
	Sun, 27 Mar 2022 16:23:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1ACC1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB4D640189
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ld50WFezGSY1 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:23:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B575940104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:23:21 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id h1so14441409edj.1
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jN6qBBhaOGsJ9tMXRPmc+I3AcbMRCqKcWx7V02HOfsc=;
 b=UniQ7JZv28u5Ja7rIT/VZgtkN7jpRcdAh0H1L5hQGd3d9rsDELvzpbBMwMUTMtDEac
 9F7sqvfVNhmZ3il9dmvGzBmtlUCYcWryScafCkB9LkEkvmueAMjwc6okDy3OzEZ8g+Z+
 3iddkgk1indn0oJXAWSb/MEcsQUmt6Z8TEibcWm8mOfyZ5KHSbn5qEy+GJClZvP9wm73
 He2FykQXvQeiG+HJrjRLhzYR45mUpz/Wz6krUo6G2pn61dFNX0jlarSc3RPb1ZmcFTdA
 nBxG1uxXXCgQa4dUF7ldBidWePPFo3+EYsb15sOxIIVRhdqFFqn0va+1mz3NwuayRz9s
 0BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jN6qBBhaOGsJ9tMXRPmc+I3AcbMRCqKcWx7V02HOfsc=;
 b=gm8MdL2Tth1TZ+0paLSki6S5g8VUejazFDg/XQnOEiKUBGWhHoi9ISgEwhUmQML8tv
 xsVEc2HZrqL0QXICgLZVoaK9wYUIp34u1aVVNJOnIJJdvQY/m0MQVoFIX6a2EjVL28Q9
 l2JuWUe3r5FTlZ3tTULfEIFWGDv7AwstC1MS7ioxmpGCBV+g1iWgqgi8Ayjy8J3AtPh5
 fVo0f4WTnmcrf44mbSIROANOBTwq9WicDsh64MaNUbskzeT1fHJkO8zlE/AeDbgIKYcu
 +yeTVxUw2Ifgg0Du2WRykGlVt6YN5h85w6wFtI4V0RIUpfB68PWjLG8U/SZiPtT5NAZq
 HmJA==
X-Gm-Message-State: AOAM532SGfUDku8JNv7OtaYcrnDXw7xMy+ZNVNXg8iGS8UH8V24RSIXW
 EJqDQILAG6uzM8H5CYOSJ1SYAg==
X-Google-Smtp-Source: ABdhPJzaLrOjkC+geEH5yp1lgDbfgo4D5SZsXHcsanZK7SKjT8nCCa8KOs+d+jEmVyS6weY0PHz0yQ==
X-Received: by 2002:aa7:dbd0:0:b0:416:633c:a0cc with SMTP id
 v16-20020aa7dbd0000000b00416633ca0ccmr11031634edt.349.1648398199908; 
 Sun, 27 Mar 2022 09:23:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d23-20020aa7d5d7000000b00418f7b2f1dbsm5881841eds.71.2022.03.27.09.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:23:19 -0700 (PDT)
Message-ID: <5e27550c-7c02-3f0d-54b4-4cc515efe970@mind.be>
Date: Sun, 27 Mar 2022 18:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220325212405.25243-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220325212405.25243-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2022 22:24, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Although honestly, there's not much point updating a host-only package unless 
it actually fixes an issue.

  Regards,
  Arnout

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index d909709b24..8389adb243 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz.asc
> -sha256  9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b  meson-0.61.3.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.61.4/meson-0.61.4.tar.gz.asc
> +sha256  4e3733ddc66bac38e38c63b739c9b8b8fc5a866de5333396b0c85c2b144ddee9  meson-0.61.4.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 4615e839fe..e9c3145183 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 0.61.3
> +MESON_VERSION = 0.61.4
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
