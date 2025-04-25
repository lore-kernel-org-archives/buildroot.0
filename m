Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF18C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3260B83D42;
	Fri, 25 Apr 2025 16:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7HqWHGHsuml; Fri, 25 Apr 2025 16:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D11983C6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D11983C6F;
	Fri, 25 Apr 2025 16:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA3A127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4017A42E35
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vcj8e4_VAHka for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0F6A42E31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0F6A42E31
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0F6A42E31
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:11:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ADE7620040F;
 Fri, 25 Apr 2025 18:11:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:11:26 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:11:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250424112203.2858147-1-elmehdi.younes@smile.fr>
References: <20250424112203.2858147-1-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <db895c6230a200d0c7d90db28d61ecaa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745597487;
 bh=niVYX8Hy/lC30xciVvN9cSMzpABlH24dayo9HN32XKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NfYGlx9UUE/LcOs4wrpOE57qObMMia8OT1uWKukwVOSPxCJ/plbdBQ9fcTnG4bpMS
 lv1RP+3SQ6/xEhhdWQCS0H++oT8+eawnacwv0QR2/+VlCahZS2ZJzzhO4yh9K+8xSE
 anvBGXDuCY/FoC4qZ4Fkmet9mpCzHNkAugGQAg/N/hf7p8AYqljjW+fN0Jfz1ccDPa
 gYLFtW0b6BrwLTBd1AkskJRtB+2APL7RmnModXAHL8NtHJYuile8JpjipFhl9TNCKi
 Hmt5vwZC/GFOgKCwFYdqvbi7WdVoRMvyEV9AkZFSULSiaWxYxqMvfWksu2Ppavxm7g
 Ob2yKvDfd2EnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NfYGlx9U
Subject: Re: [Buildroot] [PATCH v2] support/test: new dust runtime test
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

On 24/04/2025 13:22, El Mehdi YOUNES via buildroot wrote:
> Add a runtime test for the 'dust' package to verify that the binary
> executes correctly in a minimal buildroot rootfs. The test checks that:
> - 'dust --version' runs without error
> - 'dust' can analyze a directory structure with files
> - The output includes the expected directory names
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
