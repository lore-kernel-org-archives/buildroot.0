Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA315C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 10:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF0780EAC;
	Sat, 12 Jul 2025 10:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1htWqk5F146; Sat, 12 Jul 2025 10:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E273780ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E273780ECE;
	Sat, 12 Jul 2025 10:41:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93C12436
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7970F41178
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3HI_jbSFlc5 for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 10:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85F084083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F084083E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85F084083E
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:41:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 80301B00596;
 Sat, 12 Jul 2025 12:41:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 12:41:20 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 12:41:20 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250710-loongarch-fabi-v2-1-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
 <20250710-loongarch-fabi-v2-1-72fcf95c8b65@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3cbd7e67a6f2f0ca9e68150e2b61f955@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752316881;
 bh=YGdsnQT2lebBnMNYnxpmT9V6SPQOxuwDXcRwUwZObhU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P1ju8/NX/GA+YG1jNd0Q2nB0BbUP29ZAydsJANOVojhn5HXf8DO9zauBGPZjuZeI8
 umlLNiSF003Ph/DGtZcFhNMlLYIQUiJoQ96Ziwb5soia4uuneOWPthw97djhCo3trH
 xD4utbxzH33DMPqpv1l8TRv0kZk6T52FHgzw/g4d1QkC7A+gr3Y0ZfeDUxb7impLA4
 2tqDNsBvHPFmqgCDteH1speqg09/s32qoLQRqov6lkGlJ//mGjzllY9LEmLN8zBFh2
 gFqObJubsx73k6iRhJMRWzMQNsJmROQPMAKosGO4ge9z1L+pS3VkShuyUKWNxps+bV
 Qpr4C5S/Kh34Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P1ju8/NX
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/loongarch: Fix toolchain triple
 ABI suffix
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

On 10/07/2025 12:41, Jiaxun Yang wrote:
> LoongArch GCC infers ABI from triple suffix, thus it's necesessary
> to set up proper triple ABI suffixes for different ABI types.
> 
> Adjust ABI suffix as per Table 10. List of possible <fabi-suffix>
> in "LoongArch Toolchain Conventions Version 1.00".
> 
> Link: 
> https://loongson.github.io/LoongArch-Documentation/LoongArch-toolchain-conventions-EN.html
> Link: https://lore.kernel.org/all/20250706105859.292908-1-ju.o@free.fr/
> Suggested-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
