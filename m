Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B345EE49A0
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF74D81470;
	Fri, 25 Aug 2023 21:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF74D81470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnE-FzXS1e9U; Fri, 25 Aug 2023 21:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A2281491;
	Fri, 25 Aug 2023 21:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A2281491
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12D8B1BF398
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEEE2813D7
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEEE2813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPiROv_CR2uC for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:03:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83A8481331
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83A8481331
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFBCD20002;
 Fri, 25 Aug 2023 21:03:32 +0000 (UTC)
Date: Fri, 25 Aug 2023 23:03:31 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230825230331.36fde6b3@windsurf>
In-Reply-To: <87pm3b7z9e.fsf@48ers.dk>
References: <20230825101535.661486-1-peter@korsgaard.com>
 <20230825191851.41b3b155@windsurf> <87pm3b7z9e.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692997413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnhLdyneI2nZCQ+r7XfKCQSDEThh0iPvP2hsoQ0bkvY=;
 b=ZN8x50UESQSC6ZjkdWCyHiqbbBcXNMGUyY4ExcD3N9p1nLPrAlw31rsmX2NkHTJ4t2kyT3
 /5hkUCoravMmmEjvAOxa45VQKzMl3xvbG2cVh9WqQMGDZFZuQ7HhFPX1+QzyYxJ4GPOFNj
 Nz/AG4eyZb+V7FZS8LBKOrtbukhBSifBf6aPibDsUdpbuoqUlRUG7sJLAPqo8nP6rFrQ0t
 0eNWN1+d71qt0vA7v8XlsE/sjES9LvV0zDbj4ZjZ2dsCncstf9EE5yKXtvBMUBWaBHd32W
 tyNTkaKTN9CbpHmm2rrzV0QaNc+Dr2ymS4h5yI1a7GvFtNRkaTlSfcGqwXB8Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZN8x50UE
Subject: Re: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.17
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Aug 2023 20:28:13 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Sorry if that wasn't clear, but given that it fixes regressions in
> 2.0.16 (which is in master), I think it makes sense to apply it to
> master as well.

Indeed, wasn't immediately clear to me. I cherry-picked the commit in
the master branch. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
