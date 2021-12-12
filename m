Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6091C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 856D1401B9;
	Sun, 12 Dec 2021 14:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpAz3EEIchcb; Sun, 12 Dec 2021 14:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7102D4019D;
	Sun, 12 Dec 2021 14:50:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBA031BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A794014E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueK5q9KA2Rm7 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:50:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99D5140131
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:50:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y12so43632858eda.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2UReqYdwSb+NVVdsARE8eRnzfvlEMwMpBPzH87dejzQ=;
 b=XOoKn6jHaFBGBQXd0oshB6YZjSU6lxt23DYVb1NqqZMicMsNfjCVn2BVTxtTJxZ4aH
 oxAn7C6ozTibHdFFz1e8m3AJddPA9oITA24If3JlMSTv71/uFvp4ZY4mEkRZmDarXvqI
 zlOruVU1HUinpvEMJj3RTrpZRscY8/FUEVKem18UUD9ZNwB9aFZfcoBkrcDF+BtxJWAh
 kkKmM84G2b+pGA4j9sQf2jOVHOhpnSzFHcstWwWkpM5LAtwy8Y4kwbhqRmFC66N0yfZ5
 70Wrq9ErZgUL/wcniK7p/qxy21MFDXGmi99ktLp+DN9kDZ/rLIuR7Z70xs3UtPoxXpOF
 n4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2UReqYdwSb+NVVdsARE8eRnzfvlEMwMpBPzH87dejzQ=;
 b=FYtAT2CE14AFnlU8T7DvF7FhjnkH5hc4ld0ReiZY7ufhuFZ3Ii+VPzh0clb1Mg7lVz
 weiF7DPOG6FZlkM3/u0tnoOYLnDyhwAC4IWgLjnmPdnuYxmPnKDoP8aU4cpZru9QIcHC
 JfRaSuLc1oeI4bjvapT3WG69BzeULZqXNJ2Kpqa19wa51QupR5CmuKNvcejrWFK9naUn
 L3jXWpVZvz7O6mV8vq+yO4ISsR4Mt+KCvSHUyKGtA//o58IHDo5EnqrgXo67256BQyOi
 9SteZ56QKNWqZvyudYGqN6tkXQ2bteWYwbK2PuYBR2xwCsHK+FooklsBSE+xCrdOcX+e
 yGBw==
X-Gm-Message-State: AOAM5333031gTGWrwJAmERbosccGUyiBPh6wCFN8iCWw3Cf2t4351jHM
 1xKxIfjt1WsLwumDHMK3smFOpBab7kk6NQ==
X-Google-Smtp-Source: ABdhPJzzyr1rIZcOh2XRPPDTkuN30UWz8LcL/RbHz/ef94FAJJEi1lu8JW63MZib+oLuv+1fO7VM6g==
X-Received: by 2002:a17:906:d152:: with SMTP id
 br18mr37296566ejb.287.1639320606877; 
 Sun, 12 Dec 2021 06:50:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hx14sm4461280ejc.92.2021.12.12.06.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:50:06 -0800 (PST)
Message-ID: <1b0cea8f-a1fa-e7ef-0e49-41546a34cf2d@mind.be>
Date: Sun, 12 Dec 2021 15:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211210211558.4015391-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211210211558.4015391-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.5.8
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



On 10/12/2021 22:15, Fabrice Fontaine wrote:
> The eighth patch release for containerd 1.5 contains a mitigation for
> CVE-2021-41190 as well as several fixes and updates.
> 
> https://github.com/containerd/containerd/releases/tag/v1.5.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index 594c56a819..f1a6709554 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05b8c7cd45a  containerd-1.5.7.tar.gz
> +sha256  a41ab8d39393c9456941b477c33bb1b221a29b635f1c9a99523aab2f5e74f790  containerd-1.5.8.tar.gz
>   sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index fdbd2bf3e6..cd975db274 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONTAINERD_VERSION = 1.5.7
> +CONTAINERD_VERSION = 1.5.8
>   CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
