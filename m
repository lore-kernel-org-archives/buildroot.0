Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A2C7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D94C81207;
	Wed, 18 Jun 2025 20:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z4FPNPgN4c8; Wed, 18 Jun 2025 20:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E00811D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0E00811D2;
	Wed, 18 Jun 2025 20:10:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE44A16B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E02FC60035
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id he4uDZZ4V8ZZ for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B9ED60B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B9ED60B55
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B9ED60B55
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:10:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BE3FF5FF88;
 Wed, 18 Jun 2025 22:10:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Jun 2025 22:10:52 +0200
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:10:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250617210228.1146390-1-bernd@kuhls.net>
References: <20250617210228.1146390-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <545c2ece0b8a75bc9fef1d517da28563@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750277453;
 bh=9bR3UD6CadqIdqkuhYHsoyf1+iCE9MZWkpu7DlJqLaA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m2WfYaDvTTO/7BxmKF3XjeEcGUqp5uqzI/SHSnA6aJIBJP/LuvZ0p8yM2h06lzBS1
 s6m8SAAXdqAEsiZ+vYFHtKuF/kfzgwduo2V1I5eG0zEpEz6f8Zuw4v/cd+0ar9wAaB
 Y6sQZzSDEMTj2TH9rREpwII0W2+ktTQF+4r6olVc4vECbX6ucRZKlw0NmHZSQgX5L9
 jv8pLiQnrgEIU+exnLVzm3rwku65c2Vb9CD1Hc9eM8+0Zu1DHbrEehp8MmaJrOnOW5
 ZO8XymKstvzF87f67dPJcEkGFJJW/R0VU8zLZoIFsfluWuvKbRQAhpd0RO7YVqdBJ5
 w7twJYBB76tJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m2WfYaDv
Subject: Re: [Buildroot] [PATCH 1/1] package/libplatform: bump version
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

On 17/06/2025 23:02, Bernd Kuhls wrote:
> Removed patch which is included in this release:
> https://github.com/Pulse-Eight/platform/commit/e48db06c64613ac76c820511da95228bcd072f64
> 
> Use upstream-provided license file:
> https://github.com/Pulse-Eight/platform/commit/92220248b11c43a80105567dbb074c5f30b04029
> 
> This bump includes compatibility with cmake 4.x:
> https://github.com/Pulse-Eight/platform/commit/d7faed1c696b1a6a67f114a63a0f4c085f0f9195
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
