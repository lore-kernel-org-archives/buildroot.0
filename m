Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572ADC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FE7140621;
	Wed, 27 Apr 2022 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BOiYS1zj130; Wed, 27 Apr 2022 19:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23D754036A;
	Wed, 27 Apr 2022 19:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CCF61BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B75A417CC
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWaYnU6eaDSA for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:39:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD94C4189E
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:39:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id e23so3116592eda.11
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jz1AeG585L8i5XICwQBj7VT5uUCLf3g4RPhiSEtsZZ8=;
 b=gmbF2Iu/jodglFX6yH4249DYwdYjQ9R2iWLgJRy6jDk4VPppuekIXfvSHmJJ0aNCmk
 29XvlWaztnkhr+kXxuAmrRh3TfTRMZrGoPULlcVEeEtKjMX5EBdz3+jtBMVAmSExGt7H
 0dqeX4i9zwsZ1wMwy9hPhcTw0MUx8u4Nq3sMtqlWqYX7vuhL3lFNqBNBv5KYaybU0SpQ
 QdeWKP6UdNlFHa8+3Df0qUKOcDYBXuCC8WJiLUMsvOTiGkx+PnaZY/mizZpBpARdGzfP
 nZXrGVTHcbmedTsRMYt0wNML+mlhZwWMzT2Dykj5MHQAc/SGBosxs5B6vkhqzbkPy0NH
 DMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jz1AeG585L8i5XICwQBj7VT5uUCLf3g4RPhiSEtsZZ8=;
 b=rO7eJNXqWpAdOBMTASjnDZp1WAdEpwOAgehnDIgCPu2d80e8j8aTtiJDLqeSB8rbJt
 Z+GD0vEMD1wU6TSHGVMLX9ANY2yUbAVmhhYOOtHpDSbA3S2vi/Xtd5Z2M8LLoL+FR6Gp
 lBYL1bxIG7czUEWE9ZSyQTtrpU+aoMWCiCzTLDiVwpFkxz/gXxOtWkpZnwPHGLYcTTI4
 lGs3kkOwl77lMikRNI/XXspTvoj6nJnfZJid7wxJj4eVR5AspWxLdC+12B5d0AgOLZRn
 N485SUwds8mztzd095O/9K9DPg/U5Lz4A/7xUwIFt1XgSY8dxPZCw6RLyXQOQmH/p4Dh
 ombw==
X-Gm-Message-State: AOAM531MhAvT8QVRruFW0GRyHpxqXD4XyV6pg4jlD+R9Jt+IpdN2B5am
 c6ee/a3MW2Y+txrAuK438L7K4fnpSUAqIw==
X-Google-Smtp-Source: ABdhPJzV4x7KaKbVwKgLJwoY/+JYvM15cyI5BuBLbkjJdWEbbmSevhC3rKJ4nEtLnT46jtD+2qsRDw==
X-Received: by 2002:aa7:c3ca:0:b0:425:ecfc:4258 with SMTP id
 l10-20020aa7c3ca000000b00425ecfc4258mr17308463edr.266.1651088338703; 
 Wed, 27 Apr 2022 12:38:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a170906289600b006e44a0c1105sm7227899ejd.46.2022.04.27.12.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:38:58 -0700 (PDT)
Message-ID: <47a0512c-cf8f-a518-cd00-9e6d911efffb@mind.be>
Date: Wed, 27 Apr 2022 21:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20220427072245.3610-1-nicolas.cavallari@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427072245.3610-1-nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.4.3
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



On 27/04/2022 09:22, Nicolas Cavallari wrote:
> git added restrictions on config files to fix CVE 2022-24765.  libgit2
> adopted these changes for compatibility reasons, even if the vuln is
> not exploitable in libgit2.
> 
> https://github.com/libgit2/libgit2/releases/tag/v1.4.3
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgit2/libgit2.hash | 2 +-
>   package/libgit2/libgit2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index ada411ea22..3b5837f789 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  901c2b4492976b86477569502a41c31b274b69adc177149c02099ea88404ef19  libgit2-1.4.2.tar.gz
> +sha256  f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163  libgit2-1.4.3.tar.gz
>   sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index e94dd9c370..3f1e6e1593 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGIT2_VERSION = 1.4.2
> +LIBGIT2_VERSION = 1.4.3
>   LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>   LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
>   LIBGIT2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
