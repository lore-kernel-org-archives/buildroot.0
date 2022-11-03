Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4841381FE7;
	Thu,  3 Nov 2022 21:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4841381FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9UB5GKO9gOt; Thu,  3 Nov 2022 21:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC6981FC5;
	Thu,  3 Nov 2022 21:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EC6981FC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79A291BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 557E861051
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 557E861051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTzMGhV1ioom for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A1861074
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38A1861074
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:08:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C757560004;
 Thu,  3 Nov 2022 21:08:55 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:07:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220756.06b4b7f6@windsurf>
In-Reply-To: <20221103203400.664382-1-james.hilliard1@gmail.com>
References: <20221103203400.664382-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMSDot7KOp3ucdElJ6YhU81v1UsU1+ha6M6PqD69rIg=;
 b=UQI5ze5AeH3tvTMnaLliKMvKsXXhcMeDxmqHVFp+ihHvOC38zqPpC9EghEhybom9/osuUv
 PSjUMB0PlbjrIQUi61K8i+MWBim0DV4JCSmpMNX3cbOeUy6lmiN4HJ0BAamuaH4xXTIXg3
 jtB4LJpoa1WBdqt2iRYEWkG8IMbzyFuov3FmOqS2kqb0sEUmTiuxtvSvSYStLpw+uzVp73
 0fedqtJ6fuX/KXbyrd819ne8KFdR1xfeFmfH9GHD2X+KKIvK/obhoS17WqNH6ODhCAmseR
 IDvhTYU6egdsEjUy3zOd4axzX8oKadjf/oIrysX8KEYwl2TmcVms8onRd0bO0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UQI5ze5A
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wcwidth: bump to version
 0.2.5
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

On Thu,  3 Nov 2022 14:34:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to format change during move:
> https://github.com/jquast/wcwidth/commit/4baf950b88a28a9fe21d132e088b4ffc58e66276
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-wcwidth/python-wcwidth.hash | 8 ++++----
>  package/python-wcwidth/python-wcwidth.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)

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
