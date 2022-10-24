Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6307FA373F
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 20:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7212D40339;
	Mon, 24 Oct 2022 20:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7212D40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBtVWJQkFHls; Mon, 24 Oct 2022 20:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A3F40331;
	Mon, 24 Oct 2022 20:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A3F40331
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E901E1BF338
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C401B812F6
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 20:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C401B812F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aib7DVYxVmLQ for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 20:55:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5018C812F1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5018C812F1
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 20:55:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4CFB240002;
 Mon, 24 Oct 2022 20:55:35 +0000 (UTC)
Date: Mon, 24 Oct 2022 22:55:34 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221024225534.53c42f53@windsurf>
In-Reply-To: <20221024104150.1470698-1-francois.perrad@gadz.org>
References: <20221024104150.1470698-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666644936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fV85xR3rVzYFle1XT2grkgWM01KOg6LxuoOZ9Yq8SY=;
 b=mCQcdweUu0KI9LxKXfHNcUWSyQ901T/IDY6sYBxYhmzdCupPbqjh7FE9K4gCKUtl2SlTWI
 bhNcDWBHtM8SdwDFlBRLsI6nDQDVPZ3VM7o/yoLbhXOrsGKcFUBSGy2TWXVAWpojlsCUsc
 mzdAsNiKYuxbcM4jwTn4vhEHmeIdmseKAEQNeJMesFwvetufGuxPZgyKRTwQlVIOokxxaE
 M05p9P2WFg2nwhnViQhIGDPvUkHbLt8xyhZH9/y5W0zy1yl6sviH9+FfN5Nbxzj1jGc7qH
 ymV8Roh0vY/lF1DrRRdHZlfxNqN1jUpekLo5+SR/q0sysEeoapXSc/TjzFNlAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mCQcdweU
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump to version 3.39.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Oct 2022 12:41:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
