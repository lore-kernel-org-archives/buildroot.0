Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3BFC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E948F40B9C;
	Tue, 22 Nov 2022 22:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E948F40B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrhvvXfWAr_4; Tue, 22 Nov 2022 22:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 341A740A13;
	Tue, 22 Nov 2022 22:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 341A740A13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36FF31BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A5381F38
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A5381F38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8iJ6VYi60yc for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000FB81EF0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 000FB81EF0
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:41:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47DA4240002;
 Tue, 22 Nov 2022 22:41:45 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:41:44 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221122234144.623ee570@windsurf>
In-Reply-To: <20221031195205.429257-1-bernd.kuhls@t-online.de>
References: <20221031195205.429257-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oVvWG1xKxpyG++jx2oV68crm4+uOqOt+afyZq8o0Uo=;
 b=aLW4DgJS4qIOBka+f81Cw4mFqNjkltOhnYmA+PjNFVqq7IEOI62IqE+1Ir0IVBrVbylkm1
 NL+kHPdyyWTylDjw41k1+oAy8VxoeNJO397rIFHsKBLnKG4h7h+3LwFsEYEnU03GOEy97b
 ETsOHaZFmeuBir5h7fY2VD2z2ym6sQdmh2WgUOSRWd9fES6IExm76ESLHQOcqg8BFwcsTp
 QJLk2pXXHYdQFR/alWxEnX/RFSu0fgNha0Z2nBTed7SZByOtwCoNZgIZ+ihgl5/uBD3f92
 7EhiKo32IrXB5q3YwCThAkSU6jYUBkJYlPDOZ2EVevo3GSh4yYuG07YKW1v1Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aLW4DgJS
Subject: Re: [Buildroot] [PATCH v2 1/3] package/unbound: install to staging
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
Cc: Stefan Ott <stefan@ott.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 20:52:03 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for Monero:
> https://github.com/monero-project/monero/blob/release-v0.18/cmake/FindUnbound.cmake
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes

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
