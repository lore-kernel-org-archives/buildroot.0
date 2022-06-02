Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E94CCA478
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0068560FDD;
	Thu,  2 Jun 2022 14:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNyeqerZajWl; Thu,  2 Jun 2022 14:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A6560B65;
	Thu,  2 Jun 2022 14:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 022251BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F29DA40FF5
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5J6rv1VzL_9 for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:02:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E102D40B59
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:02:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B80CD100009;
 Thu,  2 Jun 2022 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654178528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJyfOtQBl8QXCLI+6Eu38Bz99y9xRITRA9UwWNDSXi8=;
 b=X7qKNkWTgTlW8+Hl27jVlTanPIcUhIoN3mdKF4mOh+j3BGDNe0WrNCmKREwMlqkZfZnzoY
 Ioc2n/zDiSTWlDr0RM3/GHBSsY7xcJh3snMxpcngsTFvtTdJJkHVr6nyITkdsuTZguV1vU
 MQJS/DUn5kenELNUCids8WC6ZPd5A4UsLIu7qTBhVE3hoBixfzThiH5Yglmgz7qizqGrwc
 44QZycI5EXIJSSKr9AlL1KuUsyGxN/q6CKwr0MwGBszC2h+ff5YSl9IvzmCmdiqyYX8IQk
 EzPBUKryr4SEDGxL7f91GPw7FC0vGoGEDtv5LhqchnlcwEcOZN4+FLvOCTfiBQ==
Date: Thu, 2 Jun 2022 16:02:06 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220602160206.1cb8273e@windsurf>
In-Reply-To: <20220522143027.1258744-1-bernd.kuhls@t-online.de>
References: <20220522143027.1258744-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-vfs-libarchive: bump
 version to 19.2.0-Matrix
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

On Sun, 22 May 2022 16:30:27 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
>  package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
