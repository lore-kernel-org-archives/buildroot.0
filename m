Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED0BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112ED6FC27;
	Thu,  6 Jan 2022 19:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVN2odJOZgeH; Thu,  6 Jan 2022 19:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2926FC25;
	Thu,  6 Jan 2022 19:13:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7A6E1BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C55BE6FC25
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQHBo1vwOH08 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:13:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB37160D93
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:13:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l10so6726249wrh.7
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 11:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NE4ykC9NJ22+TAzJX36zPW3FpSoD34BVDpMRyqVlKI4=;
 b=Ks0L5Np5T+PcdVodNBZy3loI7eP0lLSgqVTw2UsHh3I6HfJ4FuYNQ8dwxQgtWwZvq3
 Qye4c2SQEudUeRHs7pIOmM+8PkoKbk+bzuU7etChrXqgrZUnQJWVao+gmnLSYpQhoZGG
 yGSkGge+HYa4svsMUuDyCg3XODjR/sQ4SQt6/E/w6M4T+Yd7gK49MG7qJuL8Y/nvZ09Y
 bgdv4xDf5izjW5p6bWMcqMV+6vCXqGXbR+1PRu2RLT6aPWhUzww6NgiYeh3ez6RcxGmL
 VeIHfx5y9IuFNLQwT3nRlDhosWzmYRk8gioKo9YajknEHdey2yA1qermWAsBUYMr4/C9
 tM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NE4ykC9NJ22+TAzJX36zPW3FpSoD34BVDpMRyqVlKI4=;
 b=lPoh4o8DLoiNG43ZMXXV49sD90/zySItUDuB9wQaMG6bT4rHyY8MqQmdza9amI9U7W
 GOoJt+vFJQE3ZkZo3NY2WC/paUUsK5wU0bcB4CBnf+XhNhUbAibu61daX7RqnVQ32kcj
 HaJtBiMXByZLVO5KUpb/ANE80PSkQfdqzfwWyGbm1oJtYxZB/h8UwPnJsNKRFA7pvpRi
 0pVKzj18S9HNmAAEdTwhxa64Xn9yfAIbQjF7GHJTQq5s8mT5EX1KeIs393IxSY4ISdGB
 GsxP3m5alek1lJfJyBlvXH4u4lnoDcB2kU1igYlyJxr+xJqYzGyC3U2XXdLcUHwl0/tS
 c8Mg==
X-Gm-Message-State: AOAM532zf4RsoJISFhhIH6semx6pZ69P0qU/vLiGO9gtPf8WTIwRuVEX
 sQu6b2NDM8QqrW/Z95EliBNXYw==
X-Google-Smtp-Source: ABdhPJwNUcjNCizdB4Qi9r/nzPlQUQsHFjQyikKyOuGqPtCd3ntznbhj2Mjuq8NVsQI2FX+VUAmAuQ==
X-Received: by 2002:adf:e491:: with SMTP id i17mr4468797wrm.44.1641496426028; 
 Thu, 06 Jan 2022 11:13:46 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id bd21sm416617wmb.8.2022.01.06.11.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:13:45 -0800 (PST)
Message-ID: <a491140e-465d-b739-8d6f-1bf0b23ef046@mind.be>
Date: Thu, 6 Jan 2022 20:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106062407.3131530-3-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220106062407.3131530-3-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/01/2022 07:24, James Hilliard wrote:
> We need to switch to the kde upstream as the existing upstream no
> longer updates the qt5 branch for most packages.
> 
> We need to add a separate package for the chromium submodule so that
> we can apply patches for python3 support to it and replace catapult
> with a python3 compatible version.

  Creating a separate package that does nothing more than download something 
that is later copied into another package's subdirectory is not the right 
approach. For this, we have FOO_EXTRA_DOWNLOADS, which can be followed by a 
_POST_EXTRACT_HOOK to graft it in.

  So what I think you should do is download both chromium and catapult with 
QT5WEBENGINE_EXTRA_DOWNLOADS, then remove the directories in POST_EXTRACT_HOOK 
and untar the download over it.

  That would vastly simplify this patch as well...

  Regards,
  Arnout

> 
> There are python3 patches available that apply to this version with
> minor modifications(to be added in a future patch).
> 
> We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
> from a repository archive instead of a release archive.
> 
> We need to add some new required dependencies to qt5webengine so that
> it will build.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/qt5/qt5.mk                            |    5 +-
>   .../qt5webengine-chromium/chromium-latest.inc | 1257 +++++++++++++++++
>   .../qt5webengine-chromium.hash                | 1256 ++++++++++++++++
>   .../qt5webengine-chromium.mk                  |   22 +
>   package/qt5/qt5webengine/Config.in            |    2 +
>   package/qt5/qt5webengine/chromium-latest.inc  | 1000 -------------
>   package/qt5/qt5webengine/qt5webengine.hash    | 1001 +------------
>   package/qt5/qt5webengine/qt5webengine.mk      |   30 +-
>   8 files changed, 2561 insertions(+), 2012 deletions(-)
>   create mode 100644 package/qt5/qt5webengine-chromium/chromium-latest.inc
>   create mode 100644 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
>   create mode 100644 package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
>   delete mode 100644 package/qt5/qt5webengine/chromium-latest.inc

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
