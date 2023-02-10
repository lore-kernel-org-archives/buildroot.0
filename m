Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B866C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E9261079;
	Fri, 10 Feb 2023 22:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29E9261079
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlgVLW8oClrC; Fri, 10 Feb 2023 22:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D60361058;
	Fri, 10 Feb 2023 22:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D60361058
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 352F11BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E52440AF7
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E52440AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BnIcXQZn6Pd for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:34:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A74401B2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9A74401B2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:34:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A354660003;
 Fri, 10 Feb 2023 22:34:52 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:34:51 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230210233451.3a3a2f9f@windsurf>
In-Reply-To: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
References: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676068493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JLFJmPshoQfiLsmIBPAozFeeRvWG9Q9+nA93OHZecU=;
 b=nYl3TfgbOIE8m9t6zaBUcQEwEqJbfnWup8B9AczY2WSu2CRpwWEfeAMVYJasTN+m6cQgCA
 8Jf6PIDdQwmV3hWRcPe4pJmLQm1Dvm6ZB/5taL2zimUApuLrY/EOoJelEXuvwB8OOSXidI
 u4QLZ7yOSkGbaabcjCJDKwk8jMQYQdPbM3ZIJ5GbctkVJHIf9p586Lcf+qvIkZiuTh5sEJ
 Jz5xwGAUrl5pollb/EHPzXs6hnbFihfrGzYuIAC9R+0skk+rLCYucGYvGLsx/FsTvBaOQV
 qqKWjlxnqzWIsq695nZaKsglSrukwowmwN2VHzFy05xvbt9V2AoXhCk49r0BoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nYl3Tfgb
Subject: Re: [Buildroot] [PATCH 0/4] Tinker board boot fix and Linux/U-Boot
 update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Jan 2023 01:21:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Giulio Benetti (4):
>   configs/asus_tinker_rk3288_defconfig: fix boot by prepending tpl to
>     spl+u-boot
>   board/asus/tinker: rename label linux-next to linux in extlinux.conf
>   configs/asus_tinker_rk3288_defconfig: bump Linux to 6.1.2 and U-boot
>     to 2022.10
>   board/asus/tinker: add a note to readme.txt for power supply

Series applied with minor adjustements here and there, nothing major.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
