Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8D2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4014960BF6;
	Tue, 14 Dec 2021 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RsAOWjXcs_o; Tue, 14 Dec 2021 19:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C6060D4E;
	Tue, 14 Dec 2021 19:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA8D1BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 376808177A
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evPTRba2L5da for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:44:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 210C58145D
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:44:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z7so5684154edc.11
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3NNMp/MRp7xFomIjAfJUmNSSSXe0rO0aVR9tLiCKi2Q=;
 b=TNO5xCDtiBJJoExbLNsVbcjEsKI8qmsnlTP+4kzYsm474Gbq5Sz3jPG9HYSxl1yF/c
 eRze5blBT2bo3yDn1eMU9SR5n6WwBBHVUU/QqiSRZ0G2STJ7wZGs6Q6cBX4v5cdBe02U
 IXlQC9q3CmyyIzChMOKxVQHEwvGl13Rpt+XwlJd7yX7T5SFX/EupC58jdyWnEXirSCEb
 C/anoQobiQbNtsDKM2v+gJuw1KZBKrOMFKJJCYSSuADcuhXOoj24A5Ch+B/XfG2QmSYj
 IDr6dcJO2oxdClvJHUcJlrNS9U+3cyaIQj8G8GEeTh340JUuF2tc7h6VrkD/moTac3aJ
 Rh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3NNMp/MRp7xFomIjAfJUmNSSSXe0rO0aVR9tLiCKi2Q=;
 b=M2jZL0puqJPfbH6vcSyoQ0Js0QUQGtT0mVVxqmnye2QCdmPPZYb2k9R2uJVvMc/qTq
 djIbqdX8l6H6Of0CZkNBeoUsf8hpDIqUctLNrGdjEZEieCma1ura7bW3ApgJ/U/NhPrY
 Bkvhx4M4rPjVpLQPt2Bs9qNfKPttoXcectRtfm1zw4Na6Y8jKYZMF6g/wm3q/E14E57a
 4HlULzcs/2MVoXTc5Nvy2/huVxn2gob3ETGTTGC1rfg7OI6W4+Cb21hy+ZE+mGYSb9ZH
 W6TcWeUUY2BxVR5zYuDSuBkVAUMbM5GNsMW4r5Y6NPR2YHP4hnfExONzIexkXzp0JCpN
 Cusw==
X-Gm-Message-State: AOAM533YGr9/OGvAYmAqO9hSGDYCDrXZbOAqXlxdnn6C9VWcnn4PdxeA
 hVgDFifYzmlhIXbM8WoDYfbjWg==
X-Google-Smtp-Source: ABdhPJwbpsTlVuZXdsmg4Nj1lriaer2Fv3o6DNqWCanTK/NsGeIUw57bYcTeWSLRIgKoLZaT+o+z8w==
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr8076477ejc.407.1639511042109; 
 Tue, 14 Dec 2021 11:44:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o22sm280731edw.50.2021.12.14.11.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:44:01 -0800 (PST)
Message-ID: <e0cfbdf0-e2a8-73bc-42be-de0a588489ee@mind.be>
Date: Tue, 14 Dec 2021 20:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212192544.838696-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212192544.838696-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.40
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 20:25, Fabrice Fontaine wrote:
> - Drop patches (already in version)
> - This bump will fix build failures on ARM
> - This bump will fix build failures with old glibc thanks to
>    https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/e1671236671afbf7719b3ef29039ec4ac5102347
> 
> https://gitlab.freedesktop.org/pipewire/pipewire/-/tags/0.3.40
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/faec4ea02f4a6ddf44d54d5784d9de866c2d8a1f
>   - http://autobuild.buildroot.org/results/31014558b6ad72e0f602095c423d48219dd6ebfa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ix-compilation-on-some-architectures.patch | 28 -----------------
>   ...u-disable-VFP-asm-when-not-available.patch | 30 -------------------
>   package/pipewire/pipewire.hash                |  2 +-
>   package/pipewire/pipewire.mk                  |  2 +-
>   4 files changed, 2 insertions(+), 60 deletions(-)
>   delete mode 100644 package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
>   delete mode 100644 package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
> 
> diff --git a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
> deleted file mode 100644
> index 4465523610..0000000000
> --- a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 651f0decea5f83730c271e9bed03cdd0048fcd49 Mon Sep 17 00:00:00 2001
> -From: Wim Taymans <wtaymans@redhat.com>
> -Date: Thu, 21 Oct 2021 11:09:48 +0200
> -Subject: [PATCH] cpu: fix compilation on some architectures
> -
> -[Retrieved from:
> -https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/651f0decea5f83730c271e9bed03cdd0048fcd49]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - spa/plugins/support/cpu.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/spa/plugins/support/cpu.c b/spa/plugins/support/cpu.c
> -index ee1816512..01cff4854 100644
> ---- a/spa/plugins/support/cpu.c
> -+++ b/spa/plugins/support/cpu.c
> -@@ -270,7 +270,7 @@ impl_init(const struct spa_handle_factory *factory,
> - 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_VM_TYPE)) != NULL)
> - 			this->vm_type = atoi(str);
> - 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_ZERO_DENORMALS)) != NULL)
> --			impl_cpu_zero_denormals(this, spa_atob(str));
> -+			spa_cpu_zero_denormals(&this->cpu, spa_atob(str));
> - 	}
> -
> - 	spa_log_debug(this->log, "%p: count:%d align:%d flags:%08x",
> ---
> -GitLab
> -
> diff --git a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
> deleted file mode 100644
> index 297016edc2..0000000000
> --- a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 2cddd4a775c145570f4a8a30d28b57f551d43206 Mon Sep 17 00:00:00 2001
> -From: Wim Taymans <wtaymans@redhat.com>
> -Date: Mon, 25 Oct 2021 16:32:16 +0200
> -Subject: [PATCH] cpu: disable VFP asm when not available
> -
> -Fixes #1746
> -
> -[Retrieved from:
> -https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cddd4a775c145570f4a8a30d28b57f551d43206]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - spa/plugins/support/cpu-arm.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
> -index c07711f70..fe6222f7c 100644
> ---- a/spa/plugins/support/cpu-arm.c
> -+++ b/spa/plugins/support/cpu-arm.c
> -@@ -143,7 +143,7 @@ static int arm_zero_denormals(void *object, bool enable)
> - 			"msr	fpcr, %0		\n"
> - 			"isb				\n"
> - 			: "=r"(cw)::"memory");
> --#else
> -+#elif (defined(__VFP_FP__) && !defined(__SOFTFP__))
> - 	uint32_t cw;
> - 	if (enable)
> - 		__asm__ __volatile__(
> ---
> -GitLab
> -
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index 7894939b0d..c41c0a3686 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  fafcde675b264485883df1f3bf7e08f36fd1d661ecc092dcec6fd35a059c2aff  pipewire-0.3.39.tar.bz2
> +sha256  b6a2eab8bda2f3cb87c3a0a714839696831ad27b5786674c4bd6c3776b9ebc97  pipewire-0.3.40.tar.bz2
>   sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>   sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index cbf24dd0ec..efda3ad695 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PIPEWIRE_VERSION = 0.3.39
> +PIPEWIRE_VERSION = 0.3.40
>   PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
>   PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
>   PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
