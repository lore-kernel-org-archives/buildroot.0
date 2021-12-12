Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9861C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B38B80DEE;
	Sun, 12 Dec 2021 12:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsUMRIUNDgx3; Sun, 12 Dec 2021 12:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E249380DDE;
	Sun, 12 Dec 2021 12:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB0EA1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA10180DCF
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRH0pmzSYCjf for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:19:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B264B80DCD
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:19:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r11so43121407edd.9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ifzMiwe9pCAaeQQyM7D3/6D3STX11yeGNs8KWiJSAso=;
 b=OxVP+eD8py8NJwB0B1APIwTxVu9gQVW0GY33t9HnKFhzv+CVCIItgO6OJO0eh6lC0G
 QEC0jvp1d8fvoAQ4uUlkFPb+gHS1ynzXK5AZufFf+J8Y7tBGEtS2Er3WWOYh6TVeToco
 GoqMu01I9k88D5id0Qi4FRCMMVnZhQBUg+6lbX0xLtSZ8ABC/Axhv+YfPQCtOUS7ghhz
 iFjxFwCpce38dRbbZxvEy38ujWqMpu/TcWl9B7K/zu6xBsqcw3drdU2rO/t1WJtErBji
 Y0mO5NoPEVDjl5NjFaFLhMwpFlXN34LLgzvcPd2gioAWaP9YdkpzzO+D/+RBPwZbsZFo
 G1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ifzMiwe9pCAaeQQyM7D3/6D3STX11yeGNs8KWiJSAso=;
 b=Oalru5elL92wYTLO9h19TwAp1gt7KQe5XyFcMI+l5FS2ucYLhDmBP06LY+NfXzDcJL
 OpHS+rhzRACePgtq/YDhVmZDfUzjGj/vS5+rzDV31bJQwD+KOb7yufJXlGPZYHzLHVxx
 KpJfb/N/BwxwMku/IdQb7/k3NpEyobYtbWh3/o4IH3aRLoCnmtIVKAcZ2abVa1sNarNm
 QH3nGJM23fQ3wIt3Z738imH5KfJcH1KjsmXag75uitUO2sp8HorxtWTCA+nz0T0VljLx
 JaKaFzk6uK8czReeU5csqT/TcmU1e8jEl2amPVqhylf1ujuk/FjU810M5l2x8ZpgDUIR
 bZ2w==
X-Gm-Message-State: AOAM53368CkSUJl9KSnGmTyOKfttW6zouq7dCCiGbbIdc/5/GAqAtsJ9
 NhrmFKD1FiLZlIGy6lPwWWFN+/IOcJ+4aw==
X-Google-Smtp-Source: ABdhPJzxZU56TUPja+Ckpc2nc9nHx1ZldhIr+u3Qh6mZg9YaX8xMxKBx8H3krFYt4/HFp1sqigRX4A==
X-Received: by 2002:a17:906:9153:: with SMTP id
 y19mr37289435ejw.516.1639311579930; 
 Sun, 12 Dec 2021 04:19:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cb20sm936249edb.19.2021.12.12.04.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:19:39 -0800 (PST)
Message-ID: <e5972112-5dca-3663-7b9d-209feaca7176@mind.be>
Date: Sun, 12 Dec 2021 13:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207215419.3319061-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207215419.3319061-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/stella: libpng is optional,
 not mandatory
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 22:54, Fabrice Fontaine wrote:
> libpng is optional, not mandatory since version 6.1 and
> https://github.com/stella-emu/stella/commit/eb13d515fb6385df6c653c5d295d97979b140031
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/stella/Config.in | 1 -
>   package/stella/stella.mk | 9 ++++++++-
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/stella/Config.in b/package/stella/Config.in
> index 7031f8d31e..22507edd60 100644
> --- a/package/stella/Config.in
> +++ b/package/stella/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_STELLA
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>   	select BR2_PACKAGE_SDL2
> -	select BR2_PACKAGE_LIBPNG
>   	select BR2_PACKAGE_ZLIB
>   	help
>   	  Stella is a multi-platform Atari 2600 VCS emulator.
> diff --git a/package/stella/stella.mk b/package/stella/stella.mk
> index 2dcfbeaccd..e7b0082e7e 100644
> --- a/package/stella/stella.mk
> +++ b/package/stella/stella.mk
> @@ -10,13 +10,20 @@ STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VE
>   STELLA_LICENSE = GPL-2.0+
>   STELLA_LICENSE_FILES = Copyright.txt License.txt
>   
> -STELLA_DEPENDENCIES = sdl2 libpng zlib
> +STELLA_DEPENDENCIES = sdl2 zlib
>   
>   STELLA_CONF_OPTS = \
>   	--host=$(GNU_TARGET_NAME) \
>   	--prefix=/usr \
>   	--with-sdl-prefix=$(STAGING_DIR)/usr
>   
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +STELLA_CONF_OPTS += --enable-png
> +STELLA_DEPENDENCIES += libpng
> +else
> +STELLA_CONF_OPTS += --disable-png
> +endif
> +
>   # The configure script is not autoconf based, so we use the
>   # generic-package infrastructure
>   define STELLA_CONFIGURE_CMDS
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
