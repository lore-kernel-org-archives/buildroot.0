Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4C3C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 16:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E95B414E5;
	Sun, 28 Jan 2024 16:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E95B414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdhOuzEvO7k6; Sun, 28 Jan 2024 16:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4AE410E1;
	Sun, 28 Jan 2024 16:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4AE410E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3DC61BF2F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 16:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A816B40475
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 16:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A816B40475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGvD2aimAKe5 for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 16:39:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4C93402D4
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 16:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C93402D4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 662E313F8CE;
 Sun, 28 Jan 2024 17:39:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Jan 2024 17:39:15 +0100
Date: Sun, 28 Jan 2024 17:39:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZbaDM9uzEw5quEgA@landeda>
References: <20240128110544.2449102-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240128110544.2449102-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706459957;
 bh=8LKYuP4E7IhmdPGWC4Uf+onZU8Y/DdyMgP2n1TOqu2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzZZpNqUsQKgbxlkAZ69rSm6jpPmxRMzfmpyU3Cjg9TQL9jxTlGdKxdY15oq233FO
 xQefCaCIdLbtU/wGrfErgOuz2ZDe8LcEWDudrU4RmWxDgKZe7H6xFRB0HFQvtt8+KJ
 pKOluoPNuZYOOjsZkIQrk7VXYLkiD8WryXlRtl4jj0nN5iEvQv0DzWymbdqbjowhHd
 nKoilZNTASQt3+AG+KDUV8sXYMOWG2bvvvagAxJqW7Hfk9sLdcSWiB8cTt+FHWE24X
 dimTQhWn7uckAxcvk6MvHv45t8oQTAU5dzeqnG9Onc+9+nTaUNCEbO1fe3T0E0lBGg
 Jiq1U1p448uwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MzZZpNqU
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 CPE variables
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

On 2024-01-28 12:05 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:x.org:xorg-server is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/79A86C02-31A5-4F25-8CA6-7C4A8CD92B7B
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 4a05582583..1d0807ffec 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -9,6 +9,8 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
>  XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
> +XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
> +XSERVER_XORG_SERVER_CPE_ID_PRODUCT = xorg-server
>  XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
>  XSERVER_XORG_SERVER_INSTALL_STAGING = YES
>  
> -- 
> 2.43.0
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
