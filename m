Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D67CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260074063C;
	Sat,  8 Jan 2022 15:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56Qf2KamlSkm; Sat,  8 Jan 2022 15:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B1A40384;
	Sat,  8 Jan 2022 15:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA5151BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B64E560AA9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzBctRBekp69 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A1226076C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:14:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h10so7007436wrb.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KpJQp+d64E5XxeFVy+uON2VmHPXpNFkv+AQWLcOGK1Y=;
 b=HCb6O3sAW3ctwlyeCTK+3NQRZvEm7DP7cY1o9CCmcYz2+b9NVlipGwGLdWh4nmDoRl
 NPInBtP1qW11spneoAbJON1H8rdxpFxKHezkNL78Q/g+6Nk/1EoKZs0d8iLlmdhHo/Wp
 IeOydQacQcJjozkzOfK0VLp6BwiJfhghFyJoZCyyu6qFeSZbh7d3JEN/85UylR+6/Lhr
 WC+SnZBzEFi71+47nBr4CW7kY6oxSK6Y3rnfbCU+wZIJhiJoHb3X/9+hp5Fv869C1Nt6
 6/y7x80AakPmjVLmg7HE2jPcscnjxx3LLOkzjfJ9PDMzXX7D5BiZLSnR55BE8m++ef5J
 Q3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KpJQp+d64E5XxeFVy+uON2VmHPXpNFkv+AQWLcOGK1Y=;
 b=ArR6fOMKXT0c8M8Ue/zybmdCa8GefsvjhFkwf+ESPDfDz3Zd9C1FuEs3gPmoTGvAQw
 5xy1tpH7H5Omro2Gr0Zj36gmjfNnQV5Vzi/nYgQJOTJm+PFtvcemHzyOn4JxNLDfpDmf
 LW4VnUZqe+6RvrlwpbwWQm3eH1PjWwWe0qb9uoQMhgE9D3auvufly7VDND+xwMhWf+co
 SZkQyBqkS/WJWlDqQU2MaE7vyoSC+rODjpP/lSi9kr9xaLtWm7UAHSnBEVwrlsz7Ku8y
 sjXToHVA2Z2a9WuBHM3LUwAeXQC59XOdQ184QySjAcnD1CLIj3iWQlVjMoXXswpOu6cl
 wVIQ==
X-Gm-Message-State: AOAM5319euAj1zQYd3IHTyPX4BaTK+5bXF7x1iuccNnJRYMTYtYmt5QQ
 MWWtD7LEXtKrQde5toMIPeLstg==
X-Google-Smtp-Source: ABdhPJwZZzj8x58IIsEPOYDxvygpaYwjttvXOYhE7sYcnYAPsZh1cYDaBjsW8IPPjFIpZj/4I4LMMg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr59149068wrr.422.1641654861794; 
 Sat, 08 Jan 2022 07:14:21 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id a2sm2076680wri.17.2022.01.08.07.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:14:21 -0800 (PST)
Message-ID: <83ee7af9-fcfb-740f-412d-97b93787b265@mind.be>
Date: Sat, 8 Jan 2022 16:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220108095037.1065173-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108095037.1065173-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libfribidi: bump version to
 1.0.11
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
Cc: Mikhail Boiko <mikhailboiko85@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 10:50, Bernd Kuhls wrote:
> Release notes: https://github.com/fribidi/fribidi/releases/tag/v1.0.11
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

  Applied to master, thanks.

  Regards,
  Arnout

>   package/libfribidi/libfribidi.hash | 2 +-
>   package/libfribidi/libfribidi.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
> index 8e7eb49bcd..da25b2d24d 100644
> --- a/package/libfribidi/libfribidi.hash
> +++ b/package/libfribidi/libfribidi.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  7f1c687c7831499bcacae5e8675945a39bacbad16ecaa945e9454a32df653c01  fribidi-1.0.10.tar.xz
> +sha256  30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d  fribidi-1.0.11.tar.xz
>   sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
> diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
> index 97e875b4a2..adbd786db1 100644
> --- a/package/libfribidi/libfribidi.mk
> +++ b/package/libfribidi/libfribidi.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBFRIBIDI_VERSION = 1.0.10
> +LIBFRIBIDI_VERSION = 1.0.11
>   LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
>   LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
>   LIBFRIBIDI_LICENSE = LGPL-2.1+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
