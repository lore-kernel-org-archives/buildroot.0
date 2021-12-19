Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3459C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 10:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A23C60A91;
	Sun, 19 Dec 2021 10:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIOnv1Dy6bcF; Sun, 19 Dec 2021 10:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 714D160A7F;
	Sun, 19 Dec 2021 10:15:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46B471BF340
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 10:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE8860A7F
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 10:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7A9GrCG21RYr for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 10:15:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14E4F607F7
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 10:15:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3B6135FFAC;
 Sun, 19 Dec 2021 11:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639908900;
 bh=4H3nuikxrKZQ+gXqkUeya0HyZeM6YXybz+5ZwfvE5EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o6lCylqmjfqtuouMFVR3pZgF0EsD4bL9WZQC4OyLnd/Un9rZrwN0K/bSEJZxzranU
 HcAoavn/bi7gH0egpseouOG6OJ83Ovs11AVKJ11uRAm7xkjlUl6tHa2/MDUkBGJC1V
 sNdqUuAwY1KqD+HMR3zZgoj0KtUTiJWVZs4z4UCuGuDUu8n4UuNluawN24D2Wg1FGw
 f742YGUVY4f2/sKT098sr1NPldvi4Kv76PLA8lEpheE4GbxpMRsupgYJL3Zvxd5B5T
 T3JwS6X/3NNxOkvIe5UlIveKOCXu3vWsJTVj9n2a9fmFatGVpyZslQqU/cgEso62rT
 FXDypeXW08hMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Dec 2021 11:14:51 +0100
Date: Sun, 19 Dec 2021 11:14:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211219101451.GF2603@scaer>
References: <20211218232238.667138-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218232238.667138-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenaptx: use official
 tarball
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-19 00:22 +0100, Fabrice Fontaine spake thusly:
> Use official tarball and while at it use 2 spaces and reorder files in
> libopenaptx.hash
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenaptx/libopenaptx.hash | 4 ++--
>  package/libopenaptx/libopenaptx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenaptx/libopenaptx.hash b/package/libopenaptx/libopenaptx.hash
> index 76b4e66c9b..acaec5d642 100644
> --- a/package/libopenaptx/libopenaptx.hash
> +++ b/package/libopenaptx/libopenaptx.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated:
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
> -sha256 a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a libopenaptx-0.2.1.tar.gz
> +sha256  f13eac1ebfe31a563943cd47819eece1109960e10a1e85c111975bcfd37d5361  libopenaptx-0.2.1.tar.gz

I was not awake enough yesterday evening when I said to send a patch
switching over to the official tarball: this will change the hash, and
trhus will clash with anyone already having downloaded the archive, and
will also obviously clash with s.b.o.

So I took a look at upstream to see if there was any newer version we
could switch to at the same time, and... Oh the horror...

0.2.1 has been released just so that the license was changed from
LGPLv2.1+ to GPLv3.0+, *and* an explicit ban to f.d.o and Collabora from
using that code, and with a long rant about it, even stating that the
license to f.d.o or Collabora was terminated:
    https://github.com/pali/libopenaptx/commit/811bc18586d634042618d633727ac0281d4170b8#diff-2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900

Most conerning are some sentences like:

    this library and any other project which uses this library must not
    be used or distributed in any Freedesktop or Collabora project,
    application or library, either in source code, loaded or linked at
    compile time or at runtime either directly or transitionally

This is very, very concerning.

An issue was opened about that, and it is pretty dirty:
    https://github.com/pali/libopenaptx/issues/13

Besides, the original code is puportedly from ffmpeg, where it was
LGPLv2.1+. Relicensing to GPL-3.0+ seems very dubious at best...

My suggestion is that we should just drop that package.

An option would be to revert to 0.2.0, which is the last version before
the licensing change...

Thoughts?

Regards,
Yann E. MORIN.

> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
> index c2f5fa2390..12c33f6225 100644
> --- a/package/libopenaptx/libopenaptx.mk
> +++ b/package/libopenaptx/libopenaptx.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBOPENAPTX_VERSION = 0.2.1
> -LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))
> +LIBOPENAPTX_SITE = https://github.com/pali/libopenaptx/releases/download/$(LIBOPENAPTX_VERSION)
>  LIBOPENAPTX_LICENSE = GPL-3.0+
>  LIBOPENAPTX_LICENSE_FILES = COPYING
>  LIBOPENAPTX_INSTALL_STAGING = YES
> -- 
> 2.33.0
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
