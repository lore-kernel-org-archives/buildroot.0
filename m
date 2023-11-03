Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2934EC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA3E6403C7;
	Fri,  3 Nov 2023 19:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA3E6403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTpymsAJRvo5; Fri,  3 Nov 2023 19:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F876403A9;
	Fri,  3 Nov 2023 19:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F876403A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC7F71BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 992B660AD4
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 992B660AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvvHx7ycliIl for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:29:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBF4360ACA
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF4360ACA
Received: by mail.gandi.net (Postfix) with ESMTPSA id D04D6E0004;
 Fri,  3 Nov 2023 19:29:19 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:29:18 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103202918.179466d3@windsurf>
In-Reply-To: <20231102185411.51382-3-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
 <20231102185411.51382-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699039760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4zHGrJgOA5/Yfo+CAnqqS1n0G1tnNVWm+XelxETKa4=;
 b=CU6D4E6fyrJidrm9hyBvB57b5KsEI841oiqca3D5TahC3j3UFwQi0F3dJh4JoefA/gaLBi
 mRkECxaKOIwCsknntK4C90nOkpfSFKRrxDnmDVqllTe8ex9jLax5DaOXcWAAj56Nodmvz1
 ZO7F6wN+lxM6tLQKtDd9MNrjIqnK0vba0NuRdL53gnw4cMwuRs+j6yGq5fmveapWVQYkOK
 KjV7Sv3Kg/MlbN+iNFkjGah8VOwQcg1xWZwZqguIYhvgH331iZAF3VzyWeJw1HG4R0NW0d
 NHyTWnf42wxGr0bfmUoONqiDZkhptMr7DoMeJDhO3Qh0R2c58S6ZY14N7dk94Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CU6D4E6f
Subject: Re: [Buildroot] [PATCH 3/5] package/flutter-engine: use impeller
 rendering engine
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

On Thu,  2 Nov 2023 12:54:09 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> From: https://docs.flutter.dev/perf/impeller

Using this syntax is not a good idea, as it makes "git am" believe that
the author of the patch is https://docs.flutter.dev/perf/impeller,
which screws things up. I fixed that when applying to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
