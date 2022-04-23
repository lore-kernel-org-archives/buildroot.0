Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1E2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0763405D3;
	Sat, 23 Apr 2022 15:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiJBE4LWNv7k; Sat, 23 Apr 2022 15:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEB7E4049A;
	Sat, 23 Apr 2022 15:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A987D1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9850783300
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-qO48fWDl-M for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:04:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4A478134C
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:04:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id m20so836974ejj.10
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0e5AhE4GxsX3SIFGVLMrCw6jLvhFcDnoyzAv0Z1j5Ko=;
 b=h9wOiwrGepP7zcVnY/1PCO92Beqn9NjkqrqZB1oJolOa1EGItJdPUwW/tcB52gjHno
 W/B12a3cJssEK/byWFApHIn8Ml/z9ojsuU3+MNlZhfwsRGDbulg/+Yl8eLCBl1wjrPkL
 QQSLxH+3r7r8JbKB3Iu6qoZS19CQrt5fiQ1hakMHzmUNcxolPxzbEmZ7yZR0d28mwPVK
 9f3KbXzhP02hRVQPinnvvZ5IwaomaKmUb1L0xpfX5n3zmOfVnNKBDa/6rmHye1rZjq1S
 6CfEJgPAjmm0o7SgcAy6ktzmZRoDrubqKk4PCNq75dzWP6eqrT8kbB6jSOdp5EYC2pAo
 oLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0e5AhE4GxsX3SIFGVLMrCw6jLvhFcDnoyzAv0Z1j5Ko=;
 b=NcyfxP5ipGs98fthnCGbaj3kXa7Mf7tIuQ6Pg84HJu52YTM5eUVNvqyCC519AIb/EH
 ZIZF+xIvsPTUQjvbt+AOlvq8cEjoMZ0qdxb0YBURXQrs3bB+MPntRSFd5w3Y7KdO5Q/j
 XscV9HYivCU5hrA04BtamtsrUASJGLz3hmnPlJHPElCdHY0gFBP2y5iDUYvQeYNTlxef
 l/a0wJURPgjZk2uUQGcKlLFlOrmqCPvDRHKXFMSFN+4llFgV8ABVO7SF1NfSUgTv/gRi
 bxDmSKj64eeBY6ZAix+F0G5hD4ETldjDb/wH2sEVveXmGQnFDxvj6O4DVpZb8nDsfKMV
 s4XA==
X-Gm-Message-State: AOAM532AqHziRrc9/R/o1XPIWowQZNeNOOsmosPiKR0JzNaHERKEhcwE
 yVnQDxYI+MqDj+fRVi/fFSypf0rmRx/AiQ==
X-Google-Smtp-Source: ABdhPJwFJzr7EeJpCP9/6j6b0Hkgx7hII22tsuXx+N9uPtmYsvyMBCwXHuW6kqjK6bVrlYttX/+J0w==
X-Received: by 2002:a17:907:1624:b0:6db:8caa:d71 with SMTP id
 hb36-20020a170907162400b006db8caa0d71mr8714395ejc.723.1650726278774; 
 Sat, 23 Apr 2022 08:04:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm1742953ejz.57.2022.04.23.08.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:04:38 -0700 (PDT)
Message-ID: <36655c3d-bb76-4eb6-c8b0-521fea745984@mind.be>
Date: Sat, 23 Apr 2022 17:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 buildroot@buildroot.org
References: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
Subject: Re: [Buildroot] [PATCH] package/openlayers: bump to version 6.14.1
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 10:54, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openlayers/openlayers.hash | 2 +-
>   package/openlayers/openlayers.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
> index 2d6c2fb9d3..1c93b9a729 100644
> --- a/package/openlayers/openlayers.hash
> +++ b/package/openlayers/openlayers.hash
> @@ -1,2 +1,2 @@
>   # Locally computed:
> -sha256  aeb8107a23a99d79efb6031c7cf901307b63571c39fd744f771d4a707e06a14f  v6.12.0-dist.zip
> +sha256  8a9fda6e392688c049ebb88fb2c73b5788b4965b625443de4cca7d4688b1fb82  v6.14.1-dist.zip
> diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
> index 7532bb7f68..4626e7545a 100644
> --- a/package/openlayers/openlayers.mk
> +++ b/package/openlayers/openlayers.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENLAYERS_VERSION = 6.12.0
> +OPENLAYERS_VERSION = 6.14.1
>   OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
>   OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
>   OPENLAYERS_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
