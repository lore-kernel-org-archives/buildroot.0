Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEDAEE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC05E410A7;
	Mon, 21 Aug 2023 13:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC05E410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGQALbqoz5Wi; Mon, 21 Aug 2023 13:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F216E410A1;
	Mon, 21 Aug 2023 13:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F216E410A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 991051BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6511360E48
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6511360E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeWOl9HLgTxo for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:50:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3972460E25
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3972460E25
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95CA4FF806;
 Mon, 21 Aug 2023 13:50:48 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:50:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230821155047.3f8b7257@windsurf>
In-Reply-To: <20230817191532.106855-1-bernd@kuhls.net>
References: <20230817191532.106855-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692625848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ewf7+FU/4EFYHySdyeOsR2wk1AIqKu25zKIV1GZt9IQ=;
 b=dlubkFpGCeN2Lfsme6baeYbXyCCorwsuldpZ4THeMqR+jcyfM9Liw/CBQ0A5MtHC5YiDi1
 KZI8PLjxlgtENA6y/HTf1nEysR01Vsu36vxqOG8IQmXxBllJ2sQhW7DMlxPCHYq2NoQKhy
 RhDPLbpoVdnMaecT2piqJ7v4GM9PANSlliH/cyBbhjK3XDBQtRVld3n4HgPdI10QuYCkXZ
 mX/0IG4yW+h0HVhAWZtrAqgLx/pyC1E//mnm6aZor2MKPkd7RKWX8hdwyhzjXf50ifZlx1
 n+7l26b5wwwj54++oji5Q8RwGuS7PhNwVZFMJdAPE2ytrfAQs4tyNIQvu3Bzpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dlubkFpG
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cmake: bump version to
 3.27.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Aug 2023 21:15:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://cmake.org/cmake/help/v3.27/release/3.27.html#updates
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
