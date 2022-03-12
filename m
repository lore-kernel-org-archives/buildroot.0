Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A048AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 352AF40488;
	Sat, 12 Mar 2022 17:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6Yf8OU8PHYu; Sat, 12 Mar 2022 17:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B5E4023D;
	Sat, 12 Mar 2022 17:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29BBB1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 182F460864
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0D6_sHY99C86 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B510C6009C
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:08:26 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c20so14516446edr.8
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lww00e62vDTirehrOoj35PjgPPCIUXSrdyW1ns9M7/0=;
 b=b/IR42/wWtMhBPCFwoUIlDVtf+lTSBBqB+EFqoJPUa49EdsRBgROKI3anmFOfWfNVv
 6zFOK0LeE7QT9SSsNTkdmBSaq5W37Y+SHAGVADp83iCOP0oXF6YDVa3+bHJ70vMNCUFO
 RIbcfq3KIb+bxRXmCE+hmIav/VDsGQwmpNC+m1z9jtlzzbJkcecAmx2r47JgOOqncZVA
 eKwZXh/JUflax4FUMAzytI+y6N40O2ZmcmHRroIPK+DcPct1wrDrW7Il4Hv/WMsrN/X7
 lr1Mct/fy0hFjDx5HpSXTM2Wr7hoQv+R+fgiyLb3fbRkXSIdWdVklS8aSdAKOoaYLjtD
 nSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lww00e62vDTirehrOoj35PjgPPCIUXSrdyW1ns9M7/0=;
 b=fmFxpRA+aA8ltYrjrjWGQZ/ybfUZ2IvnshEBuopt6EM5kh9cUWa4JRDauhWsIxXXc9
 2C9/fBJ31yLasqcMNqGlqKkxpAT5aVbBqAzzOqvggktkUvRfnmNZZJc3Dpw6gfDWCU/b
 SGICs1lVXUjVI7g08XOreZz9pBvh5d6/xjy6jePjdfKfNFZ8a9YX5ht6nIibuo/8wNUM
 6HdIMiBqJyHYXJLusDk4Ct+w+0ieO3C+56YrlSI9YyTfRgmaobMucIFq2UFpCJo6et7i
 vA+L1l2MGQvqgHpCeIBxK8AMyaewKZgvA/uIb2jMrBgGCheI6uYLIsMwNpkG+fKmYLOz
 UBwA==
X-Gm-Message-State: AOAM531MD93ADEvi5rbhwNpt9GlolUEckGxEDfF3i6m7bJuRHP7iedhR
 qBbKPOFDsaRXc+LR3kkKd7u13Q==
X-Google-Smtp-Source: ABdhPJwlzClaRFvBkge1FY720gX6YFyJq1+AwWxA0geI8CLktTm3pGT5ATiiCKz75kCGPjQF9CrYzw==
X-Received: by 2002:a05:6402:2350:b0:418:50c6:211c with SMTP id
 r16-20020a056402235000b0041850c6211cmr5603796eda.291.1647104904958; 
 Sat, 12 Mar 2022 09:08:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056402004300b004162aa024c0sm4976678edu.76.2022.03.12.09.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:08:24 -0800 (PST)
Message-ID: <4aafa550-a762-e702-854a-cbc38751e8a6@mind.be>
Date: Sat, 12 Mar 2022 18:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20220222192905.20456-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222192905.20456-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/modem-manager: bump version
 to 1.18.6
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 20:29, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1->v2:
> * fix version in commit message subject (Yegor Yefremov)
> 
>   package/modem-manager/modem-manager.hash | 2 +-
>   package/modem-manager/modem-manager.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 14597215df..ea91f42fe0 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
> +sha256  d4f804b31cf504239c5f1d4973c62095c00cba1ee9abb503718dac6d146a470a  ModemManager-1.18.6.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index a881edc272..d7e2c55bf8 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MODEM_MANAGER_VERSION = 1.16.10
> +MODEM_MANAGER_VERSION = 1.18.6
>   MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>   MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>   MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
