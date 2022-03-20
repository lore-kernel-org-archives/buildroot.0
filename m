Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFF1C80C39;
	Sun, 20 Mar 2022 17:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfgydr3ksDSr; Sun, 20 Mar 2022 17:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC9D80C0C;
	Sun, 20 Mar 2022 17:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB1531BF3C0
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB345402C1
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZnKaoM9PlAA for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4855A402A4
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:03:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1770CFF802;
 Sun, 20 Mar 2022 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647795816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gdvg3jjMjpvzr9DjK4Km6X6t7ppt/tsbADw92CnbiKM=;
 b=JcFnyhDqMx/BHeAYV4jA++MkgJg5y1BrX3tzPnqZh47m/myWtmGPBn+NbIc+GxkbilxyRA
 2NY9O/+C3+FDoC+1SiR10/5w627XRZLNVv0mOi2mREq5YXbi6SGBoNud354G/DpeZNqkz5
 zXt+AX/UBcnYitT/qCKEExKVXnb24AaoG1mtolXEB8FpeaErcUv/eIghZ456NGj2lU2qw6
 OJQxdrKA4SFBNx9JnxdwJy5WSPX6AfTra04APS2ml1aAezOUsXQ/tv5vl+nfx+NE1H5vnx
 6ZxhYGB1h4z/rDJh1IuwqQBQJZV2MZFlc+2ntCgOxgGmtcxlof1kEgdSrVM6Hw==
Date: Sun, 20 Mar 2022 18:03:34 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180334.131f2728@windsurf>
In-Reply-To: <20220320115401.3214796-1-bernd.kuhls@t-online.de>
References: <20220320115401.3214796-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 20 Mar 2022 12:54:01 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed all patches after being applied upstream:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=ec8c8f22efb66ccae533fbd55a236570ffcf756c
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=710220f861b100856711a0a4d4a852874228a57a
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9f09e69ecb077082301dafb745856e1f3731aaa7
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=cfab569484b18407fc117bb96634525cc76ea1f5
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=58dec00edcaa316909cdd5309bd7bd3239ee221a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../bluez5_utils-headers.mk                   |    2 +-
>  ...-tools-mesh-cfgtest-include-limits.h.patch |   33 -
>  ...til-Rename-btd_malloc-to-util_malloc.patch |   67 -
>  .../0003-shared-util-Add-util_memdup.patch    |   57 -
>  ...ace-use-of-g_memdup-with-util_memdup.patch | 1411 -----------------
>  ...005-build-Fix-errors-with-glibc-2-25.patch |  312 ----
>  ...rc-shared-util.h-include-sys-types.h.patch |   39 -
>  package/bluez5_utils/bluez5_utils.hash        |    2 +-
>  package/bluez5_utils/bluez5_utils.mk          |    4 +-
>  9 files changed, 3 insertions(+), 1924 deletions(-)
>  delete mode 100644 package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
>  delete mode 100644 package/bluez5_utils/0002-shared-util-Rename-btd_malloc-to-util_malloc.patch
>  delete mode 100644 package/bluez5_utils/0003-shared-util-Add-util_memdup.patch
>  delete mode 100644 package/bluez5_utils/0004-build-Replace-use-of-g_memdup-with-util_memdup.patch
>  delete mode 100644 package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch
>  delete mode 100644 package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
