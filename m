Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A4BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 453FE40110;
	Sat, 25 Dec 2021 15:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I77gnG3SZ2bZ; Sat, 25 Dec 2021 15:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 433D74056B;
	Sat, 25 Dec 2021 15:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E46781BF239
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D36706060A
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jwVaRP-hzI7 for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:00:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91AEA605D8
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:00:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b527:fd15:94c1:e7d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0F86C13F87F;
 Sat, 25 Dec 2021 16:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640444438;
 bh=GG8w3vYprO+zJEyYmScEIU/UN/tdMU2LS+nuWOdi2zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dbkp5noj0EKRgm1Na+O/K0/8fVGg+TQfXWH1g26IKHJRebiDNRpusJWOo36sVzYYA
 euq0RylziedMCfOrj4POGRZPSAM0G1W5gxb4tfHKrGJeew9wmhRMBDGOLq3fLSrJYd
 KDMP2ShAO55cxTbzLo1zqN7tL6Yqw0+A7KjDQkpzXZZ/NbtKwVxk2H8R0UUJw8VP8p
 Xe18/VjUq83eSdc1odr052LrfejJcI1OZ/rsijOhLhKNrKOSTobFwH3Uc38BazqGDL
 h8r2OEUZcMDgsCpVfnVNVmj2cc/d4TSzU0VXcYkohF7CR6QRx8ln00gJHKvuPWiTVN
 7DBUK51qC4d7Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Dec 2021 16:00:31 +0100
Date: Sat, 25 Dec 2021 16:00:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20211225150031.GO2603@scaer>
References: <20211224095257.2909635-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211224095257.2909635-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gcc: fix xtensa overlay for gcc
 ccache hash
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2021-12-24 10:52 +0100, Yann E. MORIN spake thusly:
> Commit b3b60706221d (arch/xtensa: allow specifying path to tarball file)
> m issed a place where the xtensa overlay was refrenced, thus breaking
> the calculation for the ccache hash.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master with the typo-fixes noticed by Giulio, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index fcc352aa25..3adc1d4e16 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -283,7 +283,7 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
>  		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
>  		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
>  ifeq ($(BR2_xtensa),y)
> -HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_FILE)
>  endif
>  
>  # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
> -- 
> 2.25.1
> 

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
