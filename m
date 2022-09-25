Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E09C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 18:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C16541714;
	Sun, 25 Sep 2022 18:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C16541714
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sT_2ZHWYl6H; Sun, 25 Sep 2022 18:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211EE4170F;
	Sun, 25 Sep 2022 18:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 211EE4170F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37FF21BF32E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 204B060B12
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 204B060B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GYCNxCl726C for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 18:41:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC90560655
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC90560655
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 18:41:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D87E1C0005;
 Sun, 25 Sep 2022 18:41:14 +0000 (UTC)
Date: Sun, 25 Sep 2022 20:41:13 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220925204113.2c1f4d86@windsurf>
In-Reply-To: <CA+U=DspSC9f3P-m3DnBRnKb9-F4UtY7BynBTgytPsORZ3TY0cA@mail.gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220925102714.163869b8@windsurf>
 <CA+U=DsrMnh-60tcZKk7r41h5kyuGR5Cni7S5D6pTA0UpR4oE7Q@mail.gmail.com>
 <CA+U=DspSC9f3P-m3DnBRnKb9-F4UtY7BynBTgytPsORZ3TY0cA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664131275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qzGKuoQhYzF+n4v9Khc2bIjZIR6d8XLj5zPALBFX88=;
 b=LBGKyavYH+ISC42A6zAbT0z0ldOd86XpC6DRe4sFaU/RjRVU/NhNikYTYKuj9A14W4ivim
 /m1o6jMqCo7wX82ch5667TgCj05h9Fd0WFWJTKVgCrgIzk6aqOgNaqwTnW24TTUIH4OCIi
 /WX3dIoJD2xWNbmpmW77GKyI+a/oXewCHhzIO6xQf8Zi6lbbApostvaTCYiE1od/GrohmX
 99ekwSc/vZ1/GR7mE4nV2EG2+PReoycm7afDOl4AzViPnMPnTt3fLCSh1bZHb29+0baMPC
 3KaibP15WC7TCGRffhAdgJ0SYOrnYIsgIEaRECWegcO7n6VmWktG856iufEErQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LBGKyavY
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexandru,

On Sun, 25 Sep 2022 19:15:56 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> /home/aardelean/work/upstream/buildroot/output/host/bin/qemu-arm: not
> found
> Return code is 127

Could you try again with the latest master? Yann just pushed the patch
I submitted a few hours ago to fix this. You need to make sure you have
at least commit:

  https://gitlab.com/buildroot.org/buildroot/-/commit/a88ba1548a50d5599e0156d66063dd71545f910b

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
