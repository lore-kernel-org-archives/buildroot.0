Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C62CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 18:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4880D403A9;
	Thu,  4 Sep 2025 18:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcW2eFoSP6h3; Thu,  4 Sep 2025 18:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F68403C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F68403C8;
	Thu,  4 Sep 2025 18:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5514B1E04
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 463E3400AB
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g_nkK630Tok for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 18:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD208400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD208400A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD208400A1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4F3ED13F88F;
 Thu,  4 Sep 2025 20:36:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 20:36:47 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 20:36:47 +0200
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250904082207.61497-1-andrea.ricchi@amarulasolutions.com>
References: <20250904082207.61497-1-andrea.ricchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4ec5418d7bdffa1ab47e957856d1959f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757011009;
 bh=a/7+Cu/ZduUGI0aeNpOcJTbbv02t0BVAYCZYKWfxP4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jftkHeXEx0HuvSJTKvmVErmWXBlS/F9xInNCPwuy3VgcMySv+kEJ3FGlKMJLhIyke
 PL2jQFVIK6Yfa3jPAEkFHywPV0SQmpfUYWAeDHeiKVS3vg2WsJ5b36En3gEBIDqgTC
 pG4Y3chpsKp5M1/y9x0cWxSWhTQITxbw3JePQqrADU88wtbP+Yjoe+f0yrpnL4zNtG
 dag8h1sQd3WQ0z+FjmMi8EnvJ/4nYk0eopC1r3tpClj+gLB4jTNseW47geCoc+1tLi
 Zz60i0IxznvNnEK1Xbd5uE380B0YDjoHihEdr6yUCNi6NsxfI5VMXesKZtO40qPqN8
 bqyMBuqsDqIog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jftkHeXE
Subject: Re: [Buildroot] [PATCH v2 1/2] package/cutekeyboard: bump version
 to 1.4.0
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

On 04/09/2025 10:22, Andrea Ricchi wrote:
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
