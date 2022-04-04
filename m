Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C63C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC47404C1;
	Mon,  4 Apr 2022 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOa-O8wk3XHj; Mon,  4 Apr 2022 19:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B1504038B;
	Mon,  4 Apr 2022 19:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3574C1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32BA160BEF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZG2zBAel-P4 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22B1460B1C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:44:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id yy13so22232641ejb.2
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3bEwCo/ATskYyxT6UXImZTqP7u+j8F7qDPCYrWPR/SI=;
 b=hW7nGLWGIJYagZ1liKDPKj0MEnt4cTeq+cxl2ttTliocwxlR79j8A+HoivGFqFx6bw
 OgekbmEO+Dqr9yCQ8WbHCltypiRcM/k+8MthQ2NUCFgJ6met7jkBmP+++Tg6UonXEHaY
 EFcPloUq8M4V3RsseFa1z0jWs0Azn3fDpQ8tEIw18/nL7b3/5BarhO46tX9FQnMmlMtm
 dvKD2iE5igppvqyCLPhyPs9jzs/ex+YExOHYcXViTtB9evFKBHaBUc6ZZ+wYabA78+nY
 1IiV83TrG0L48xD9lne3evqcH7J5rFo9Gxp3B7BUNIq8LzVYejbFq8MqiOlZz4rouVGu
 Suug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3bEwCo/ATskYyxT6UXImZTqP7u+j8F7qDPCYrWPR/SI=;
 b=zECD8qy7mYtPhXDDjPdo2JlicL1AFWmZQAdHlJWcGOQ6dRVgJGpIWGnQVgcEE+Zf++
 zsC7G9lBgT+lRq2OD1EgLt5aHHvTSy9mJFfq67einSnMyPGPNX4Z59LYlHUcKj+CPueY
 s4zQlIxzI2kCPZHeLJ8VF6bNCp+XlLMuNb22VmlCTzfUMlwPZdBGkQMkY4vDqbI9qIj5
 rdw3kCAMWmFGuymd+DoK0BtRLSfkRgxTvYaSqXIwvILUpUssIrFyF8kSf8P+lU4ZH5KG
 OGl4E0Ec6muIYpYzpswUK7OFRYK++Sm7HbDEW8a/ASKi810dVbNT8bwAxSoaXBjkB1gS
 MRVw==
X-Gm-Message-State: AOAM531w2qLhffqEuEEIA6fD2j9YpgfSRIsTYaNzu9D2nDnfpeKjoWMR
 P2qdjq/gqNVBzLKn2CXA7rtR+c2Cg1J+XA==
X-Google-Smtp-Source: ABdhPJxaNjcaVAYjGTYVZyBkDKtwWTfVjt/gCyLT1GoatyXv8dJVPfBEvxjLrl+Fq2JaYIrWIuknnA==
X-Received: by 2002:a17:906:c307:b0:6df:c7d0:90e8 with SMTP id
 s7-20020a170906c30700b006dfc7d090e8mr1634527ejz.421.1649101481949; 
 Mon, 04 Apr 2022 12:44:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n25-20020aa7db59000000b00415965e9727sm5630218edt.18.2022.04.04.12.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:44:41 -0700 (PDT)
Message-ID: <25fabd64-4752-3b3b-bfab-2d1904267f3a@mind.be>
Date: Mon, 4 Apr 2022 21:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403140024.3774250-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403140024.3774250-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/glib-networking: fix build with
 libressl
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



On 03/04/2022 16:00, Fabrice Fontaine wrote:
> glib-networking raises the following build failure with libressl:
> 
> ../tls/openssl/gtlsconnection-openssl.c: In function 'g_tls_connection_openssl_handshake_thread_request_rehandshake':
> ../tls/openssl/gtlsconnection-openssl.c:419:27: error: 'TLS1_3_VERSION' undeclared (first use in this function); did you mean 'TLS1_2_VERSION'?
>    419 |   if (SSL_version(ssl) >= TLS1_3_VERSION)
>        |                           ^~~~~~~~~~~~~~
>        |                           TLS1_2_VERSION
> ../tls/openssl/gtlsconnection-openssl.c:419:27: note: each undeclared identifier is reported only once for each function it appears in
> ../tls/openssl/gtlsconnection-openssl.c:420:11: error: implicit declaration of function 'SSL_key_update' [-Werror=implicit-function-declaration]
>    420 |     ret = SSL_key_update (ssl, SSL_KEY_UPDATE_REQUESTED);
>        |           ^~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b8dea5704903c84858c7a339a73ecb713ac2791c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/glib-networking/Config.in          | 1 +
>   package/glib-networking/glib-networking.mk | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
> index 38cded5e6b..9c5d36af16 100644
> --- a/package/glib-networking/Config.in
> +++ b/package/glib-networking/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
>   	select BR2_PACKAGE_P11_KIT if BR2_PACKAGE_GNUTLS
>   	help
>   	  Network-related GIO modules for glib.
> diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
> index f74e520d31..e8905dfff4 100644
> --- a/package/glib-networking/glib-networking.mk
> +++ b/package/glib-networking/glib-networking.mk
> @@ -31,7 +31,7 @@ else
>   GLIB_NETWORKING_CONF_OPTS += -Dgnutls=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>   GLIB_NETWORKING_DEPENDENCIES += openssl
>   GLIB_NETWORKING_CONF_OPTS += -Dopenssl=enabled
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
