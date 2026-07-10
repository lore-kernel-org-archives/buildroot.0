Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7D9C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E21C40A44;
	Fri, 10 Jul 2026 20:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMXKHhRPu2tf; Fri, 10 Jul 2026 20:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F21240A33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783715039;
	bh=cGMoJ/o6IYS1vrB04OgyXevyWBedizzLM1LPNXe4KC0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DB5Ygo3gZW0OW3cej9oFRpT9YnFu/osjUYcVZ10pxibpF8lUrWj7MglfABSJS8KQW
	 uVqvM6nTlWDFGj+jbKGU6E9jXVBImBsK3znq91Z/cK3/oQVZkCnWQfAeD9v84ZxkUS
	 5p1XpNG3cYXsuECvoJCp2tN/NWJu4eVkKLQCZR8zjGugIwJ4oKdDI0hyoymGgx9qXv
	 wRgzYgECdErWWz/5rPu2bziPs02dU8pEmPwE/GLvcBCPe6rjlabrWeFuqlKR0uL89x
	 79UKkGA8Ss7L4Vpl++i/XE4vYkrYYCpEkv1sVFd/HNIcdY5gslRor90GY6Q/DFqIcE
	 V1Przbg34o63g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F21240A33;
	Fri, 10 Jul 2026 20:23:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53147372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38764608C9
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tCQPHcjxQwG for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6600460877
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6600460877
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6600460877
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:23:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 51F745FFC0;
 Fri, 10 Jul 2026 22:23:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 22:23:54 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 22:23:54 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260709122406.1125768-1-giulio.benetti@benettiengineering.com>
References: <20260709122406.1125768-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <cdbfd9866e94b9e7fb7d19aae8699106@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783715035;
 bh=le6g6B1qu894p/RMI+WFofFN93674k2wRtBpce1OQuo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MvmUDVlHN3wm8fEG8X6PWhbsvh0sYl28CktPXfbAxHQs0H+hPHB15aEvInjQZ8m+8
 r9ppVyEDwbfXGGPDqd/6ZWhpMG4dXPfJy6kCL8gbIQu9SezRp4/CY1/HOPIgN4Cfh6
 gZaG0v7U3MW65dznwjXbNHyxQEZBZ6WGJKH/TC4wLN98DAWqsqzHFYNsDZhx58VWeU
 YZu4xq1/2etUa1Lpgw1fOhA2RttBcv9rrfpkELvpYc464B8C6vTQ1693KRvI99oTOt
 xk0dPc+O/LpT2Tze9XP/cgq4J+5Tbk3sk8kEemVIYv92o4px3mrS6ICVlaIKpbdpBp
 w5rsnUbURLK/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MvmUDVlH
Subject: Re: [Buildroot] [PATCH] package/wireshark: bump to v4.4.17
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

On 09/07/2026 14:24, Giulio Benetti wrote:
> For more information on the version bump, see:
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.17.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
