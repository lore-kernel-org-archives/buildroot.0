Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54679D3A661
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 16:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 075A9803BA;
	Tue, 29 Oct 2024 16:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DALkEvuJKws5; Tue, 29 Oct 2024 16:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FE68052A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FE68052A;
	Tue, 29 Oct 2024 16:04:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A42624EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920B1605CE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9L1JUMF1kEq for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 16:04:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FA396059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FA396059D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FA396059D
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:04:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65A2120005;
 Tue, 29 Oct 2024 16:04:18 +0000 (UTC)
Date: Tue, 29 Oct 2024 17:04:17 +0100
To: CHERNIAEV ANDREI <dungeonlords789@naver.com>
Cc: <buildroot@buildroot.org>
Message-ID: <20241029170417.435fd8ad@windsurf>
In-Reply-To: <58534f324981edb8a3a348673b5ba25e@cweb016.nm>
References: <d6269fa3c64d831751c6ce37d105895@cweb002.nm>
 <20241029121908.604a3074@windsurf>
 <58534f324981edb8a3a348673b5ba25e@cweb016.nm>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730217858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lv4rSEGDGiEwWfi+IBtwdmxDQrpoPcKaDKJOyGHJqi4=;
 b=CKzw/zsSRB5O9P/V1A9KeTL7VGIyqz0NzyZa6525M6ZaSyjLAujApuV5kQaE0B+/gre07+
 24D+NTQKd2xVp2i6YVJ+ThJXZUQ8NckKJCFL6/eNdJpF0+9Q9nA8w3ESS2YcCwY46ve9Eh
 2hAWXFR+lLvnvPMOnxc1NfQ2FKDEimN+0M+qOzmUHxZYvqEV//LawaHaGUE8avYkZVqv/W
 WgPgax2rd91hL/xFNMnrxTluoFuklefm9dNQxHOhn5rhracwCxfYyQ4OnlwW50cInkSFGt
 E9WSzRv5qAqDJpGvNoeFQG1sY6Bot039PGfnt5vUVuVr3eJAzLz7jvPvXFfqrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CKzw/zsS
Subject: Re: [Buildroot] [Feature request] Find all non-existent config
 options by CI/CD
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 29 Oct 2024 20:57:07 +0900
CHERNIAEV ANDREI <dungeonlords789@naver.com> wrote:

> Why you call the officially part of buildroot documentation as
> "random documentation"? Is file "/support/kconfig/README.buildroot"
> or "buildroot/blob/master/board/qemu/x86/readme.txt" also "random
> documentation"? So if any file from buildroot repo is not Config.in
> or .mk then buildroot doesn't plan to check it?

For now, check-package is only capable of verifying the coding style of
Config.in, .hash files, .mk files. At this point, I don't expect it to
ever be capable of scanning/validating *.txt files, as their content
can be quite arbitrary.

Of course, you are welcome to develop improvements in this area if you
feel like it should be improved.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
