Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A9CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 217674100C;
	Wed,  5 Nov 2025 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uarfsXqNONSz; Wed,  5 Nov 2025 19:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A1C34114E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1C34114E;
	Wed,  5 Nov 2025 19:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 972F44C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 19:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88C5B842C1
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 19:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8byw1A-4Nl4 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 19:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9B4B842B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B4B842B8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9B4B842B8
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 19:55:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C9ED2003AE;
 Wed,  5 Nov 2025 20:55:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 20:55:47 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 20:55:47 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Abelino Romo <abelino.romo@gmail.com>
In-Reply-To: <20251105113208.3223645-1-fiona.klute@gmx.de>
References: <20251105113208.3223645-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <c6e4543c11969eb44f8526a06896a82d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762372549;
 bh=ppeDIFwl7ZRgNkErwQAhorvICtKVGO57FBJQq9MKphY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TTa5s7OsYtYe05rw+5LqUA6ndTcC8I4Mb7ub5/u7j7FRassZBhfxgOecCVFqAhvE2
 pkP3kV7gIOjR4vewL7xs8VJVsdqaY6b6RzPEgyj+VwYl+86MzrM0ZZMBGsdWflh9AZ
 1qTfUCwgb4uLxHAI97hYIqTe75tyGOuG60RMsEdVInQhBeabm6Q1V+5RK2jpUnR4IN
 vasRkjxL0PAbW0prJX+HnOfsuLrrUOt4tHTtdSv7AR2NdZaQsAYdEjP5zl0RCO4Ij+
 tMOnMj/DXHZNDwAqOSWXCg5GwJTaPUf2MqPFEe+f3K8fqM2tZ1XXrOBJShgJucDeQ7
 zV5GmPEqheNvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TTa5s7Os
Subject: Re: [Buildroot] [PATCH v4 1/1] package/tpm2-tss: bump version to
 4.1.3
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

On 05/11/2025 12:32, Fiona Klute via buildroot wrote:
> From: Abelino Romo <abelino.romo@gmail.com>
> 
> On v3.2.2, testing with an Infineon SLB9673 resulted in the following
> error when attempting to read from a previously written NV index.
> Upgrading to the latest release, v4.1.3, resolves the issue:
> 
> ```shell
> ~# tpm2_nvread 0x1900001
> WARN: Reading full size of the NV index
> ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() 
> Error: Esys handle does not exist (70018).
> ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource 
> object is bad
> ERROR: Failed to get shandle
> ERROR: Failed to read NVRAM area at index 0x1900001
> ERROR: Unable to run tpm2_nvread
> ```
> 
> Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
> includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
> features. Bumping to v4.1.3 adds access to these improvements and
> addresses the NV index read issue.
> 
> [1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0
> 
> Signed-off-by: Abelino Romo <abelino.romo@gmail.com>
> [Fiona: rebase for package/tpm2-tss changes]
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master.
For info, I added the mention "security" in the commit title and added a 
link to the CVE.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
