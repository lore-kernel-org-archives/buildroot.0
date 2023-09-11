Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340E3C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E078E8127F;
	Mon, 11 Sep 2023 20:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E078E8127F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4eN_3888krs; Mon, 11 Sep 2023 20:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E4281220;
	Mon, 11 Sep 2023 20:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E4281220
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C66991BF357
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB5B400FE
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB5B400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfykZKH2Xl3I for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:08:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91B2040158
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91B2040158
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1F611C0012;
 Mon, 11 Sep 2023 20:08:28 +0000 (UTC)
Date: Mon, 11 Sep 2023 22:08:27 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230911220827.0330eb1b@windsurf>
In-Reply-To: <20230911035202.51266-2-dalang@gmx.at>
References: <20230911035202.51266-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694462932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omITyceY7chjTBpSYeKrCAPDI9LsBOHPycd/sMXvza0=;
 b=dD2PbuFH3CruYr0DeCj3d/RCXoFpthKYGIUnkUgUGc41GpqhUk3yMoSwgjRqG78nfwSUoi
 B3otxgtoDS7O/iu2nNeiyAUbb5gSd583B/dQAmuWN4ShjR3I7uvaotEryU2Bl4lTyusASa
 1NSf54/4vOuKn6BY5bO/ZxvijYssYUDqdM5jDVtoAIwLjFM5h0vuJjnUWC8nDezReaZspD
 6qBZhjUzzDk0ZVG0Nfir9Uu5rS+17/cHjwDQTOp6rypOM/PadT5MULwuxhopCV0wlJ06t6
 6FmWRbVlW94vhfFCC0wxBYFxUbWxnJ7cOH7CjP+WUUhEJaeGuiFcB8RmYbcUeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dD2PbuFH
Subject: Re: [Buildroot] [PATCH] package/libxcrypt: drop upstream patches
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Sep 2023 05:52:02 +0200
Daniel Lang <dalang@gmx.at> wrote:

> These patches were backported (47b7947 and 7dd5233) before the 2023.08
> release. Meanwhile the package was bumped on next (be5e4a1) to a version
> containing these patches. Therefore they can be dropped.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/7f7ec74e80cd1ab782d87f5db3e4631c12611101/
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  ...ommon.pm-compatible-with-latest-perl.patch | 50 ---------------
>  ...ve-smartmatch-usage-from-gen-crypt-h.patch | 61 -------------------
>  2 files changed, 111 deletions(-)
>  delete mode 100644 package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
>  delete mode 100644 package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch

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
