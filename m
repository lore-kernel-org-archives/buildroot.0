Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B42C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E188382162;
	Tue,  8 Aug 2023 22:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E188382162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9K0JN2kU0Nq; Tue,  8 Aug 2023 22:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3428381AA7;
	Tue,  8 Aug 2023 22:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3428381AA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8F571BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B275E81442
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B275E81442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1bmXow6Qp80 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:19:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E448141B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E448141B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9021A20003;
 Tue,  8 Aug 2023 22:19:10 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:19:09 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230809001909.6f2342db@windsurf>
In-Reply-To: <20230808184736.4245-1-dalang@gmx.at>
References: <20230808184736.4245-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691533150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qc6PgvqYXLkeDcKLCfRJ1V28Foeqkip6UzkBff9V3eI=;
 b=IKxNNUl/N51SMwlBLzxpMIsV8hn4jXM4/fuvlDVdO4je89WSjDGTt9fbz0/wwrk3uxDnNV
 xdIhahodhgw3bPN9stZB7EOiaYY/oqH5hyy9YtlGmzxB+GJomDKsygFujp+sBt2+zV7eTo
 iNbmPkwuOxXPGS6BKoVVTcxfMK+uDqBDKwJTllCDPAmrtZ0CHZdxVTmwxlQjoP4sMFXRHA
 uqKr1m7CV08DDGF+Gg+z//EvuDzYCbncUziRWVbwXFWjQqtQTW6/LYRY/sQCHDcYP1mQCv
 zCRmdTyGkW7yTuUdzzTe8ujdA59pedFekypz/Mgo5KxtZazCizGJ1spcDEOEjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IKxNNUl/
Subject: Re: [Buildroot] [PATCH] package/libcoap: add CPE ID
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 20:47:35 +0200
Daniel Lang <dalang@gmx.at> wrote:

> libcoap:libcoap is a valid CPE ID:
> https://nvd.nist.gov/products/cpe/detail/FA3B1D63-B4E6-4EAD-A2C9-CE4E52D83E37?namingFormat=2.3&orderBy=CPEURI&keyword=libcoap&status=FINAL
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/libcoap/libcoap.mk | 1 +
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
