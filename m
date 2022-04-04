Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA74CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64B07404CF;
	Mon,  4 Apr 2022 18:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ko9WU156sFbH; Mon,  4 Apr 2022 18:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85BC34015D;
	Mon,  4 Apr 2022 18:13:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF5AA1BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCAFF40308
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKIOa-bcHFDo for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:13:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1539408B1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:13:31 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g20so12112390edw.6
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6xab+H46P0T0onJxQG07YdGN5dq/12kuyKcSL3J5CGg=;
 b=WoOBXjCzXNJCloxu9NsZG5+sToxDoJ6q2DOqGp5qyEMpV8YKoCAdoInodOYRcq1txX
 0ekoUZ81e49j4ZECQ3286jdrOifGcpvp0cmZTk7s4StF42151GIZLsNDMjZulPW/9L2T
 IWBt3Eg+70JrsF5qbCG3ghA9EgjzcW7A5shY1Dki6lHSocMjOXwZc8rdRtsByUZFf2Kw
 BxKnDuxVLxLDsAuqYzLhNLjm6Zw1pnAwKvw52So+Jy3UuFU0fsPdmJJjlvESxkaz+26y
 0nzfHhFA4J6ux5Pdvju5r9SRTHRTB73X7MmLs7IrvIeoMjQ9/6/sy5lbkrPgBHKV+Z9/
 RazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6xab+H46P0T0onJxQG07YdGN5dq/12kuyKcSL3J5CGg=;
 b=uPp1DblVAEA6ixDRnOdOqYjqV2pOGekUqOH69DuZT+CjgCoKnbQE7012aUv5PCUTFP
 KasUxnuXC2nDn/mQvzR9/6ZBqqtL6lZLnLKANpRZE7Zp2innxg4qCMUH/2pQFbPmchKM
 /oQE5r8yackYqqr22ROBD0mAUvkHT2KalbP7ikxHZbv2IrphMPbpWo+YTt+GUiNHobxa
 3fuwGmHBdkms9nhUZESdvo+Yc6NVTFkFWCN4LVlOmAyHq5BA3NjGdnG4GUcHsw9PxRml
 WDXre3VYwNOi4MTVflkpuE9+Lt3j/5Op+fEBCoRFSx9U0ezxpUTqjfhUZLDbwPB53TE7
 QL9A==
X-Gm-Message-State: AOAM531S+yLXvK22ruo5I3HFqG/bqp87FGjqAsHoxRVX2rzXajG7z7Gm
 LcymOcNRIEenOfMvtAR/+YUysg==
X-Google-Smtp-Source: ABdhPJx/Gr0kEtvuOosg3vIDJD0qDDxs0N3MfdCXfneMWkasQrR/CEbAqe+XLhwrRudM+rekEcpzwQ==
X-Received: by 2002:a05:6402:1c1e:b0:416:5b93:eacf with SMTP id
 ck30-20020a0564021c1e00b004165b93eacfmr1518082edb.302.1649096009892; 
 Mon, 04 Apr 2022 11:13:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709063a0500b006da8fa9526esm4717755eje.178.2022.04.04.11.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:13:29 -0700 (PDT)
Message-ID: <a37dffc4-2159-db8f-4aa3-bb5d69436975@mind.be>
Date: Mon, 4 Apr 2022 20:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401211722.1057825-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401211722.1057825-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: bump to version 2.63
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 23:17, Fabrice Fontaine wrote:
> https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.6tsfgutj5dhm
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcap/libcap.hash | 2 +-
>   package/libcap/libcap.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
> index 396e592c5b..2cdf92bbc1 100644
> --- a/package/libcap/libcap.hash
> +++ b/package/libcap/libcap.hash
> @@ -1,5 +1,5 @@
>   # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
> -sha256  190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2  libcap-2.62.tar.xz
> +sha256  0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f  libcap-2.63.tar.xz
>   
>   # Hash for license file:
>   sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 1207995333..ed689ce503 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCAP_VERSION = 2.62
> +LIBCAP_VERSION = 2.63
>   LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
>   LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
>   LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
