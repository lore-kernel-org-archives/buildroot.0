Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C00CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E648060F28;
	Sat, 28 May 2022 22:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RI1rKQ-zv1lZ; Sat, 28 May 2022 22:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086BD60EC5;
	Sat, 28 May 2022 22:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457401BF580
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3324240B86
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCtx-H_Q95UI for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 22:14:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F84D4010D
 for <buildroot@buildroot.org>; Sat, 28 May 2022 22:14:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AD1F919F4F3;
 Sun, 29 May 2022 00:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653776062;
 bh=4959yfwoffYbM6HJoGQSdJdFxXho2G5cJ5rJepqIoAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWUHrsfQhg0CI9DeDna4pP4ZeNnvbt3qZZZ9M+YvMjM0rZ5GHE3v807u4JfUCulpx
 HwdtVDlf7i3JqrLbUy5ncZ4mFNmVDA6iQrZ+8ZD+bohHCSD0b99X/CmadmeeClHvea
 ZX4iyTXx4P0MK4xujqa/Q4YICaPh/LRG2dL6u7PEGvIwIqWPOxdoxdgbDIHyohkLxd
 iohkgF6c6sLWLaVjhc65N0WttiRrmH4JuZRJ4JXbyokirCyzkZbYxYbDM+v6IVHb5n
 BWbzsG07o11OWDQ6G4r3ZBnA8aLq89UsNy8lrYq4Cs18M/whfrYrK25bby0tO9AMVs
 4JL59Hwt+V4Rw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 00:14:20 +0200
Date: Sun, 29 May 2022 00:14:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528221420.GP301044@scaer>
References: <20220528202627.2082719-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220528202627.2082719-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/dhcp: fix build without atomic
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

On 2022-05-28 22:26 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without atomic raised since commit
> fde21979427ffeb4fe9c0068310be195f2dec5ec:
> 
> /nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Move BR2_TOOLCHAIN_HAS_LIBATOMIC block inside 
>    BR2_TOOLCHAIN_HAS_ATOMIC block
> 
>  package/dhcp/dhcp.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index cbc95cb152..183c8322d6 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -62,9 +62,14 @@ else
>  DHCP_BIND_EXTRA_CONFIG += --without-zlib
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
> +DHCP_BIND_EXTRA_CONFIG += --enable-atomic
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  DHCP_CONF_ENV += LIBS=-latomic
>  endif
> +else
> +DHCP_BIND_EXTRA_CONFIG += --disable-atomic
> +endif
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  DHCP_CONF_OPTS += --disable-libtool
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
