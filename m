Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C41FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D235D810D6;
	Wed,  1 Nov 2023 18:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D235D810D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGv5iFyJw5hX; Wed,  1 Nov 2023 18:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EE384158;
	Wed,  1 Nov 2023 18:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56EE384158
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7DB1BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36858704B9
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36858704B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgzaZA4wdqwr for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:14:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5B7E7049B
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B7E7049B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F7B120004;
 Wed,  1 Nov 2023 18:14:16 +0000 (UTC)
Date: Wed, 1 Nov 2023 19:14:15 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231101191415.3350dada@windsurf>
In-Reply-To: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
References: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698862457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4h+SG1uA2Vv4M6udtTzVnhDjQRMRhNK5MvQsEKdt2E=;
 b=EpSIbwf2t/AUfkhWdHKvI+WJ7PFeZx8jttgVeiOUf1Nr1Im2G0uP7JASeTbrowfhyl6PdF
 C0hiCli6yhOoaqvdboYqRpF1O0mxGDVDRA7UgQdS778V+G2JjDUcsvbRCcRgVvRWqo4sln
 ZQR2CFCkcbHYSqjsMnHdErw2tRbEnNVXrNxum7d/BhwvOIcb5+jOdfr1oXxLeSF53pXWtV
 GE7+1OjFl5ZHm8Y9tULiC73mVgWXEAPF0+l6uFoeXrQayYriZgYDeSMUgCNh+uhUj8RUGX
 geDCiA2Ytvg7GKqbNp6ij9zXAlQshWAedgG8hKX6xPnvliZP2hUoegOsFgqFQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EpSIbwf2
Subject: Re: [Buildroot] [PATCH v5 1/4] package/openrc: bump version to 0.51
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 Oct 2023 13:08:06 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> OpenRC has not been updated for quite some time, and much has changed.
> 
>   - Convert to a meson package.
> 
>   - Update the license hash as the year has changed from 2015 to 2023.
> 
>   - Introduce one new patch:
> 
>     - 0007-allow-setting-rc_libexecdir-path.patch: Introduces the previous
>       behavior of setting the rc directory to /usr/libexec/rc.
>       (Upstream: Upstream: https://github.com/OpenRC/openrc/pull/443)
> 
>   - Install the sysv-rcs script in the new OPENRC_INSTALL_SYSV_RCS_SCRIPT
>     post install hook as the OPENRC_BUILD_CMDS define no longer exists.
> 
> Tested with tests.init.test_openrc all tests pass.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v4 -> v5: bump to 0.51

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
