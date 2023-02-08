Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918AC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 12:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35ECC8140C;
	Wed,  8 Feb 2023 12:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35ECC8140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwQ4SRDfQFse; Wed,  8 Feb 2023 12:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CCC38140F;
	Wed,  8 Feb 2023 12:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CCC38140F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38FBB1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0424B6107C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0424B6107C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rw_OWv4YqWQZ for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 12:54:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59D461097
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B59D461097
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 12:54:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD853FF807;
 Wed,  8 Feb 2023 12:54:03 +0000 (UTC)
Date: Wed, 8 Feb 2023 13:54:03 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230208135403.1a419032@windsurf>
In-Reply-To: <20230107153156.26347-1-ps.report@gmx.net>
References: <20230107153156.26347-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675860844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rN5Tdv8WNATKjk7v/yUOG1R2M2E19FtDwGGcVJ5+V8Q=;
 b=dqHJT5RLRs1GkhZbJsD8RoY9M8ywL2gSQdsJ5KL5gRhXQr43n8LkUpLVZ7UJzt4yYw6SuR
 qWGKCszMPKuWbyRWHnVQOafYhUk1pSm+SHRf0X01/HeOf9Fsq+4PgFCyuirmlY29Kl3QYl
 KmpDyhZIv6IRMpyaQ+YcCwNImRfb8Nnor11BGK8LBZ0vROShesHx4A+v2fF8JORDBxpPth
 P7cLWsKIcx/LlN1Pnk3HqChEqgxULeqB/lce3qp9qyp5HSwnggfRiW7baOznUl/AWKKSVI
 jZac83y8b+m1ysk0fvTOJv5ZBi8rFlZz1ACOm7+C12Sh6BK+DOhnN9wRXqWdTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dqHJT5RL
Subject: Re: [Buildroot] [PATCH v1] package/qt6: bump version to 6.4.2
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  7 Jan 2023 16:31:56 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1] and [2].
> 
> [1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.1/release-note.md
> [2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.2/release-note.md
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt6/qt6.mk                           | 2 +-
>  package/qt6/qt6base/qt6base.hash             | 4 ++--
>  package/qt6/qt6serialport/qt6serialport.hash | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
