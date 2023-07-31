Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67E7C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEA3610B7;
	Mon, 31 Jul 2023 14:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEA3610B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9r-UtlEz0SP; Mon, 31 Jul 2023 14:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992286109A;
	Mon, 31 Jul 2023 14:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 992286109A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8FE1BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03648405CD
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03648405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMw0SRelgK2X for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:55:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CBF44037E
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CBF44037E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2514260004;
 Mon, 31 Jul 2023 14:55:29 +0000 (UTC)
Date: Mon, 31 Jul 2023 16:55:28 +0200
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20230731165528.47f7cc0e@windsurf>
In-Reply-To: <20230731060847.25665-1-fido_max@inbox.ru>
References: <20230731060847.25665-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690815329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgHwNlbPSWmICTz+SbVlzVrGAthmls/pHmh7O0H8qCs=;
 b=KsH0osCpHBJ0QTA1RXN3yCqo7hXyswkzqLKvr2Fk1twgaJEaKQ/TZUEpn7+uCA0RChIfDP
 AS5Ay4ZyPsuImxBgkYnGYVekLCkJK/YnCkaphSPUbpbHdQQlJlf+wLoM4cboP53IliNQpk
 x9XqrqIuP+UwgqDmXx4EF4zUpDFtZZQcpNILmKazzUvapSqHTk5V+cNwobwQBVbhXPAAfC
 8KsjH5sPFVp/gXokOXs1nVdWyH1zJz57RRh8ktsat+xBN8qNASZlBG7mZRKvUsOwY6NgaG
 MutxS+T8bAen4EAfZBMGnePHPSqTtl+ecGn28Ee6MXBxhKo9OFrFX9/gMya+zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KsH0osCp
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.11.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 09:08:47 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.11.1/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
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
