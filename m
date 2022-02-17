Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3853D409B4;
	Thu, 17 Feb 2022 21:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsXaNnku6gDV; Thu, 17 Feb 2022 21:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71E7A40267;
	Thu, 17 Feb 2022 21:43:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50FA01C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D7A9400D8
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pmd2-mnWzjtE for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:43:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C667E400C6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:43:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D053513F879;
 Thu, 17 Feb 2022 22:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645134198;
 bh=ckSenHKg2uHoCeRLZ8YZ4KrVRe3PuXFoKOntLh82uz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fd5RbvEvhZ8Zbp/mEooynJzEzyA7FLZ06yGqTARay/eM1XwWvB2l3gB4ohERz11O4
 2qoKg5Wmpo6tTx+tLnRKnJNrBXpc9G3HDzav9lLsRXw5LBAJ7Mo3YrijpnXmTIyEdk
 ifuMCMlDWaZYMK8vIfD4rXhTHpOzXxsBSiK/yPGJCf2GW2QtoBenhouqMPBsCZmhPn
 ORzzI6jH5KBCHjteb0g3Cy+fgUjn1nYNAnQyHeilBbbW1I+tA6jIkjnydFRLW6OZGc
 l8bMA4KXRfILg+xn/wbQLuh+44ahWOkYZVbRNVy4egvo5eG9Ui1+QQwVBkLxvGpand
 HknRD/WTmuY7w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 22:43:14 +0100
Date: Thu, 17 Feb 2022 22:43:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220217214314.GL522310@scaer>
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-2-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217155549.1084829-2-marcus.hoffmann@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/2]
 configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All

On 2022-02-17 16:55 +0100, Marcus Hoffmann spake thusly:
> Fixes the following compile error:
> 
> In file included from include/bootm.h:10,
>                  from tools/image-host.c:12:
> include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
>  1178 | #  include <openssl/evp.h>
>       |            ^~~~~~~~~~~~~~~
> compilation terminated.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784200
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/friendlyarm_nanopi_r2s_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
> index 818c847f4b..ce252a5d76 100644
> --- a/configs/friendlyarm_nanopi_r2s_defconfig
> +++ b/configs/friendlyarm_nanopi_r2s_defconfig
> @@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
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
