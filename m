Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52362C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0502F61162;
	Sat,  6 May 2023 14:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0502F61162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nypTm-OBnqjx; Sat,  6 May 2023 14:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215BB61119;
	Sat,  6 May 2023 14:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215BB61119
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A127D1BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F0341764
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F0341764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43pceBHZYjah for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:46:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B9DB41718
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B9DB41718
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:46:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 88B81B0052C;
 Sat,  6 May 2023 16:46:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:46:12 +0200
Date: Sat, 6 May 2023 16:46:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230506144612.GJ2661@scaer>
References: <20230325181958.25542-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230325181958.25542-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384374;
 bh=TJue+9Q71HlNHV0TUPNw+zImhZ+SrCpKI1tadaVcsXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vx8K6Eim+T1KuPUQbYAh3iqSidTmatw+O29K3o3ylbhTA4omkLXoTytZkb2bZ3LZC
 zVk6iAx4xro+SKL5IwT5z3kVlTRxPleEORMxaDAAOQG7u78X+z1tjZbgiKweEo2lk9
 ju9wi5D9YeMXQeWrFxKDSI5+p/0DhbC2jqYXBfqCEGg1MfzbQjw2wGOqUq1LnKvO1M
 CxFVPxVnCvhyoQZ6Fo25Essfsi09tIhk1NMVx9+P24mbkqwnZYGhh2hZ6TwXiaIMhP
 NW1sP/w2smj3y+xS5+O22Nm4tgO19yOXGx6W+8axqB+ZT+hUuxBdOoq12CsM9gy8Jp
 E+mxuj5N68Evg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vx8K6Eim
Subject: Re: [Buildroot] [PATCH v1] package/libcurl: disable NTLM support
 definitely
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All

On 2023-03-25 19:19 +0100, Peter Seiderer spake thusly:
> - do not only disable NTLM delegation to winbinds ntlm_auth but
>   disable NTLM support overall (and drop enforced libopenssl DES
>   dependency introduced by 'package/libcurl: make sure openssl
>   supports DES' (commit f25c820a4f93ad0ca7eaf5e504667bd4099b878c)
> - change man page hint to https URL
> - rearrange configure options to one option per line
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch works for libcurl-7.88.1 and libcurl-8.0.1
> ---
>  package/libcurl/Config.in  |  1 -
>  package/libcurl/libcurl.mk | 21 ++++++++++++++-------
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index 218309ed56..adab1ca3e6 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -57,7 +57,6 @@ choice
>  config BR2_PACKAGE_LIBCURL_OPENSSL
>  	bool "OpenSSL"
>  	depends on BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  
>  config BR2_PACKAGE_LIBCURL_BEARSSL
>  	bool "BearSSL"
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1a1594a45e..1ff0ecc004 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -16,15 +16,22 @@ LIBCURL_CPE_ID_VENDOR = haxx
>  LIBCURL_CPE_ID_PRODUCT = libcurl
>  LIBCURL_INSTALL_STAGING = YES
>  
> -# We disable NTLM support because it uses fork(), which doesn't work
> -# on non-MMU platforms. Moreover, this authentication method is
> -# probably almost never used. See
> -# http://curl.se/docs/manpage.html#--ntlm.
> +# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
> +# support because it uses fork(), which doesn't work on non-MMU platforms.
> +# Moreover, this authentication method is probably almost never used (see
> +# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
> +#
>  # Likewise, there is no compiler on the target, so libcurl-option (to
>  # generate C code) isn't very useful
> -LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
> -	--with-random=/dev/urandom --disable-curldebug \
> -	--disable-libcurl-option --disable-ldap --disable-ldaps
> +LIBCURL_CONF_OPTS = \
> +	--disable-manual \
> +	--disable-ntlm \
> +	--disable-ntlm-wb \
> +	--with-random=/dev/urandom \
> +	--disable-curldebug \
> +	--disable-libcurl-option \
> +	--disable-ldap \
> +	--disable-ldaps
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  LIBCURL_CONF_OPTS += --enable-threaded-resolver
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
