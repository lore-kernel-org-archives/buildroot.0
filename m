Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B0C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A6B61464;
	Sun, 29 Oct 2023 08:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A6B61464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ViFu3bkaWKy; Sun, 29 Oct 2023 08:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EBEE61174;
	Sun, 29 Oct 2023 08:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EBEE61174
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE751BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F26534ECDB
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F26534ECDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_zqRxmXRNMa for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:43:46 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 133484ECD6
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133484ECD6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5AC7E200402;
 Sun, 29 Oct 2023 09:43:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:43:42 +0100
Date: Sun, 29 Oct 2023 09:43:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20231029084342.GM687180@scaer>
References: <20231026201145.130747-1-bobrofon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026201145.130747-1-bobrofon@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569024;
 bh=iud8ibzCEyo4ubMJFXKc1/SQnfEbeVznlnEYxLq4z90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JVNFqkk/FCK5tWcF0/XPuxOiSrSLEiq+uoFUL6xC93r/vPa8rEt+nyQj939/svKyT
 ePWs5jH6zpZjK6VgHE+Qf1GNpAZjdL+tgrDUOeJQY1vZpeTfcRKCDF0WXGL284GBtD
 iP2Y1bjVNBC2mCvB6a62XHXzjfrXQ+Vkj7vChZEgtKrrrCh7NujTEF46BHDMDWPNHI
 pNJEwZK+s0ThuaaDuRW/RrfGx7kd5RxX2PMSow59hgMXg+E9c3DHo1srU2q4wC4wKv
 E1HGd278KbVCGbZU1YkJ3CdbU1tFKpWvjJ5PtR/u28MNX79gAfdgpDYMB5x4YVNZnK
 blp1e/PbbTyFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JVNFqkk/
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.4.0
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

Sergey, All,

On 2023-10-26 23:11 +0300, Sergey Bobrenok spake thusly:
> Changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.4.0
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
>  package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
> index f5fc8d6868..379864e3ba 100644
> --- a/package/sdbus-cpp/sdbus-cpp.hash
> +++ b/package/sdbus-cpp/sdbus-cpp.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  d44f59abdd64d8f1ca3af7db58bc6518cb081fc9ff16285c3d75a68f5c073d10  v1.3.0.tar.gz
> +sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  v1.4.0.tar.gz
>  sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
>  sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
> diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
> index 2a6b67d6e3..2c3844094e 100644
> --- a/package/sdbus-cpp/sdbus-cpp.mk
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDBUS_CPP_VERSION = 1.3.0
> +SDBUS_CPP_VERSION = 1.4.0
>  SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
>  SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
>  SDBUS_CPP_INSTALL_STAGING = YES
> -- 
> 2.41.0
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
