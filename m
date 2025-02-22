Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDBCC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 14:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEDC160592;
	Sat, 22 Feb 2025 14:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-g05B4aSipJ; Sat, 22 Feb 2025 14:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B74605EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B74605EA;
	Sat, 22 Feb 2025 14:21:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94766F11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 14:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786D960609
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 14:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxjIBapfjP_V for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 14:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 778DB60592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 778DB60592
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 778DB60592
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 14:21:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A9ECCB0053D;
 Sat, 22 Feb 2025 15:21:36 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 15:21:36 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 15:21:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: buildroot@buildroot.org
In-Reply-To: <AS1P250MB0608ECF736D7C41395E8474BA9C42@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608ECF736D7C41395E8474BA9C42@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
User-Agent: Webmail Free/1.6.10
Message-ID: <2d84da9bdeba5c882ae2f8f93bf8c48a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740234097;
 bh=f7r/1Q8nTf4DoN2yECFPsBetu16NeNGQ0OjqU3pheTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LEGPBSOwYP5GyqnorZsenEzFr34j4yBEt/v11n5dF9++SKDvSC1WJ6iNofi1WX1Kk
 jdxaoOSiP+KPKWjFgIBz53sMd31wEX2VXqzvd9DN8OXoDdJ2zpa/BFuZCOaBcW2697
 uN2p+SyhFMlRNHTpJVDtEPQPIVymWP4un+JTZJzOfwBcPuCLugpfHm+O3km4bMMWR6
 sUYhZ76BRTprAQshYJXH+/+tZbFZbIuS8PoirRPFcVbQmPdXnY3XG60AC+X67NQNHr
 pHlSeI+ieaeAkehEAfnufvvKkYhhmnJOL/hokX/TcHTxrMZsoCQSBb35edD/VWvcnm
 lADZs9p7/coqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LEGPBSOw
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-pico: bump to version
 1.2.1
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

On 20/02/2025 08:28, Michel Alex wrote:
> https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.2.1
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
