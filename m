Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD62C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71CE440A2E;
	Tue, 26 Dec 2023 13:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71CE440A2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqG9diBB6LG3; Tue, 26 Dec 2023 13:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 639BA40912;
	Tue, 26 Dec 2023 13:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 639BA40912
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BDF1BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E129B408B4
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E129B408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uX6yIzPLZWyF for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:14:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DACB40858
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DACB40858
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A4B71C0006;
 Tue, 26 Dec 2023 13:13:57 +0000 (UTC)
Date: Tue, 26 Dec 2023 14:13:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231226141356.6e9cebe7@windsurf>
In-Reply-To: <20231226112711.12319-1-fontaine.fabrice@gmail.com>
References: <20231226112711.12319-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703596437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5DUH0MWICgfAuI/j2MpSf+Aszjv1oLL6iBZ4OmzeSI=;
 b=h9sUmjWAyJOK5B65pyuEhaEkzJp1Xp+7bZG5xTiiNj0Y0GAfnlXBK6xVS7uV0bDmWFG0Ip
 CIL5dDs3RPRHmZncm4rgYKCykouKCYhgMzZoYPO3VGoC5brEbrOLv9eOghMHf+PM6g3ih3
 /DBx/OxyaGEg6XEQbq0mxgPtRXvbOiI/N5+L2DGKz2j/sJprOt5YD3oukYrxT6o8Y5WTiZ
 H5lGAH8fUb327JQN5kUSJALEVUlljU/cgcsgqTRozEABlM9JgQKYWc2nj/DoIXQpmkGn23
 qmnMoqluElXWvNE6S0ZdkVeJQP5mPFnKYJ5QJ33Z/XM5EBzVHPwd0DOesLM9Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9sUmjWA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uvicorn: add CPE
 variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Dec 2023 12:27:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:encode:uvicorn is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/D3AA1B54-4363-4E52-90AB-01DC2080D950
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-uvicorn/python-uvicorn.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
