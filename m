Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7325CCFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 14:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F8D60B43;
	Sun, 23 Nov 2025 14:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xibhYf8oBm82; Sun, 23 Nov 2025 14:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C00F60A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C00F60A98;
	Sun, 23 Nov 2025 14:16:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96026E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 14:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C431401E0
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 14:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcV1SneFxALs for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 14:16:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E3E140147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E3E140147
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E3E140147
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 14:16:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3892860132;
 Sun, 23 Nov 2025 15:16:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Nov 2025 15:16:16 +0100
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 15:16:16 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
References: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fe64d9aca519af339d5d30054c162d0e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763907378;
 bh=Cyp9O/Y1YedUFqZFSt7YjelvLP349SKrIDTjypH5stg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WLit7sSjgtot5/vhbftVOqopXkN9n5fgs2LNeLSC/ZO7cKXimyBeymKTzSFme6vT5
 MJvQ1daYDx8POxUAHUFp24rXIzqKre987NzcWql5CMtFKrw9nnCtSUZCgfyPJNu7ZS
 +0+UgysM1gb2AuaFgD7dlj/HuRwExWC2AeP71ZXkXPbZjRcaAc3Ewv2LtJZ42BkOsm
 XyTFqO4fUC7p4Zlg3DAz75O35fhnON7QsQ1HWIBFlww2g0KHK6/gZ4YRDhXemdcMlk
 jHUutwHrBnU8XMuzlyPSRPACM7F9f/qwFYbWPVv/FMTUZwYLCv2H5zghL1c58S/HgZ
 4srUKNIvAhWBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WLit7sSj
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
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

On 23/11/2025 14:34, Thomas Petazzoni via buildroot wrote:
> The bump of e2fsprogs to 1.47.3 in Buildroot commit
> bb004ddba26ea86687d917fa16d313ea92aff41c causes the package to fail
> building when the kernel headers are >= 5.10 but < 5.12.
> 
> Indeed the new version of e2fsprogs detects the presence of
> <linux/fsverity.h> (which occurred in 5.10), and when it's available,
> enables some fsverity functionality, which uses an ioctl() that was
> only introduced in 5.12. This causes some build breakage if the
> headers used are 5.10 or 5.11.
> 
> We fix this by introducing a patch, submitted upstream, that not only
> verifies the availability of the header file, but also the
> availability of the ioctl().
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/c573233b1f871c61f916eda9c402c84070902432/ 
> (host-e2fsprogs)
>   
> https://autobuild.buildroot.net/results/0ed16cad1d1f500d0e577d03166c06381be73ffc/ 
> (e2fsprogs)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
