Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA9360F35;
	Sat,  4 Nov 2023 17:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA9360F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3eAhyBa_3Rm; Sat,  4 Nov 2023 17:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C721160C08;
	Sat,  4 Nov 2023 17:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C721160C08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9FEA1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C246D41B6C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C246D41B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lN93-EUQWzcd for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:33:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 586E641B6B
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 586E641B6B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03C8CFF806;
 Sat,  4 Nov 2023 17:33:50 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:33:49 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231104183349.27388c7b@windsurf>
In-Reply-To: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
References: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVuAThEasfCIC7XBnNlILBjLcuTw7GcuTpnYZgkhB3c=;
 b=Wx9alTQSf0PoPR3DnIXYudSN1ZgFeicT0ZcoTCsADw/zvwwFLjezoVSvzjDzjh8HwCeAQY
 M+4+8MC2km7IXwPq9j/cq6TIUAY54HNQD7vmDtcYYD2IamEEI00prmLzINIlNiyXuDLIt+
 iopOJ35w2UAkWAGd3ktQ46cRIkfXn5WZyK/xlLaJRNC+FxzKX3uRZOb8oJALpCP9GrZFVP
 cwfEjFlskbUalWDKWxpnxBBVjSxEeNqOYzoMWUaRS//Pej3nUNbFDZxtlaCvVz4V/IPuGi
 L91hd5rgYFa+UC+ww8Jckn8pqqF1PJjtV9ITUK5eCYcv2ByrklmIGPcqn1z1iA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wx9alTQS
Subject: Re: [Buildroot] [PATCH v4 1/2] package/refpolicy: bump version to
 2.20231002
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Oct 2023 19:04:27 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Drop upstream patch
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v3 -> v4: Drop upstream patch in this patch.

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
