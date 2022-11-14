Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740BFC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D17204086A;
	Mon, 14 Nov 2022 22:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D17204086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ARAaTIR3GBn4; Mon, 14 Nov 2022 22:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB5C74086B;
	Mon, 14 Nov 2022 22:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB5C74086B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB9D81BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8956881378
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8956881378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31eiBrewG0I7 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:12:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6258380D4B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6258380D4B
 for <buildroot@busybox.net>; Mon, 14 Nov 2022 22:12:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D35640007;
 Mon, 14 Nov 2022 22:12:45 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:12:44 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221114231244.157a837d@windsurf>
In-Reply-To: <889889d8be793f429c3a36717502136a69b6abb4.1668061717.git.baruch@tkos.co.il>
References: <889889d8be793f429c3a36717502136a69b6abb4.1668061717.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668463965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ed+CWMXRWS9xkWE4EU595C2QYmayZTJR+l+tAmhuJZ0=;
 b=WnfzsirJwFzrDzZY0dCectSlMEdhwkT4UqXG9YxrNgPoiGjCRkCdp3M6a+Z5k1HLimYedp
 464n+YYIv5yUEhuxI79ykb7tKREbhaFxZz/pG3L6CGtz62bpcODbhx/FFOGmosXv7RJ6s0
 WgoBgY9ZImy/lBiOt4b0bxKGepctvfNIxPzi9bxM6BN49N7DZalTG+G5eHL8iE0/9MJhTm
 yZACM0KpnLuF69IxRPDAtUTIMIF6Mf2aScaI6L9kD7Q+L9SqnCd3vk+FiRqkpUEkGvBD3V
 mmWw54VD2LN7JGHz/6Ej5lUDC7GRWJQ2YMgAAKZGfBBcfzpT0Sj0bT0ub/yI3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WnfzsirJ
Subject: Re: [Buildroot] [PATCH next] package/uhubctl: bump to version 2.5.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Nov 2022 08:28:37 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Update LICENSE file hash for copyright year update.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/uhubctl/uhubctl.hash | 4 ++--
>  package/uhubctl/uhubctl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
