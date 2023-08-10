Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D2C001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CC341603;
	Thu, 10 Aug 2023 19:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CC341603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kl0IQZFkOmFM; Thu, 10 Aug 2023 19:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74AF040246;
	Thu, 10 Aug 2023 19:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74AF040246
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1D91BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0EBD408D4
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0EBD408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fik1sJiXXPnq for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:48:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 946E440126
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 946E440126
Received: by mail.gandi.net (Postfix) with ESMTPSA id A36FB240003;
 Thu, 10 Aug 2023 19:48:44 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:48:43 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230810214843.5f96f23a@windsurf>
In-Reply-To: <20230810175319.1071011-1-ju.o@free.fr>
References: <20230810175319.1071011-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691696924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdPH9zLepVdWtQZgmlW3waK58dMUzYBK60TzOZ9ff9I=;
 b=pT0EPDAGuR+GfaF9mWtlfLydkuCQQ/hVfwAjWNDB4shZTLmwlEXr86gT6IkGGUyrAhybxW
 yS9wwUFQGanmTlVnP4CXEHayKmt7gAzMfwPRVhWYig2KOYGl/EUL46xKiJYNvKtT2srWx4
 IhlJxcfw1Cja5LFVGkqUhAIEGdcrQNRjkKNNFzxO6i8aiykkxLepaCJ4U9U2CfwYrjQ1bR
 SGb8w0hvAykW1pY+jT+vB/0Rflb3tg75t7HKHK2EnkiRMfXw9NvPzspX0mjsenf10mfuU3
 m9NSDdLBJ6VCBBlxRUlJMU4JUWF+Ow4LKnlUh6qL/OIgeScQww+CooRrHYfptw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pT0EPDAG
Subject: Re: [Buildroot] [PATCH next 1/1]
 support/testing/tests/package/test_kmscube: new runtime test
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

On Thu, 10 Aug 2023 19:53:19 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note:
> This runtime test needs the kmscube update proposed in [1] to succeed.

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
