Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35A7C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8481D83E7B;
	Fri, 23 Sep 2022 21:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8481D83E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCpLp5CysyXJ; Fri, 23 Sep 2022 21:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6CFF826B0;
	Fri, 23 Sep 2022 21:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CFF826B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6D9D1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90A6E826B0
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A6E826B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqRrqLluGe_X for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:34:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5249482591
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5249482591
 for <buildroot@busybox.net>; Fri, 23 Sep 2022 21:34:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14C17240002;
 Fri, 23 Sep 2022 21:33:58 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:33:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220923233358.43016358@windsurf>
In-Reply-To: <20220923123223.6582-1-mf@go-sys.de>
References: <20220923123223.6582-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1SZ+tkd5Nznay6FrCj8NlufA3UwrYeXSfhg/CxX0cc=;
 b=GxCLjMY3ln5TIyBH78egUdxaNBsbnrIOdidc4to7RkAejgn176FT3h0gVvjmqyGbLfXC10
 1ni7iKUqNsxrRDkfKPzsOR1Aox93BGILGJF5qpQyeS8qzHlKWR2fbqLNLNtin+yZirIP7x
 i9qZ51bszi2ki/fwwmmMWawn8BYfJUghB1z2y0NPLI5kGBN51d+DNt/XzqdXfHRwKgfODL
 4GMfjP+WtrcZ4j4FAQLggv5CpHskBolir19Vno8x7foQGyik5uPRUrhq/n9dAPVlqLNfXe
 BF7ol9Lm0vT7r9zWtLXltssIppQ47fhI9uE1MB9ZqgkQpPy9ChhwPsydbr1cog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GxCLjMY3
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.18.12
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Sep 2022 14:32:23 +0200
Michael Fischer <mf@go-sys.de> wrote:

> This release fixes a few very critical issues that happpen when using a glib2 newer or equal
> than 2.73.2 (after the pcre1->pcre2 update)
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/modem-manager/modem-manager.hash | 4 ++--
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
