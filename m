Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273BCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEC341249;
	Wed,  5 Nov 2025 20:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kE6H1iLvOKQ; Wed,  5 Nov 2025 20:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12233411AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12233411AE;
	Wed,  5 Nov 2025 20:02:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC9244C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE0FF844B7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ec0OfJCg_On6 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DA0D844B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA0D844B6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DA0D844B6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:02:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E85D019F74E;
 Wed,  5 Nov 2025 21:02:17 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 21:02:17 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 21:02:17 +0100
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251103072700.968500-1-vladimir.kondratiev@mobileye.com>
References: <20251103072700.968500-1-vladimir.kondratiev@mobileye.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f28eafbd5ff9e85c8b1912de00f015f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762372939;
 bh=+mZOWCchjcU++dT9OiVESyUpbxBIt3snoryhJnbVj70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=onZn3imSIA15mH0sSAsDq0wHUhw4itClnVGlGpHooGQRAW6uu+4Q3/jagGGhl1wVy
 KW5/uM4zWd2VMKntwAcZzioa4iAKU1iEP8p27u1/SfkqNoUjNBzTQxwMILeqKQfEMb
 I+rI0iJs+pluoUDkcaQGAYrkMKih8tawSMe5wY7AxbCT7tDWJ11WT8ACdyhb1Hl1ha
 9b5N1v4f0RzvjMdvPfmqUXo0fBO0uRmc4fn3qlBUgD5atkiNPZDPf1TWW4HSuBYy3i
 gModDLY0uPUW2v9WvW5V8S5ZOoJ/HmRR6pBYIpQT7S9mm6XrtwPFza7hBrF67zLRxq
 kFyqK0hnxMz0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=onZn3imS
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: enable on risc-v
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

On 03/11/2025 08:27, Vladimir Kondratiev via buildroot wrote:
> Starting from version 2.0.32, kexec has support for the
> risc-v architecture
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
