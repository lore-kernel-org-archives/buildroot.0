Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9623C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8FC60B0C;
	Sat,  8 Jan 2022 14:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeaMvwnPQmi6; Sat,  8 Jan 2022 14:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1073560AF7;
	Sat,  8 Jan 2022 14:13:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB9AA1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7CD181757
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLpYkeiGOb1r for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:13:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C84D81495
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 14:13:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8F16C0003;
 Sat,  8 Jan 2022 14:13:43 +0000 (UTC)
Date: Sat, 8 Jan 2022 15:13:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220108151342.063a9bc6@windsurf>
In-Reply-To: <8bfdc46b-bfbe-2470-0068-ca3a5d72fd89@smile.fr>
References: <20210316143822.3421019-1-masahiroy@kernel.org>
 <8bfdc46b-bfbe-2470-0068-ca3a5d72fd89@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] qemu_arm_versatile: switch to in-kernel
 defconfig + fragment
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
Cc: buildroot@busybox.net, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 8 Jan 2022 15:09:56 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> We use a custom kernel defconfig for this defconfig since it was added to
> Buildroot [1].
> 
> I guess the aim of having a custom kernel defconfig is to reduce the build time.

Most likely yes, but when I see the fragment, it indeed disables a lot
of things, which is nice as it speed up the build. Just like on x86,
you could build the full defconfig to have something that boots under
qemu, but having a stripped down configuration is a lot more
useful/practical;

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
