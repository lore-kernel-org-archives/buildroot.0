Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE45EC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4714C4091F;
	Wed, 26 Oct 2022 21:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4714C4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqP5MXP_1lLY; Wed, 26 Oct 2022 21:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4011640915;
	Wed, 26 Oct 2022 21:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4011640915
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE33F1BF31D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66B3140588
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66B3140588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNEluL-YHoRT for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:28:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E9D400BB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E9D400BB
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:28:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC6B9FF803;
 Wed, 26 Oct 2022 21:28:07 +0000 (UTC)
Date: Wed, 26 Oct 2022 23:28:05 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221026232805.29f33605@windsurf>
In-Reply-To: <20221026220009.12ec01ee@windsurf>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-2-tobias@waldekranz.com>
 <20221026220009.12ec01ee@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666819688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IdHSs1Rg6I/nFSmm1HabnXnF4YCxepbzBJbRTsOjjjk=;
 b=iFG1HAPY6Kfsi4ITcIEeqp2J0OVd4owJzkYkNUL6wAKAHN4EjPds5xVAiKMF3B62OpT7Vk
 3TWLUQhv+Cj1BSosVa9YtANbVO5Xb4dhpPSO+15AZM5LaYaQizPjIPcIg6ypOVTUnDjm1g
 tR31YyjLqHjvVTQ6t7ZsoG18TnHmqaVtKx94pE3QVZLULPZfqxvTyW1K6vPghX3jsa1pOq
 g6pHMdRPXUgyb8ogwX4rreYfqZ0FCLYuCTDuR4B9D8xydouJoqHX4TV8cX1W76SR0x471p
 xzpQohcBAP+1IeuHvVoggAY4navyUHOx/FgCjYrWN2FpremKwPDr42YWLBnCtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iFG1HAPY
Subject: Re: [Buildroot] [PATCH 1/4] package/libbpf: fix cross compilation
 for 32-bit targets
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 22:00:09 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Could you copy/paste the details of the build failure that was
> occurring, and provide details on the context it was occurring?

By building kmemd, I figured out what the issue was, and it's now
clear. I have applied your PATCH 1/4 with an extended explanation.

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
