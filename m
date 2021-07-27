Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B8CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:08:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD3260F9B
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BD3260F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2FC83A6C;
	Tue, 27 Jul 2021 20:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3D5Kh1Szz_X; Tue, 27 Jul 2021 20:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9883F83A69;
	Tue, 27 Jul 2021 20:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9E81BF46D
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C2526081A
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSOLezMWlQ4L for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 20:08:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4634D606E7
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 20:08:52 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x14so12162640edr.12
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nt+tQxnPZY50Io17l8nfvt04ndMSEWZwY8Ix/AaHh3E=;
 b=XBNsvtaAB5OEKHCPbqK2VbXihMG6tGc2MDqQ8Qo0teV152XJ0V5exbn856yYTOZ0ja
 KkrO1Mn/EV4fgfKQnLebOBN8D4Bwtpt3aZGjevDnopXGvVt7WYGpNjgMk7Fx0FU7/iFa
 TmfHjlu7EsC2KnwFDhGXNuF/27pfm9/aHnbjseVDfMb+1qkm7Jee/l252saZgZcehGqf
 y8zWhUgxDPLlyH4gHB5e7IJMMOn/Yh4oHL/ol4rRO++GXSNezuFLLq2QLjigr62bwwNf
 uXK5C/JpXvpvvvctS8oDAwnCKOWuWByFKel7BprViJ2ObWpLamFuMoGMAxkBiCjGUH+a
 D0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Nt+tQxnPZY50Io17l8nfvt04ndMSEWZwY8Ix/AaHh3E=;
 b=VamgoYAA2S7pl7O5T+7phZh/o1aC/8QBx7A4ToFjMX2HTIwokk0hMhB5+kbC9/eQJX
 8sNTOupOLAVyeO8hNjCzYD+tB8Wx6J+pTzYvXolsDtTNOlzn8GKhjpZ3HIT7CnrcyfTF
 WNT41OGZrujlS5DhNn3bh7b7mJ0LPevcA6ViDXOeIh5GoV0lu5YLB3GxGnCybOVXI9zf
 IPeoF+ykCncYgNsaJWrM4fUjCB+OB/mFLrNQSVtcD9v/PByER0gseXeu+CooaY06PjfK
 ROoOwhJ7Y2cspfyAENcn/U5EAxmsS1bJeYA+puJ/nIzameLANbgqmEnff6TQrc8bKhGH
 P5Sg==
X-Gm-Message-State: AOAM531QJC3+/mR6nzwkVR/3IV/lBX+P5Y8c94GbCjZz4etDCOYe3ZO5
 Cw+L2vcLvWOeRvB+eHJG8TS6gQ==
X-Google-Smtp-Source: ABdhPJyrgzXbhgACCwN6Lk21M+AUtgYC5SR1/fSBhGiCUcSq5zzdFUo2QGdD5HHMUPVZDi6o+66sNQ==
X-Received: by 2002:a50:ce45:: with SMTP id k5mr29632140edj.168.1627416530251; 
 Tue, 27 Jul 2021 13:08:50 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mf1sm1235127ejb.51.2021.07.27.13.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 13:08:49 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <0493cfafbdc9dd03d461d8707de2358156f9ad5d.1586592741.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a34d7987-65be-b578-6d65-df806733a9a1@mind.be>
Date: Tue, 27 Jul 2021 22:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0493cfafbdc9dd03d461d8707de2358156f9ad5d.1586592741.git.yann.morin.1998@free.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 8/8] core/show-info: report image name of
 filesystems
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Vadim Kochan <vadim4j@gmail.com>, eeppeliteloop@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 11/04/2020 10:12, Yann E. MORIN wrote:
> The rootfses, unlike packages, do not have stampfiles to represent
> whether they are built or not. Indeed, we always rebuild the rootfs, and
> there is a single step to do.
> 
> Hpwever, people (and scripts) who want to report on the build progress,
> will want to know whether each rootfs has been built already or not.
> 
> Expose in show-info the name of the file that wil contain the rootfs
> image.
> 

 Applied to master, thanks.

 I extended the commit message with an explanation of the _FINAL_IMAGE_NAME
condition.

 Regards,
 Arnout

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop@gmail.com
> ---
>  package/pkg-utils.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index bcdbf568fe..a464b660ef 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -174,6 +174,10 @@ define _json-info-pkg-details
>  endef
>  
>  define _json-info-fs
> +	"image_name": $(if $($(1)_FINAL_IMAGE_NAME), \
> +				"$($(1)_FINAL_IMAGE_NAME)", \
> +				null \
> +			),
>  	"dependencies": [
>  		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
>  	]
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
