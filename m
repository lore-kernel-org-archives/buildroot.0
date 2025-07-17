Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D24EC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E8F96081B;
	Thu, 17 Jul 2025 19:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd3XbI_vJvUE; Thu, 17 Jul 2025 19:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98F96607CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F96607CC;
	Thu, 17 Jul 2025 19:21:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C5CDA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A91083CEC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfPLGbV1IgMa for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 450D683CAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450D683CAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 450D683CAB
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:21:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2015FB00571;
 Thu, 17 Jul 2025 21:21:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 17 Jul 2025 21:21:50 +0200
MIME-Version: 1.0
Date: Thu, 17 Jul 2025 21:21:50 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250716055941.1323148-1-dario.binacchi@amarulasolutions.com>
References: <20250716055941.1323148-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0b1e5f61dce71ab3833fab677ddd33f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752780112;
 bh=aZPPUYrwU/FSgMwoQICNlL8f+kz1MEM8q6+zJGHXUJY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UeyZhvYi/Nw1Ba4UoPiv449jM/UqHD9Pl7eJgm+W8yuwuLfvdohEDfpnWPGvZ7mL7
 vsdip0TXjnk7Z7xv84lqTD0cLJln5Ha5NY6FdUY+Tb2TnJwUuoQmg5M+V+nrTUMdj0
 1R3s8boeVsEuYh+cwmneSNtvPt9vYEQ1dEViX5xDSPHzcIh2SktnSU+sHmEKA/rxOt
 AMqQd+a2hOIzESVMArbYAkSShd1ZYdgsJB3pfh1e21OrCsUA/PAnioj2IyRh4aMEjG
 x2w3VqSGAWnDZdmOJSK7RZTQJrLFE2O+dovLBeYGJOn8w6ZU4QD1rO4h2DaP+cFJui
 5nI0RUlOmsH7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UeyZhvYi
Subject: Re: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version
 7.14.12
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

On 16/07/2025 07:59, Dario Binacchi wrote:
> Release notes:
> https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v7.14.12
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
