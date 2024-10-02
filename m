Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E44ECEACF3
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C341360A7E;
	Wed,  2 Oct 2024 19:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcfD842aFdJF; Wed,  2 Oct 2024 19:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C803761113
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C803761113;
	Wed,  2 Oct 2024 19:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C94A81BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4B7E410EC
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PB9gFfOA9apy for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:11:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DFF0410C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFF0410C2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DFF0410C2
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:11:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CFDEFF803
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:11:38 +0000 (UTC)
Date: Wed, 2 Oct 2024 21:11:37 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241002211137.25c4c147@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727896298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6W/9i9KGnE6aG+MKOE+SJKQF1NAAcwK43573nBybxJ4=;
 b=bo3FYhykj8+E4m/xVmwnHOprmlIPf+IGUGhfXzvd9FxIBHz0LA9/C1qi0eKDLl7K+gUxdX
 4F12F8WnTkwtpLT8K+/IHakwcPLwF4tGN8FMnyidWv9W/KanyVcYV60mu8fKBAfLdYO73P
 K8Dzp/L1pS6UiXaAk9CxNWJ56Rurrq5WpZW4aU4d2x6mNUyHTq3WSfa5G6+WolVfmGNgYL
 iPbllgute5nCctSONNa8FeKCPA4/QsDfscvSviuMhT+zsXyRl3vjeeslfureVWrxCwyZFu
 XbHLKlhnFHG94aaINppNuGwlpOGEaDjJ56/r3QeB7GyQhH/jB3ebZrLBP56k5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bo3FYhyk
Subject: [Buildroot] Buildroot Developers Meeting after FOSDEM 2025
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The FOSDEM conference will take place on Feb 1-2, 2025 in Brussels.

Right after the conference, we are organizing on Feb 3-5 a 3-day
Buildroot Developers Meeting. We invite Buildroot developers and
contributors to join this meeting to work together on Buildroot,
discuss current topics, review and merge pending patches, and tackle
specific issues. The event is free, and it is not mandatory to
participate to all 3 days.

The event is kindly hosted by Smile, in a location conveniently
accessible by the Brussels metro.

If you're interested, you can register at:

  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025

If you don't have an account on eLinux.org and don't want to create
one, just let us know that you intend to participate.

We really encourage those of you who are using Buildroot and attending
FOSDEM to at least consider attending the first day of the meeting, to
meet other Buildroot users and developers.

Do not hesitate to get back to me if you have any question or doubt
about the meeting, its organization, or contents.

I'm looking forward to meeting the Buildroot community in Brussels next
February!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
