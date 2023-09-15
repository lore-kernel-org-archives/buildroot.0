Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF9CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 048F641989;
	Fri, 15 Sep 2023 21:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 048F641989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVa9Xurbv8eM; Fri, 15 Sep 2023 21:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32C1841980;
	Fri, 15 Sep 2023 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C1841980
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8C5E1BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF58660E4A
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF58660E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aU_dQjvN3vSc for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:10:19 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A22F060AD2
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22F060AD2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6A2CA2003A4;
 Fri, 15 Sep 2023 23:10:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:10:14 +0200
Date: Fri, 15 Sep 2023 23:10:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230915211014.GD2571@scaer>
References: <20230915182305.975086-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915182305.975086-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694812217;
 bh=9Qu654gkdd24Ri+8mPUgT2j6Exx1aOfm6cevGMchKVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DxZAc50cUy4ci+MhWpteIZE0FLx+oVKgEg0EwRtuvVCmSN5FnaYTvUdskPIHtLD+D
 Z76SwQWznW/6chTvu75nxAj6I8XCttDiO7zhaflJ03tqqUrwOHRRiJURfHmAPSlPyX
 HaDAkhlW5SElyY3EdRgeUMDcYCztOXCraQoNobRtiEPTfDt9AEMr5PF/Re2HS3HAzV
 YPw76/RpVgI17vVNK9YVpOv2jeVM8/uTDN9RpHRYWL/5dpuzx0RTFsvdEBdLoKMd0x
 +64o1tscGC88gnPMkAxIwSZ3ZjnhNibJXl1eJbAYi2eLy7hb98W8z0DyvedRXJt41t
 0ubiACCwkDDig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DxZAc50c
Subject: Re: [Buildroot] [PATCH 1/1] package/irssi: bump to version 1.4.4
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
Cc: Rodrigo Rebello <rprebello@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-15 20:23 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2023-29132: Irssi 1.3.x and 1.4.x before 1.4.4 has a
> use-after-free because of use of a stale special collector reference.
> This occurs when printing of a non-formatted line is concurrent with
> printing of a formatted line.
> 
> https://irssi.org/NEWS/#news-v1-4-4
> https://irssi.org/NEWS/#news-v1-4-3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/irssi/irssi.hash | 2 +-
>  package/irssi/irssi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
> index ecd339d83d..df72ee4d76 100644
> --- a/package/irssi/irssi.hash
> +++ b/package/irssi/irssi.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8  irssi-1.4.2.tar.xz
> +sha256  fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead  irssi-1.4.4.tar.xz
>  # Locally calculated
>  sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
> diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
> index c2d02289ad..6790bf0c96 100644
> --- a/package/irssi/irssi.mk
> +++ b/package/irssi/irssi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IRSSI_VERSION = 1.4.2
> +IRSSI_VERSION = 1.4.4
>  IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
>  IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
>  IRSSI_LICENSE = GPL-2.0+
> -- 
> 2.40.1
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
