Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB3CC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 18:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25098401E1;
	Sat,  9 Dec 2023 18:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25098401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTvGGUEmfe42; Sat,  9 Dec 2023 18:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F80400B9;
	Sat,  9 Dec 2023 18:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64F80400B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8EBD1BF397
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 18:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE9CA60FB8
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 18:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9CA60FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgQDraKJodRr for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 18:22:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D0D560FB7
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 18:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0D560FB7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07D6013F81D;
 Sat,  9 Dec 2023 19:22:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 19:22:44 +0100
Date: Sat, 9 Dec 2023 19:22:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Zhangjin Wu <falcon@tinylab.org>
Message-ID: <ZXSwdJFb46e_u2RX@landeda>
References: <20231209162118.190035-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231209162118.190035-1-falcon@tinylab.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702146168;
 bh=DUiYlT7CAWbEHnLryofYJUmGwoU7+YvEKDlqCQxYZ1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3y+G0N1wr+F24icwGd++X3qJUXREEucpofRYjZ1ZWBQYQfepnzeerB1zQ3KpZeY5
 npSiqwTVy5WDqZpN6u1PqQ+LmxGOWME7cUPi++CtS3YHo6+Z9kODkC5iJMaG23q++a
 VS2g4aq1hsCIwvNQaMGmp5h3KK7HVW5IOQN0yNt45XaWcGvPFbTc94q8jk9y4xSHeo
 FQLnSIekVGaT/cs39Psn1TKIiUY/fY9sg9TxJ7zfNlCMHlaeog9R3/aprh0RnzbODT
 CdHb6RSZ1tpQpt/agfHDShoDFn/NmAfeUNAJDJL40e0KEtHuHwSDbDSQyEUOapFo/Z
 yTl7PJab6qKFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q3y+G0N1
Subject: Re: [Buildroot] [PATCH 1/1] package/mpfr: Fix GNU Mirror Path
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zhangjin Wu, All,

On 2023-12-10 00:21 +0800, Zhangjin Wu spake thusly:
> Replacing http://www.mpfr.org with BR2_GNU_MIRROR variable

The upstream for MPFR still references their own location as the
download location:

    https://www.mpfr.org/mpfr-4.1.1/

E.g.:

    https://www.mpfr.org/mpfr-4.1.1/mpfr-4.1.1.tar.xz

What is the rationale for switching over to the GNU mirror rather than
use the official upstream location?

Regards,
Yann E. MORIN.

> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  package/mpfr/mpfr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
> index 8d12c7502b..a5e26404d1 100644
> --- a/package/mpfr/mpfr.mk
> +++ b/package/mpfr/mpfr.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MPFR_VERSION = 4.1.1
> -MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
> +MPFR_SITE = $(BR2_GNU_MIRROR)/mpfr
>  MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
>  MPFR_LICENSE = LGPL-3.0+
>  MPFR_LICENSE_FILES = COPYING.LESSER
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
