Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F14C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D70B60B32;
	Sun, 12 Mar 2023 18:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D70B60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8BS6CS7dIhV; Sun, 12 Mar 2023 18:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1B060AFE;
	Sun, 12 Mar 2023 18:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1B060AFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDD51BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E793860AFE
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E793860AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2WbzTK0X6JE for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:00:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919B260A82
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 919B260A82
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:00:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 169F2C0004;
 Sun, 12 Mar 2023 18:00:29 +0000 (UTC)
Date: Sun, 12 Mar 2023 19:00:29 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230312190029.6989cfaa@windsurf>
In-Reply-To: <674d788fda128807b203f3b1d8b407b5bb85948b.1677628527.git.stefan@agner.ch>
References: <674d788fda128807b203f3b1d8b407b5bb85948b.1677628527.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678644030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UE6DFjzwYQ3PAL8vcztY2E7YuqOrahQ4DI/IgrwwBMY=;
 b=TJoWSQVXs4PKzKq/NyMrH/gZgIztyT8PBJAMBHqOzyAylWBkBPO0klLUtNhMWSLYOkfKTt
 8eYcXsIJKRg5YjRJYA2cBd+cxH+5pelJg8QMhsRVV7o1xq7hrawMt2UQLwrt4HBsUhepiT
 5hOn85wJ6O8CajqIfg8oSIiwBZTUbxu3+VIQ/rppJoPhMM8YFnVAJFSSeDThi7WEPETwIG
 cd4sGOkDoyaLDzSg2VOr4P/Eo1vUi8tFoI7eQfGkTGDc64chzgQLWge0lB8TNw7bypZAM9
 hDDY/7h8PvdsqJMW51rnvohLvflKfZe+ukt0x4O5HhUHA0s7KAB5tzEE863s/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TJoWSQVX
Subject: Re: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.66
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Mar 2023 00:55:47 +0100
Stefan Agner <stefan@agner.ch> wrote:

> bluez 5.66 contains various fixes and initial support for Basic Audio
> Profile and Volume Control Profile.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
