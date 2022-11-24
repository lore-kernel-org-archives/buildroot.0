Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E307C43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 22:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C829F41694;
	Thu, 24 Nov 2022 22:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C829F41694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stXrtNYWDBxp; Thu, 24 Nov 2022 22:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E29416BC;
	Thu, 24 Nov 2022 22:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E29416BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC0D1BF3D6
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D1841694
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D1841694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UTHZD1MdU4I for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 22:29:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C8B4168E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03C8B4168E
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 22:29:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7A691C0004;
 Thu, 24 Nov 2022 22:29:34 +0000 (UTC)
Date: Thu, 24 Nov 2022 23:29:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221124232933.6ee4f171@windsurf>
In-Reply-To: <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
References: <20220921205815.1082192-1-giulio.benetti@benettiengineering.com>
 <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669328975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NfssHtu5Oj3IBFfCePiOB+gcLC06AW7jR4Y4hSQ/xw=;
 b=aVfP7bFxIj+MYwZQ3o5oGx8MjGgTHrhtwIp0RKgbxQzCDMx/dwIYX+X1YvugLNluSejw7r
 skcH6OH16N7w6rf1/wciLNHlL/gUUOGrZuDeFrY5yv+wRnXiP0h3PGU54RpPUUUi1bRWl/
 drSDfaht372EYfWAwgTRnZX/pNsr3P4KKRGGBa7WgWmWAEYtQhJ2eogl/fxDlDrg1m3oer
 V16ik4zxLYIMbGLTcV0mBlnIK6vXj3vr/dmaKePPB46EUP0lbi9wpZwIqi2+PgGh7/7h9A
 niLM1HK1HEZoo7ZkXcbRg75CdubgyKUOgA6Q1++5FYRemCGBmXIvLYmY8evAow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aVfP7bFx
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8821au: move upstream and
 fix missing linux options
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Wed, 21 Sep 2022 22:58:15 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package builds to fail with Linux > 5.15 and abperiasamy's
> rtl8812AU_8821AU_linux repository is not maintained since 2 years and
> there is not a fork where all pending patches have been upstreamed, so
> let's switch to lwfinger's rtl8812au repository that is well maintained
> with Linux up to version 5.18 supported. While switching let's drop all
> local patches. Also add me as maintainer for this package in DEVELOPERS
> file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  DEVELOPERS                                    |   1 +
>  ...-fallthrough-comments-for-kernel-5.3.patch |  29 --
>  ...river-crashes-from-aircrack-ng-rtl88.patch | 169 ---------
>  ...f-for-extending-string-which-causes-.patch | 339 ------------------
>  ...ate-to-rtl_sha256_state-to-avoid-nam.patch |  79 ----
>  ..._mgmt_frame_register-on-kernel-5.8.0.patch |  47 ---
>  ...-file_operations-to-proc_ops-for-5.6.patch | 110 ------
>  package/rtl8821au/rtl8821au.hash              |   2 +-
>  package/rtl8821au/rtl8821au.mk                |  12 +-
>  9 files changed, 12 insertions(+), 776 deletions(-)
>  delete mode 100644 package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
>  delete mode 100644 package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
>  delete mode 100644 package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
>  delete mode 100644 package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
>  delete mode 100644 package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
>  delete mode 100644 package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch

I have applied to master, but after fixing the hash of the license,
which you had forgotten to update (I checked, it's still under GPL-2.0,
of course).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
