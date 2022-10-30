Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7FBECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9DB9403AA;
	Sun, 30 Oct 2022 14:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9DB9403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2JZkT5aV-IH; Sun, 30 Oct 2022 14:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE3C440441;
	Sun, 30 Oct 2022 14:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3C440441
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D18C1BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4335640345
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4335640345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0rtcurKwHLO for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:06:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE35402C3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CE35402C3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:06:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21F3060002;
 Sun, 30 Oct 2022 14:06:54 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:06:54 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030150654.24260b34@windsurf>
In-Reply-To: <20221029012704.1399837-1-james.hilliard1@gmail.com>
References: <20221029012704.1399837-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4KeM8p7yCxi5v5Ct30AIc93rwQpimr/PzsfE+Lw0yM=;
 b=o/J49rdZS7m9Q+ubqM2HMZ/weUENjo/McyYxhldSzCv7wvG2W1NvQ/NB2mZBEp9Fcscr/b
 8FAuMexmvmWNh4OWXPSKRdnNRafUTFRxD94V3Buym+RTDphFjsv3y36yeVZ/sMp9T+XIfm
 vu5uxhLR6tqkCphMplkXeDDRTwzezUVCJfZ+gqbLtaaR6tVPxnZKPovoMzZ+6F17osz4W7
 9FqJusqRccPTEb9JZCHGJJWDMKTsUOGNXhzR6+ESSpmv02SgaTyQ2c6UzkXYdMI6WgZrZD
 pDsC5WTNtFW3ne9uM5lqehdmG4NyAE+70MdgIHhWYSAk26Hqe1V8HdwAp+T1tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o/J49rdZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump
 to version 3.0.0
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

On Fri, 28 Oct 2022 19:27:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
>  .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
