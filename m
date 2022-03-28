Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663A4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B7881B14;
	Mon, 28 Mar 2022 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXCIlQZWlVOO; Mon, 28 Mar 2022 19:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C82F819F6;
	Mon, 28 Mar 2022 19:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0D3D1BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC64E60C02
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWKVW5o-ilJM for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8809660899
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:56:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b24so18188954edu.10
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1uaB7NadXpJ5bUEHDnEGBuwCwVg+qf9BmN7XAiTdyMQ=;
 b=TobL1P3Fg/Z0x2Gk1cNXghm6JwETdJ1pociZl4WGbx5SVMtgh0Jezc5+kx1lqsmbGw
 4Bew2169eJW9Y3oB0XT4fN9YeLQf84/HJ3ON7Z7xofnBb/7DwwN3jZE8YqKcePuMm+Nm
 mLBwtmnBby6//Zceyll2a+P2MpkuE1SGB3HXQcMsRpIRVgDln7oKw1bpP3ZYWjY+Ja8g
 IxPAf1syddt4y6rrnLOC8NtJcaSs0lt4xoGsLuwe2PazeReac6VjMzEKOh9kST+ZZMl8
 2ENFaZTq07FTN57d4WQgCgO1Sow4knZ8l2HKKZE5SlrS25ZyqYxJQd98VKSeb59Rlc2B
 RCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1uaB7NadXpJ5bUEHDnEGBuwCwVg+qf9BmN7XAiTdyMQ=;
 b=nvezIgfiEE1XPtasOyj5dT7Ni77dTwrpMtJh56JHXpEbsyrBKf7Fvz6IWAk2E4NSYQ
 JsmkRVag6SGhi+qRGZQ1aGX2FTfOkP58SvTmAFrFjfXgxuQfkX4Fetk9hWaj3QO4FHHU
 9l5KaDaxEF1+94TI5kl5TN4YdTIgaVWG2n+cACF3P4GqXxcyBpY/WBhonA4zM7yyiR4s
 /Pjp+0bzGyUBJga/Pno57IL8WBjdKL/EEb9e90l+ByDqawamfwAZ3EGBGePK/Y8eICE6
 xZD/SFibxkHazhsW2RudEha5whqBcVU1u8+Zz+kQq6TrwUTJ4zL5mtJ3iHKJE+eTBbSy
 3PMA==
X-Gm-Message-State: AOAM531MmM8MyH5F2n/koa0Fz9EvA/sI62kKmUA9u6DcNaLH7P0hywgW
 ddtaFGv7qEEMASAkcHHMPZ4mfw==
X-Google-Smtp-Source: ABdhPJyUjrHueEY/ri4mAZ0PqrdgOn2CP+MHRrakG0aRggq/cwbNDt99AfiIbNVlClzb0vPY3uQ/8A==
X-Received: by 2002:aa7:d7c1:0:b0:419:2f7e:178d with SMTP id
 e1-20020aa7d7c1000000b004192f7e178dmr18613103eds.136.1648497391783; 
 Mon, 28 Mar 2022 12:56:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm6249433ejb.164.2022.03.28.12.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:56:30 -0700 (PDT)
Message-ID: <f282066a-4a5a-d3d9-df7a-079db524f6c8@mind.be>
Date: Mon, 28 Mar 2022 21:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220327200651.4189748-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327200651.4189748-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 250.4
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 22:06, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/systemd/systemd.hash | 2 +-
>   package/systemd/systemd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 81f51eac20..3572b25965 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>   # sha256 locally computed
> -sha256  87b0eee7b6e5aaab2ab56d158f9536daa6bfd5de011f2a5fc6ccdd81ee1e7a24  systemd-250.3.tar.gz
> +sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>   sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b07fac27d4..9feed9c084 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>   # - Diff sysusers.d with the previous version
>   # - Diff factory/etc/nsswitch.conf with the previous version
>   #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 250.3
> +SYSTEMD_VERSION = 250.4
>   SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>   SYSTEMD_LICENSE = \
>   	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
