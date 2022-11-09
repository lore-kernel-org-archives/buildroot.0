Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06080C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 22:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A63CA40448;
	Wed,  9 Nov 2022 22:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63CA40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdenbdF0kILn; Wed,  9 Nov 2022 22:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1AC3400EC;
	Wed,  9 Nov 2022 22:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1AC3400EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BBBF1BF308
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E69B080EF1
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69B080EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQOIA0TpduGT for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 22:10:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94778128B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E94778128B
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 22:10:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AB73FF804;
 Wed,  9 Nov 2022 22:10:04 +0000 (UTC)
Date: Wed, 9 Nov 2022 23:10:03 +0100
To: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <20221109231003.2b3387bc@windsurf>
In-Reply-To: <3d7721bd-ab21-89b5-61c0-0a729442883d@grandegger.com>
References: <3d7721bd-ab21-89b5-61c0-0a729442883d@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668031805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9j0sdO66JlbcVzO0Y2JGd4tdrrHo95LrOeClSB6YbHU=;
 b=TYOgV7xCPAypFZZbC8EaajfZ0twQ2vpkb/FcQkc4dphtVx6wJ+Tgb1aee8+2yjoz7oWVXJ
 BtcH371hP9LpY1aWqwnYbsv5kkAuJN6L/g39ILeZ+jNA0UQXNOzUT3toAR76Z38gO1uS7o
 JJ2d/qxVYYkG8irRhfVpJkcCbfHohJPUpT/L+SOazFjlmrQ75iuV5RI/YftnuHf6aOFheQ
 Q3+bN27THQjXFuoQx4qWQ+EL9yfWuh9PjVKjyhbKQZxN4ReVj0h1SoBT7aJnuu4pKHR32x
 ndaRo5rFVTgrJzdKvNY+E+T+G9psc4GNytd4kJX887G3otrBjwsVAsPKHMg1rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TYOgV7xC
Subject: Re: [Buildroot] [PATCH] package/udisks: fix the tool name in the
 config help
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 8 Nov 2022 18:19:04 +0100
Wolfgang Grandegger <wg@grandegger.com> wrote:

> The name of the tool in udisks2 is udisksctl.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>   package/udisks/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

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
