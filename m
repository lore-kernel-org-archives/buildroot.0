Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7311EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E70E61438;
	Fri, 14 Jul 2023 10:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E70E61438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nQAcamIXWix; Fri, 14 Jul 2023 10:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C643D61463;
	Fri, 14 Jul 2023 10:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C643D61463
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 822D01BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6FE421C3
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D6FE421C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WvucCjgFQ2j for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:26:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3DF421A2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB3DF421A2
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:26:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A1FAFF805;
 Fri, 14 Jul 2023 10:26:29 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:26:28 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230714122628.422f757b@windsurf>
In-Reply-To: <20230611104159.683078-1-bernd.kuhls@t-online.de>
References: <20230611104159.683078-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNpJb5bHBpyvoKzEWy0dj2ptUDYuvtUg0E+ADy6FLRk=;
 b=GKWt9w6N8jmbcGEpB65d2uEkNBfKtcr85COjbA+0ICLysADxKXXTAy71Lwd4Gu5/MtnbDZ
 hB01lNQkmOv1yauq0SKIzcTY0XNmXItKzgOlrbibmtZqYMO5ZtGt4+iFQlVzSfxJk+Iz2q
 oijygKgovuElIuz3liBXVVJezqOFOSdC32Wte+ZZLzDGhKL4TaHmCuoK2BmjUE6amdi22m
 21fkKAUiYp/Gqi3A611oB2TFL1zclJ/+a5Kzys9zP0qskZjny53/xyRwQ8RYrDNkHt0PH6
 5uyq+W/WWk2FoTRiC4FvflHOSq3fdcqCmq7prR45tK5jsWAe+FGPjVGfRqQ5Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GKWt9w6N
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: bump version to 2.39
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

On Sun, 11 Jun 2023 12:41:59 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39-ReleaseNotes
> 
> Removed patch which is included in this version bump.
> 
> Updated license hash duu to upstream commit
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=faeb1b64b36ededd1a0b62555cad65f002d47ac6
> adding the BSD-2-Clause license:
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/diff/README.licensing?id=faeb1b64b36ededd1a0b62555cad65f002d47ac6
> 
> Reformatted UTIL_LINUX_LICENSE and added BSD-2-Clause license.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .checkpackageignore                           |  1 -
>  ...improve-dependence-on-NS_GET_-ioctls.patch | 34 -------------------
>  package/util-linux/util-linux.hash            |  6 ++--
>  package/util-linux/util-linux.mk              | 10 ++++--
>  4 files changed, 11 insertions(+), 40 deletions(-)
>  delete mode 100644 package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch

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
