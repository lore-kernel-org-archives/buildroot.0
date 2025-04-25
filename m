Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFBBC369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8068A42549;
	Fri, 25 Apr 2025 16:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg2a0FWsffhH; Fri, 25 Apr 2025 16:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA10042556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA10042556;
	Fri, 25 Apr 2025 16:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42214127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C8661224
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWRp0sTrUn1d for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8415D608EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8415D608EA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8415D608EA
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:14:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 810C0780389;
 Fri, 25 Apr 2025 18:14:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:14:11 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:14:11 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20250424211216.4117827-1-thomas.petazzoni@bootlin.com>
References: <20250424211216.4117827-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f6197ac6e822cd050f90bd33e4f98e9f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745597653;
 bh=T+ENCVmZ9U70o2WNuI7LR+pmaplaXS5DL8mX34Ad9lY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ip+vQDAB9b41aefXcY/m6Fs718iHkWOE4E3gP5C7ik61BXLopmqb3pURM+l+Pvz0V
 C3S0kVEZHgWt7t3YYcuqiMBPv8hW/1QXyBYXMQKvzMTB/6dMdaKm7NVgt70laJ03jP
 N06+8EDjVf0LSxpY0L5E04T1nWFb3/szqZMXQf3yD5DY3I7iupwHRaPFzz/dTG+bGr
 Wk18lihoa92BsEmN7NHH42R4Oa5g8xfER+U5JNS/H+dz84/Nr3ArcAztUw8u7T2JjN
 U1Oei1MQIFOCt5eSWwLkXCkNvV9J0gbIPGBHJTeVMU3mPBNHAMwInwAb5bW3R+MqOz
 Qk2q2Naz1nCMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ip+vQDAB
Subject: Re: [Buildroot] [PATCH] package/dpdk: fixup Config.in comment about
 dependencies
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

On 24/04/2025 23:12, Thomas Petazzoni via buildroot wrote:
> The Config.in comment in the dpdk package was wrong for a number of
> reasons:
> 
> - It didn't mention the glibc dependency
> 
> - It didn't mention the gcc >= 4.9 dependency
> 
> - It mentioned a wchar dependency that isn't listed in the dpdk
>   dependencies
> 
> - It mentioned a dynamic library dependency that isn't listed in the
>   dpdk dependencies
> 
> - It used "kernel headers >= 4.19", while for brievity we use "headers
>   >= 4.19" everywhere in Buildroot
> 
> - Minor nit: DPDK was written allcaps, while we write package names
>   lower-case in Buildroot
> 
> Fixes: d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179 ("package/dpdk: add 
> 24.07")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
