Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E629C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1698383EC5;
	Sat, 23 Jul 2022 19:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1698383EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TreT_0fcPo92; Sat, 23 Jul 2022 19:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF48832A9;
	Sat, 23 Jul 2022 19:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF48832A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2022A1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E05D040566
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E05D040566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq7uSIrtLwZ6 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:13:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71FF440354
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71FF440354
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:13:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EEECC20002;
 Sat, 23 Jul 2022 19:13:40 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:13:39 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220723211339.1055ae75@windsurf>
In-Reply-To: <20220510071430.29647-1-yegorslists@googlemail.com>
References: <20220510071430.29647-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658603621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80M/Biyi1nQvkY++S0WZsJSeC/r0ODlG7VMmA19fHHI=;
 b=CLlfY0XI4gYANxp2oZVi6QwHF3JMB/lW5rGpYM0j1K05+qMkkPkvHbEW9PmpLOcX1GIG1h
 oGcwFvY/TkmmmrTVd1zXtPM8llS2bIsvIMX8B0+rHLO/a2lHn2ReaQhZ9XrY6VdQDOAbt5
 VqrF+hcnUXPleKYcshe+RNDJSDbVGXdiinpq8awu/5tTwOqDYbGQYxEcEJeq8/z4PWd+jf
 JTlRxLuhh9jh47tjeYPE4YbpvkoTVDo/kxBDVdUXhqwJ0q5ER+NqeYp4098x7ie+1YY04s
 eKON4gSqsZJPSRoHufvMB3UFgl+dlp/Mj8zCXHc18RiW+BnS4s1FqIhMxfaRbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CLlfY0XI
Subject: Re: [Buildroot] [PATCH] package/python-rfc3987: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 May 2022 09:14:30 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-rfc3987/Config.in           |  7 +++++++
>  package/python-rfc3987/python-rfc3987.hash |  5 +++++
>  package/python-rfc3987/python-rfc3987.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-rfc3987/Config.in
>  create mode 100644 package/python-rfc3987/python-rfc3987.hash
>  create mode 100644 package/python-rfc3987/python-rfc3987.mk

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
