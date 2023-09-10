Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67CEEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A016D60F22;
	Sun, 10 Sep 2023 19:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A016D60F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOhAYF8-Mg86; Sun, 10 Sep 2023 19:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E342660BEC;
	Sun, 10 Sep 2023 19:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E342660BEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9E61BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6571760BA9
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6571760BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXcsdQrUi46h for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:09:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C4E86077D
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C4E86077D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 008C01BF208;
 Sun, 10 Sep 2023 19:09:36 +0000 (UTC)
Date: Sun, 10 Sep 2023 21:09:36 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230910210936.4b0c03c5@windsurf>
In-Reply-To: <20230902202724.3498579-1-thomas.petazzoni@bootlin.com>
References: <20230902202724.3498579-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694372977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCOiMITDhwH+MrxEjYLk/tuRVU9//cFBNBRAjPwfXz8=;
 b=OO1GZJaDty7DZfxPmTc9HkAANaWcuY04FAuZCGQSpwPBHE4VRuPlYj4Bp8pThhrJDueBs6
 WBROrMB0Ign48mglHP3zw3MnXPC0oiRKRFrIfaTCQa5dodXRPGtnG0lPscU/peD8FSj8T7
 tedJkiMhRpLWznqbDp/AzPhx6/0S2IQMIOkq16gugec72mHJDirbdyBjzoNbp80iGdjxOm
 2tDiznsnSqwhLtN8PbuAUZcTCt0tEnD/zyzqMl7CBpD+NMkDBS5Phok502Rh81BAr9DLy3
 lPuDuAqGL1uESb+6YfxNU9uvc6hOrupeNygkdPais7RNwSpMXl4bbxkgYFIGOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OO1GZJaD
Subject: Re: [Buildroot] [PATCH next] package/polkit: bump to version 123
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  2 Sep 2023 22:27:23 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> polkit runtime tests are passing successfully with this version bump:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/989945901
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/polkit/polkit.hash | 2 +-
>  package/polkit/polkit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
