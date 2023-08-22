Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040FEE49B7
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9876125C;
	Tue, 22 Aug 2023 19:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9876125C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1vUe4fagRTH; Tue, 22 Aug 2023 19:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E0C6124D;
	Tue, 22 Aug 2023 19:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E0C6124D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E48CE1BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0AD66121B
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AD66121B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGDpGxzcXIrZ for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:23:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B62E46120D
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62E46120D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E3681BF204;
 Tue, 22 Aug 2023 19:23:42 +0000 (UTC)
Date: Tue, 22 Aug 2023 21:23:41 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230822212341.490c9910@windsurf>
In-Reply-To: <043c43d7-63a1-143c-aa75-a0f751b2ef6b@benettiengineering.com>
References: <20230814145413.2099039-1-giulio.benetti@benettiengineering.com>
 <20230822202821.4b750d61@windsurf>
 <043c43d7-63a1-143c-aa75-a0f751b2ef6b@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692732222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVUKsGPdOFVbFMpunhDWzImLB/IqRFSfRoAfUQzyg+s=;
 b=bFb+RM83rJn6cgAL+H39+rEYVq+fKn5jjk2voL6H7Y17In2fewdt3yTxrmGq3racrosHPP
 owozfU0QMaInlv0N+vRx7ZnjbfPLPuHgvE6rzzbrpXu2kMOp7+JZdXIYjtHV3BfrkIOzlV
 5cWMlNnygmhKD88rS/8SQWq6odCwvC2Cvd6wvVbgbRBtxoLZWKIFjuXvFsQIWgEJ0fLYqG
 xTy83bmCh3MWihpeqtO2bTGWnhZ29AwiSnSvbAIq4olzPnPzv9VbCanNnmOfcWPAuTPe97
 +f3kHC5r5tQhUUHAY6wMn9a2r+82PZI7v6AStpr4RS0GSAptl7+r8o3kB8hPWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bFb+RM83
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.16.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Aug 2023 21:22:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> I still have that tarball, and indeed they very different each other.
> In the new version they dropped entirely the doc/html folder while
> instead adding some .gitignore file, the .github folder for CI/CD and
> a script called make_release_tarball.sh
> 
> They don't mention on their Github repository[1] they've changed it, but
> they did it.

This is annoying. Could you let them know that it is a problem by
filling an issue in their Github repo?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
