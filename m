Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57D7C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60BF6408A5;
	Mon,  7 Nov 2022 22:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BF6408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ne389vuzcTZt; Mon,  7 Nov 2022 22:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A788E4064D;
	Mon,  7 Nov 2022 22:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A788E4064D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6F71BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B0E60BF0
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B0E60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wARGFjRkr3qN for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:17:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4D960BBE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF4D960BBE
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:17:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A715D240004;
 Mon,  7 Nov 2022 22:17:24 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:17:23 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221107231723.6035f030@windsurf>
In-Reply-To: <20221106155953.313573-1-james.hilliard1@gmail.com>
References: <20221106155953.313573-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t01py3fA+vSphydwReTCPYSwUoKNVVt/t987zaFdVLk=;
 b=K4VpsDU6YdwM8oshmQ5UtHxRkNLk+2LLclk851QWoTScXxlPPklLaWmjK+FO4AznZ5aDGo
 MpjF8Kk3ldz7HUloJd69me7ijzn6hC9JYLfb2KpSg4Yozvhs0FR6AjijPBLfB6snkyyCjc
 0MdvrWaepqTEuJ4aIOucNiGDKEsqaPMb6g6oGrDAZ90CBZIY9PswA75FegIezHqouzev3g
 Pab0e0xTKbBabqWMiHSCCNcgAY8aVbmUpodt8whprVBqULnK5F28GaxH87UqKhx25HlT49
 7zIYzUXDwE7j4jedJBun0zmqBwgKQWkQGsGfrBfiDUHCRLP9f/WBptLoO9fiDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K4VpsDU6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-spidev: bump to version
 3.6
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 08:59:53 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License moved out of readme, verified as still MIT.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-spidev/python-spidev.hash | 10 +++++-----
>  package/python-spidev/python-spidev.mk   |  6 +++---
>  2 files changed, 8 insertions(+), 8 deletions(-)

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
