Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2028ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1116161125;
	Sat, 17 Sep 2022 13:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1116161125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufVb_BY35HfX; Sat, 17 Sep 2022 13:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5797C61124;
	Sat, 17 Sep 2022 13:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5797C61124
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 974E71BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D8441DAC
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D8441DAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihODtWdmwtFR for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:27:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8D041C06
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F8D041C06
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:27:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D19CC240005;
 Sat, 17 Sep 2022 13:27:03 +0000 (UTC)
Date: Sat, 17 Sep 2022 15:27:01 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220917152701.753bcefd@windsurf>
In-Reply-To: <20220914192655.899570-1-giulio.benetti@benettiengineering.com>
References: <20220914192655.899570-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663421224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztxNPyKz0XUSu81DnLo2tyjfR/lUV4mX1QJZHpVI2Mk=;
 b=UzHCn/wrbxKDadjcGYuDY9D4MRbl+9eVZSuwdIyGNixilfj5e/7AViuTsy964NobZ7hhbJ
 GposGVkclX48JmARxKZl8mzRwSr/wiyEyfYZ3mQOpgoF5jEkpi6AwTlMQfG5bKEvKepqv/
 WriMb4g9KajnA0k9Fv5d3a1tcWKw47E0p7ikEMaDjopTda9XoHrYRcsvs9ajgVTq9tIC/8
 PdIYgvG+PH/X0UV4NfHjDPZScztFpt1igaxFma1K3orFvnRWk9Nov9M3sGszVXaTRkr6sw
 h8DfuXS4w7CcHWshLIWC2rILFkGIx6swUZ/THUx70VWPMtq54rUVG64cWpSDQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UzHCn/wr
Subject: Re: [Buildroot] [PATCH] package/python-uvloop: bump version to
 0.17.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 14 Sep 2022 21:26:55 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/python-uvloop/python-uvloop.hash | 4 ++--
>  package/python-uvloop/python-uvloop.mk   | 4 ++--
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
