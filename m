Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BCFFC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F60812E4;
	Sat,  3 Jan 2026 12:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeGve7_wOnbW; Sat,  3 Jan 2026 12:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84E5812B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442291;
	bh=1HqXf+53cZbW9q8ObOjCQgCN77qkYHKVTIBr4z3UDc8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fm6A0f6xj5yDlV0/A7kwYMbvJrBZApP4nCtGacX7LSHoedfM2u9daOCBQC/6P3hiV
	 IIxS7CWJI0fkpbLHP6ElXOOKDkAwWxrUoxa3+oESx6MA00asSrRQ+hn+ASF6/4SNBJ
	 l36hRBLB+2fVRZgaM3Th1kzI+NN9f0eEtoHy3FhNICYuWh1/TsJ2lr5YWxhNL7S7fy
	 jUiCbcD3waf+zK8iYXConGTnCVaihVi3DoBR3q3ic43FSY8nTGuSreQLJCXZcdjRiq
	 vFWkbbTw6zlqtdnpJjjneaw6hppqUG8KxNOcRx4HYwD6wAP94CF99wY7ErtyAzW0nr
	 WOpG63u55rH9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C84E5812B8;
	Sat,  3 Jan 2026 12:11:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C60249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8B0B40499
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwFJiAZG5wbj for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5992404A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5992404A1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5992404A1
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E37FD19F732;
 Sat,  3 Jan 2026 13:11:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 13:11:26 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 13:11:26 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103004018.677643-1-james.hilliard1@gmail.com>
References: <20260103004018.677643-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <dcd663e9ade07d4a1a410f44024998ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767442288;
 bh=4x5Im3t/sCayGgtWi8vLDchExKuc+iEtclmF3YG0V4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a0UH/R5FUkHEXzjczkqVZDuTj4WHdbK1GWnsM/MD907nV/4XgZfBiy8tK3mbW2VYA
 yAte8Vdpudb+USDZcv/pYQzBQL96ofYQ0pU6s0LQhr0epyMeRIOOxL0NgtyVmbxsgz
 Zbe2XzPghP6Aoc34alRZn7rT2l3LxnmkI0wWN5fziFY1OnQXfT1k2LptzkMXWXCgLQ
 R28Mh6BIcbNBU1KbXGGqmRVyOSGjKfmYzXBI/IEo582V+JspyoS0itstZcwVREc/HD
 ayOTXn5E8esfAXo17TKqvJBgFrp8LlYJRKZkJ5KaA/fnCf/jq7izSMXl6TCH8ODapl
 BS8vtLApWeY6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a0UH/R5F
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump
 to version 1.76.0
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

On 03/01/2026 01:40, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
