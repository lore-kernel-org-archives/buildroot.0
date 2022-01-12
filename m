Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39A2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ACA160B3F;
	Wed, 12 Jan 2022 19:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhSCBrc2PFmr; Wed, 12 Jan 2022 19:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3F260ACA;
	Wed, 12 Jan 2022 19:46:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B100E1BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FCFD60ACA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5JL0dVJX6Ni for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:46:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE2F760AA7
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:46:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o6so14297579edc.4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=oAX7DUsBdjvnF01OQyzcUwy0eE0B/8QMioqNWtomQwE=;
 b=KACuSEKuLeu1z5zzaLwzXFytJ/cACkMfrv9S/8GYrz6624z0CADmc38lL1i5PDRanL
 7kqXb0HK5FVuF80nnsgFFbVlp6AJpskbDc1piAj+15ijaL1mDjj8mdG6DDzf99sNmtY/
 Gxs5tne+8Fp1pkrFXbsBrdV58G1cKCs2V8za8L61FcTaYAYmriF70+AWk4grDfJtVyHx
 rEmyMPKEOmZqjZKhHfCwbPHTAFZdq0mp0im7fPGPNOFTTM9YMIikQr/0ObSv7fziqdGN
 0QgamYL0dt4/dzWzmsvs+QDBxwC1ZxwF4YVFCyoxC+OgXW89i/RTtMK2Jb37WHJ7ewzw
 HpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oAX7DUsBdjvnF01OQyzcUwy0eE0B/8QMioqNWtomQwE=;
 b=zI+269jkb5Ci6CKclep/5PuR2FlkNtI3Kcb+2UZJUttsPHqX8zgi5KdgESvzQdI31D
 5tPbF7tPak7pO6zRgJUDevTCN2mLEAP0vHZOQzatddg//LdZE2BWX/YkKRGHAJiaQZ+j
 f8Je2F+gUVn/trPfLLg0FyNza0Ia9KALtPdkissIYd5ph1M2PztwImT65Ftpgh4AH986
 buq4bNxFBe49Cmazz9zlmsji9s0+8TddHWpuOsZDhpajpu/4dXEdHRe2Yqs2nhUHW6fq
 741lTuqNBQhjjF0qlzQ4z52cFhsnyr02rcJ7ftfq+7hJhnNLTf+fwa2/zK4WqlMDcpwg
 eNUQ==
X-Gm-Message-State: AOAM5330tUZjjdHeGu5JYRniCc2eeXB+xXfrsrHpHXt1eer825DPzzW6
 gjs6r6GKaJGXeg5E2HoEIAaMlg==
X-Google-Smtp-Source: ABdhPJz9XJxKVqHAxefDedU3YZwgw0AnDtrKoF4Yycb7YSFNoYJZH8j0TR4MzvrPeDxmloyn78cG/w==
X-Received: by 2002:a17:907:1caa:: with SMTP id
 nb42mr1002334ejc.408.1642016760140; 
 Wed, 12 Jan 2022 11:46:00 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kx19sm205090ejc.112.2022.01.12.11.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:45:59 -0800 (PST)
Message-ID: <d10f722f-f890-623c-6ae7-5b599af950c4@mind.be>
Date: Wed, 12 Jan 2022 20:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220112191708.77947-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112191708.77947-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi-inputstream-adaptive: bump
 version to 19.0.2-Matrix
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



On 12/01/2022 20:17, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>   package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index d193a0c4f8..c7a081f887 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  d389af940011887378d1e6ad0ad91b81cfc138b862cf4a43593388c33308cb55  kodi-inputstream-adaptive-19.0.1-Matrix.tar.gz
> +sha256  f2285e77043a0c9160d1ab11dd5943cc584be17a2f7920be3002751ff697ec7b  kodi-inputstream-adaptive-19.0.2-Matrix.tar.gz
>   sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index 6044ed07fb..f632a42adb 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.1-Matrix
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.2-Matrix
>   KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>   KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
>   KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
