Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469AEC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA03C83C19;
	Sun,  7 May 2023 12:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA03C83C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22b-qS5Bmg2X; Sun,  7 May 2023 12:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0310381A29;
	Sun,  7 May 2023 12:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0310381A29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6901BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7675418C3
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7675418C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CFcr4wjj6rZ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8659B418C5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8659B418C5
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:09:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DA09419F58A;
 Sun,  7 May 2023 14:09:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:09:44 +0200
Date: Sun, 7 May 2023 14:09:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507120944.GJ252090@scaer>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
 <20230506173917.1112500-2-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506173917.1112500-2-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683461387;
 bh=g2onOLqa5PbgLa0yecHtpdFAxjN8DCrLOumBVN+JGQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oW3WL/Nv/1d9x4O2lWzLLkC0TJHfLdOp0yXmCPzF01gsFvvojfZJS8ok3yK3TLiwZ
 DcDnvKu9YdnkzDDddAG+3rg2fesfqRZJiBpJRZknXLDJP8P6PkbIO35KQEsazjAysl
 RGWMkX9kDbB1HQ0m4O9nV8AFRjAfSUE2J7qz2T9lKdREe24HnJmNx+9zuJ6Mmmx9zO
 fRAIjtqx9Pkl6LvroV6OAgZBIU8Y5oJi8MNK6umO8b8RJ7hdo915jrIbETiQ6jDHF+
 6kHOzJF2+uHT+6yh0WMKkdH3H1Npl0LvC6tZ4qV8teL+6LayFQ6Qva9guS10107WER
 b7QS9KHvZRpaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oW3WL/Nv
Subject: Re: [Buildroot] [PATCH 02/22]
 package/x11r7/xdriver_xf86-input-mouse: bump version to 1.9.5
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

Bernd, All,

On 2023-05-06 19:38 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-May/003392.html
> 
> Updated license hash due to upstream commit
> https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/5f63ab04338fd811c610ae7617757ede52471316

If you change the hash of COPYING (or any other license-text-bearing
file), it is obvious that there has been an upstream commit that
changed, so just saying "there was an upstream commit that changed the
license file" does not bring any valuable information.

Waht we really need to know and track in such a situation, is what the
change was, and how it impacts the licensing terms.

In this case, the change was just about an update in the copyright
years, and so has no impact on the licensing terms.

Applied to master with the c ommit log amended to reflect the above
(check it to see how simple it can be), thanks!

I also had to do some similar changes in a few other patches, but next
time it wouls be nice if you could do that on your side. Thanks! ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../xdriver_xf86-input-mouse.hash                         | 8 ++++----
>  .../xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk  | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
> index adba659aea..d654c362a9 100644
> --- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
> +++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2022-November/003247.html
> -sha256  7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c  xf86-input-mouse-1.9.4.tar.xz
> -sha512  7dfde3b1e0c1291c4d78ee920942771808b007f743bfc6eed20de12579383745858673dd874a4b5cf4ab8d9d15f6f7ca2db81ee831547a488d64848a7fe5e16c  xf86-input-mouse-1.9.4.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2023-May/003392.html
> +sha256  4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968  xf86-input-mouse-1.9.5.tar.xz
> +sha512  ed9bd9cb9a05dac0ff1bfb4e4704cb2e94117afb400aa9e0b7ccdbb102bc6db1b0d3af7cb6f99d0892f8fc306f1643286291c0fa7114af8e65864412bd6c1afa  xf86-input-mouse-1.9.5.tar.xz
>  # Locally computed
> -sha256  472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
> +sha256  5b066654bdb61a1ef41f38cceda752897bbddb6e60e20f5889cab436a9b7b813  COPYING
> diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
> index 4a9eb3089f..25e25ab93d 100644
> --- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
> +++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.4
> +XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.5
>  XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
>  XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
>  XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
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
