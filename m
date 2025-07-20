Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C2C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE89820E0;
	Sun, 20 Jul 2025 11:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYQT_T80YN5F; Sun, 20 Jul 2025 11:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C941820B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C941820B2;
	Sun, 20 Jul 2025 11:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B711117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD2160BB8
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z74IUHydoznA for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57B6D61087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57B6D61087
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57B6D61087
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:00:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0A4C813F8A7;
 Sun, 20 Jul 2025 13:00:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 13:00:01 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 13:00:01 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alejandro_Gonz=C3=A1lez?=
 <alejandro.gonzalez.correo@gmail.com>
In-Reply-To: <20250619082600.2176432-1-yegorslists@googlemail.com>
References: <20250619082600.2176432-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1c274f5f8a78756de1eb7bd2c34f4822@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753009204;
 bh=a/FP/7ZMbXiKmv80tC5L+QEP7HTptntuAvKjkP1cQ/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tzxxjQweUggPtnArLJe6hNVfQCGZVfsceAIFeliQHsFJRg0pIsZwtO3+mWFXFBy77
 bSpwRevlIWUgGPMkzxWleISWh12UiNKC71vWs5+SGvD0VyX/ZfoYQKU/OgAEJqdcQD
 q81IgIghrn7TRareuaeur2I/tfBpzkZZzRhI+u4VwMu9/fxvKqmeoGWHqFoFwWRQD5
 6/Iavc8PHW4wpLR252FIR+9WqXnsnGJJ0P/ET+Zd6xx4SkTckg4Dj89+cmR9WYUEbr
 2urXgZL5H3wp9hHnO+FaDVANio1FKBH3a2Ci0a0zDSDYL2x/iGmkerY38Yzx4Xs2ki
 ng6xQZqCJEwcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tzxxjQwe
Subject: Re: [Buildroot] [PATCH] package/watchdog: do not guard shutdown
 __GLIBC__
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

On 19/06/2025 10:25, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> These headers are provided by uclibc/musl/glibc and bionic so we can
> assume they are not needed to be glibc specific includes. This also
> ensures that we get proper declaration of reboot() API.
> 
> Upstream:
> https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/
> 
> Fixes:
> https://autobuild.buildroot.org/results/3e67d5b3b89d794e3f6c510803368f8b100b07a7/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
