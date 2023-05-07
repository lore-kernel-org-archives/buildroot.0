Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31229C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF8E41AEC;
	Sun,  7 May 2023 16:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF8E41AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2oae-JYt2o3; Sun,  7 May 2023 16:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 848F541B52;
	Sun,  7 May 2023 16:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848F541B52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC5A81BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B60CA4168C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B60CA4168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tOiOHm37Hty for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD250405D1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD250405D1
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:18:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C67C919F4B5;
 Sun,  7 May 2023 18:18:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 18:18:39 +0200
Date: Sun, 7 May 2023 18:18:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507161839.GZ252090@scaer>
References: <20230506160524.2231307-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506160524.2231307-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683476323;
 bh=6AJ19G5wfbYxheQAEOHu6n4SEK1wTpULz/D+E4tVKsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IdJbyiYRtIILvpf1XYNUqv32lezjceyQ7seEyUvLaNxIt+u0qlBQTT8Q8yUV3E+4c
 QFUmExNfQGvLM9j0KV0mxitM3Jrhuo03JCGJ2e96Uy0R8oaR0k7B0FolXHiCmmiNfq
 ZQQl5w51wy8K1Z5ZWZUX/xwa9n33pVEktfLQrq61QP221oNC62v+ebASC3+OyBl+nA
 I8k7xB3sVXoiWquKQHWCK/04Sl3IwSdmh34Y3cPU4UaCvUtK8+YvkKW2NhG7nlIuL0
 1i5Lo9qOiPtMfFInqV6XC1hLOLuEnTBX16aWbTyQnNuUJ6Ft1cRE1GEQTaoYoLrbf9
 aERjASUSgyofw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IdJbyiYR
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libutp: bump version
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-06 18:05 +0200, Bernd Kuhls spake thusly:
> Needed for bumping transmission to version 4.0.1.
> 
> Added configure option to fix build error with gcc-12.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: No changes
> 
>  package/libutp/libutp.hash | 2 +-
>  package/libutp/libutp.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
> index f347dc3f2c..0312f42612 100644
> --- a/package/libutp/libutp.hash
> +++ b/package/libutp/libutp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  484f802d044f774fa5f669476ecdd9cb6110c383781c39adc03bbf6575090771  libutp-059c9449a104e440e4f913756a5f560dd4ae76a9.tar.gz
> +sha256  d856fde68828d52eb39df40e15ad5dc4efaa9a51d4121bcbfbe47fed2163d20a  libutp-c95738b1a6644b919e5b64d3ea9736cfc5894e0b.tar.gz
>  sha256  73b400bf61dde52223dae1642205ca187f1a6b24a508dcce52bf386c27a0e58c  LICENSE
> diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
> index 394c1e9cb9..df0617555d 100644
> --- a/package/libutp/libutp.mk
> +++ b/package/libutp/libutp.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> -LIBUTP_VERSION = 059c9449a104e440e4f913756a5f560dd4ae76a9
> +LIBUTP_VERSION = c95738b1a6644b919e5b64d3ea9736cfc5894e0b
>  LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
>  LIBUTP_LICENSE = MIT
>  LIBUTP_LICENSE_FILES = LICENSE
>  LIBUTP_INSTALL_STAGING = YES
> +LIBUTP_CONF_OPTS = -DLIBUTP_ENABLE_WERROR=OFF
>  
>  $(eval $(cmake-package))
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
