Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D9C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C81B41891;
	Thu,  3 Nov 2022 21:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C81B41891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDEFV0ijof47; Thu,  3 Nov 2022 21:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0B4418A1;
	Thu,  3 Nov 2022 21:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0B4418A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCD151BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9858B40BC6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9858B40BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoUxw7f6NKwV for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:09:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8138E40BC0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8138E40BC0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:09:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77C8360002;
 Thu,  3 Nov 2022 21:09:09 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:08:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220827.49c5da70@windsurf>
In-Reply-To: <20221103204643.1608896-1-james.hilliard1@gmail.com>
References: <20221103204643.1608896-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYuqiFiF5vu8fZGptjLaGTbuAdXl+GvFsOTHwtRSLOI=;
 b=A7D3ADCwUdA6WEiyQ3pHKnyuuDG6kM0a+cnSrqDnjEmlAfZA/P/NNcju6Rw2Gxw6ssBc4m
 H8MBusUZD22WvkcVOJ+0lpeqB8MdeC4IsAwHDYVSTuK3RvthypHy3sKehVPw+/tl/goJ6a
 pfbQOfjgLuj0lWtdIFrBjNb3pb17+oW5oVig45m4ASifX+a9ALxGl+6OQ6rwoWxA4aYpWB
 UVZS0Kf4tvNxZdzxgFxL1rj9NMG1MF8GiZUZt45VIYezPap5xSo68WsgWLZw7Z1b7c4/3t
 AOCW6gw/g/G0B0WfsL9qN+/RGpZlE45UMCNzeLcIwyZPDHc3o0kTQTQxTBfyZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A7D3ADCw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-websockets: bump to
 version 10.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 14:46:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-websockets/python-websockets.hash | 4 ++--
>  package/python-websockets/python-websockets.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
