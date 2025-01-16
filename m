Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2815C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 22:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE0B6FB56;
	Thu, 16 Jan 2025 22:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXK_2rp2C1Te; Thu, 16 Jan 2025 22:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA2B6FB43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA2B6FB43;
	Thu, 16 Jan 2025 22:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61EF5B89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412DF41691
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwnwKmbYAgOb for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 22:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B60741686
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B60741686
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B60741686
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:25:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E8C8013F86E;
 Thu, 16 Jan 2025 23:25:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48888])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Jan 2025 23:25:34 +0100
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 23:25:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: buildroot@buildroot.org
In-Reply-To: <AS1P250MB06087379AC560B82EAB3B466A91A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06087379AC560B82EAB3B466A91A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
User-Agent: Webmail Free/1.6.9
Message-ID: <6f97746da9be1d3e42586736fd555bc6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737066336;
 bh=RQVu+LIE9pz+lSSUbJSqNJvIo85/9XvoZD/AFrbjKgM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MjOvBMvV6i6Ntu8qlyg/wy419lH+lqZZSHfG1BN/4btlQt64OTis+CUtywjNJnJtd
 NVfEgy3bZcvCup6AP3RSO5TZvuW9Rakm3xbYGMQuDd/tDAjnlMPyUHVsmx7o+DnmzP
 jFh0MzAEVO0FtvMEyzrYKW9D6GAhG32tEIqB1l4xItK/gFvCAbpX06sqOftl+e0CbY
 l0QyEVLCaz93T+Qi1d6QCNQFqZ2kStezbTULHqK7TNLww59vRqP36mMsqODh8MgAoz
 JZic7zLmNN5AhTpkYuCerRX57VF5d6/Qs2JFNDKawFW6M9Xlfw0D3r35tQ5NRbvHIL
 w4biL9BYAdcEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MjOvBMvV
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 1.1.0
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

On 16/01/2025 08:17, Michel Alex wrote:
> https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.1.0
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
