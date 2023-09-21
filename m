Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6812E71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C33883A93;
	Thu, 21 Sep 2023 12:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C33883A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIho5TsbR4YQ; Thu, 21 Sep 2023 12:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D9183BE2;
	Thu, 21 Sep 2023 12:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7D9183BE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA06D1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822A342012
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822A342012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyzY3TgY-fPY for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:57:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6605041F1B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6605041F1B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96EBC1BF203;
 Thu, 21 Sep 2023 12:57:41 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:57:40 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230921145740.6844af93@windsurf>
In-Reply-To: <20230919153513.2801785-1-angelo@amarulasolutions.com>
References: <20230919153513.2801785-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695301061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jodnlUNtj2h1YYfanSTTgD8mK41NcfIZ9P49vB1SKLU=;
 b=YSmNoh/hItFSJPXz9yE04kjXPeUNRbFBgsJvsBGDP+2kIM32mtWYa5Anhdlc5FYIJuSezG
 +fOuQoGAOWrw5LMckw2ydjEZufjBnjTvojr+tpKFi/O42nOXpQaJmIUg9ltLnK7uUtuaWx
 Qooz3NY+POxaEkjlvLxp2sHrZsIoKgwNx2Rj/YwagD38xsxHeg6UUjr0gQtJkIG5p16BLv
 Qb8LO9SDldgHtpLfqkMRkVeRwPTAh1m1gvH63KZxThHtJY7xad6bo29ERH5XNbm3AeABA+
 7hZEEIAVAymEo2asSp9AR18P5c1OxEFJFMMX0V7WcKZTWyMt93pgTw5oQPcHmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YSmNoh/h
Subject: Re: [Buildroot] [PATCH v2] package/python-pillow: bump to version
 10.0.1
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

On Tue, 19 Sep 2023 17:35:13 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v2:
> * Fixed md5 hash file name (thanks Quentin)

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
