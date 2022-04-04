Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609F4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9084040C;
	Mon,  4 Apr 2022 20:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWGEMqV40xiX; Mon,  4 Apr 2022 20:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E0D140204;
	Mon,  4 Apr 2022 20:17:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8F71BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A41860A70
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkdmJC0FXgQO for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 617AD607F9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:17:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b15so12492039edn.4
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=TcQ+KjQZudaVituiDUsP6zraVWsTSosklG9hZ6AJJQk=;
 b=cHAnzimgs4EkShoG2cbGu6UUabpvN13gZRkSS1nFfCGvXdjo8nadKQMx2g+1BR/pxR
 olOVMwHi6QdGoT9AVJni86Rr8EG89L5kij+hcQEgcUoPwJrRm5UApRgOku7ZimzOQ/PD
 9eQptFO1gG0TWbhQK6AW6XzjS1Vr1eqv3bwcBdgWbxOo10HFS0ef1mbV6QSwWPhqVg5l
 7TSkEDXgkgfNYAHoZmcnAlY5eIQfJlbliqBKcv9ZCMPLwFzVpqi3hSvBdyM5+kly9t9r
 0Fjri0/uNC09TQFDkSBSvd/X8slC3vfn0x5EQuPD4KgjymLxL9Jot6SYUjWEDIEkg4Oe
 BxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TcQ+KjQZudaVituiDUsP6zraVWsTSosklG9hZ6AJJQk=;
 b=uOrubBtBBnPe2ZZwOS2TOiEwCT8Ufq92wB/1GQEbwozsXCw6ZU1+vN//jOnqumXZGP
 58sR7zR08YSY9LamfTLXI4BDgo8zHA31wN7fh+EodYgBaq+eqqlyz9+rujXcMni45Yd3
 IcdOaMtlRx4g7Zg5nQpW1nv0FmVTvZ3/xBdwCDq5IibqKd2YX0XUczIUQ2dZ6k/gScqU
 IMMsVXZP8dAlSSAutWNhlfirofQ2SguwAHUtOtDyZF+LUV//Bb4GRupXOr4EUOBdH2L6
 HeUYoF7DwgI2XyJfc3/nxNOEWD07uBIaLnKs6ImADwVczeWuFjni1R/HJl5YgQlwEvVE
 46Fg==
X-Gm-Message-State: AOAM5312U+d5Edn8lcFukcVW+3i0Gjk2GwITyxuJFyIKq4sMUvOtIs2s
 qOBsUN1zkfDTiZA0N6Xl3J0bAw==
X-Google-Smtp-Source: ABdhPJwWuGV7RZuJZxhiO483MMskk3Ul0RdlgiXwr5C2Q88NuLBVFa4s1lBbyGPMrBgyCXks99mc6Q==
X-Received: by 2002:a05:6402:524c:b0:419:4d8c:e959 with SMTP id
 t12-20020a056402524c00b004194d8ce959mr2002222edd.398.1649103454488; 
 Mon, 04 Apr 2022 13:17:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm4703286ejc.153.2022.04.04.13.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:17:33 -0700 (PDT)
Message-ID: <dca3ae89-9bed-b085-8e7c-203a8a1b30c4@mind.be>
Date: Mon, 4 Apr 2022 22:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404162248.325842-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404162248.325842-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix build with libressl
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



On 04/04/2022 18:22, Fabrice Fontaine wrote:
> Fix the following build failure with libressl:
> 
> p11_rsa.c:355:14: error: static declaration of 'RSA_meth_get_finish' follows non-static declaration
>    355 | static int (*RSA_meth_get_finish(const RSA_METHOD *meth)) (RSA *rsa)
>        |              ^~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/de3b1e97796f717eac47d291911e3e1517cb557b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libp11/0001-Update-wp11_rsa.c.patch | 26 +++++++++++++++++++++
>   package/libp11/libp11.mk                    |  8 ++++++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 package/libp11/0001-Update-wp11_rsa.c.patch
> 
> diff --git a/package/libp11/0001-Update-wp11_rsa.c.patch b/package/libp11/0001-Update-wp11_rsa.c.patch
> new file mode 100644
> index 0000000000..0a2d6e65ce
> --- /dev/null
> +++ b/package/libp11/0001-Update-wp11_rsa.c.patch
> @@ -0,0 +1,26 @@
> +From 4968cfc64dbaa39bb479a24d9578d75099e2f337 Mon Sep 17 00:00:00 2001
> +From: patchMonkey156 <pagorman@asu.edu>
> +Date: Mon, 19 Oct 2020 17:12:15 -0400
> +Subject: [PATCH] Update p11_rsa.c
> +
> +Bugfix for new LibreSSL version 3.2.2
> +[Retrieved from:
> +https://github.com/OpenSC/libp11/commit/4968cfc64dbaa39bb479a24d9578d75099e2f337]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/p11_rsa.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/p11_rsa.c b/src/p11_rsa.c
> +index b6beef0..ff12ed7 100644
> +--- a/src/p11_rsa.c
> ++++ b/src/p11_rsa.c
> +@@ -336,7 +336,7 @@ int pkcs11_get_key_size(PKCS11_KEY *key)
> + 	return RSA_size(rsa);
> + }
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100005L || defined(LIBRESSL_VERSION_NUMBER)
> ++#if ( ( defined (OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100005L ) || ( defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3020199L ) )
> +
> + int (*RSA_meth_get_priv_enc(const RSA_METHOD *meth))
> + 		(int flen, const unsigned char *from,
> diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
> index 45a718ee99..c1873a920c 100644
> --- a/package/libp11/libp11.mk
> +++ b/package/libp11/libp11.mk
> @@ -11,10 +11,16 @@ LIBP11_INSTALL_STAGING = YES
>   LIBP11_LICENSE = LGPL-2.1+
>   LIBP11_LICENSE_FILES = COPYING
>   
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +LIBP11_ENGINESDIR = enginesdir
> +else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +LIBP11_ENGINESDIR = libdir
> +endif
> +
>   # pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
>   # so let's rip it out.
>   LIBP11_CONF_OPTS = \
> -	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
> +	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable $(LIBP11_ENGINESDIR) libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
>   
>   ifeq ($(BR2_PACKAGE_P11_KIT),y)
>   LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
