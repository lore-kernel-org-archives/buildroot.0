Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E778C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD61381FBF;
	Mon,  3 Jul 2023 20:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD61381FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSHkEjM4TmXc; Mon,  3 Jul 2023 20:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0267E81EAE;
	Mon,  3 Jul 2023 20:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0267E81EAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7881BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37FCA60BE9
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FCA60BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pfsBwdcS2po for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:02:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D4A60DC6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18D4A60DC6
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:02:48 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C888EE0007;
 Mon,  3 Jul 2023 20:02:45 +0000 (UTC)
Date: Mon, 3 Jul 2023 22:02:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703220244.156783b7@windsurf>
In-Reply-To: <20230702150232.3414717-1-bernd@kuhls.net>
References: <20230702150232.3414717-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiBM8lU/69gyVdfUBdaDSGBXUs9Oif1cTTZzDdmXLi4=;
 b=HjivfDCI+ZAX1TQeKqvqQ7QSdKIxuHsMNO87hrh6GsNxw2sw/oINDaYD1HqDrHK7+7jS1a
 +4ehojGpi1mR1LCTrHdn/JcvoB4Fz3IfsXj3U6nek+uVRkQJA/wNW+rean+5Xe9Ul79eyc
 oSWJxH9DhRz6qqYj4ZU1Lez3t+ahqlQ3COvhmCfrCdEmikUTBXidEB1LRqkN5FXIgyAS7N
 r5b07ALcGx9wlmgJysrRhNGkt6gSQpFRbgU3htS54lcSlWo+61WgcE5JHCgwFIKBuGG/ts
 0oRyDtruaUvaogGRzN/XhmXBmgHa4x4a1vINErjPpzXRBvpwDTWPt0pf6Z21WA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HjivfDCI
Subject: Re: [Buildroot] [PATCH 1/1] package/sconeserver: re-add dependency
 to pcre
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  2 Jul 2023 17:02:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> While pcre was an optional dependency with autoconf [1] upstream removed
> the HAVE_LIBPCRE defines with the introduction of cmake [2] breaking the
> build without pcre after buildroot switched to cmake with commit
> 8b42bbf30a914b0fd40a4518e61ac7bc511a7deb.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a15/a15db87c8cec195905b6bcc2cbd3da59ad8aa3b9/
> 
> [1] https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79
> [2] https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/sconeserver/Config.in      | 1 +
>  package/sconeserver/sconeserver.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

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
