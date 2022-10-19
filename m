Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3389CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 16:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAB2E40DC2;
	Wed, 19 Oct 2022 16:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB2E40DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skwz0zXvW02w; Wed, 19 Oct 2022 16:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C7EB40D73;
	Wed, 19 Oct 2022 16:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C7EB40D73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE15E1BF283
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 16:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 738A784045
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738A784045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YE-f8EWHnWtP for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 16:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B8784023
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00B8784023
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 16:15:08 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D8F6240004;
 Wed, 19 Oct 2022 16:15:06 +0000 (UTC)
Date: Wed, 19 Oct 2022 18:15:05 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221019181505.37f9c2b8@booty>
In-Reply-To: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
References: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666196107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrtwpKFlKHgORemNHBcLha4NqaEjUf1NOdYjFi6lUys=;
 b=CvEf8oX5Z462OrW+D5TnyWXMCz72mFqsLVT9jS0QwUGpBvtTcHYR4JMTBCusxkVPQS6ruL
 JESs7d+OWtZIIk0Q8X40t8dAIhMUaxhh6O+mMJGFaoelN3fIAzWMd0X+oqwPORuboqKMpU
 Omiao1lMhYcGZpcPo/KAASdhRb932kKVRw6HaOp0PT4tkUwHNNDyTBoqCIT0hMFl/aR47s
 BRLlOf2OVNMirCjc0F2Nd9ZTptnnWUQANc/51KiLXLFWy9Kk3HPylkUSjWocameDCXjznt
 CbrkTInluNQpp5cwsQPevYe0Mh2e8xyykh1OZF81sP8OZG4Al8SR7jj9kMy+YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CvEf8oX5
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong
 description in Config.in
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Wed, 19 Oct 2022 15:48:23 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This rtl8188eu driver is not the same as the one in mainline Linux that
> still has pending work to be done that in this driver is done, check:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
> specifically:
> * Switch to use LIB80211.
> * Switch to use MAC80211.
> * Switch to use CFG80211.
> So let's remove the description that is not valid anymore.
> 
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
