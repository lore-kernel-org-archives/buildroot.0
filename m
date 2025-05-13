Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D107DC3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E4160FD1;
	Tue, 13 May 2025 20:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtB7OCTj_2Hi; Tue, 13 May 2025 20:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B381160F7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B381160F7B;
	Tue, 13 May 2025 20:43:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6299153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB4E6411D6
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVVb1FR-ytof for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9ADF40DFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9ADF40DFD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9ADF40DFD
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:43:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B26B219F5A7;
 Tue, 13 May 2025 22:43:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 22:43:24 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 22:43:24 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250513195417.2730273-1-bernd@kuhls.net>
References: <20250513195417.2730273-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <8eda77722239c427666ca12085831bd3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747169005;
 bh=JkEqpFpRUQRn0ezU6SVfmWDLQ0AeShTHGWhgj5PmZbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qb3tXFSKJG3ASvX0MoXRhtj1uV+nEu/D4n4bAztJ/4IaSsU8/mkm7CYeF9r2ESgtA
 zwsWfhPEG3v09w0mQIKFXVEiTCgcQOjivM7xopRXWCVurYIK6pbxNAIw8LpIqjUZdV
 S3X/eQcNyxv8492yC68V1xDlr41cqacqeyd3Fb822dbKmcJQtLtEZjqPA5v5XnZR7u
 DHjSgIulsT8jnnb2rrVynnladwLz59MLTy8itSd2P9CmnjMp2tC10GO6vTDh72acpC
 AgpfBeuUUXAlrqXAQqzVawZtgDm2QWrXmAO6c/2HC/rckt6w8vk0FGxoJvddDeSqru
 d1nmPY61FTXQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qb3tXFSK
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250512
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

On 13/05/2025 21:54, Bernd Kuhls wrote:
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250512
> 
> CVE-2025-24495:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01322.html
> 
> CVE-2024-28956:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01153.html
> 
> CVE-2024-43420:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01247.html
> 
> CVE-2025-20103:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01244.html
> 
> "Note: INTEL-SA-01244 and INTEL-SA-01247 will be published on May 13th 
> 2025"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
