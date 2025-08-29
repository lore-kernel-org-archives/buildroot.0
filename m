Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF3ACA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 16:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6D741844;
	Fri, 29 Aug 2025 16:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pF5eQysNYV78; Fri, 29 Aug 2025 16:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC9DA41824
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC9DA41824;
	Fri, 29 Aug 2025 16:27:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B172D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D4E340735
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMVqVsszyZQh for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 16:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 399204003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399204003D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 399204003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:27:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0A95E4E40C8A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:27:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA32C605F1;
 Fri, 29 Aug 2025 16:27:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 241BF1C228022; 
 Fri, 29 Aug 2025 18:27:06 +0200 (CEST)
Date: Fri, 29 Aug 2025 18:27:04 +0200
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>, Yuriy Kolerov
 <yuriy.kolerov@synopsys.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Message-ID: <20250829182704.226c2560@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756484835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=2iiMTf93IpON7OV3/m+TsR/Xh3j6q9TiC3HTHwiLnRw=;
 b=pgXZqgTsT6IBdbuLIlkT/dKX2PgoWsp2OmtKhju4WDnSrFIqCJJhFksKNmlSolVtAq94kl
 olDNqtzpcub3JYLO5/vzPwX6apn7P74uWg+RSwk7sm702gY6qTg1Zt2YErnpzaNyvn0MMo
 WHG9Lko0Rbv/wEHX5E08nGewPBgBap4PC8c50FzuXuGJFI0xUbBtlNnXRC40TK6Q4O54vX
 /Ib0Rh6Jlj5mNi/I9whqkO/C2Whm8z4FUy2zz+QU2DlOiElbeWvIkCjC+SYHdLg7OQiobq
 qdcDpYYnlEyfyApiq89F0JdjrYxjZ6dZcOlmKjLe/fly48nCyxoaFqcnU7uz7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pgXZqgTs
Subject: [Buildroot] Issue with libatomic in recent ARC GCC versions
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

Hello Alexey,

I hope this message finds you well.

We are seeing a number of build failures due to libatomic on ARC 750d.
Indeed, it seems like libatomic.so needs __atomic_test_and_set (the
symbol is undefined in the library), but nothing provides it.

Example 1 with libcap:

  http://autobuild.buildroot.net/results/297/2975043dd2c9d537e7a5b5634e7ad047a7a08afc/build-end.log

Example 2 with android-tools:

  http://autobuild.buildroot.net/results/c02/c02ab71087eb70fc6bd5d40ecc509cfe0df36233/build-end.log

And indeed, looking at libatomic.so:

    15: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __atomic_test_and_set

This issue happens with both GCC arc-2024.12-release and the upstream
GCC 15.x.

Aside from this specific issue, we're seeing less and less
contributions from Synopsys to the ARC support (not to say zero
contributions). I was the one doing recently an update of ARC toolchain
components. But there are ARC related build failures, we get
essentially no feedback, even though a daily e-mail is sent with build
failure reports.

Should we drop support for the ARC CPU architecture in Buildroot?
Without more active support from Synopsys, it's likely what will happen.

Thanks a lot for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
