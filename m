Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F27AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF5940286;
	Sat, 12 Feb 2022 16:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4cbeo5bANLQ; Sat, 12 Feb 2022 16:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B261340329;
	Sat, 12 Feb 2022 16:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 924291BF34F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EAE4408A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 16:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpFNNHOretjl for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 16:49:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C993408A2
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 16:49:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9140:15a5:f29a:157f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C41FC19F576;
 Sat, 12 Feb 2022 17:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644684596;
 bh=PxvTR+/MolanbJgA1SKESyoVWucrXC77+Cf6Uh+nF1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egHwdM3owpkqJ++h+exBUIaPggxqjn8wjH05eo5ldXpXITEQT8+TuJWkvhEz1NhvM
 sTQbgCSPPvUmlEpXdsnCMlgfOILXS3ruGIwBKJNxHWFiYw7pUOpw/dFMYaovs3PBZl
 G3tE+SIoB1JvtBFP77LKKhn84bEF+ftRyndteGTNwd+AWsmBTbStL0a3tnLMGt1l64
 cbEERihUhoJNgNGEEBlQK2UIUzsOKWK9XPjmAzRn80Ya5FpGud8w5lwcaV/K6b2LDk
 aL7HewqGSEw9jyGP725mTiRNZtiJMc3sOQwcNf5uWaT1qZ3SIVzhgg/4n/JTRV2/jy
 MkjpSjY173N8g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Feb 2022 17:49:51 +0100
Date: Sat, 12 Feb 2022 17:49:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220212164951.GE3752867@scaer>
References: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
 <20220128110542.1101197-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128110542.1101197-2-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libcamera: fix missing comment for
 binutils-bug-27597
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-01-28 12:05 +0100, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libcamera/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 23a0040abf..88db054975 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -92,7 +92,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
>  
>  endif # BR2_PACKAGE_LIBCAMERA
>  
> -comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
> +comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7, not binutils bug 27597"

Bug 27597 is inherently an architecture-speific bug, which is always set
for NIOS2, so there is nothing the user can do about it except switch to
another architecture...

The comments are meant for when the user has an alternative option, like
chossing a different version of a component.

In this case, there is nothing the user can do, so we don't add it to
the comment.

Regards,
Yann E. MORIN.

>  	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> -- 
> 2.25.1
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
