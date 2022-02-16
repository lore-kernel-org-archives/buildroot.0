Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A06EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC08040157;
	Wed, 16 Feb 2022 21:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zS650KLlniyL; Wed, 16 Feb 2022 21:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C13FE40164;
	Wed, 16 Feb 2022 21:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7BD1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49FEC60BEA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8PkHq0jChra for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:48:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5839760BE5
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:48:58 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hw13so2273868ejc.9
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=FyfqJMaXE04pipq21y5JrCjuCuLyZyEBRdbbJuKB9mE=;
 b=WYxT2YW6WkLsVEP07/vahA8givXGLrWpBP6JnvJmoiID5WkW3FVQZ8CTfA7rcG2YSa
 iY/VstqEQL9NPSIN3/s2LhtUwHLRvUCKSCV4W6gYJ+uG2ARXTyEia4pp1nX0o4Aq2uZi
 EXhUQfB3hA/rw+D9YFgHKq2k7L/5tUZRx7pTJVUgz2VWu/iJPGry6i59wUGWQaifoK7J
 X/3+0yGxo0k2JvMjKcsP7XhqtVov5X/B8wZ9Sf/PPu3W68MMX8zPZ9/yAtzCHZczWsAk
 3C5h53lE++UUTJ4A86gpYFGJofv7UO+U44S6X5IiUB7ZZ2wSIyfevjdsYWrebQMc+DVz
 ZcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FyfqJMaXE04pipq21y5JrCjuCuLyZyEBRdbbJuKB9mE=;
 b=JL2sbAWc0V+2DmduoN3lNvUsvKMASrZ2L5mKj2TFOg944ywz7ppliW2M2l8Tab3IjM
 hV4S+BYHEWKC+1filoruAUyQDDIKlYCDuYoa+gt8l6fA1wAAbxVsZLpBZcokmsf6T/GN
 2KL3d6ZNUVOa5//doTd1tP5tNNnsjM34GcriU5YgNfoccDfo5+4ePe86hxPv1UinvewJ
 ITvCk+BizkDWPpRhjESUcXssYy6cfvlosk0MPK1tZfWpaK/ihzs1t8DGDwuv4bHARZZA
 LFlgphg8hfEJAn6ZnO9PvGT4PX7rvs8x1KVXMpTBf/6gkLil0UczspIiFDBiqRXMyE0G
 tC/g==
X-Gm-Message-State: AOAM531cvPLIRpUznYeRy5zaanHSt8bgNANJBa2H8lrBGAVgln4B5lzK
 cgjN2OGQ0bAZ0vjo9s8st9r0AA==
X-Google-Smtp-Source: ABdhPJwnrITCpuu0HJJf6nCPPzT51fO01GDFdn/lmN0Hfovx5JhyLM829kcCSErlOt6XQukzIZ/SdQ==
X-Received: by 2002:a17:906:3e90:b0:6b6:829b:577c with SMTP id
 a16-20020a1709063e9000b006b6829b577cmr3955111ejj.711.1645048136596; 
 Wed, 16 Feb 2022 13:48:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d25sm389152ejz.4.2022.02.16.13.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:48:55 -0800 (PST)
Message-ID: <abdceb9c-8dfb-6c09-4027-e241e089873a@mind.be>
Date: Wed, 16 Feb 2022 22:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220208205232.16362-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208205232.16362-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: drop openssl workaround
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



On 08/02/2022 21:52, Fabrice Fontaine wrote:
> Drop workaround added by commit bf899e50d89439b1a1bdf22bc933075958ffc108
> because sudo natively supports pkg-config for searching openssl (which
> is enabled by default) since version 1.9.2 and
> https://github.com/sudo-project/sudo/commit/4cadd549513ef35d4d740e941576294f4491d13d
> 
> As a side-effect, this will fix the following build failure when openssl
> is not installed on host (as LIBS is set before AX_PROG_CC_FOR_BUILD):
> 
> configure:8162: checking whether the C compiler works
> configure:8184: /usr/bin/gcc -O2 -I/home/buildroot/autobuild/instance-2/output-1/host/include -I/home/buildroot/autobuild/instance-2/output-1/host/include -L/home/buildroot/autobuild/instance-2/output-1/host/lib -Wl,-rpath,/home/buildroot/autobuild/instance-2/output-1/host/lib conftest.c -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -pthread -latomic -lcrypto -pthread -latomic  >&5
> /usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a when searching for -lssl
> /usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a when searching for -lssl
> /usr/bin/ld: cannot find -lssl
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/7a5d4dd22343be46a5ddd1c1a1a8e1799517d564
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sudo/sudo.mk | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index f2c074e55f..a752217123 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -45,17 +45,17 @@ endif
>   ifeq ($(BR2_PACKAGE_OPENLDAP),y)
>   SUDO_DEPENDENCIES += openldap
>   SUDO_CONF_OPTS += --with-ldap
> -# If we are building sudo statically and openldap was linked with openssl, then
> -# when we link sudo with openldap we need to specify the openssl libs, otherwise
> -# it will fail with "undefined reference" errors.
> -ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_OPENSSL),yy)
> -SUDO_DEPENDENCIES += host-pkgconf
> -SUDO_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
> -endif
>   else
>   SUDO_CONF_OPTS += --without-ldap
>   endif
>   
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SUDO_DEPENDENCIES += host-pkgconf openssl
> +SUDO_CONF_OPTS += --enable-openssl
> +else
> +SUDO_CONF_OPTS += --disable-openssl
> +endif
> +
>   # mksigname/mksiglist needs to run on build host to generate source files
>   define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
>   	$(MAKE) $(HOST_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
