Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA56AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720B680BF6;
	Mon, 14 Nov 2022 22:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720B680BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haicXuGcv9PP; Mon, 14 Nov 2022 22:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC41780B4D;
	Mon, 14 Nov 2022 22:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC41780B4D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2F291BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC7D40217
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCC7D40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iSvTEuX1zPH for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:13:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994EB40012
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 994EB40012
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:13:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9AFBC240006;
 Mon, 14 Nov 2022 22:13:29 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:13:28 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221114231328.49ff0fa6@windsurf>
In-Reply-To: <20221111191458.1292483-1-ju.o@free.fr>
References: <20221111191458.1292483-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668464009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBL6N64BVqdzrOKi4/bVRT0XEUP7zb/hcC8Y8SENm3M=;
 b=kCKTfBwfHGoXKEfBOqbWW+3v7E79OSs+44Aq5zySZK2gE1ql1OM6Ur11nGaEFIpmBCCpNL
 3uzVkt8aXtLFkCsfzjLCpVJVAALEk9oJ0vRetSxQvzjytyiIwv1kylwYfFnVtF/jamQAuO
 Q43fIlo99Y5RH/1gluNUz08wsi2edfTsiHopoKC/8vIKSuHOqjeSpcEa8zaOVGyq+YWov9
 l3VaUfHgpN+8i0Hg4X43xUgCSGxZN6HogImsO8oC9pQnz3OXGPVuyAyGBiObWubqizyVxz
 5iUPfAfHe/aU2+AS9opeyLMreMV+7526qnbZEjKEjL0ICpznad16B5VeTVieuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kCKTfBwf
Subject: Re: [Buildroot] [PATCH next 1/1] package/octave: bump to version
 7.3.0
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

On Fri, 11 Nov 2022 20:14:58 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 7.2.0, see:
> https://octave.org/news/release/2022/11/02/octave-7.3.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Commit tested on branch next at commit a85f5f2, with commands:

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
