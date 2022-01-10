Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647CEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2363460C06;
	Mon, 10 Jan 2022 07:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDoyUh-ZYQoi; Mon, 10 Jan 2022 07:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A79C60C00;
	Mon, 10 Jan 2022 07:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 811521BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E1C24031D
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waKzwbHTQMAy for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:26:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59ECC40004
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:26:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o3so24889618wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d9g7A5hWdvTSS+InXgVh0HxV/YctC/wlCo1Z5mdURM0=;
 b=NmO+SOnvGkZ9nK8m+JbPgfVFwttnlUbi8OhQcv8fEJCJCQ7Ck4c8MtyNACeFQXTTB3
 6WH2Ar47/FYkSxOLE8r6bHYrwBOuvbPv1kGUKUWz0YhgDPaLS+LYo4eoONkWH6rHds1m
 uXcmAFSWw1rlLmlPx+lQi/+wDcQz001NCpnkI96FblCQqnoa4lzIibuVhfg1rLr3E0HE
 SnkwuhupgEEj0xJ+Aqlo/sgwWWc7mk54mjt0gtfNb/GRlnC6cAW4V6sCVR/+Iuiv7Dy7
 eP/Okdv74+EdfEOzxcNRWBKMS5YQa3+Hd75ZHChvU5mEYznJR8/txkJAw7XU2GWZXhJe
 Re3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d9g7A5hWdvTSS+InXgVh0HxV/YctC/wlCo1Z5mdURM0=;
 b=Kq8/+xXlLKrXz5l5BMR3SPOSNLx+x+Io3I+cMdKrB95uTDnjH3FYIMEeTGcFF6MZis
 S1HuUaTO9GBqfYf80pS1FvNu/5NJPN9cniVNbqvG3a9Ls9R7HXvbacxo1G4t9AdKEoqA
 3vp5EHsYQUJVhBE9PDLWl9pK84gemH5aTPHp+X7uak0rGgsmnUa8qmIAbZBSjrzPG9TV
 hTEsL27haTxbNVjMeQRpPrtmE4fnz17SG9NpG53rbxOOtWfWI2bXxNomQxmvacpjY4YP
 VxW+S+dau2I/Jy5+nOLwmJiCUJHVoW7VfILCYD9l0UUjKGHw/RCL8yZ2zuzufggcLeqs
 Qcug==
X-Gm-Message-State: AOAM532jEoVhEibnN1N8sBtdgw3LLq4hpODgGJNGFggDvTgibsa9Yjwr
 TXlC03Ky5vSnlKeHxW9LzSF6cQ==
X-Google-Smtp-Source: ABdhPJyPHVibaid+1LUqL+z05tJk92eCngvzNUrTxj6SumeqfOAJX+AXRJuwcLtY7/LXGj7y4YXH0Q==
X-Received: by 2002:adf:f8d0:: with SMTP id f16mr4478039wrq.427.1641799562506; 
 Sun, 09 Jan 2022 23:26:02 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l4sm6413122wry.85.2022.01.09.23.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:26:02 -0800 (PST)
Message-ID: <7229983a-cbde-eb3f-83cb-984544f3b355@mind.be>
Date: Mon, 10 Jan 2022 08:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
 <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
 <CADvTj4q4bR++z4YevSfa35Xxu7AUVMmS2o4mEtfP4WK3-cGx2A@mail.gmail.com>
 <CADYdroMDCcUYSj6XyrXUHi4hwDWjtTXNX7BOmLt-Eb3JK_3fQQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroMDCcUYSj6XyrXUHi4hwDWjtTXNX7BOmLt-Eb3JK_3fQQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: buildroot <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 23:52, Norbert Lange wrote:
> Not only missing, but I sometimes need a *different* config. For example i don't 
> want to link against lz4, since I use zstd instead.

  Which is a great example of why the option doesn't work: it would affect 
dependencies as well.

  However, specifically for this one, we have in the .mk file:

ifeq ($(BR2_PACKAGE_ZSTD),y)
SYSTEMD_DEPENDENCIES += zstd
SYSTEMD_CONF_OPTS += -Dzstd=true
else
SYSTEMD_CONF_OPTS += -Dzstd=false
endif

ifeq ($(BR2_PACKAGE_LZ4),y)
SYSTEMD_DEPENDENCIES += lz4
SYSTEMD_CONF_OPTS += -Dlz4=true
else
SYSTEMD_CONF_OPTS += -Dlz4=false
endif

So it should already do what you need, no?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
