Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDB3C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FFB8403D;
	Fri, 28 Mar 2025 18:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha1kgtqIh1Ax; Fri, 28 Mar 2025 18:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70323846F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70323846F0;
	Fri, 28 Mar 2025 18:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A5F219A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 612D37068D
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpR7yc1RX675 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BEA06FA23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BEA06FA23
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BEA06FA23
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:55:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5DBDB5FFB4;
 Fri, 28 Mar 2025 19:55:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47098])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:55:19 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:55:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Stephan Hoffmann <sho@relinux.de>
In-Reply-To: <20250326211006.1081561-2-buildroot@heine.tech>
References: <20250326211006.1081561-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.10
Message-ID: <1b824bdf57483672750c4cb0e9ef1024@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743188121;
 bh=DIstnrsOA5NXAmgAuEBH4IbRqz7/RJmkGbAJZ3gC+VA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PDtZNSOkCB4n7hc1UyEnZAMqSPyci1juvva+3vH1E04HAz1mfKJdauPpvgWrwtr9F
 2cBDCzF03XPcUZkq3ZptSmunNJDBlifGE8vc1T+fBu3UAC9cFYrwuhOp31JRec0m+y
 bQqd0sDEhhkMC82OSSwdxfSbFuVfxxtHegj3EBCliSwxQMmmmCBjXy5of5Eo59ZUeq
 n5XWTLIjWukOwKZZt9KSAmoZmesql/NOrrDxTEuoYmjZxaNi2xCYOtUt/jSVhm1Eab
 KMst5jTWwFw/gqpCHnKM10DUwV+JEWRN51V9dD2ioCbJ7R+svZ3vIDd2NOZXuI+fFl
 Odt18TyN3GBVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PDtZNSOk
Subject: Re: [Buildroot] [PATCH] package/gtest: bump to version 1.16.0
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

On 26/03/2025 22:10, Michael Nosthoff via buildroot wrote:
> release notes: 
> https://github.com/google/googletest/releases/tag/v1.16.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
