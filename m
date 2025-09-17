Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E47DCAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CC88474A;
	Wed, 17 Sep 2025 21:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BfwA51Bi-2k; Wed, 17 Sep 2025 21:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D7E84746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D7E84746;
	Wed, 17 Sep 2025 21:07:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6683DAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C7E94172F
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AC_2dFSlKFdX for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77AE541676
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77AE541676
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77AE541676
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9AC9EB0051B;
 Wed, 17 Sep 2025 23:07:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 23:07:40 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 23:07:40 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250830170904.1857479-1-ju.o@free.fr>
References: <20250830170904.1857479-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <2cb3deeed0b41f4adaa6b1b8e05b33f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758143261;
 bh=zl4XX6Ol+7UDfqTOu+RgCPJhfv3947AGcQjic74+lB8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UMGEmSpn+LSMP1LZGm8yc2npSpCVwWGxvg2W2V7E06LPBP20NFfCY/+ixJH1OHLEk
 pWcPigeyEGDKMrMt8xXvGB/Ew9KaMhQGSQLw9FIZ4fjQ/i+Gm9odIiQdQ7seUgkMae
 2L43D4JeuQIVOTELJUPwbLEQCXB0Cpsv49sczqLphmm3aMznbW4Hv8SdyPHwdUbuT5
 bBDVyRtG8/ce7z7iF2hcz4YqsrY+U3Edn0Q5HbWXIFTdyTrGlX6JF9nZQd7b9zNfAb
 bXhB6F/dDRA9WZyNEFzv+WSPTbopEKNaZPRvv1DUdwY0BBGphJgVvKTQuorvMzj0Pj
 CewSQVgHi4OTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UMGEmSpn
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_fwts.py: switch to neoverse-n2 cpu
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/08/2025 19:09, Julien Olivain via buildroot wrote:
> The SBSA Reference Platform was updated to neoverse-n2 (armv9.0a)
> in Qemu v9.1 [1].
> 
> The Armv9-A and Neoverse N2 core support was added in Buildroot
> commit [2].
> 
> Since the test_fwts uses the Qemu sbsa-ref machine, this commit
> aligns it to use the neoverse-n2 cpu.
> 
> [1] 
> https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a
> [2] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/9845bd4541cb03e97e577281f3c64f00c6ead881
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied on master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
