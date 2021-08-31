Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3DFC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 09:51:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14A560E98
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 09:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B14A560E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56C5D400D0;
	Tue, 31 Aug 2021 09:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLqNyMbsddSR; Tue, 31 Aug 2021 09:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C8D640139;
	Tue, 31 Aug 2021 09:50:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8FF81BF355
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 09:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D471F81CC3
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 09:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3EqO6qVMfZH for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 09:50:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 881D680E27
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 09:50:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 071F620000D;
 Tue, 31 Aug 2021 09:50:45 +0000 (UTC)
Date: Tue, 31 Aug 2021 11:50:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Hager Stefan <Stefan.Hager@ginzinger.com>
Message-ID: <20210831115044.6c74bf6d@windsurf>
In-Reply-To: <AM5PR06MB315372DC33325D77D69C6E1984CC9@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <b1013791-e98d-4543-acea-65fd9ce8d248.c516e98e-fc1c-4197-847c-feec798fb1a1.a28525cc-33b9-43ed-b9bc-c35c32acecd8@emailsignatures365.codetwo.com>
 <b1013791-e98d-4543-acea-65fd9ce8d248.67bdf025-9d7d-48dd-b0d0-cdaaec3cf4a9.4573a150-d1eb-4ea2-ad89-03a806cffdff@emailsignatures365.codetwo.com>
 <AM5PR06MB315372DC33325D77D69C6E1984CC9@AM5PR06MB3153.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Tensorflow-lite as package?
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Stefan,

On Tue, 31 Aug 2021 06:24:25 +0000
Hager Stefan <Stefan.Hager@ginzinger.com> wrote:

> I am wondering why tensorflow-lite is currently not available in buildroot as a package.
> Is there any technical reason for that? 

Because nobody contributed such a package, so there's no technical
reason, just that nobody had the need so far. Feel free to develop and
contribute such a package, it would definitely be useful!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
