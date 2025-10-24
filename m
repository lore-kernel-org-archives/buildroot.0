Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D29CCF9E0
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E005C40A49;
	Fri, 24 Oct 2025 21:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9Mp3lBWQzJ3; Fri, 24 Oct 2025 21:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E92408D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E92408D6;
	Fri, 24 Oct 2025 21:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03A7419D
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D5C60E4E
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrAi2ilAokEB for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE2B260E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2B260E4A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE2B260E4A
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:07:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D839D13F89C;
 Fri, 24 Oct 2025 23:07:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Oct 2025 23:07:16 +0200
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 23:07:16 +0200
To: Trammell Hudson <hudson@trmm.net>
Cc: buildroot@buildroot.org
In-Reply-To: <aPoF1TdyuQ9KYqrL@hachi.swcp.com>
References: <aPoF1TdyuQ9KYqrL@hachi.swcp.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7b99f47df1240120f2dffbea93ea0e07@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761340038;
 bh=yhIVCC0bs2gY1Efr/W/Ni1s24Fap6GtEmE/GXHP3inA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hwUxReP0HdVXPEIF4NuZJ8yxV6hzm9lWJeEgLdAZHJE/3/i5hygS+04r1fQPCZK/u
 2ZAA96dh/GUl9zN9SLJd4z8nl2jgzXJjc7kxcNs+B6dZvFeS8nmZbqxtudeJwb8LGG
 WG7sWwjzwu1BSmxYKWf6qkMM5MHgDYZJc5yaikJAmXI6izsfReQBtJ+BGuZ0z98csB
 45Tt2cdNiWOhPwHUh4Iy3WFLCMUiL/8VUBSZFsdiM9E9R7w4iuSwFA1Ib7xqZRUG2n
 m5YwdpREeQINPtraEHl2rS1tN+DiFxvxAQLRQMdm2OOq6J6VYd4zKvUg2SkwlQO+lW
 g/pUNienMfNNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hwUxReP0
Subject: Re: [Buildroot] [PATCH 1/1] package/shairport-sync: bump version to
 4.3.7
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

On 23/10/2025 12:39, Trammell Hudson via buildroot wrote:
> Drop all the patches (already in version).  Works on Pi 4b and 0W.
> 
> https://github.com/mikebrady/shairport-sync/releases/tag/4.3.7
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
