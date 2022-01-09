Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589AFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB697404FD;
	Sun,  9 Jan 2022 13:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4wtVuZfV7RG; Sun,  9 Jan 2022 13:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3773402EB;
	Sun,  9 Jan 2022 13:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11AC81BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F16D7402EB
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8_Dlh1iH8Pj for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:04:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6E8C400E9
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:04:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h10so11362678wrb.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YdHAG9n3KOxfIfYNP+u9z4B8w9URRO4OQe5Rj98+hEI=;
 b=Ox62TermE+pEjbP1snkMwJOCs6sqO6sGUKW5Svxy5sgKfM/m3TYGWa6uwPMtqbKIHP
 qhu6Zj2f7eG9p9pYtB053egc+jmwo8SXlVbDRkeihFMPmDc71UHTkO+0EBo/sYkflmxE
 BjD8CrzC5hzGh4ub1G2THGla27+XxQTec1KSlZ1id4dAj1LND1AxTuPpRJaMxA3jfwiF
 QXXHXrNMhAzECI1A2r2Ibrm7AfPznRvuoX72ovPzr3tjULEnZxcAMCuRDoI0IOC2gvj1
 sTm5/Oi3OQZyOq9pjZze2mILPyD9Hbv2ruUpEOO9Jp1RXLHrh1uOoXnm8e+ShwSp6Mra
 nHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YdHAG9n3KOxfIfYNP+u9z4B8w9URRO4OQe5Rj98+hEI=;
 b=HAGMIRSoap6ikXi8ULrgfuY2Q4pf+2Tr3f9rNmlwzoN8v3vKyAPuM67ATn2hEh46SZ
 t8el2uULzPBObFvGWMbB7dFYjjHXRZmCWATz1IT4ZxxOGfdEYxH6Nft+MdK45tHYepan
 RKfSa988+a2pF/rGWryt/N7vfrhM+jUvCXIr+28kqooKmDIZoYbD1GwlXh3jKamaCZ/j
 ei9LSBWfNXFpKx3SpeTZOg1x0GheTuKowGxoknFqqCwQ9qVmIVXnzOvXmiHXpalFAp1f
 zfA/NqxBnNM1Fczvqv5NSNHbLAq5fCinCsSPTc6gpOT/xod/2n3lWm2MrT1Aq5gnaSXP
 PNiw==
X-Gm-Message-State: AOAM5339irmuY7CG/368swZfNoWts0v/3zEG8TIFNpPmV+WyVhE7+Ef/
 Z5C6sncoW/E/BAiD9b/s3Rs4WQ==
X-Google-Smtp-Source: ABdhPJw40BrrdJfme52Rhlpz0mMJM+rG45ZTMHmjrPhNePowqn9bVZwArlTW6r/KYzbwbO2z/WknNQ==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr62359176wrf.279.1641733458267; 
 Sun, 09 Jan 2022 05:04:18 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id q14sm4160965wro.58.2022.01.09.05.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 05:04:17 -0800 (PST)
Message-ID: <8f621d1a-c021-13ed-18c6-fbd800f03ce3@mind.be>
Date: Sun, 9 Jan 2022 14:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220109110132.3430-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109110132.3430-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/skeleton-init-systemd: support
 /var/lock again
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
Cc: joseph.kogut@gmail.com, yann.morin.1998@free.fr, aduskett@gmail.com,
 maxime.hadjinlian@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 12:01, Norbert Lange wrote:
> systemd's own configuration file is not installed anymore,
> as side effect of disabling sysv support.
> 
> the funtionality is added back in skeleton-init-systemd,
> since this is a buildroot feature to support software expecting
> this directories to exist, as well as trying to be similar to
> other init systems.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/skeleton-init-systemd/legacy.conf              | 7 +++++++
>   package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
>   2 files changed, 8 insertions(+)
>   create mode 100644 package/skeleton-init-systemd/legacy.conf
> 
> diff --git a/package/skeleton-init-systemd/legacy.conf b/package/skeleton-init-systemd/legacy.conf
> new file mode 100644
> index 0000000000..0a5393408c
> --- /dev/null
> +++ b/package/skeleton-init-systemd/legacy.conf
> @@ -0,0 +1,7 @@
> +# Create legacy directories for buildroot
> +# This is a subset of systemd's legacy.conf
> +
> +d /run/lock 0755 root root -
> +d /run/lock/subsys 0755 root root -
> +
> +L /var/lock - - - - ../run/lock
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index 5d6b716f7a..1e212cc2f7 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -62,6 +62,7 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>   	mkdir -p $(TARGET_DIR)/srv
>   	mkdir -p $(TARGET_DIR)/var
>   	ln -s ../run $(TARGET_DIR)/var/run
> +	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>   	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>   endef
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
