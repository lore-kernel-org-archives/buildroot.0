Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905F1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 482D161001;
	Wed, 27 Apr 2022 18:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsWThPDrr0Bv; Wed, 27 Apr 2022 18:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3C9260EE2;
	Wed, 27 Apr 2022 18:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8F31BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39DFB40151
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-BtwJsPSKPE for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BF22400BA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:55:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z99so3009615ede.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+6cP8MgLwVxwOHh5rNUryuydf5TW5YliUTTG7mMQmiU=;
 b=RPgBJ7a7Wx54jEhR5XouLCdX3XGsSrT4hccm3bGR+pdAu4un+079W8wwRgZPLwm/ht
 5u4Mw4Y/uya2pQ1sFLn5XvqZjXDas/HPJlLt8p6ciBciLF9LZZEeSJKMnLS+1R4tynqL
 8eZ/9Vmp4dm0W/XdQiL+EIoQ5oBVu+lpHLHDdwp/jiNzQVHMZesNQ1zkbpFsLU6orDDn
 2tMvkaVusy9co1/7rr9Yzf9Ci5NpnQAOA3Wz3LMi1R4hHuIfQ0f0KPofvKUVuoZEOqOC
 HQkuw4Hf/SaFfqCqfpFjRV9ZTsFc2h6AX1+Pn9NuI88g5thlEa7ZxlO/spwPkvIuG01b
 5YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+6cP8MgLwVxwOHh5rNUryuydf5TW5YliUTTG7mMQmiU=;
 b=sLqBSsQt777yhm4q/qPEvor9mzq+dJOxq5Z/a3747kuApM49RSM0mbbvvNkWCSdTyN
 rxV3Ms3UiC3u+g0au5/ntXUEMV1ZjXroFZ9eA3Y/kZ5TbYA/ffhoEzwprsvHAso7xJkt
 zxTDyC8iojNp9FD/35MP8DvcNobS+x2SDcjcPMVTMGVHs8+yXeiR60ughuxN0HPD4acb
 4CEwtXigR5raiD4Us9NOfFiDZNNoAxHT16d5hcupYDP/DF+jJe8+0pyjdaYoi61GplzN
 VVFkzoJZ3/gUnx/d2iCsfLGNsPSqk2oAs1nHA1jeDZLzdV8m2cQWks8DvaKGmsAb7WbH
 sOOw==
X-Gm-Message-State: AOAM531bFnE1hRONfXCODIk6KHSm2EwBsx8ipyvrULj6p4W26l2S+KYD
 veE6p/x0YJlJgnTmFpYLA1ZW1FvnA+s2oA==
X-Google-Smtp-Source: ABdhPJxXFwDqabBC0OvpfHDeQU5PacHzuu5E9pkh3C4xO0nV9vLDUzI0ELXajjusbcp3fzAsLwjKrg==
X-Received: by 2002:a05:6402:11c9:b0:425:ef56:a1dd with SMTP id
 j9-20020a05640211c900b00425ef56a1ddmr16082366edw.143.1651085718279; 
 Wed, 27 Apr 2022 11:55:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170906410800b006f39ffef37fsm4111054ejk.205.2022.04.27.11.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:55:17 -0700 (PDT)
Message-ID: <a0d68821-857a-6ba1-8ca1-691574f5ec5f@mind.be>
Date: Wed, 27 Apr 2022 20:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220426171600.2552919-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426171600.2552919-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libpri: fix static build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 19:15, Fabrice Fontaine wrote:
> pritest, rosetest and testprilib needs a static library and pridump
> needs a dynamic library resulting in the following static build failure
> since the addition of the package in commit
> a77f356b78f9134227f9702a1eb09c3203c42d88:
> 
> /home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -fPIC -MD -MT pridump.o -MF .pridump.o.d -MP -c -o pridump.o pridump.c
> /home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -static -shared -Wl,-hlibpri.so.1.4  -o libpri.so.1.4 copy_string.o pri.o q921.o prisched.o q931.o pri_aoc.o pri_cc.o pri_facility.o asn1_primitive.o rose.o rose_address.o rose_etsi_aoc.o rose_etsi_cc.o rose_etsi_diversion.o rose_etsi_ect.o rose_etsi_mwi.o rose_other.o rose_q931.o rose_qsig_aoc.o rose_qsig_cc.o rose_qsig_ct.o rose_qsig_diversion.o rose_qsig_mwi.o rose_qsig_name.o version.o
> /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> __uClibc_main.c:(.text+0xd0): undefined reference to `__fini_array_start'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1217922af3a72646ae242c2c4dec22ead7883b91
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/libpri/libpri.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
> index e1fa2abcf5..34d84393c4 100644
> --- a/package/libpri/libpri.mk
> +++ b/package/libpri/libpri.mk
> @@ -17,6 +17,7 @@ LIBPRI_INSTALL_STAGING = YES
>   # So we need to explicitly build only what we can.
>   ifneq ($(BR2_SHARED_LIBS),y)
>   LIBPRI_LIBS = libpri.a
> +LIBPRI_UTILS += pritest rosetest testprilib
>   define LIBPRI_INSTALL_A
>   	$(INSTALL) -D -m 0644 $(@D)/libpri.a $(1)/usr/lib/libpri.a
>   endef
> @@ -24,14 +25,13 @@ endif
>   
>   ifneq ($(BR2_STATIC_LIBS),y)
>   LIBPRI_LIBS += libpri.so.1.4
> +LIBPRI_UTILS += pridump
>   define LIBPRI_INSTALL_SO
>   	$(INSTALL) -D -m 0644 $(@D)/libpri.so.1.4 $(1)/usr/lib/libpri.so.1.4
>   	ln -sf libpri.so.1.4 $(1)/usr/lib/libpri.so
>   endef
>   endif
>   
> -LIBPRI_UTILS = pridump pritest rosetest testprilib
> -
>   define LIBPRI_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
>   		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
