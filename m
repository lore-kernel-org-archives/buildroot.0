Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D70C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 09:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BF840951;
	Mon, 31 Jan 2022 09:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzUTJ_5ZNvsi; Mon, 31 Jan 2022 09:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C73640939;
	Mon, 31 Jan 2022 09:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB6FB1BF2B9
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 09:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75BB60AE1
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 09:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_AVJg7_wJ-j for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 09:45:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B71560AA5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 09:45:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88434E000E;
 Mon, 31 Jan 2022 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643622355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVkHx6zquxBsyUaEde9PNOFHlzQYuNdFkqI0N9/yYwA=;
 b=CzQ46/qO0WuF2RGulow0VBH599mRszwQG+LAI1CtBOQnseVx9EX0Nep1uhXJULzmfjpfXJ
 avr/D+Ax8J7HOYuwrREXjXhmqJID3rkMLDG4E7fwEY2DfcL+9gz4o16RF6TQ/2f1oSz6Cb
 PQseG4yZVg9//xQfgbdfPa6+uFPJ1CxDti6B0rpuL6uDevXW+zlCZQfYaZ0xRNByw+hk1Y
 ZzRU2EDtUNcckgM7yt46rnmGAHuugDdxR54Slc5mZgalJpnQXh0RA3s4nnSqBRGzIu4M0p
 qClc2Tv8L42AS7q2YMT8eB+6EEF3o/n4LpP/QtsrPEdV9GH7/tzg1Ht84nMkfw==
Date: Mon, 31 Jan 2022 10:45:53 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220131104553.715b97ce@windsurf>
In-Reply-To: <20220131015937.4113728-1-james.hilliard1@gmail.com>
References: <20220131015937.4113728-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jan 2022 18:59:37 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This appears to be the latest version that has a working lld build.
> 
> Version 12.0.0 and newer have broken lld stand-alone builds:
> https://bugs.llvm.org/show_bug.cgi?id=49228
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Is this really enough? I remember seeing patches a long time ago doing
bumps on LLVM/Clang and that was much more involved, which I think
explains why we're still at version 9.x.

Romain, any comments on this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
