Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3274ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C0D402C2;
	Sun, 30 Oct 2022 18:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C0D402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUvaUgwFMBDl; Sun, 30 Oct 2022 18:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CED401B1;
	Sun, 30 Oct 2022 18:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01CED401B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005D61BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE4BE80C2C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE4BE80C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejLf_lOy_dqH for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:34:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B1780BD5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95B1780BD5
 for <buildroot@busybox.net>; Sun, 30 Oct 2022 18:34:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A145E13F89D;
 Sun, 30 Oct 2022 19:34:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 19:34:07 +0100
Date: Sun, 30 Oct 2022 19:34:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20221030183407.GZ1058960@scaer>
References: <7568ca93d2d360efc2c6096406b8d9af533dec86.1667154015.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7568ca93d2d360efc2c6096406b8d9af533dec86.1667154015.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667154852;
 bh=4XoxnFl5kv/LCZgyhNfK27b9WYH91iFvbGEBuGJR9WU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2gbXUBP0+vzZnMxqqaQbwv0uYcI1/E4LNJSyXUYFjPXpTsN2hEaGHnTSYLO0Fz/R
 QVF3u4vo6uTjTpIDTd0rZWRK7fcCDIpA9nE/tYXI2bdU3yja11seFkGlVcxni5Bty7
 7n4/U/mx6KW1LNsQOCWWOWLL3HGq9VNzIAs3YTT1cxnnnWd+YnC4nVEIuWLCJcXuiH
 5WijpjdEr/N6K5zp0qnNFYJFGusnE2YuS3UGBBiDzT/PCDWtgPlJE9r97ciJWsna2y
 mUrz5ZwqEbsJ4E+r/cXSnlIwX0Adb+fOzVLdJqgDR7lOwZUpdpWu3JIoT/dUBNlNlU
 ZsfTix5mShx3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D2gbXUBP
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix crypto backend
 selection
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
Cc: buildroot@busybox.net, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2022-10-30 20:20 +0200, Baruch Siach via buildroot spake thusly:
> Since version 7.77 --with-ssl that used to select OpenSSL renamed to
> --with-openssl. --without-ssl changed to mean no crypto backend.
> 
> Only in version 7.86 setting both --without-ssl and some other crypto
> parameter became a hard configure error.
> 
> Update OpenSSL selection parameter, and add --without-ssl explicitly for
> the case of no selected crypto backend.
> 
> Fixes:
> http://autobuild.buildroot.net/results/05e9cb71619e640849c27b2984d0df671a9f86c5/
> http://autobuild.buildroot.net/results/5a4a905de2a232a38916f03278d0a3cbd8a29711/
> http://autobuild.buildroot.net/results/4432314aa13d4acc8fce27f79177f82298ae0626/
> 
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 3c3ad082fc65..8de43581073d 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -50,6 +50,10 @@ endif
>  
>  LIBCURL_CONFIG_SCRIPTS = curl-config
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL_TLS_NONE),y)
> +LIBCURL_CONF_OPTS += --without-ssl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
>  LIBCURL_DEPENDENCIES += openssl
>  # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
> @@ -57,10 +61,10 @@ LIBCURL_DEPENDENCIES += openssl
>  # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
>  # are found first.
>  LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
> -LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
> +LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
>  	--with-ca-path=/etc/ssl/certs
>  else
> -LIBCURL_CONF_OPTS += --without-ssl
> +LIBCURL_CONF_OPTS += --without-openssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
> -- 
> 2.35.1
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
