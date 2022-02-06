Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C6AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4491D60B75;
	Sun,  6 Feb 2022 14:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Shm8nA0GXSr; Sun,  6 Feb 2022 14:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8540A60ABE;
	Sun,  6 Feb 2022 14:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56CAA1BF968
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45ABE60ABE
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOBpjQKb-7qo for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:00:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5387E60A89
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:00:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id og43so10747824ejc.0
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Fjs+OukTVPmIM9XD5DtYL5ZdNVWRlqqdlKTFUcylzJ0=;
 b=SF9fg2/ILKj4/XkqaazRAIn0SHMvYL9Fl32OwVLbk2yxAf4iFK7uhIyYkrocnIJH8v
 4caBPuUlCayMHPiNBuadX8m47EtcbakTuGqFogCBxjb3Xa8NOUgVUgNw++NdNrNKacjd
 tnRhrfyvqmKoWoDFYRlhNFDPhXBEj5T236/8PlQk0s2esy9I+eJA7MSlLSioqPHZ18Vy
 iLi+D+L3Yc38uaE4pH3GirzHw8k6S26peb1AiK6GfKy69dRcAU9JZF5tzIOwQvwJq/tc
 tc3+7I9LiBXYURb9rmeBJllK6AGrIZnWaN0qT2FrZwZV6VzwSvUPTZr+Tq1Z3FvrOfs8
 MsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fjs+OukTVPmIM9XD5DtYL5ZdNVWRlqqdlKTFUcylzJ0=;
 b=EhxrRlWTIQ+DUA0zzC2sQ+cKRCHSrbmqBQbmvZrFJAsR3rLfIyvZk9WCUOmkv/mxtA
 KaweHKslKY77p0NVoVQ+gECNUsc01Imdw8tLyplSlMBJbk7GH9BcmEgyJanLVp8BAAoj
 BM59E9r5bVwfRus9u9T42EsrKXnGTJqQM3EAT7AMzjALnTpwAtH6EJpsyd0gdVeoiv+q
 Hv6XNqxKJl9OI0kEV/JdU0GuOPCncMzatDJgHp0VL9oOq6PxBaJ0xkxOCDXwldpve7Wm
 aizAcxLdIalQIJPPk2ZHcOli0gfzoDE/tVt/Ffm7BrcauuBmdH3bm6C1+vNvqV8CXzH0
 uXiA==
X-Gm-Message-State: AOAM533eKrsg6yfQRWKrMc0y0LvnBcCDDHbVaF7zD8OBN/5ymzudVhDn
 FU3O9bVPwgffLHcklX8NOwsv+w==
X-Google-Smtp-Source: ABdhPJzXP1KrMlmZ+z2v980azqMfyTmetyCrgbHplZbq9WivzK9RARmNfNydUdFllwkG+hzDd2dfSA==
X-Received: by 2002:a17:907:7ba9:: with SMTP id
 ne41mr6782416ejc.554.1644156045588; 
 Sun, 06 Feb 2022 06:00:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bv2sm2610903ejb.155.2022.02.06.06.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 06:00:45 -0800 (PST)
Message-ID: <5f160478-5d3f-0541-7d54-0bc80772e636@mind.be>
Date: Sun, 6 Feb 2022 15:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
 <20220123160847.2653086-4-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220123160847.2653086-4-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 4/4] utils/docker-run: new script
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



On 23/01/2022 17:08, Ricardo Martincoski wrote:
> Add a small script to run commands in the same docker image used in the
> GitLab CI.
> 
> For instance, one can run check-package unit tests without installing
> pytest directly in the host:
> $ ./utils/docker-run python3 -m pytest -v utils/checkpackagelib/
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>    - none
> 
> NOTE: see also this other series for another use of this script: to call
> shellcheck from check-package with stable results, not depending on:
> - the developer having the tool shellcheck installed;
> - the version of the tool that is installed;
> http://patchwork.ozlabs.org/project/buildroot/patch/20211226184919.2753591-6-ricardo.martincoski@gmail.com/
> ---
>   utils/docker-run | 7 +++++++
>   1 file changed, 7 insertions(+)
>   create mode 100755 utils/docker-run
> 
> diff --git a/utils/docker-run b/utils/docker-run
> new file mode 100755
> index 0000000000..499c194d13
> --- /dev/null
> +++ b/utils/docker-run
> @@ -0,0 +1,7 @@
> +#!/usr/bin/bash
> +set -o errexit -o pipefail
> +DIR=$(dirname "${0}")
> +MAIN_DIR=$(readlink -f "${DIR}/..")
> +IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
> +set -x
> +docker run -v ${MAIN_DIR}:/home/br-user -t "${IMAGE}" $*

  This should be "$@" instead of $*, right?

  There was another shellcheck error as well, for which I added an exception. 
And I also added an exec to the last line.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
