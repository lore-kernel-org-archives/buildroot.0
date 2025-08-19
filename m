Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BA4CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45B340C44;
	Tue, 19 Aug 2025 15:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXP_-DurtyFN; Tue, 19 Aug 2025 15:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A25409A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84A25409A2;
	Tue, 19 Aug 2025 15:38:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86816E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7815260A70
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAJKAyK4tCVn for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4ED0F60A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED0F60A64
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ED0F60A64
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:38:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4107F780395;
 Tue, 19 Aug 2025 17:38:45 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 17:38:45 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 17:38:45 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250816134837.9603-1-fl@n621.de>
References: <20250816134837.9603-1-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <60598c920615bacce6f5a613c5c81c63@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755617927;
 bh=4u35Hx5t667OxTgnKfzKTTWCNAToMr+ZB+lPt3sg5iU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dga6rO+WYWe4M744/6wR0hT90rrQtd6jzUAIv0lx6Hw6UIa6etl6qkS9tHWJL7HGN
 hcC/jNHdlsXrq8Pf00xTfnkLFt6MoAiyhEeMV15k0cRaHeXTeIMCQpnT2Uf4N0lyqm
 dVK4CwPTtYnA1JueMoI0mNsym8GSRwDIWMvXJ8OSF5CauKBvkToyO1WTSTNGn2LkeS
 BR/uU2jbn/GvLtRocLaMYvN7kTQyIX7ch1mG5+Dn0McpCG1BolbGMXKnWZ63KRdhab
 lTAY4XetKrgjvFqI/JY55WbgVbjCuFKdszY0a29tn8hM4mmVgnGIUWCEVjgWjkLC5p
 KtpUgqfwXqbPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dga6rO+W
Subject: Re: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.22.1
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

On 16/08/2025 15:48, Florian Larysch wrote:
> In particular, the 1.21 release fixes C23 compilation issues caused by 
> a
> custom bool definition.
> 
> Release 1.21 also includes a change of the COPYRIGHT file, but it is
> purely cosmetic.
> 
> Changelogs since 1.20.2:
> 1.21:   https://lists.gnu.org/archive/html/bug-ed/2025-01/msg00002.html
> 1.21.1: https://lists.gnu.org/archive/html/bug-ed/2025-03/msg00006.html
> 1.22:   https://lists.gnu.org/archive/html/bug-ed/2025-07/msg00008.html
> 1.22.1: https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html
> 
> Fixes: 
> https://autobuild.buildroot.org/results/3d5/3d523440dc7bebe12fd95564e3c5b5e90bc39af9
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Since this bump is fixing gcc-15 build issues and also includes other
bugfixes, I applied this patch on master, thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
