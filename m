Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA21EC61DB2
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 21:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E38A80CD5;
	Tue, 10 Jun 2025 21:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNVbb_CZ64OC; Tue, 10 Jun 2025 21:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF1B80CDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF1B80CDD;
	Tue, 10 Jun 2025 21:52:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F631F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED150400E7
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PdfxrJCN873 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 21:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2D7140069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D7140069
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2D7140069
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 21:52:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0B9445FFB4;
 Tue, 10 Jun 2025 23:52:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 23:52:28 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 23:52:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250610052904.2449000-1-neal.frager@amd.com>
References: <20250610052904.2449000-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <45480e15d07b1a146ec7f0b0f77a0d4a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749592356;
 bh=gFga01DIhtk5CJE2UIDNZ13n0yRpj9w8ga9TeHIcZ9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=opTJLhrWCjJf3pCAF/ztfoEkpuHLq3jT2g7uYzKIHWM/OAKr5rK+LFkTEaSieMTKN
 SYIJtBSPXC0IaseqSm2FwyeXL9Ohv8yoe4S1fJaGVDI9PEcDdiJjyB/2+WjuaS/onj
 bUgbW7VHlrH2RtxmWhDuwzsxLb78z/9Nla5RrLBCi6imkOY4OolZXboY9I/ZIcI+2J
 w83FcK34koGhYXDrWKHO2RhasgW3orbzBmi9blSwmBRZdbuTrall1XKybCBPvC6vjv
 X9+LUVt5F5Kdlopg0f4X9Tv9DaSlfKYNJ19JaUpYDJQjVsqicZPCzKbnjG78OpogBZ
 FaF4F5dTaoB6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=opTJLhrW
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: bump default
 to xilinx_v2025.1
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

On 10/06/2025 07:29, Neal Frager via buildroot wrote:
> Now that all zynqmp and versal defconfigs have bumped to version
> xilinx_v2025.1, the xilinx-embeddedsw default version can also be 
> bumped
> to xilinx_v2025.1.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
