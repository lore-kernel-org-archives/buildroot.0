Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9313DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ED6A404E9;
	Mon,  6 Nov 2023 22:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ED6A404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M33IXXrdvenb; Mon,  6 Nov 2023 22:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8084D420A6;
	Mon,  6 Nov 2023 22:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8084D420A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CFBD1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 365718234E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 365718234E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIp8kT5Qw7VK for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25DC8824D4
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25DC8824D4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A33360002;
 Mon,  6 Nov 2023 22:26:00 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:07 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232407.44f7e44b@windsurf>
In-Reply-To: <20231105064642.2863739-1-james.hilliard1@gmail.com>
References: <20231105064642.2863739-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9uBk7xtPeB2un24T7ixSmcL50A59Pd7XLZG4ZDzBak=;
 b=BM/U5KNfSeLxYKD52pJ0S0PcykkwYfVXXE4DOeOaDOn8WCEZI5Vj1WS0IKGz7pc55QUous
 D+05quLV7/637IV5NNKDSoUbAqfAghXfJx4BUqCqYTS4/mawbBxzkPm4AgjAsZ+1yYNOfo
 kKCVuVWKXa2b2brC+wSnWVlE0SCXGRMAek6E/7nT4cDuttXrdXofZTIOGN2Cu75iBBEgyl
 zTV4779IlYZIT5IBE7DRTbOge1TpAbwq6HrqcR+cH2gJbzxeHAOCk8xGQe6FHaVrSkW7bB
 7o7kLYdTpmOZfsU71jiHyPCE0pU8Tu8he4qOsac2GNgJYwqgvxvV/ocMeE+9/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BM/U5KNf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 3.0.0
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 00:46:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to flit build backend.
> 
> Remove python-setuptools runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask/Config.in         | 1 -
>  package/python-flask/python-flask.hash | 4 ++--
>  package/python-flask/python-flask.mk   | 8 ++++----
>  3 files changed, 6 insertions(+), 7 deletions(-)

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
