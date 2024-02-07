Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7E2C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B15DA401D8;
	Wed,  7 Feb 2024 14:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZD5ECkQ85PWG; Wed,  7 Feb 2024 14:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 735D740320
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 735D740320;
	Wed,  7 Feb 2024 14:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38B911BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E578124F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUusE2ehyMEV for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4133B8089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4133B8089D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4133B8089D
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:06:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B9F40008
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:06:17 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:06:16 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20240207150616.2683d894@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707314777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c4P92xV4Y24JpdqQHzMxthK0zMxM02CPD6bZ39Pe5sc=;
 b=DJ7bX7oJPC0CHMaMi4HDAKILYx7X/sdY30czBqLlCn/LtNyi5HAkbLSNVBX9OwXFcuFVh3
 uWwJb5K4VyRlO7aMF4XC2OMmZ/pqH2JIabVTOwoYS8tSPkRn5Qig1+vcT1kr/G4HBE5nWk
 3Dj5eatq+xw5qq9/gbXf5Ik43hBdUy5AkV3764SDJ1pz+cKZTh3sm4N34VhuHTOwMHnrH9
 yVcZUWlhjD1TkojRnjf4wBLEjufluUppjQpKAjnSsLENkgvQHnJDopPPA6ZUnOxRHLSXaN
 mB9zLRNcV4KX+cpIbXjWnAPTZJw0AmYrOSyySAeU6cVaaQNf6vkUBHU9kKvBlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DJ7bX7oJ
Subject: [Buildroot] Call for more autobuilder machines
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

Dear Buildroot community members,

Our "autobuilder" infrastructure, whose results are presented at
http://autobuild.buildroot.net/, and sent on a daily basis to the
mailing list and individual developers, is critical to the proper
testing of Buildroot.

Unfortunately, over recent times, less and less machines have been
contributing build results, to the point where we only test 100-120
builds per day, which is not enough to have good coverage.

Indeed, the builds are done by various machines that contribute their
results to autobuild.buildroot.net. Therefore, the way to increase the
number of builds done per day is to increase the number of machines
that contributes to the build.

So this e-mail is a call for participation: if you have some machines
that could be used to run Buildroot builds 24/7, or at least during the
night and/or week-end, it would be useful.

However, beware that it only makes sense to contribute if you have a
sufficiently powerful machine at hand: enough RAM, fast storage,
recently recent CPU. At least 4 cores (not threads), 32 GB of RAM, and
SSD/NVMe.

If you are interested in contributing to this, contact us and we will
give you the details. It's pretty much as simple as running
https://git.buildroot.org/buildroot-test/tree/scripts/autobuild-run on
your machine, as an unprivileged user (no root/sudo access needed), and
that's it.

Thanks a lot for your collaboration!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
