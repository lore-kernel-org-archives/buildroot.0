Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B25C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 317276075A;
	Tue, 18 Feb 2025 20:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1CMI_zV0Spc; Tue, 18 Feb 2025 20:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41823607AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41823607AA;
	Tue, 18 Feb 2025 20:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B135E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F7EE80F72
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zut_Ef7mRBX4 for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA16580F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA16580F4B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA16580F4B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:40:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 076DE19F54D;
 Tue, 18 Feb 2025 21:40:10 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Feb 2025 21:40:10 +0100
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 21:40:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250212135027.759121-1-fancp2007@gmail.com>
References: <20250212135027.759121-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <006613d5f070af5f7c9dfef1d9a3ea7e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739911214;
 bh=vcfnGCE0MM1F1T9x+JxDKMrc2Cnagh4IYNsx361ptco=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Iz0Abe6Kdeckc8RT4wcc/NWpz71IhKtIF6AXxenfuqscGo+sdNYK1in/JYHepEsKp
 nP9DwKUBEXbLVNY+b1C4rEEGursZqyYJBh5iMUlKmxdXb6+Px8co0JBSjsplk9u3QS
 POgEJFTCF8rJ9JtTdEBiNiqGfQPXghVu67pVgYQoaAAVED5LcNwu67cgmUAy/5lcIK
 o14lPYUk+qTITwdpdUjkMrX2gLUOS7UixLVqoHt/z/E7AyUJNHQDo83vXCb3RVu8i+
 8kpSh3wYq/0wS5eKCqU2gBx13RFeOksdksBrcfAjZwk0qVorchNlGx2csYUmcrlFlY
 NPWtGpH2wvGSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Iz0Abe6K
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,

On 12/02/2025 14:50, Scott Fan wrote:
> As of release 3.49.0, the author has replaced the configure script used 
> in
> the precompiled amalgamation tarball with Autosetup instead of 
> Autotools.
> 
> Fixes:
>   https://autobuild.buildroot.org/?reason=sqlite-3.49.0
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

This sqlite bump still generates runtime errors. See for example:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9153298472

For info, you can run this test with the command:

     utils/docker-run support/testing/run-tests \
         -k -d dl -o output_folder \
         tests.package.test_proj

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
