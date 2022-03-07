Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CED5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB24B81AF6;
	Mon,  7 Mar 2022 22:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0tz2JoQxPYZ; Mon,  7 Mar 2022 22:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB6DC81773;
	Mon,  7 Mar 2022 22:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C202D1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B04AD402F4
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4THEQ2DjHEJp for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:05:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F77540146
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:05:34 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y12so8383546edt.9
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3NR2uFeGhXyuGaC64IGvBOlCp0S/BrKKjYcqM/591Gc=;
 b=Y76kMzEpAkmdyDF/bpi2A7TIWsg2DeYRHpOh+gBqUysgrC6LVlYVWAN0QuSR0NbEzy
 rY4+3acrNEhfT5kem265TddH97sUxt3yXedcPJ6ZL013wJsNBxIWEGh8TwvVpGjeD1OV
 ff8jicoW1XE4VsNwXebrmf0ghmLhIBt0JxoewaldeyCVYVWRa9c8GRpmU/z6diq+xfDk
 vobMV2UFitDyTWTNXHF2Kzfl6gPGEVMu2fQ95+jBH9FK9wsol7t/GMmUEPeVOUrl4YUZ
 a6qnzBxVCy4ubRmOs+eJ2ncKvDzrRf+7QjjcSb7zzsYqyMjrIXRxevNaW0V3/T6c5Jle
 +PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3NR2uFeGhXyuGaC64IGvBOlCp0S/BrKKjYcqM/591Gc=;
 b=pBmE1RaPULuKs5Ee+iqY8SUGMTohORsHg3Fnn7vzaKh3kRtmcRG5mF9Y3tnqzAy8xZ
 QfAIzI97VSU3zx4mrtqjwnJ3O9lQz6iqpJgdcT6ctkg8IQAt8FaOZYYlaT+l2WkT2/tn
 Jmt/uhga85ysZC4jMZKxj1DSPuU7EIa7KAwjb47L1X4OISUkKrKxmAB2sjQmhx5HezOA
 Q9gfghg1tIjiojyuYbNEEJrBHSWffWAg94l5NMlsxuVfVGVMG84XlepMNcpognW2uHeJ
 7X+mtj50q7RgqPgVULHyuvBoWEToMG86h4StD4jsMTTQAGKS/OP7a5qphBqZVrCDL2v+
 lGNg==
X-Gm-Message-State: AOAM531qEM1YZe+kXIb08f1NdRF6TFIhvlpdduheAXvwSo6n8EYSWgfw
 dyvOD/SauWm6vfi9bRnJDI7MpA==
X-Google-Smtp-Source: ABdhPJxNXRBMH0R+ng/734kXahQ0WK6zd2WCNQzD308FRtVKmmlIWkd0CdCToPbr/+1/bGDC7MsX3w==
X-Received: by 2002:a05:6402:51d1:b0:412:e72f:c6d3 with SMTP id
 r17-20020a05640251d100b00412e72fc6d3mr12975408edd.61.1646690732725; 
 Mon, 07 Mar 2022 14:05:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm6740010edu.51.2022.03.07.14.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:05:32 -0800 (PST)
Message-ID: <7b607f83-e892-fb78-5dac-69b22b1ae4e2@mind.be>
Date: Mon, 7 Mar 2022 23:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220222120034.1748652-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222120034.1748652-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/glib-networking: security bump
 to version 2.70.1
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



On 22/02/2022 13:00, Adrian Perez de Castro wrote:
> This is a minor release which fixes a couple of crashes and an incorrect
> case of TLS certificate velidation when built with the OpenSSL backend.
> Release notes:
> 
>    https://gitlab.gnome.org/GNOME/glib-networking/-/blob/b0d45b17f745088256c9ad1ae9a7e2467dec6286/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/glib-networking/glib-networking.hash | 4 ++--
>   package/glib-networking/glib-networking.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
> index 6a53b436b0..347ef6777c 100644
> --- a/package/glib-networking/glib-networking.hash
> +++ b/package/glib-networking/glib-networking.hash
> @@ -1,3 +1,3 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.0.sha256sum
> -sha256  66b408e7afa86c582fe38963db56133869ab4b57d34e48ec56aba621940d6f35  glib-networking-2.70.0.tar.xz
> +# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
> +sha256  2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc  glib-networking-2.70.1.tar.xz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
> index 53280700bc..f74e520d31 100644
> --- a/package/glib-networking/glib-networking.mk
> +++ b/package/glib-networking/glib-networking.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   GLIB_NETWORKING_VERSION_MAJOR = 2.70
> -GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
> +GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
>   GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
>   GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
>   GLIB_NETWORKING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
