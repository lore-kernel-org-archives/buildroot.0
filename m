Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21123C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C53D740360;
	Sat,  4 Nov 2023 20:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C53D740360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMVEJooW6cAL; Sat,  4 Nov 2023 20:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A87403C0;
	Sat,  4 Nov 2023 20:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A87403C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA17D1BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC7240364
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC7240364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaSRUqx0aZMl for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:26:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F6ED40273
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F6ED40273
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1039820002;
 Sat,  4 Nov 2023 20:26:11 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:26:11 +0100
To: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Message-ID: <20231104212611.32d305a5@windsurf>
In-Reply-To: <20231003122517.2725616-1-julien.boibessot@armadeus.com>
References: <20231003122517.2725616-1-julien.boibessot@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOZwXAZK1Bbv5rsnCdkd6j367CFV+Zp0YxeVvxcgiUk=;
 b=IyNlQ++IVw1AYOe8yiQQCAKOGTGydYFGSEnDm06FrhSjfK51wPzJ6dkcDG0oLS4kgrffZs
 J5fwiNGA0eexpiUUHRTXLrLkAjYWFsYw6z3vWuDQ+K1W7N14rt5GEx3KhzXdWE6AATNAaP
 Dg6zbt5B2mG87toB+SzewYfVvdR8XwO10Fvh66u6sAxVGwmZ3oLIpIc6gcbDFZa02HmG/S
 wXUirP+4C1RIarAKRVhg0wcA1MPZ2vZJZd1S3Vjc00QFrojdQOVvMW0tvDdOASRQgmrk3h
 gI4CKlBYtGAYJaDMLUisSNa+zGArL35A+ZXIsQOLvPT6NH4/cvson1dbAVHDOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IyNlQ++I
Subject: Re: [Buildroot] [PATCH v2] package/ltris: bump to version 1.2.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  3 Oct 2023 14:25:17 +0200
Julien BOIBESSOT <julien.boibessot@armadeus.com> wrote:

> Latest release. Asked by autobuild.buildroot.net.
> Remove integrated fix.
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> ---
> Changes v1 -> v2:
>   - updated .checkpackageignore as requested by Fabrice Fontaine

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
