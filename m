Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A95C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFE8D400E9;
	Wed, 16 Feb 2022 19:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVFKjWeYrJWl; Wed, 16 Feb 2022 19:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C3D400DA;
	Wed, 16 Feb 2022 19:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD58B1BF9BA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB6EC61C2C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9F3-53E4QnRJ for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:39:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 608FC6068F
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:39:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m17so5652538edc.13
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ro7xQM7NFTJz2G+nPaRngmvg2KAkr36hsShcpsvE8kE=;
 b=N71dXA3fQ+u77/VfT8AHTxxsdMqqos5l42HAIQVe/MHqCn7dYruw8CmQckNDPYZw5D
 RRX5Gw3K+SJ1NXbkueHyThrcgGZe0NgiMHOX//2qi4sND+SEjCmMklNf0gaW87O3eC9r
 ULwMZ5K3BSqqWIyDxN3WbPKtaWB12ObpkKGm88J+nwRJt3wYqwcUuVWSZ0Ni1bpT8pEq
 jwvR6rFkXj1IjtVFFqk2phq8AwJKgj7r0mlApp6O1XLeheWtUKvuaP1llnQSRg1x7q0f
 k2RNDpBrpGeGJtZyxdw8M3qMdMRN5M6Mm+d4yNt/NTBS7RRpjoHNAqNJzYBPm2ssd3ia
 VCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ro7xQM7NFTJz2G+nPaRngmvg2KAkr36hsShcpsvE8kE=;
 b=Xto6BX7PsDffWgLCWYtLAJ7nIETyoKfvRRNUKF6Lc7ll7pqwOLImhjK4/Li8REU68U
 /AatjWAvNTuTYZ8Hj2jkJlk9O0HqVFN/tMIue+sVlP9PT2F7FvZdJX98KH5SMAIpeBzQ
 pxCFCMswV/pX+q3oa1vt2b6UuUQO3okEDpSfxMB6s73mVkBNHxSuC3mHE63wPbxbIJYz
 hs8MBEW4lPJwP4PyGliu1ciZkRcpzynXmjLZlba0oRDk+J5poFGHi1hk8sS4NN6K/5/q
 nYJRx8I3wKQtP+1Y21QS9I0XKJAzBB+gbVSWIHB1GcILT6AufImZmjX79ejqgmw6ZVP1
 oxMQ==
X-Gm-Message-State: AOAM532tN95l12COwCEUT2TbLl96e/T1uhVIhuQ4Xj33j7ewYInJbi8Y
 CiK/bX5EB8tydQJh01TiL+rgSjm6jCpNRA==
X-Google-Smtp-Source: ABdhPJzV8W3F6S4HwUFUkHJTrQ5+xq7txaAR/MBRqRb7cfg56u7XbcoFgtYdgQh7D5OhAK7q4SaS3w==
X-Received: by 2002:a50:ba8b:0:b0:410:dedd:ea37 with SMTP id
 x11-20020a50ba8b000000b00410deddea37mr4765426ede.260.1645040369682; 
 Wed, 16 Feb 2022 11:39:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 13sm267669ejr.112.2022.02.16.11.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:39:29 -0800 (PST)
Message-ID: <7f4c3239-890c-0954-8f71-a460200532b6@mind.be>
Date: Wed, 16 Feb 2022 20:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220212062220.611561-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220212062220.611561-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.16.4
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



On 12/02/2022 07:22, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index 36b0c8c8a1..ff5f80a67b 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d413b6a20a0ce30410388d330e1056715333e0863165369668dda596766e9d5b  xmrig-6.16.3.tar.gz
> +sha256  245ba47a6b8ae8e9a9df1c055e90f22f944a7d1219416cb30268881d0c0d377b  xmrig-6.16.4.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 7fa638a54c..1feab499fc 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.16.3
> +XMRIG_VERSION = 6.16.4
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
