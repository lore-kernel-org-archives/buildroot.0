Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C3FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDE281357;
	Sun, 13 Feb 2022 15:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyWUW61yP93f; Sun, 13 Feb 2022 15:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF60F817D3;
	Sun, 13 Feb 2022 15:23:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0809B1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05228814B4
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UbXQvZym9QZq for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:22:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03E0081357
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:22:22 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p14so8373472ejf.11
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pUE8e4sMqCxITec94Apj1CmCylkjnTHmWkA/zBiGPbw=;
 b=Se56nsUDWZIgtk6FcDHagRNMHOd4Oi/69UfGAToZycbV5Rx/HWiTjRoSe48db0ZwwW
 meuJvaJWJNTx8LJHVFwEy6b6FWsT4QtyhdkwoQWC7U+CwiY0QQO2UjXo09ejepnNS6J+
 y4jLT8yY/8RThn+gbhNV6VBhFMAeOLAvnyPtMDS9TkntdqwnKkONId/i2MrAWJTA2ffk
 lSVXQMn7aF2HSRhEKeo4iOZdGQzE8PREX9FJodyre4QMz/hkIsOb7cQOKdooG50dFLQF
 c1vgQfZkZ3b5hzDpcwSEhm3Tbxj1uI7szWOIAKjPLWC84GLq0kwkxzKg6kWJ/fvI7ltc
 BPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pUE8e4sMqCxITec94Apj1CmCylkjnTHmWkA/zBiGPbw=;
 b=bHE+IQwwHMP3rJWi7ERHHrfPCcDogRfwNbubC3HrU6JNmCDfyEyFWVvA8GOEdqXfKc
 pG7duLBFJhqVj8OOjfyCffKreiUd7EeSZhld9VUFhjtqkqZaqA1b1fPb5snvUtPf2h4g
 vDEebYpf93Bu36WBvIacx0FWgtiOb6xaRQZIF7Bm47ydYErQz4mlVcxG6sQHp4jGEYKP
 LbXmQl0QeIVtjvBj1iFqmXo5qroAMQOYUEj3qS/EwOwSpvYndsp7z1uaGH2v0DXxxiEZ
 MjexMXi/f71WZkGh1GSggVIjQTOkxPp23Q8gxfl0UymLWKGIWVURfVZnXdmTYW4MurYJ
 eFvQ==
X-Gm-Message-State: AOAM533e5fjjICvDPoZj7T7+NUXBzpaGPeCHodIiFJj5lrLMGf0sL7w1
 /73SIRWzoBZRZZLWxNVDsb1tyA==
X-Google-Smtp-Source: ABdhPJyyhEzxlFjMtqamkEVDgFYafKy/XmTbxjwjPPj8TQeTMFmXVVLQBe9XWhaWESIkdB6RuyN+tw==
X-Received: by 2002:a17:906:7306:: with SMTP id
 di6mr8139343ejc.410.1644765741228; 
 Sun, 13 Feb 2022 07:22:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p24sm543621ejx.53.2022.02.13.07.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:22:20 -0800 (PST)
Message-ID: <b80de55a-45c5-1dec-5231-7de3738d9d0e@mind.be>
Date: Sun, 13 Feb 2022 16:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220203222639.725822-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220203222639.725822-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dt-utils: use snapshot tarball
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/02/2022 23:26, Fabrice Fontaine wrote:
> Use snapshot tarball so DT_UTILS_VERSION will match what is returned by
> https://release-monitoring.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dt-utils/dt-utils.hash | 2 +-
>   package/dt-utils/dt-utils.mk   | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
> index 74819158bb..9fca594db5 100644
> --- a/package/dt-utils/dt-utils.hash
> +++ b/package/dt-utils/dt-utils.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  8b29d3a8799170afdb1b077e655528bf4e6afe0c789107b1eec8fff9d4482771  dt-utils-v2021.03.0-br1.tar.gz
> +sha256  63cf47c70911bb3605bafac38a5a7e19eb753ac1c90de2abceaf2fdefd71be6d  dt-utils-2021.03.0.tar.xz
>   sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
> diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
> index bc7fd90631..d264e2cdc9 100644
> --- a/package/dt-utils/dt-utils.mk
> +++ b/package/dt-utils/dt-utils.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -DT_UTILS_VERSION = v2021.03.0
> -DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
> -DT_UTILS_SITE_METHOD = git
> +DT_UTILS_VERSION = 2021.03.0
> +DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
> +DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
>   DT_UTILS_LICENSE = GPL-2.0
>   DT_UTILS_LICENSE_FILES = COPYING
>   DT_UTILS_DEPENDENCIES = udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
