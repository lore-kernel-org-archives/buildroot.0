Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB26C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F4C80BFB;
	Sun,  6 Aug 2023 12:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F4C80BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJrrRJwtaDp5; Sun,  6 Aug 2023 12:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8066C81EBB;
	Sun,  6 Aug 2023 12:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8066C81EBB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 515681BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6CB1410C7
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6CB1410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5m4vgc4GPWM3 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:05:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9058D40EC1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9058D40EC1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 941B060003;
 Sun,  6 Aug 2023 12:05:52 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:05:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806140551.5695698b@windsurf>
In-Reply-To: <20230805083440.2954531-1-bernd@kuhls.net>
References: <20230805083440.2954531-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUZqgh7XbeGFAittY/Ke4fKX4lTMys/qQQudumJIBA4=;
 b=B/fNAxbN1SZLIGO6Jyz0mSpIfpMcMljfJrh9i75kbcT5XJXQP0dQnJe+o2tLqLDrbj8+XX
 Uc64GWOKp3igCnZHMHIDEZZRYna1yKW2URp8C324bY1j2uKgqsZ7k08ZphpyhVxzxRh2b7
 UJZ84S9NXxP5USWMaXV461y70A3G8bK3WzcUht0PvGXOd5C+qgm26ieMYjKtBlBgZmISLV
 lYaBBIFf4fqzL8LrT68JUIS7WkndxNqANV4THACiaoQrhef3NE5bx5669C4FoLcqafVYFg
 JeCJTl2TYnm9sEeDGYMqtwTGM9LUqUN73IKKqbhaS4us+UdV6r82LufFfEaLow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B/fNAxbN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lxml: bump version to
 4.9.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Aug 2023 10:34:40 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/lxml/lxml/blob/master/CHANGES.txt
> 
> Added sha256 hash provided by upstream.
> This release includes fixes for upcoming Python 3.12.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-lxml/python-lxml.hash | 3 ++-
>  package/python-lxml/python-lxml.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

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
