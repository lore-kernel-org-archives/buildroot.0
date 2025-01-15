Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40978C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 19:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EBBE60E45;
	Wed, 15 Jan 2025 19:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suTuQ4wGY2pU; Wed, 15 Jan 2025 19:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 296F66109A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296F66109A;
	Wed, 15 Jan 2025 19:46:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DCEB89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E652883F48
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEvbrqXMa9ay for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 19:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A92C83F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A92C83F2D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A92C83F2D
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:46:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F26CE60141;
 Wed, 15 Jan 2025 20:46:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58892])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 20:46:42 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 20:46:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250115094956.2468555-1-neal.frager@amd.com>
References: <20250115094956.2468555-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <96938bd084c680007d6fe51247d222db@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736970410;
 bh=AqCtl1f4g7Ow2n3S3Dfo2JFHHUUAJH1xENiTm/KrTdA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=okGsNw4hCUtPDLvztZwyjw23foLvZHxHLPFtegsZQYEzVkxiYaLdqL/G6s+ozVi7d
 YvTNoEbWaZDxdgAHCwxGON6PDFJebw4kvVKxLnBtOr4vM2+CfpTS9Gj0o1M3Q6+d1w
 n8eF3rpwcnf/9JkXmMhIZ7CwnY+TASqA+DmHesO5jkSncUnWE5k5bHfePKo2aWiOeY
 dTrmvDBnBz6UH2POWTza2qlQN274RAY4nuKaPQWlKh2FzJSDtVtzDDVBGNKrSD9I8E
 AejisCChxRhR4SrZ3/y2bAOsxMSOPw5WBzLvoGQ2DBe1nSc/23WL1x74lWEgRkRNvj
 pjSH+8BpbinGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=okGsNw4h
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/versal_vck190_defconfig:
 bump to Linux 6.6.60
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

On 15/01/2025 10:49, Neal Frager via buildroot wrote:
> This patch bumps the versal_vck190_defconfig to Linux kernel 6.6.60.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
