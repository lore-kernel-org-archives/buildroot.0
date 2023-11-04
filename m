Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208D1C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C34AB40391;
	Sat,  4 Nov 2023 20:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34AB40391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3fTrLlz6vKK; Sat,  4 Nov 2023 20:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B754037E;
	Sat,  4 Nov 2023 20:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B754037E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2404E1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3FFF60AF2
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FFF60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id trvtOwIj1Lu1 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:29:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D897760ADD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D897760ADD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C0211C0002;
 Sat,  4 Nov 2023 20:29:46 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:29:46 +0100
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20231104212946.405bf671@windsurf>
In-Reply-To: <20231007104205.12608-1-paul@crapouillou.net>
References: <20231007104205.12608-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HXfgXqsvfc+ofwPfWvSx8WMIQhEu5laA+QHNc/ncB4=;
 b=PQfX7Pm3/K5MHw4q8KW+VK9S2oBiX7760sF2VyxXjE1w6EXVp6zstUX3Yn9UAlyIMJZSx3
 aIrrIXrp4dUC5QnK7nA38VYEFkaZ2ZbRFaTqa67DkporpSk6sCUVtUK6W0uRBSHBMj/jjl
 0dGHgWri52KLSDTg/y1dTsyI+WvzC6t324iQNyz7Jr68xFFcXrXQT/cLHt3fcVPWmy9TKv
 yGOdH1AMF3cvBg4LjUzKKlErHGnOEX1EbZHDJ20F3C8V7ubjoqddV5yXNB5Sm9/IqyL/R8
 jXMP0i7l0C/jmgHMGVYL7KRr+KG/Vs8fmNjCWrNWV5FAa/UKO6qwD7HR1d1hAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PQfX7Pm3
Subject: Re: [Buildroot] [PATCH] package/lightning: fix build on mips64
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

On Sat,  7 Oct 2023 12:42:05 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Grab commit 90f5c78f47dfb1ae4b953b0e30c7ef72a6438396 from upstream to
> fix the build on mips64 and mips64el.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../0001-Fix-build-on-mips64el.patch          | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/lightning/0001-Fix-build-on-mips64el.patch

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
