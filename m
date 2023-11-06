Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9206DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6F6402B2;
	Mon,  6 Nov 2023 22:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F6F6402B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPpiV4ZeMGaS; Mon,  6 Nov 2023 22:31:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6EE421F6;
	Mon,  6 Nov 2023 22:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6EE421F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03FEA1BF954
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E28142095
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E28142095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzHfpuJga9B6 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04A9F42161
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A9F42161
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49F5F60005;
 Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:26 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232526.7e009a7a@windsurf>
In-Reply-To: <20231105034436.2799389-1-james.hilliard1@gmail.com>
References: <20231105034436.2799389-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Xd+L2WKBPJhOxwB/LoDYMgXZbErlBzyiGCvaXj2WfM=;
 b=j9u4BtMf7uvRZ7NJCXOsLs6bqnZt8z3MNRfnGkFtuyI24PtZunlO6yZCJMdal0u0FxxyIT
 U8dw18fAltWc5CJqsxvDbAyBjGe1PokdNGM7jtbT3lmMLK2ei785fT6FaibodpDAJ+vqOf
 UOAVFxyk2m1yLgZdwsQvS3+N2aecYDWVbH66i8UAvcc1i0yHHRkTb+jpxjao+7SctlCf7l
 Dv9jSLbFYLwnakoGOy1t2zvEnVjH4A1DnZYLAkEFOODD4OOllDAV/wFyTbA8XXRD+rS6Q+
 zArfJVf/AdrxhH0tGuEhFfDAZXOPVxHmI9XuHzCgfNXjV2Fa4/pHcI7x4N/4mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j9u4BtMf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cycler: bump to version
 0.12.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 21:44:36 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cycler/python-cycler.hash | 4 ++--
>  package/python-cycler/python-cycler.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
