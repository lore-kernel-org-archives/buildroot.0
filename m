Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4259BC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E668781ECA;
	Fri,  5 Jan 2024 13:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E668781ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bixgG3TfE8ij; Fri,  5 Jan 2024 13:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB5E81EC8;
	Fri,  5 Jan 2024 13:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB5E81EC8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61E1A1BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38981436BD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38981436BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkrt-oDW7UpF for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:14:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1716435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1716435DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F7F840008;
 Fri,  5 Jan 2024 13:13:58 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:13:57 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240105141357.42c31ac3@windsurf>
In-Reply-To: <20231104183723.2bb97efb@windsurf>
References: <20231104183723.2bb97efb@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704460438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9gFDMPrEj0IN/SeDQnii8F3yYRkvS/T31AxLa1SDO0=;
 b=HDUa0cd8g82+0V3KZbbp2nijaK15+4kFo64YLgKuq4Ka+hyY7Ru3T3YGnbABC2K85bwVIu
 pQqfQq0SVNkByEiB8N6woJnvRP0awtB//q68lSbB6fg6xySgkyA5EPZtyZQnLk1ULFPDpp
 juuFU3+vFirmt86kvYqZMVzUmrhU4J8gMZTzz8M0QxAMFObiGG6PRp3o6O3cs3lSzoznbc
 UUNvbUNM1EbfYcPvXMSkYo+jZRDEXSQs1VB8q5KhWya+BwKnP4nje0NBlGuuWC5MO9ZOjG
 OxjZW+mMMScOyKfYs7RneffJoXCeZ4QsWdt0HaK3WJa8O+0kdBesjKNaH1YpJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HDUa0cd8
Subject: [Buildroot] Reminder: Buildroot Developer Days at FOSDEM 2024: Feb
 5-7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This is your reminder than in exactly one month, the Buildroot
Developer Days will take place in Brussels, right after FOSDEM.

Hope to see some of the Buildroot community members during this meeting!

Best regards,

Thomas

On Sat, 4 Nov 2023 18:37:23 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello,
> 
> FOSDEM is taking place once again in Brussels, this year on February 3-4.
> 
> Right after FOSDEM, we're inviting all Buildroot contributors and/or
> developers interested to participate to the Buildroot Developer Days, a
> 3-day event to meet with the rest of the Buildroot community and work
> together to improve Buildroot.
> 
> See more details at:
> 
>   https://elinux.org/Buildroot:DeveloperDaysFOSDEM2024
> 
> The event is free. Attending all 3 days is not required. If you want to
> attend just 1 day to get a feeling of what the meeting looks like,
> that's totally fine.
> 
> Registration is directly on the Wiki page. If you don't have an
> eLinux.org Wiki account and don't want to create one, you can either
> reply to this e-mail or contact me.
> 
> The exact location of the meeting in Brussels is not yet defined. We
> are working with one possible host company (not confirmed yet) and will
> announce the location when it is confirmed.
> 
> Best regards,
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
