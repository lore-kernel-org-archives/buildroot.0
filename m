Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CEAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BC96855C5;
	Sun, 12 Dec 2021 14:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHqFrmKPa8-x; Sun, 12 Dec 2021 14:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0C0855BF;
	Sun, 12 Dec 2021 14:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7629D1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C59855BE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hgIlCLMtqBK for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:07:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8064B855BB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:07:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id l25so44627712eda.11
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0aykdpRBoNKnP1QcaVydBhJbXUkcrQdZ6VM1AGG44m0=;
 b=Ku4msk+gR3qHWUXheJHMa1OOV3sLauVVZbIMBkk/7EpUSqpUsro6nLiRulK7nMIF3k
 1tCyVqBspErtAEHGtA6NnatgzN5ZHy+rf59Hb3DgLBmo1e26m2KFlsdJI1DjTW/LjNu0
 rxDDCXKlV+4qCNDYcWccwpwpDZlQdobWmgPzyIW8JPbosjf92cnMFQXLfyTz2E+Ubp3Y
 XTJ71jpcshRbzXza4zFf5FRmHwcBh4NPyUwx7vGvPR2b/PvyX2ZqnMZmKPrnAvqZbyl8
 eFM6BPnQSsfjNjWhJta8SxMEw+gMbUoh9Njuc6k6jzixvQkAO5btobfyq8irk/vWZSZJ
 7+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0aykdpRBoNKnP1QcaVydBhJbXUkcrQdZ6VM1AGG44m0=;
 b=zPrG/uLP70pcJtAH8zdoErhIxisxc/aqsiKU8HQhG0FmRoZCEr+gNzWQ9F3DzKT7ig
 h2nC0K2rCt89UDjTOjvhdHjOLamgO3C3jf7D4sGgjGlRuMDLyF0nVRTi6K0GR+F+7F8e
 UiXY6NsJGGVESH5YQ4ir8rLckJo1nD+AboxYEGDIGRZABCK5e66P9BOovUTO0f2nyGSL
 QwkQlmX6nEDCddQtwpcDSBAnnEKLDH/Eg/QjQBy8NgZDFFkBjS+wxVx7MfdS9J7Gjw0C
 5MQopKcPwvn4se7qGdq4TNVxmQBT1HSzIag8WrhtMnfOo5Q675qddF/j7meTT+k7WU1f
 rrLw==
X-Gm-Message-State: AOAM531+HjAcm2fSlihU2etDspvZCHyaDDhFAVhl6bkDDkZnWb3rISHC
 HlhDpat44SI1M3xIWvwL47375g==
X-Google-Smtp-Source: ABdhPJxBdB17HPzw8+ZMwteAY0OZFYl2Wgi9yGlrXsAa2gFtgpF/HRq+00IfXv8DoxwJzTjLDLsTAQ==
X-Received: by 2002:a05:6402:7d8:: with SMTP id
 u24mr55873395edy.215.1639318045734; 
 Sun, 12 Dec 2021 06:07:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d19sm4763357edt.34.2021.12.12.06.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:07:25 -0800 (PST)
Message-ID: <36d28776-d63b-6c5c-5c97-ae50ff5af119@mind.be>
Date: Sun, 12 Dec 2021 15:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211209093758.3084564-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209093758.3084564-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.60.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 10:37, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index 33b8676cc5..467f540761 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.60.1/meson-0.60.1.tar.gz.asc
> -sha256  5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13  meson-0.60.1.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.60.2/meson-0.60.2.tar.gz.asc
> +sha256  64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921  meson-0.60.2.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index a8c846126a..154f712f5b 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 0.60.1
> +MESON_VERSION = 0.60.2
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
