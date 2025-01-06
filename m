Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E02AE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 21:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F6E40644;
	Mon,  6 Jan 2025 21:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBRbzamZztVI; Mon,  6 Jan 2025 21:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F8F40645
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F8F40645;
	Mon,  6 Jan 2025 21:34:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC781F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD05640644
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_EsGdfuGj85 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 21:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 756C44063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756C44063C
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 756C44063C
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:34:07 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 90D92240CD5;
 Mon,  6 Jan 2025 22:34:05 +0100 (CET)
Received: from smtp01.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id 6ADEC240592;
 Mon,  6 Jan 2025 22:34:05 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id CAC19240A1D;
 Mon,  6 Jan 2025 22:34:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org, Han Gao <rabenda.cn@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 06 Jan 2025 22:33:02 +0100
Message-ID: <10590208.nUPlyArG6x@kilian-laptop>
In-Reply-To: <8511014.NyiUUSuA9g@kilian-laptop>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <3258931.5fSG56mABF@kilian-laptop> <8511014.NyiUUSuA9g@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2116
X-purgate-ID: 154282::1736199245-F6D1189A-DE6238E7/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1736199245;
 bh=nBgGf4yTdptkbmCiLkCJumeJDspD+ULXfL3XRQlHaWc=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=hBlrQCBsnICTFJj/AHI6r6xNZfgKwW7Q8SQQioL3cq2oMANUAI4x/hKLTDnS0drz7
 OLX9mhKKR1IqLkwHOrpXsV0HHUhqL+YsENOQzJYNdA4JYiv77LAuwTcaPVUy5B8ZZ9
 hVpjjkQwG/0Ec4NCJsX6+UbYnL7NrTDisSGip65oqSaVLMo/2v94u5m+6FF8m5m+fZ
 jXOGxvcD9iFC2ZyEU0gVh9LOOQhqvKusJZY61Bfh65c3vagbRwP6u9Rnxi2LU0KJKU
 6q8T9lhZwo8XXvetVdtZkST9lJ2VIfnfH56g+LnkVe8TVGN0HMpcmmR+S0fJmgTJTu
 t2PsdiIEjgGSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=hBlrQCBs
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

(@Thomas, I added you, because I have a question about how to deal with known 
issues and vulnerabilities regarding a board in buildroot, and I hope you can 
maybe give some good suggestions. See below.)

> actually the custom device tree containing the reset-sample node could be
> wrong. With the node it seems that the cores 1-3 might not be activated
> after all, but when omitting the node, it seems that the custom uboot does
> properly activate them. I have to have another look at this ...

Yep, the additional device tree node in conjunction with the Revyos uboot was 
wrong. I removed it and it is now working again with all four cores!

Furthermore, there is now a repo, containing the "Xuantie-bins", which has a 
LICENSE file in it[1]! I switched to using that repository. As it is a couple 
of 100MBs large, I changed the package makefile to only fetch the needed 
binaries and the LICENSE file. Hence, I prepared a 7th iterartion of the board.

However, I have further questions, I wanted to ask before sending a v7: There 
exist vulnerabilities reported for the board's SoC, e.g., "Ghostwrite"[2]. How 
would be a proper way to deal with such issues? Specifically regarding 
Ghostwrite the authors say, that to mitigate one would have to disable the 
SoCs vector extension. However, the only way I am currently aware to do that 
is to disable the SoC's vendor extensions all toghether (using the 
"theadisaee" bit in the "mxstatus" register). If I do so, I do get a kernel 
oops upon booting, as the kernel is executing some vendor specific 
instructions. Is there a proper way to disable the use of the vendor specific 
instructions by the kernel, which does not introduce other issues? Or 
alternatively would it be ok to only mention the vulnerability in the board's 
readme, (ofc. including links and CVEs), stating that the board support does 
not fix theses issues?

[1] https://github.com/XUANTIE-RV/xuantie-yocto
[2] https://ghostwriteattack.com/
[3] https://elixir.bootlin.com/linux/v6.12.6/source/arch/riscv/errata/thead/
errata.c





_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
