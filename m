Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09236EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA2CD400D1;
	Fri, 14 Jul 2023 21:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2CD400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nmz2YXoHbUTW; Fri, 14 Jul 2023 21:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF10C40993;
	Fri, 14 Jul 2023 21:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF10C40993
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E158E1BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADA1760B24
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA1760B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVP5HTFn9HZq for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8CCA607F1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8CCA607F1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32004E0002;
 Fri, 14 Jul 2023 21:26:16 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:26:15 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230714232615.610d9745@windsurf>
In-Reply-To: <20230714164203.9881-1-ju.o@free.fr>
References: <20230714164203.9881-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2TbajmI9tnQKztD3Y9WqQzOpZSyeenUiBezhIe4Q5w=;
 b=P3/qvlhsTKarbXqv4R0hodkiRahKO0kNkekuJonHm03wbHMJ81GPFQiKVZJYikqypY18pp
 DC30PovxNQGcOiSc/+5cvtCdNPFhTNyTEzTq/cUIp1xX8pk5pHmbBWWbClozCLQc1AFOcq
 QyU7htpxu9nruzYaXT1W1NWEz46nsn+qbzIacIq5eWD2wH7zsheEse6chLTezCyzdOKbwI
 tZQMyAcJizHh9BYAdzrdqtRLNE8++BB6k1DhAoHy2C8Kaats5P2pFnbb5PvM3fc9umdiFX
 X8cx5eR31yHKYtTp5v5js2Bt37BxnjizCZWjfwpve60cuF3u7UXed9WzYyYGUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P3/qvlhs
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_lzop.py: new runtime test
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

On Fri, 14 Jul 2023 18:42:03 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_lzop.py | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 support/testing/tests/package/test_lzop.py

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
