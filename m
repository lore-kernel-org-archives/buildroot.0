Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B8BC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FB181AAD;
	Mon,  1 Aug 2022 18:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0FB181AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXoh9o9stPuq; Mon,  1 Aug 2022 18:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB204818CD;
	Mon,  1 Aug 2022 18:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB204818CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8891BF29C
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45CF7405A6
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45CF7405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfJ1GnRvhhEB for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:59:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB88D405CA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB88D405CA
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:59:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8B3F240004;
 Mon,  1 Aug 2022 18:59:08 +0000 (UTC)
Date: Mon, 1 Aug 2022 20:59:07 +0200
To: Guillaume Bres <guillaume.bressaix@gmail.com>
Message-ID: <20220801205907.545f6693@windsurf>
In-Reply-To: <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-4-guillaume.bressaix@gmail.com>
 <20220801194254.118219ec@windsurf>
 <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659380349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHIAlwFwRlnCSBrRn6jIAD9I4yN8ick3BF7wBBgM+Eo=;
 b=KimyNq/Y5TGUF5AztYwhOMkxvjC9EY3sXWbZLS7zp5mZNBUHHEiv5fdHsaNw+BUJVMr7iP
 AlQFbXo4AiW2r0aUQWhfHBrxpsezh9VKrJm2m9+OhhqkqKAZnye+R2tyNaQr2jzSRjXhdN
 Dkoi25j5/SmhgRXchqNzh7x914cGXDkXl5gO+2aDHN3oM2TqUDdeH5Rk3rqgHvRRO4BK6v
 hnYNXMrLqwf8kK/A5eUMaOeaOCaylGRoqxCgqMtxnBnXdza+PX3MykyCUSh+A/+W7DA1zF
 FmpzDGE+bfarpjayE/VRp/+0AMMpxHcxWM0VRzdPLOc6vgkmMpNEEyzouE7RJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KimyNq/Y
Subject: Re: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: jmfriedt <jmfriedt@femto-st.fr>, "gwenhael.goavec" <gwen@trabucayre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 1 Aug 2022 19:58:23 +0200
Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> thank you Thomas for merging this serie and also for adding the runtime
> test, I did try to provide it but could not get it to work.

Could you give some details on what didn't work? Our runtime test
infrastructure is (I believe?) reasonably simple and straightforward to
use, with tons of existing examples.

The one thing that was tricky here is that most Python test cases use a
CPIO filesystem loaded as an initrd, but that doesn't work for SciPy as
the filesystem is too large for an initrd. Which is why my test case
uses an ext2 filesystem on a hard drive.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
