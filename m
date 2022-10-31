Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6041FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADBD408C1;
	Mon, 31 Oct 2022 22:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADBD408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzpbCeXObKFk; Mon, 31 Oct 2022 22:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1524B408AC;
	Mon, 31 Oct 2022 22:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1524B408AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5BB21BF2B6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574B1408AC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574B1408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBEXFvh7ShJM for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:31:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DF54031F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8DF54031F
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:31:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C85FDFF804;
 Mon, 31 Oct 2022 22:31:35 +0000 (UTC)
Date: Mon, 31 Oct 2022 23:31:34 +0100
To: Christian Stewart <christian@paral.in>
Message-ID: <20221031233134.6d432abd@windsurf>
In-Reply-To: <CA+h8R2obmhk2WH2O5oxELnYX3k+ab1pP-zS-AJfpRmQcx_SxiQ@mail.gmail.com>
References: <20220904191010.200822-1-christian@paral.in>
 <20221031230227.222d7ad1@windsurf>
 <CA+h8R2obmhk2WH2O5oxELnYX3k+ab1pP-zS-AJfpRmQcx_SxiQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667255496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuogdJNnqa+GMpF+LMUylr3IJqJS6/h1/f21g6wiJaQ=;
 b=LLARE50/cnDDHeLQcUnXg2b/g4a8yVym3SZq5DwBsekCR0RRlFsjj4VzUz9YwOnFnlDs6d
 x0OtO7C6xFdLEzVRSW8dGJz31qc95wZFGrxn3szrNrdFdEr03bhye4JQIZzmoZDOjGJxDd
 PQrgZA7rdnAuMzGkPDs7503Qj9C3wTIt5r8vi+oPpoWd1iS6TRFlowqXlZlEIljhJ4HFzx
 VqGsM6rLTOgPKitTcEjD0gp3TafOMjWy9h+lThQbdxnci2k7pwWl+4mY1vCVwexox/cXWD
 PAijRhk4kOvSIOtDXsri2pkFJXXEmSYWGOtFYfXT7aBqoIgso+rbIRbb0ircpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LLARE50/
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 15:08:04 -0700
Christian Stewart <christian@paral.in> wrote:

> I can send a patch for that too, are you able to check real quick if
> that change above fixes the issue?

It does fix the docker compose issue, but then the loop of docker
inspect that waits for the container to be ready never completes:

# while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
Error: No such object: root_busybox_1
[.... until it gets killed by the timeout ....]

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
