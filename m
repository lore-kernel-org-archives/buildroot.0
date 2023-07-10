Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDBBEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B418210A;
	Mon, 10 Jul 2023 17:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B418210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDmVusD5PDGU; Mon, 10 Jul 2023 17:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2848820EE;
	Mon, 10 Jul 2023 17:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2848820EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 946D81BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DAD2820EE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAD2820EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ttJVglijl8wr for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:48:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 497E3820DB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 497E3820DB
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:48:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62ACF1C0004;
 Mon, 10 Jul 2023 17:48:19 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:48:18 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230710194818.7b366a18@windsurf>
In-Reply-To: <20230626200550.13214-1-ju.o@free.fr>
References: <20230611203909.113108-1-ju.o@free.fr>
 <20230626200550.13214-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689011299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4san9wbY5CSVCzx/n7vnhJ9RnX3jSthZKVp/jtMm5vs=;
 b=feXezOxSZT8iKYsma/Mnyt1XRJJjxqg9FgK/T7XsPH9ebH88hfLHy+dfvHmbmejxo/75Vs
 5CJjKkZYMTo5S69kZSZ2OnCADpVen3UYkGCgasHi17wheHATFNd9doRZqmHmY7rUqtCE5v
 c7w4fl4/Z1VDQcZ3qHpn4BHXtrmJ4hEBJdHsXPcSQU92UWN97d722u8tpVVCcH7qLPDC66
 1xYpUcERqIczgMXKtc7DBwprAhDNPdn1l9+RSoqTDV69C6mWAqso8L8bmV0zmtfDhQ2T6S
 FxVwgx5N2BIOy2K1t0wvFO6lB2ebZqyDg/JLCEIOn1pnt1zMSPc4Z7cqRZ+lrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=feXezOxS
Subject: Re: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_dos2unix.py: new runtime test
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

On Mon, 26 Jun 2023 22:05:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  1 +
>  .../testing/tests/package/test_dos2unix.py    | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 support/testing/tests/package/test_dos2unix.py

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
