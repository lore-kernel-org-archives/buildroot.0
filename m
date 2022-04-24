Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1173C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9510260FA0;
	Sun, 24 Apr 2022 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlsEOS7lrqWY; Sun, 24 Apr 2022 15:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B0060E7D;
	Sun, 24 Apr 2022 15:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF8F1BF383
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C3C48239A
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUv-JaesYxI1 for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C95A481DAB
 for <buildroot@busybox.net>; Sun, 24 Apr 2022 15:05:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kq17so1966847ejb.4
 for <buildroot@busybox.net>; Sun, 24 Apr 2022 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DDZzwN/W0s/S+b3pJvoYG58g30OHqhBQoNC5GMNyR4g=;
 b=I5HaFSc4ms5lSDXhK8n+EJ+czD1NX8dtcz4mKnyiWPsFLb6jwv/2imLqcS0uqAo1E+
 FJIxKYUtGcUCQEAgslDA/NhH/gOOtRrtoXWXlDlRj/eOrsnPWTNA+KSze/M+oxXwkoZv
 ePr4dw94bMsMGLwGrqRNYcGcK0inrElwAQ84We3l3qRZKUuRiUBlNodIsee1qW8boX9N
 +4s8Cwtx/BQWIJO38TvmdK2kAhmpT6surEBjvm1uyYMIQb42PHGNDrU8aulmqLdn0VXq
 Iunhw27lQnZ2FSLF9aR+gDp9BBtOtYfmMeVwT8C8A7GiwQL0LIgpk50JUTfvweBsQiMs
 Gwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DDZzwN/W0s/S+b3pJvoYG58g30OHqhBQoNC5GMNyR4g=;
 b=c6osU7IzTsBOLtKG8ng+oWhIORLDeKdhlYJHDOPTSEsdjC6cyvldLLBIey0TyLSIdH
 Qb+PHCg/smpRs8Y39FrHkyd5OnT7UoyfCQFBrVgle+pPeeEPogtbJGw7Du7lzVtTe5M6
 fLr2G3vOvRZyiYoQkDPB9evoIfhXoTM/xjke27t/SEJpTKCE6gM32wiNKz8huzaaSzyO
 Txq6e/L74HfOVNRBmaAK/VDgNStaxv/Pd2/jIRUM5JLIEh5N6QNUfM1QQx0jGijBUIGS
 xjx5Z4K6MPItm4SJVnArtR397YkBh+2cUp8lxfC6X6n251L8P344RQe57DKLNsdJTej4
 nXDQ==
X-Gm-Message-State: AOAM5329TT3665xQ6B9QFGUM1HnZnq7nBD2MAgLcmk7HQkO0IcoVLHmM
 pSlh/FSrOeom7kXY1VMFe07JTw==
X-Google-Smtp-Source: ABdhPJwJKGYwpwlo4xiK4GSf+aYAQMSjz5SFAiCEiJoBlP1TagcKhjl1YMPoLIR8EFRB8g71IlcSOg==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id
 q24-20020a1709064cd800b006db0372c4bamr12264947ejt.57.1650812739946; 
 Sun, 24 Apr 2022 08:05:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a056402349400b00425a5ea1bb7sm3430058edc.57.2022.04.24.08.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 08:05:39 -0700 (PDT)
Message-ID: <69a502da-b1f9-b688-092e-59bf594ed6be@mind.be>
Date: Sun, 24 Apr 2022 17:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220424072016.3459504-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424072016.3459504-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.5.2
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



On 24/04/2022 09:20, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
>   package/libressl/Config.in                                  | 2 ++
>   package/libressl/libressl.hash                              | 2 +-
>   package/libressl/libressl.mk                                | 2 +-
>   4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> index 98fe250f6..1c59aec72 100644
> --- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> +++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> @@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
>   index 46f24b2ea..4048a6e63 100644
>   --- a/include/openssl/ssl.h
>   +++ b/include/openssl/ssl.h
> -@@ -411,11 +411,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
> +@@ -408,11 +408,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
>    #define SSL_OP_NO_TLSv1					0x04000000L
>    #define SSL_OP_NO_TLSv1_2				0x08000000L
>    #define SSL_OP_NO_TLSv1_1				0x10000000L
> diff --git a/package/libressl/Config.in b/package/libressl/Config.in
> index 600829cb9..aa42c21a9 100644
> --- a/package/libressl/Config.in
> +++ b/package/libressl/Config.in
> @@ -6,4 +6,6 @@ config BR2_PACKAGE_LIBRESSL_BIN
>   	  Install the openssl binary to the target file system. This is
>   	  a command line tool for doing various cryptographic stuff.
>   
> +	  https://www.libressl.org/

  Why do you add this? We already have the URL in the top-level choice, in 
package/openssl/Config.in.

  Regards,
  Arnout

> +
>   endif
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> index e92399871..c3590798d 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>   # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d  libressl-3.4.3.tar.gz
> +sha256  56feab8e21c3fa6549f8b7d7511658b8e98518162838a795314732654adf3e5f  libressl-3.5.2.tar.gz
>   # Locally computed
>   sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index 0bb468ced..c9c484d5d 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBRESSL_VERSION = 3.4.3
> +LIBRESSL_VERSION = 3.5.2
>   LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>   LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
>   LIBRESSL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
