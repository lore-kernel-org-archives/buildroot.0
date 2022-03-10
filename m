Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDC4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A0941969;
	Thu, 10 Mar 2022 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id byLptGTsu7QE; Thu, 10 Mar 2022 21:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E27641974;
	Thu, 10 Mar 2022 21:24:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5EE1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 842E1841DE
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FL2ciPjWroZK for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:24:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C5BB84222
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:24:14 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qx21so14882895ejb.13
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3BHePGQXWQ8Zv5gZrjoE6ZuQYG86RZSzuEF29lba7xM=;
 b=CvywtfQUQ3btORKUZpwXmUufpPljMNc4lam1K+P4sDSS7Fnkddv4w0QEpxBemxGk6+
 rTWkjER1WAlo3mjVHI+gDYxjaFzvSvczKZd13l8NGziuiSWsPujQeW3ETXn1Vjrgm/T3
 /+0MHpbYOXsLzx94SAX3rD1vcSVNzMUUn59wciIGjZJnywn9gpG32+gK/Y5AFzn/UG7r
 boqWuN0G/dGzjHj0gNdxLwcIQrxdhx49D37hGc/IfQ92mSJwDhH+nFJqHAryLLcUn/Au
 Ds+B5YxZ0SQ6IqBn/f9QerNEiwdBG4Q5SZUeDhClNT9fXh7Bv5QUV2MaOp7HeAuT/aC6
 MYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3BHePGQXWQ8Zv5gZrjoE6ZuQYG86RZSzuEF29lba7xM=;
 b=pGnq83rFqcu5Lh52LL0nOyuWpzmQc0WQJjPKPLJtb/Far22RAwcDr4rB0cZWTXJO96
 7V0iO7QVBOGBp/aveTXUDhMCvbD/0LWLOyffbIvsBTjafDEJRcAarW7PCB1PBuJh7BKB
 rskKX04CEEiqnfYkFKSY/iZQ2d/Py3zSVGf/ldf9DlP07k8hoogJC1pWoo1W6JuUvDD4
 Q54SyplURalVadOdyBgspP+S+vHo5KHVpNM2mYXx5eYT8OdXt+b1UjEFs3tmuqXgD+aX
 19XIgesR8lEtXGEQu3R3uVywEv1V9fcBRn6kVfPlnqh+Pvgb16Lv/QQNg/UySnxqY2VH
 BJHg==
X-Gm-Message-State: AOAM530O6IjtC4OssbuHk+2Rp9kofVdXZdHJNYWg1f7sFVAc2lssY34I
 Uqaln+u+SfsR81CtanTtqUx9sxGs/ph0ag==
X-Google-Smtp-Source: ABdhPJxSjC2m9bJqFAsOFQYT+AvPCRWM3TrAMeXhpxJmwugZSO6TFeZK/cMPmTbPVqs0BjdckhqJLw==
X-Received: by 2002:a17:907:720b:b0:6db:8b63:ed3 with SMTP id
 dr11-20020a170907720b00b006db8b630ed3mr3372606ejc.234.1646947452642; 
 Thu, 10 Mar 2022 13:24:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020aa7d901000000b00416217c99bcsm2462775edr.65.2022.03.10.13.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:24:12 -0800 (PST)
Message-ID: <a06d3855-2dab-2264-fd0a-aa93e8096bf1@mind.be>
Date: Thu, 10 Mar 2022 22:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
References: <20220214211927.3673441-1-judge.packham@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214211927.3673441-1-judge.packham@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] syslog-ng: Bump version to 3.35.1
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



On 14/02/2022 22:19, Chris Packham wrote:
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/syslog-ng/syslog-ng.conf | 2 +-
>   package/syslog-ng/syslog-ng.hash | 2 +-
>   package/syslog-ng/syslog-ng.mk   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
> index 55d01501cb..64ff980593 100644
> --- a/package/syslog-ng/syslog-ng.conf
> +++ b/package/syslog-ng/syslog-ng.conf
> @@ -1,4 +1,4 @@
> -@version: 3.34
> +@version: 3.35
>   
>   source s_sys {
>   	file("/proc/kmsg" program_override("kernel"));
> diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
> index 99ed363eca..ab643627e8 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  cece39ec1c68c88d493705e0a528b83d038da384e89d4838393ccc75f62a2d4c  syslog-ng-3.34.1.tar.gz
> +sha256  1d0238b06b3e5987c859e5b529ecee738f75bacff04b149398b1fe8cbb121e53  syslog-ng-3.35.1.tar.gz
>   sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
>   sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index c05ec9785c..fc57a56820 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please check at runtime if the version in
>   # syslog-ng.conf header needs to be updated
> -SYSLOG_NG_VERSION = 3.34.1
> +SYSLOG_NG_VERSION = 3.35.1
>   SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
>   SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
>   SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
