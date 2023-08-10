Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79861C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 09:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC7C641B1A;
	Thu, 10 Aug 2023 09:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7C641B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6pwGEVsR_Kx; Thu, 10 Aug 2023 09:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B4C941B27;
	Thu, 10 Aug 2023 09:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B4C941B27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA1821BF5F5
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 09:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 834C0610B4
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 09:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834C0610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4OgxqzD-mvl for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 09:20:52 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 337BA60B9E
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 09:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 337BA60B9E
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 4322EA0388;
 Thu, 10 Aug 2023 11:20:50 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 2857F80172;
 Thu, 10 Aug 2023 11:20:50 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 99C8310013C;
 Thu, 10 Aug 2023 11:20:49 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Thu, 10 Aug 2023 11:20:49 +0200
Message-ID: <13322713.uLZWGnKmhe@kilian-aisec>
In-Reply-To: <20230809193855.60c6b89c@windsurf>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2146
X-purgate-ID: 154282::1691659249-18FFF7B6-077487D7/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691659250;
 bh=6XwuUrb2DYnhS+q3aI/YQaQdccCt84G0bsk6AxjoywA=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=ZCFy+JxXv0zHIONdKBYxsF+yKPf8ANc6n38CuT00C+H1VGeidDpHjb4WMEECrfaup
 hpLPWWO38VhD7cp2o9Eq8AUB8kWZAmRiFFfEABbwJZH+hYPoQFi1dwxDS7a28uY/5l
 MQUJK2DAL/JdUWSD5jmsj4F3du7eg0X+MB6FdvP0tr4VodTHAn5rDZebq7bTE5A+UQ
 GpxbkfMvvJ04L6dBvGtRCj73KrDVjSidVGc4DftQUg4LiqjH0Bl4hBiSbgPnTRWJXh
 DPVKecbTSOEgAmZCtDo5/2ouq0xMRWFsmZzs4IkOVqsU8GflS9OHYQn/XWdWKS51jj
 THXffMe82Ky3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=ZCFy+JxX
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,


> > I am interested in adding board support for the BeagleV-Ahead.
> 
> Ah, ah, I was working on this as well!

Nice, then let's do it together?

> > BR2_TARGET_UBOOT=y
> > BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > BR2_TARGET_UBOOT_CUSTOM_GIT=y
> > BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/beagleboard/beaglev-a
> > head-u-boot.git"
> > BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="beaglev-v2020.01-1.1.2"
> > BR2_TARGET_UBOOT_BOARD_DEFCONFIG="light_beagle"
> > BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/uboot.fragment
> > "
> 
> Backport commit 1dde977518f13824b847e23275001191139bc384 from upstream
> U-Boot on top of this vendor branch, it will solve your problem.

Great, thanks, that did the trick!

I however run into a similar problem with opensbi afterwards. As I use the 
beaglev_defconfig as basis, I also used the opensbi version defined there:

https://gitlab.com/buildroot.org/buildroot/-/blob/3a4ce27f/configs/
beaglev_defconfig#L29

However, the (2 years old) opensbi version (currently defined in the 
beaglev_defconfig) does not define the neccessary flags for the zicsr and 
zifencei extensions, needed by gcc12, as seen here in the newer opensbi 
release-1.3.x version:

https://github.com/riscv-software-src/opensbi/blob/release-1.3.x/Makefile#L274

So my build broke until I changed to release-1.3.x. This makes me wonder about 
the current beaglev_defconfig: It might be broken since bumbing gcc to v12, but 
I actually don't know. I could try building an image for the beaglev later 
today?

Now, regarding the bealgev-ahead, it seems to build opensbi on my machine. But 
I don't know whether the official opensbi is actually needed, or the custom 
version, i.e.:

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-opensbi

I still have some other problem with the build at the moment, where I have to 
look into (might be my very own fault - the errors about unknown vector 
instructions are back for some reason). But as soon as I have questions or 
news, I will send an update to the ML.

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
