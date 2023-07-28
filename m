Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4988C001E0
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B8944209C;
	Fri, 28 Jul 2023 19:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B8944209C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGAdUmAF_bUn; Fri, 28 Jul 2023 19:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C4242067;
	Fri, 28 Jul 2023 19:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C4242067
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73D021BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CAAC401E1
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CAAC401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwgSaXAQmyUr for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:31:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4188E40168
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4188E40168
Received: by mail.gandi.net (Postfix) with ESMTPSA id 086331BF20A;
 Fri, 28 Jul 2023 19:31:02 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:31:01 +0200
To: Danny Wood <danny@rotronics.co.uk>
Message-ID: <20230728213101.16a013d1@windsurf>
In-Reply-To: <32ea713a-e571-4f83-c0a4-a9b4995db5ba@rotronics.co.uk>
References: <20230728101140.10998-1-danny@rotronics.co.uk>
 <20230728121819.73bd742d@windsurf>
 <32ea713a-e571-4f83-c0a4-a9b4995db5ba@rotronics.co.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ay6poM3eSGW2UdSASCHfJ/dAnpT85J4cmMC4aPcY2gc=;
 b=j4n+uIGsL/jCcLsOBnk5/p/96Cu7HQi/W3WnislmE9cxEhF2FCcDegYyitXRK1i/Se6D30
 J/lgKFeUR599j1qkJSh1XTM0RZEoC0YYUNCeauw08XdQZdXxdyCvcC7Hu94HLF+Hfsfmx4
 xRlaa+41QVJCqtNU8vj9UFCGbtQDH5Ia4xrijw/QaTGa+9msJ8dRyI37FJHb8k1ov7xUT+
 Csl18Bg83WZY03D8fCWCMrbZTjwtnCq4YP3H1Pkyck1xjxCb2N6GHBeHqn+o3F/pPRjAFw
 Z85YT9HFl9HxUqA1i6z7NG5tKdUz3QfZ04pv2zrDPl8RNXEjPSI6q2cPfNwZNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j4n+uIGs
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: add optional systemd
 dependency
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

Hello Danny,

On Fri, 28 Jul 2023 13:23:45 +0100
Danny Wood <danny@rotronics.co.uk> wrote:

> I have updated my patch which is attached.

Thanks, I've applied this new iteration. However, we normally want new
iterations to be sent again with "git send-email", with a prefix such
as [PATCH v2] and a changelog. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
for some details.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
