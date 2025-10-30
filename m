Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808FDCCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 577AD41189;
	Thu, 30 Oct 2025 21:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrRLk_0VVr_C; Thu, 30 Oct 2025 21:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70FD14155B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70FD14155B;
	Thu, 30 Oct 2025 21:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63ECA2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554BF61545
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI4kTZsn9pO6 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:03:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49B4461506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B4461506
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49B4461506
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:03:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6949B780372;
 Thu, 30 Oct 2025 22:03:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 30 Oct 2025 22:03:28 +0100
MIME-Version: 1.0
Date: Thu, 30 Oct 2025 22:03:28 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, romain.gantois@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20251018194314.114284-2-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
 <20251018194314.114284-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4d822fe939a5278ba17b08b6a1ca6fca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761858211;
 bh=yjebUlZKmgYjwxuqGBM8QjiXZJ0ExiC1weIOrodza2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G7LWePAf7/nL1ftdmWrblvhSVpwgAtghdknPCf8v4YRuMEv+e/i2NJbyz3D78ylck
 S+D53HQZrZFgd7z523+D63AbiBBIQuWfc6XrkNK/XY6Yb69jSWyFvfZCPZ5KYnssCK
 ayeMXfORmeB4sCooAsrpqnVNh93wwTL066D9X/ZzEWLJ3Bwk3WsI/p1fLuRPTjK/gi
 hspXahKxwCp2geKumjhjO6Hq1zhTHzPhIQjcPzMhzc2UMd6r8xlXnZjkLMxBNFCZRH
 2hy7tZdS9qoiCDwgld26dF85V0lgnaktGgzvpiBUv5k7NwmkdctimHpFg4/zYrGI1m
 dSS/qVLXt+pwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G7LWePAf
Subject: Re: [Buildroot] [PATCH 01/11] support/testing/infra: improve
 run_cmd_on_host() to show stdout/stderr
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

On 18/10/2025 21:42, Thomas Petazzoni via buildroot wrote:
> When run_cmd_on_host() runs a command that fails, we only get an
> exception with no details to debug what happened. Let's improve that
> by catching the exception, and printing the command output. This
> requires redirecting stderr to stdout (instead of /dev/null) and
> asking to get the output in text format.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
