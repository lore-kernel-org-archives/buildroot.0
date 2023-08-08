Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFF8C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5565681456;
	Tue,  8 Aug 2023 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5565681456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kfvM29iDbWC; Tue,  8 Aug 2023 22:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E9882151;
	Tue,  8 Aug 2023 22:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E9882151
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015131BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C01E840494
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C01E840494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Px8eCmHzRCUA for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:19:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B777A4011B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B777A4011B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D014C0004;
 Tue,  8 Aug 2023 22:19:03 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:19:02 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230809001902.03adbb90@windsurf>
In-Reply-To: <20230808184555.3787-2-dalang@gmx.at>
References: <20230808184555.3787-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691533143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IkieC1iT+9zeu63qm9qErv460o47N7LTigBRx2ZRYY=;
 b=eUkbUs5opEscDQUB1wkJvRQYL9ptfKZVD2Y1BViDJ0AybD19rqyzwUJYLvIvqF8dV4vMRI
 5Ux/PMVn3WW6EIvDkVl1v3md00nGkEjAqcQ7D76goJjEn47X0wvDkzTfdqiT0DzRBaimau
 3xPu4/qjSUU2IBkF5xiLfqd4XPyvw+KM7tD6oqD7bnv25/WF5jvbdXp5j6NUISETNUu7Iq
 ulPZKoWPsejJCelkDsBJCV1Z6CWVf9yJVdnsqcLXBas7b4ZDeTJot6yz4+k0F5aXvwxLap
 czhczX9woita/OzMieWIo6PH29rLhD3F7TXr4ahU/MSDm9LGgPFyB5RVNqZGdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eUkbUs5o
Subject: Re: [Buildroot] [PATCH] package/bwm-ng: add CPE ID
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

On Tue,  8 Aug 2023 20:45:55 +0200
Daniel Lang <dalang@gmx.at> wrote:

> bwm-ng_project:bwm-ng is a valid CPE ID:
> https://nvd.nist.gov/products/cpe/detail/DBF33404-2CC8-41FD-B0FF-039B27A19871?namingFormat=2.3&orderBy=CPEURI&keyword=bwm-ng&status=FINAL
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/bwm-ng/bwm-ng.mk | 1 +
>  1 file changed, 1 insertion(+)

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
