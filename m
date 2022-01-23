Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F17C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 038C840105;
	Sun, 23 Jan 2022 19:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyi59tPGjg1V; Sun, 23 Jan 2022 19:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C45B04014C;
	Sun, 23 Jan 2022 19:53:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEEF61BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDDA360C2B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiYYz1y3uGBD for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:53:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCB0B600CA
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:53:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 512685FF9D;
 Sun, 23 Jan 2022 20:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642967629;
 bh=mHtorTbCIjngg5m8CDUOTiOVG0PGxwTUWkM0hF1dCvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2Xm4YIlrWEtvto4Q/PW/JewNQAaY+N4FKO2AgHAGCF4t0eO69Jr1Uygo50pnkLba
 GLAS57f6XI7RXHTRznJF6xuOoi8SFCc+rNDSSY/lPFC/Ym88xLAzkSDJPF3X7VIPEg
 /0BVqnRouDdDHNT9zwLoARDH1lz3OtEJXsVnzeNNNQaJF55Z51JbiK31xXYkWRzVQf
 BOUVd69tLjPtv05JUFz073Q32L6Cw0twV7KetisSFR2/hWgzM095vfbsn1yab0t5PO
 mo0xY5LvUAI5epU3hEEeWGC/bDIgOh4YzEfO3oAkD++Fd2pDPZY3qpPBnvmwRhSstB
 Ml17hYOBKOakw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 20:53:47 +0100
Date: Sun, 23 Jan 2022 20:53:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123195347.GC2502@scaer>
References: <20220123105146.568745-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123105146.568745-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/neon: bump to version 0.32.2
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

Fabrice, All,

On 2022-01-23 11:51 +0100, Fabrice Fontaine spake thusly:
> - Switch site to get latest version
> - README has been renamed to README.md
> - Update indentation in hash file (two spaces)
> 
> https://github.com/notroj/neon/blob/0.32.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/neon/Config.in |  2 +-
>  package/neon/neon.hash | 10 +++++-----
>  package/neon/neon.mk   |  6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/neon/Config.in b/package/neon/Config.in
> index 8dc78f0f0a..a3515f4052 100644
> --- a/package/neon/Config.in
> +++ b/package/neon/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_NEON
>  	help
>  	  HTTP and WebDAV client library, with a C interface.
>  
> -	  http://www.webdav.org/neon/
> +	  https://notroj.github.io/neon/
>  
>  if BR2_PACKAGE_NEON
>  
> diff --git a/package/neon/neon.hash b/package/neon/neon.hash
> index 2ebefbe520..5a5a77a58b 100644
> --- a/package/neon/neon.hash
> +++ b/package/neon/neon.hash
> @@ -1,6 +1,6 @@
> -# Locally calculated after checking pgp signature
> -sha256	db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca	neon-0.30.2.tar.gz
>  # Locally computed
> -sha256 95f77624e96f6728145826fc895142275451f43f41c073766db3dbbcc8b790b0  README
> -sha256 d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
> -sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
> +sha256  986566468c6295fc5d0fb141a5981e31c9f82ee38e938374abed8471ef2fb286  neon-0.32.2.tar.gz
> +# Hash for license files
> +sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
> +sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
> +sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
> diff --git a/package/neon/neon.mk b/package/neon/neon.mk
> index da53735d0e..3bbd12561f 100644
> --- a/package/neon/neon.mk
> +++ b/package/neon/neon.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -NEON_VERSION = 0.30.2
> -NEON_SITE = http://www.webdav.org/neon
> +NEON_VERSION = 0.32.2
> +NEON_SITE = https://notroj.github.io/neon
>  NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
> -NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
> +NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
>  NEON_CPE_ID_VENDOR = webdav
>  NEON_INSTALL_STAGING = YES
>  NEON_CONF_OPTS = --without-gssapi --disable-rpath
> -- 
> 2.34.1
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
