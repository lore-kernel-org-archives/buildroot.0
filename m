Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D655C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EF080FB8;
	Mon, 13 Mar 2023 21:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EF080FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qo1HMRdVObOC; Mon, 13 Mar 2023 21:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFFC580E3A;
	Mon, 13 Mar 2023 21:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFFC580E3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50DA51BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29BA8417AA
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BA8417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGwgjf5ws-WW for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:56:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE015417A8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE015417A8
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:56:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D60FDC0005;
 Mon, 13 Mar 2023 21:55:56 +0000 (UTC)
Date: Mon, 13 Mar 2023 22:55:56 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230313225556.0a5c3ef0@windsurf>
In-Reply-To: <20230313213439.277675-1-ju.o@free.fr>
References: <20230313213439.277675-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678744557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nmZqhb/ejwTLpQ32BKyHwHYldAa8vuoCtBIomtGJtw=;
 b=lYmgg92C7M/xpW+0pFEgjjPuFYM0BK8XVMhiXtn6uWVLmf5OCKd/1Sp2oRLIVqj10egDL5
 5luojQV3z5sDCI/a7DU4ObpI39UVzFLbASCFQu0oJa7vMtKrLszxEQ0mJdtEqqYvPT6EN4
 vJ0tjCujmI3gGi3NSjPEi2xSjUbV4CKy2uerFhsOaIEdtHwrgsrYjDNkP1g61jTMGledde
 B+40z3x5KQ2CcMC1EYPiNj3UN9mFPKloQwSv1YADKqNhHuCsJA4yV3E+PAk9RtJYClzumL
 4STw1xdmvNnYyJ8OmerQfopOzDJM00WyJol5j46SXLgDM/hRXlE1uX5cOrt3HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lYmgg92C
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-hwdata: new package
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

On Mon, 13 Mar 2023 22:34:39 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Provides python interface to database stored in hwdata
> package. It allows you to get human readable description of
> USB and PCI devices.
> 
> https://github.com/xsuchy/python-hwdata
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Add the LICENSE file from upstream git,
>   suggested by Thomas.

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
