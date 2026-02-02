Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C14EE73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62250831BD;
	Mon,  2 Feb 2026 13:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2N9oThgxhCQ8; Mon,  2 Feb 2026 13:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C07383163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770037428;
	bh=nwix/4WeZbBp1CL1zUBYsnGzvWQvTHFignNbKrQQK1c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fP5wi0DHwNfViEu4YCS5yIlstYCDkvXaD52TuccjLvEtdQ79mi14SiZVYyM76tdNl
	 BQzPyfuSE+Y1/npYIDflZaacBX3jERfla8zIdFGDRId9GS0tNqd50XCCNGVEb1pLfM
	 PS+V3Kk33Zw/ioGpZ52kP3vzLrv4I/ZzAp5krOAjSdjzu/v/uZDkc/VDrXMkg+Qy/D
	 sejZW+3MpVy1D33Fg7vvU7eckhZjbLb/yUiJD1fFrrZC4MR+qpAl0mAX6A/HMRRLV+
	 Do7Fz0fqCPfAqejW1cwGmCS8NAK1sVlVpIfuckH5eGn7cdugBpjeJM8ZTajLgdTLrh
	 jj2TOg93i/ymA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C07383163;
	Mon,  2 Feb 2026 13:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFA4149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD1F60629
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBxAci1jtBby for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16CA2605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16CA2605B1
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16CA2605B1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:03:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 09A404E423C1;
 Mon,  2 Feb 2026 13:03:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D43F460767;
 Mon,  2 Feb 2026 13:03:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52A38119A8888; Mon,  2 Feb 2026 14:03:39 +0100 (CET)
Date: Mon, 2 Feb 2026 14:03:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joris Lijssens <joris.lijssens@gmail.com>
Message-ID: <aYCgnaJ95xEzXlns@windsurf>
References: <20251205195851.1945029-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251205195851.1945029-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770037421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=o1VlmILV11CLfC55Gn2Paesot2dA5kxnnLXjCrqS8mk=;
 b=suSu2RFEBYbM7TRSIjfNZtFibaTX2mFrzepdf4v3nFp+vB6d8KjK/9CnjwqPIk7bOrADg9
 lbOaeLZ00XpDMJMFKBjafIs4Lu/trguUuSyhte2HmRchoo5H/Do8VUk1V5JH9bw8dGAPFf
 ifdSNjUHH5O2+aVzXJ5p7st1rSN1oycoshoOS2FXww+lAUB+R+4bQ8GyM2xmo6sAI0YLQa
 6qOeE2H2evK8L9q6FBhPG2TeD+cHEpMSV+SnSBdzr8lc1O5Qs0d1IdzOtkmeWjpUtBbMD0
 mdHukbJER6dTnmaTDFjqeDTRoRaKQlC33QlWtyBixX/xNopL1X6qQgQu9U8Z+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=suSu2RFE
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix compilation
 with gcc-15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Dec 05, 2025 at 08:58:50PM +0100, Bernd Kuhls wrote:
> Build error was not yet recorded by autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks a lot, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
