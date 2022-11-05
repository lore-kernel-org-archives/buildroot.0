Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB70CC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB1160AEC;
	Sat,  5 Nov 2022 22:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB1160AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbwxIe_y2JmN; Sat,  5 Nov 2022 22:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A02B860A7D;
	Sat,  5 Nov 2022 22:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02B860A7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 997591BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 732E4404F7
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 732E4404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1Pbsb24gfpP for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:34:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC55404E9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DC55404E9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:34:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B9381BF204;
 Sat,  5 Nov 2022 22:34:02 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:34:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221105233401.3313f9f4@windsurf>
In-Reply-To: <20221103212156.298989-1-james.hilliard1@gmail.com>
References: <20221103212156.298989-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667687642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuwEjf533DZmZKXCFVQsLffjY6ra5gB1N95ix/eBJtE=;
 b=GB6w2DI7FwW3VTEd5Xa1MZ5JCx0hyKjcEaMVIeNFs9yCyHlAeBKH5y+QY+b5d7Zzgffkk5
 HGVwR6o56++MBVdIKyL6xji2aemIeaj5ouh40jlzYNB1KLqqW/1qbBe2a3Ebzjtodqca9y
 +lU0DBO8c7TvWM1A0pP8ahZTQB6qaOj2tUMDGVD/WYU+BIbUw3T9UA4nXlA7BP2rI9PYNb
 Sq8s12bn2+4Rwpg2eSFDNYfeh9o4y5CrnOovTNaXm+Wq/Nlw+B/IRF8/verhDCSaVWDxQO
 cj8x0QscMGs/l+NwUTpgdo3TYqmULbcq0/GoaepbQP+1yIOnU1nw7GIMKT25hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GB6w2DI7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to
 version 0.39.4
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

On Thu,  3 Nov 2022 15:21:56 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new async timeout runtime dependency.
> 
> Verified license is still LGPL-2.1+ after hash changed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-zeroconf/Config.in            | 1 +
>  package/python-zeroconf/python-zeroconf.hash | 6 +++---
>  package/python-zeroconf/python-zeroconf.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
