Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEB2C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D45F160BC6;
	Sun, 12 Mar 2023 18:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D45F160BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rctx8P4L2FvX; Sun, 12 Mar 2023 18:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2538660B65;
	Sun, 12 Mar 2023 18:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2538660B65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CF741BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED68B814A0
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED68B814A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hiCdqu3mzyT for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:01:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C208B81499
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C208B81499
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:01:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5BB740007;
 Sun, 12 Mar 2023 18:00:58 +0000 (UTC)
Date: Sun, 12 Mar 2023 19:00:57 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230312190057.13a641ca@windsurf>
In-Reply-To: <b6b9a05867d45fa2a8eaa5e349d3617e@agner.ch>
References: <674d788fda128807b203f3b1d8b407b5bb85948b.1677628527.git.stefan@agner.ch>
 <b6b9a05867d45fa2a8eaa5e349d3617e@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678644060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnPJAaTcm1ShCXog9nmVAidYrYDmINJlp10ixjNBV48=;
 b=VRuF7FykVtpaJQoJrhHX7EQH9qqc/L01mBW/4aLvEnKDajtHksD75NPR/8L78nbsR/oFY2
 Eir3RGOPWSQmtQ8beHJvBahJBFhKwOKiYjmBHYS8orOYU+tiJ60eWdQNMwtMlkP8xhEMRd
 3EPNoZOwaWc95diO9PZMwGj4qxJp2KZilXdWw7ZwG0ZZ5xnKmlf1OqWxdpaq9JTXBvxL8/
 4vVQSkIPW3c7bYJ8jsV7o9PQvsOqjSFmXbic1v30YCuK5j/1kKrsVFZ6VV9JozrJxFasX+
 WgJt07mAgLz9izZEMPiRWWCaIaWyh4ZXw4Nz+1d/8mwQP/702iZB2zxaTJ6eWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VRuF7Fyk
Subject: Re: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.66
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Thu, 09 Mar 2023 08:53:35 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Is that something which still can get merged into 2023.02? Besides the
> new features it comes with a whole slew of fixes as well.

It's really too late at this point to merge version bumps in 2023.02.
Peter is about to release the final 2023.02 today.

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
