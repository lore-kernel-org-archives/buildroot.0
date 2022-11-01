Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D5C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C0A60E0A;
	Tue,  1 Nov 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C0A60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnPGfvzXILfO; Tue,  1 Nov 2022 20:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A50460AF6;
	Tue,  1 Nov 2022 20:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A50460AF6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2041BF307
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FD140250
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24FD140250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOcKxRU6zplz for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:18:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21EE40133
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B21EE40133
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:18:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE7F7FF803;
 Tue,  1 Nov 2022 20:18:38 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:18:37 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221101211837.4fb6f102@windsurf>
In-Reply-To: <20221031222907.275293-1-christian@paral.in>
References: <20221031222907.275293-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667333919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGsYM4ipLE15Uk4bIqQSZ6kXsbbwo0EeKejKNcHCRCI=;
 b=G/I783OxxY8uxuKU389CHTtHcr4LRR91exP8+AGpKYUtOv8nNk3Zgy9TZEcu0aRCdYnhbE
 bptcbGEuN7x6lQLk/Wyt85dcYcaSmQO6rXzowp0AZB97fouzCeYZb3YWeitaOsKn0vjgzN
 1cIY8aR/DsFxhGBHA5h5mT0L/RSrURmNFlMkuOYHvJrgM2ed285Y9HKfW2mwfOxXPBwi6w
 STxMDiu5COUJbBQnefM6RepNKhOGS/V4MP8Q9Sv4HaaxWyLdWlJZTDce/vpoZ17g0SuBg7
 b6y85toygs8g8GiU5vbRyx6doibq6fhBLoln+R9cgMRhSxzyqpVBA65L1gUhew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G/I783Ox
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for
 package/docker-compose
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 15:29:07 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

The commit title was wrong: you're not adding yourself for
package/docker-compose, but the docker-compose test. I fixed that up
and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
