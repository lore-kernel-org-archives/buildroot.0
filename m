Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761EEC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DF9B81E0D;
	Sat, 17 May 2025 16:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO45bJJH9mqV; Sat, 17 May 2025 16:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA9482BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA9482BBC;
	Sat, 17 May 2025 16:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE7B3204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAEE1400D2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6H2dPDmPqMOY for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D46240350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D46240350
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D46240350
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:30:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC3D14327F;
 Sat, 17 May 2025 16:30:01 +0000 (UTC)
Date: Sat, 17 May 2025 18:30:00 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250517183000.40b28b4d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfegueffiedvfedtueeuhefgjeevffdttdfhfeffieegtdefudfhvefhtdfhffenucffohhmrghinhepvgigihhmrdhorhhgpdguvggsihgrnhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepnhhvugesnhhishhtrdhgohhvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747499401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4HeGJ1KDVuECFOBx3rqvEtoAA1/w+5Pq3gK9K3Ye3fU=;
 b=AtpBe5ANfj/E+P1b4UlY8M2jGEc9HCJcatvM99W6DJmbtTzmme6ojtsIaYpqmyWPWDoT/7
 KtwB/E1C9Va7P/SCyxP75IwwhgSkXDheyMipVPxG0aaLquZuMX+GErGFBVGNR2Pdo4JoYK
 a4MoH/Wq4dIsldfnRTvTFLhuPwMNowJ7828oUteE3LRBi+PkkzCkCuEOtonouwoMiGXQ2Q
 5csraiw7HYxAJXBhNdT3HAxpveGmsBw4cgJqDtsKacOdsaMNoXE9wkuFcsGt6mb5vLGC1w
 xNAoIYAVB5ptJzfVUQ+FVjrAWdvGJ3z7fPy23fuS4ktq83WRsfsgDdcwSrRlpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AtpBe5AN
Subject: [Buildroot] CVE-2022-3620 version range fix
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

CVE-2022-3620 is documented in your database as affecting version
2022-10-18 of exim, which doesn't make much sense as there is no such
version released by the exim project. See their version naming scheme
by looking at their Git tags:

  https://code.exim.org/exim/exim/tags

The Debian Security Tracker at
https://security-tracker.debian.org/tracker/CVE-2022-3620 documents
that this CVE was introduced in commit
92583637b25b6bde926f9ca6be7b085e5ac8b1e6, which first appeared in the
release 4.95 of exim:

$ git tag --contains 92583637b25b6bde926f9ca6be7b085e5ac8b1e6 | sort | head -1
exim-4.95

And was subsequently fixed by 12fb3842f81bcbd4a4519d5728f2d7e0e3ca1445
which first appeared in the release 4.97 of exim:

$ git tag --contains 12fb3842f81bcbd4a4519d5728f2d7e0e3ca1445 | sort | head -1
exim-4.97

Therefore, your entry CVE-2022-3620 should be updated to reflect that
version 4.95 to 4.97 are affected.

Do you think you could adjust this in your database?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
