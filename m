Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235BAC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA4583330;
	Thu, 28 Jul 2022 07:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFA4583330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZT4QkVTkZwc; Thu, 28 Jul 2022 07:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D525782D0C;
	Thu, 28 Jul 2022 07:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D525782D0C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 758C31BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FBF082D0C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FBF082D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZ9ZmPBfr55H for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:35:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332058249E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 332058249E
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:35:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2CD1240002;
 Thu, 28 Jul 2022 07:35:23 +0000 (UTC)
Date: Thu, 28 Jul 2022 09:35:22 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20220728093522.2519239a@windsurf>
In-Reply-To: <20220727222918.1411727-1-m.niestroj@grinn-global.com>
References: <20220727222918.1411727-1-m.niestroj@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658993724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrvP2Xy2QcARddBm9yWi1VpdQOUKadDJ7wo9k3H62K4=;
 b=jwwb1Rn03MpJ5t7Ps+/Pwgr/twZ7zy/fVMtV6zTuML9zCS17RlHZlU0qcVKJhkzkPmqyU8
 Y8KRS+EnlaXWOQjMcx47zM0ipwcAg/zGHG4fC6uClJMkok96BWtaCdjkW5L2dA92iOlNus
 Xo13OLh0GG3RtntBkSrAqqOdVLqdZ5YGAEobFxnffPusPnDepOBYaUJmTEoB7/cdOb+R9T
 Qwtx6o8IF7WH0gtx8tFumQ3ZsnLWtEcORp1/MkZNu68sd80SN6C37z30SF3iQTrV4n5Cu7
 pJBHJrkLZgipRhAPBeqR55cpqGq6JR1twgTxtA4TfZawTkyszV6/MtuZKSVMjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jwwb1Rn0
Subject: Re: [Buildroot] [PATCH] package/python-pytest: bump to version 7.1.2
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

On Thu, 28 Jul 2022 00:29:18 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> There is just a starting year in licence file now (see [1]), but licence
> itself did not change.
> 
> [1] https://github.com/pytest-dev/pytest/commit/ed24f29e6017183ea22f3136aa180a8e3280cf8a
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/python-pytest/python-pytest.hash | 6 +++---
>  package/python-pytest/python-pytest.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

This changed raised a check-package warning due to the spacing used in
the hash file. I fixed that up when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
