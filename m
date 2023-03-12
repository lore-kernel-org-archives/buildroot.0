Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E0C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACCF41C8E;
	Sun, 12 Mar 2023 22:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ACCF41C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brsy31_iCc0l; Sun, 12 Mar 2023 22:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF8E416D7;
	Sun, 12 Mar 2023 22:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF8E416D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D839D1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B20DC60B22
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B20DC60B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSudmq8MWD3J for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:17:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A2C60BFE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55A2C60BFE
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:17:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D87F60002;
 Sun, 12 Mar 2023 22:17:23 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:17:22 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230312231722.7ab3d7c8@windsurf>
In-Reply-To: <20230312220649.288302-1-bernd.kuhls@t-online.de>
References: <20230312220649.288302-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678659443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyCnJ8NLCpVZDHT3+NGZ7v5x+hOm/liXSSs0kL0tNeI=;
 b=mRj+y2rRIkqdml7Jr8K30qnXvDUf/8y/4PqTKNnnNBvDPt0l2F6e3apUTWHKUPVL03JdDr
 5J5hEK4lj+ARwOYpVk6SyyV/5RAYCKe070AExLQI/fmrI5F7fj7L72p43+nLo62eVOFnnI
 5fnGkKYykFOf1Vf61r+6Sl/MUvsZlvP5RfGwAn92+dG+5EmUIQd9NPTj35f2NEihnlkRqb
 rK4TkJb+CAEguMz9FOi3KcwfnAs2DUIReB2rWHLOGPIlnaVb7TIj1hwvok/qdaygrEiNO5
 eYD7FQhi7SMHH777YtnYkYK3aHehl7mOwbVp/SoU201hgSgGqfOnS8C39k7UNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mRj+y2rR
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.3.4
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 Mar 2023 23:06:47 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

All three patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
