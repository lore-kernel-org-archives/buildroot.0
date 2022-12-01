Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2098DC4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 16:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D7D382081;
	Thu,  1 Dec 2022 16:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D7D382081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWMgv-7LRNBK; Thu,  1 Dec 2022 16:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD6438207F;
	Thu,  1 Dec 2022 16:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD6438207F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39B1A1BF395
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39488207F
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 16:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39488207F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20hxpc4u2Hux for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 16:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F0C8207B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F0C8207B
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 16:41:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F52D10000E;
 Thu,  1 Dec 2022 16:41:46 +0000 (UTC)
Date: Thu, 1 Dec 2022 17:41:45 +0100
To: Leonid Yuriev <leo@yuriev.ru>
Message-ID: <20221201174145.5e70863c@windsurf>
In-Reply-To: <a89a5a97-317a-b634-65ad-5fa11e526bc0@yuriev.ru>
References: <20221201104313.25K7I8a6@myt5-1a3effcffc39.qloud-c.yandex.net>
 <3b7ef091-b01c-59d3-d31b-8b28e59bf1df@yuriev.ru>
 <20221201165150.4746c32e@windsurf>
 <a89a5a97-317a-b634-65ad-5fa11e526bc0@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669912907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kuxovi01h2HUZdoLPSMG53cchJmwU5PxjWanQPOb4Hg=;
 b=aLCAmfIAXj+87QS9qNXnOL7GFJUW9XTWEa3kqZJ0RmCjtWId935pfVnbuu4gTgrNqAv0BK
 keZMMk8VywsRAkQafIb1IVS45QpSItV98ZzMXvTYUjecrNC1hgMcY0T4xVZwsiGMeuVpoz
 dOeqTfDCRTvQXBwY1b/pUI5yBmNXqz/iFARwesnWOYK8XKSpPYJHWoenZzqoh8POyrNBeA
 N/ta7krCs+svHPSJpCClk+TmzZ2XuY9pp1Qfu+0eUHoUNqb2Xl4b6XSCyfuyeEzY1eFCZq
 uFOTVFZNG8y/r11Vl0/Io1+si2PgBzHtVKzuBijyH52+82kVtZ6tVvt05q5SAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aLCAmfIA
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-30
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 1 Dec 2022 19:01:55 +0300
Leonid Yuriev <leo@yuriev.ru> wrote:

> Commit f54bf3ecc638b62162a43f8c276407ad1ffa0dd4

Thanks, but please keep the Buildroot mailing list in Cc when replying
:-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
