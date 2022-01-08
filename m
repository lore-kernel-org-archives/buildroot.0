Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEBFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D384E40761;
	Sat,  8 Jan 2022 22:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAhAXFSND9Ab; Sat,  8 Jan 2022 22:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B07405D6;
	Sat,  8 Jan 2022 22:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 450DE1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3047340117
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjuEBeteriyy for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF9D1400C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:04:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A271713F814;
 Sat,  8 Jan 2022 23:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641679455;
 bh=aqtvx6LxfZOwwrt0ugg+T4Itud9mkOuGY9grkoe1fxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jDcSpCkX4Ot8aYg+qSBMZjWYDz6Y3hEnCtfW7lEjUf/K+vONYc36ApwaXyiDqSlVk
 oLxD0ARb2f1vfgNu4C6GleKqolfPNKZ2QFyqNPk6PWRlKgoA5e/rKrNrMpstZoaIvr
 ro0d4CjXy85EiKPnL2ZNuOT+tC14EP0+sXO76iVNCBjUcTzwbHERi3lwPCn0NslvmZ
 owntoRwOGNEwwOKOw/UL7z40oPa1xd5npRziPoaTgDiDocWbue4V7RaLsSogekql8e
 H8pf+3pllX3PCavSWOKe6reFyyizNwqZ1zsHfGpX3M5Oqrb5NKLTQWhAYJUZZp2ecv
 1qYCJvMJecPNQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jan 2022 23:04:13 +0100
Date: Sat, 8 Jan 2022 23:04:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108220413.GG1881783@scaer>
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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

On 2022-01-04 21:54 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 5.41 in
> commit d38b72bcd75392a88b5100839ac410859d0a6a79:
> 
> readelf.c: In function 'do_auxv_note':
> readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
>   for (size_t off = 0; off + elsize <= descsz; off += elsize) {
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc

It turned out that all that was needed is to tun autoreconf. See the
commti for the explanations:
    https://git.buildroot.org/buildroot/commit/package/file/file.mk?id=590d89fdad50f48c120b91ac008cc2ea4b625e15

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Set ac_cv_prog_c99 for host as already done for target instead of
>    adding an upstreamable patch
> 
>  package/file/file.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/file/file.mk b/package/file/file.mk
> index 12647af8bb..62cec4b2c9 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -9,6 +9,7 @@ FILE_SITE = ftp://ftp.astron.com/pub/file
>  FILE_DEPENDENCIES = host-file
>  HOST_FILE_DEPENDENCIES = host-zlib
>  FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> +HOST_FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  FILE_INSTALL_STAGING = YES
>  FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
>  FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
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
