Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20B1C636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 067AE81FD3;
	Sat, 18 Feb 2023 13:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067AE81FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUeTWjs9fOu8; Sat, 18 Feb 2023 13:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 537BF81FB0;
	Sat, 18 Feb 2023 13:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537BF81FB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 905881BF59F
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776A260BE3
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776A260BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCCIBH9bs1vg for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 13:19:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18F4360812
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18F4360812
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:19:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2618220005;
 Sat, 18 Feb 2023 13:19:39 +0000 (UTC)
Date: Sat, 18 Feb 2023 14:19:37 +0100
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230218141937.60c307f7@windsurf>
In-Reply-To: <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676726380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCdZ6hjN55N1d9eE/8wVrYMyaLGCB0KX8S9k3WXFRxg=;
 b=msNyKLEVUnT8ljTnpgpcJofa1LnltkRS7HG4oQDPd8gJgtosSzaxHt8fGzlyaTh3QqzQdX
 f8nWY6RpYKYE8DUXNcIuesONymk4HxluAG1X6rOEwoaOYcBgO/OKTbBCdT+bOAJC2XE1s+
 S0QS6XvNGbB9TIU4Pn/5535FHo2z9w/M3okFimZiX67rsoXezRW2LAuH8KpctCpVSo0xoW
 7mWt8+X8alwi72+BsG0geoXS5QkG3TQfqfsCxl7u83gDVcUII3R0/uJWAlbUX7nWMY090Q
 f9bHUjUpyLttSrPCMU8g5vYcP6nhmU9ijN8YLD77f/Ziqh3t8cWeHRttbloZDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=msNyKLEV
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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

Hello,

On Sat, 18 Feb 2023 13:54:15 +0100
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Thanks for the update.
> 
> I was thinking the ca-certificates package will take care of this. Maybe I
> was wrong.
> 
> So, how should we add local CA to the trust store in the target?

I am not sure as I'm not super familiar with that aspect. If what you
need to do is to call update-ca-certificates during the build, then we
could potentially build it for the host, and run it as a post-build
script. Of course, this assumes update-ca-certificates is capable of
doing its work on a root filesystem that isn't at the root.

Do you have more details about what needs to be done? With more
details, we could probably give some more useful hints.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
