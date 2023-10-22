Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461A7C001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 14:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4584613A2;
	Sun, 22 Oct 2023 14:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4584613A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdt-fhM95V3H; Sun, 22 Oct 2023 14:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24DBE61369;
	Sun, 22 Oct 2023 14:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24DBE61369
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B79D1BF399
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81C634F545
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C634F545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzxWMuvidcr6 for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 14:17:07 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A96C4F534
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 14:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A96C4F534
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B9BC460149;
 Sun, 22 Oct 2023 16:17:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 16:17:02 +0200
Date: Sun, 22 Oct 2023 16:17:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231022141702.GL2607@scaer>
References: <20231021174044.295503-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231021174044.295503-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697984225;
 bh=jXoTdTq/tcrchrBxruy8mp3Dudt0TYhxw1UXL+uA4UQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JNba+qyoUlQgyRZwRB4l33Md5SNlrjE0vPvwgPwkQGVz0B8TKB1M/8/7DJ1MTvwvX
 RTAnwXE4ImWd2jBUcShwLIlSftSqhuKL8kDGiO4AJn728DnPE7b5YsRPSEGxehlN8B
 +BRSQNdVckePN3P+QJx5ou+yjga6n6lyWDZ41UvLY9mNrvcZRbg49Y209KyJXpsF0I
 EbBD3Ym0sgboPvhhF6GmuCZRd6xTg8muCSjFUvFMeknNYjfmE79+7qStDylyRospYH
 6rVmqe8iw93lLMO/9zgbcx1QbMUvGVuor49yc7aJp0XDvRee4brB0oujhJlIXyCNFS
 6CO+jxCW+lhJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JNba+qyo
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 2023-07-29
 version on v5.2.2.4 branch
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-10-21 19:40 +0200, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtl8188eu/rtl8188eu.hash | 2 +-
>  package/rtl8188eu/rtl8188eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
> index 29ce0e32c2..b3ead087d4 100644
> --- a/package/rtl8188eu/rtl8188eu.hash
> +++ b/package/rtl8188eu/rtl8188eu.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c573529862861a7a75534a4f2bc34ba7e3b116125298b5bc0d432b3065bd7df6  rtl8188eu-f4af53305cb1e9a0d8d9957a042f7c01b7121bfc.tar.gz
> +sha256  6bf8c026c7d875248f18f14de6fd116cac178db9bdb5bdbc1e267c8ac6b6237f  rtl8188eu-3ff6f7d84cb5346ed8d5dc21056769f2e03746d9.tar.gz
>  sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index 3698115d3c..f475bf3cab 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8188EU_VERSION = f4af53305cb1e9a0d8d9957a042f7c01b7121bfc
> +RTL8188EU_VERSION = 3ff6f7d84cb5346ed8d5dc21056769f2e03746d9
>  RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>  RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>  RTL8188EU_LICENSE_FILES = COPYING
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
