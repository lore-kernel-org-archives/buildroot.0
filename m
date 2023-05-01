Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D12CC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E55B380E9D;
	Mon,  1 May 2023 19:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E55B380E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhhVOWr-KKSe; Mon,  1 May 2023 19:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6AF980C60;
	Mon,  1 May 2023 19:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6AF980C60
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2E81BF4E7
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66E3D40286
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E3D40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkxHOTrAFMNs for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 19:33:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C076400EC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C076400EC
 for <buildroot@buildroot.org>; Mon,  1 May 2023 19:33:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:8906:ae70:691:1fda])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 43A8A19F740;
 Mon,  1 May 2023 21:33:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 May 2023 21:33:17 +0200
Date: Mon, 1 May 2023 21:33:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230501193317.GA2696@scaer>
References: <SN4P221MB068217338F33CAE73749100FA0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB068217338F33CAE73749100FA0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682969600;
 bh=+tis3eKohDlfbHL5vTIFUMlm8FTCtICxR428j8Mkg9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kUmvraJ4FPXdPLcHjnRIfpMFRrDYJQ7q8RQhBj0vG5QYxKNZuD8S+g5Zd7ZdOYz20
 klGAR22Kc+5/gEtm80HeDNDqqBMGFVslVbA9Ciudghh9QX2I25E0RDNXT96E9N5zD7
 Cg25NlL2WvMD0tmCbUHSJrPJg61xU3Ky0jTHqyqk/101WqkLflYPPA9/k/TSCPSjDJ
 Tk1gzndAHAAOkLbp5a27e7FDZl5axa+/Xu0ejRz0h+RaLilJuutZEFATYbk3bbx+Ux
 LqvfcgrJKpAewBRkp51iON/Nihc3yvYRlaIXbfrg0ex/MePkmi8yK3xekJ3BLM2X6J
 KkrIMRFdHZ44w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kUmvraJ4
Subject: Re: [Buildroot] [PATCH] package/libcurl: drop override of
 LD_LIBRARY_PATH
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

James, All,

On 2023-04-25 00:33 -0400, James Knight spake thusly:
> A previous commit [1] (libcurl 7.19.2) configured `LD_LIBRARY_PATH` to
> prevent cross-compiling errors when target == host; however, such an
> override is no longer needed [2][3] (libcurl 7.37, 7.74) and causes
> build errors in some environments. Dropping the override.
> 
> Fixes:
> - https://bugs.busybox.net/show_bug.cgi?id=15181
> 
> [1]: a51ce3194923430fc229fc2ad98b12795b5a1876
> [2]: https://github.com/curl/curl/commit/e48a821ed580cd2897b3e1b0bc88ca9245ac234c
> [3]: https://github.com/curl/curl/commit/6f3369bbcf9d0ebdaa5d141f8ca446448c24494c
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> When using `./utils/test-pkg` with the original implementation and the
> following configuration:
> 
>     BR2_PACKAGE_LIBCURL=y
>     BR2_PACKAGE_LIBCURL_CURL=y
>     BR2_PACKAGE_LIBCURL_OPENSSL=y
>     BR2_PACKAGE_OPENSSL=y
> 
> The `libcurl` package never seems to pass the configuration stage on an
> Arch development environment. For example:
> 
>     configure: OPT_OPENSSL: ~/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
>     configure: OPENSSL_ENABLED: 
>     configure: error: --with-openssl was given but OpenSSL could not be detected
>     make: *** [package/pkg-generic.mk:283: ~/br-test-pkg/bootlin-armv5-uclibc/build/libcurl-7.88.1/.stamp_configured] Error 1
> 
> or:
> 
>     configure: OPT_OPENSSL: ~/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr
>     configure: OPENSSL_ENABLED: 
>     configure: error: --with-openssl was given but OpenSSL could not be detected
>     make: *** [package/pkg-generic.mk:283: ~/br-test-pkg/bootlin-x86-64-musl/build/libcurl-7.88.1/.stamp_configured] Error 1
> 
> With the change applied in this proposed patch, the default toolchain
> configurations used by test-pkg all pass:
> 
>     $ ./utils/test-pkg -c libcurl.config -p libcurl
>                         bootlin-armv5-uclibc [1/6]: OK
>                          bootlin-armv7-glibc [2/6]: OK
>                        bootlin-armv7m-uclibc [3/6]: OK
>                          bootlin-x86-64-musl [4/6]: OK
>                           br-arm-full-static [5/6]: OK
>                                 sourcery-arm [6/6]: OK
>     6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  package/libcurl/libcurl.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1a1594a45e23a01fa259d0d377ef60d200309c91..dd715c1bb67202897f8a51243591676921fde24b 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -56,11 +56,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
>  LIBCURL_DEPENDENCIES += openssl
> -# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
> -# native stuff during the rest of configure when target == host.
> -# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
> -# are found first.
> -LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
>  LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
>  	--with-ca-path=/etc/ssl/certs
>  else
> -- 
> 2.39.1.windows.1
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
