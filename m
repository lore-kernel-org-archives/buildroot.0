Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D62FC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 20:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6BB6061E;
	Sat, 18 Jan 2025 20:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fGe-0sn4Imv; Sat, 18 Jan 2025 20:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1AF46074A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1AF46074A;
	Sat, 18 Jan 2025 20:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C76E7B89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9FD840F4B
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wijDp9KVzbL for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 20:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 590EE4109F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 590EE4109F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 590EE4109F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:41:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 494F513F854;
 Sat, 18 Jan 2025 21:41:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35358])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 21:41:43 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 21:41:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250118083434.2882430-1-bernd@kuhls.net>
References: <20250118083434.2882430-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <2329929fe5e15b1067a5ffc5f940068f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737232904;
 bh=QRKR3P0BFTIfIMOcaTaGGpVQRyza77gThM4pBfzICZk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j+An5uvrtDvVzxdSwjcFkB9FibD959DxPVOnbDkZ5UA0/Sz5gOharpSqVa6vIGqI2
 X1Nlpb//wFziKKfrZpzZ6/s4zBBzhJYCj1nZ2igbz+My7UQNpBHPEEmhJart9AFAd5
 TyVX4wq39dbSCs6acocO1SpjZwRwtIVHGftDJUQTOQlz71Z4eq69t+nKXvhz97z1P4
 Y3V120V4N2CnKU21u51YhGXkUjeBJ9C/gAuVlVAvCqnW0j8l48vg8gRZh3hMcNX9SK
 cU+YpE8LCFBuTVJXmU8GMLcEtVmw6PuuvRk5kzjzB2ymgdY4ktx7QmBPsOQ36XfjOB
 lYrUnI3opgluA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j+An5uvr
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.1.0
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

On 18/01/2025 09:34, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
