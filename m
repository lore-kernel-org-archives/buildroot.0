Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F7C54E71
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 17:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3788B60B51;
	Wed, 21 May 2025 17:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLw-wa-sWtYR; Wed, 21 May 2025 17:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58C7A606A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C7A606A6;
	Wed, 21 May 2025 17:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57662758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5508260632
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOJTm9vtlFIN for <buildroot@buildroot.org>;
 Wed, 21 May 2025 17:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 665E2606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 665E2606A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 665E2606A6
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:44:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 16DA913F8CE;
 Wed, 21 May 2025 19:44:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 May 2025 19:44:19 +0200
MIME-Version: 1.0
Date: Wed, 21 May 2025 19:44:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20250521104719.783458-1-buildroot@bubu1.eu>
References: <20250521104719.783458-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <696deaca3d4d0b7e2f57f4074fbef1e5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747849463;
 bh=o/ZuGnhLOelc8YK2PvKTNwhMbBG1cpRv1zgxSRFfgxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LvESiPpkoZs/MfqfNNiH9BySN9ILhJOBezdTTNUkm6WBza8kFG4eflF/cryoACNZf
 aOYtaC2OD7zp4Khoc/nwIv445PDf4oRPhHAO6jLF47e1hIS1gwpWHmqliiTUxqRajJ
 1hZW/MYYciLzRBQkdFShcWPVzc5Tv9PlC1b0Pcop2rGVkLtz65zuqptGD7UrGBE4w8
 KsJe3AWfT3sWcyrgR9/2Qqpn2X2ULB33xrJrI5usHDnziCSbzbf7CzHwIPoadrA8/S
 xaBYYN4/abwvMHbKjDXFqak5HXbhJuF25Xdiz2J+chDPu8c4d1fW6GlaHIgrJ+pcZB
 msSB7k3DTOHgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LvESiPpk
Subject: Re: [Buildroot] [PATCH] package/python-click: bump to version 8.2.1
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

On 21/05/2025 12:47, Marcus Hoffmann via buildroot wrote:
> Bugfix release for click 8.2.0, changelog:
> https://click.palletsprojects.com/en/stable/changes/#version-8-2-1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Since this version bump is a bug fix only, I applied it on master. 
Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
