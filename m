Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8631CC71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46FB381194;
	Mon, 16 Jun 2025 20:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WboZ3kNq10Iy; Mon, 16 Jun 2025 20:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C24781195
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C24781195;
	Mon, 16 Jun 2025 20:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B6116B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0771C81195
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JKfq8p3gTk2 for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5052681194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5052681194
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5052681194
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:21:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1521D13F861;
 Mon, 16 Jun 2025 22:21:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Jun 2025 22:21:40 +0200
MIME-Version: 1.0
Date: Mon, 16 Jun 2025 22:21:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20250616125359.1349323-1-gwenj@trabucayre.com>
References: <20250616125359.1349323-1-gwenj@trabucayre.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fdd0d5af45253cbe2f04825e1ebc22e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750105304;
 bh=ZN9zcpo8vrhjH0b91tXehfxzSWDGq/QoBNOH98ofv+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tohg6aL401TXhZ0AmdmLj+Tj8M7PzyMledrg2lHPiAULCjG2wlV9s+Tgb6OUS2IgH
 Q7oRNY0vhrLhMRlVZQn0xOhH/5/tPdLChf0Eu3t8YA79d3QiuAo0UEMuWjIK+BTjwy
 EVFXH9gtQEWbP6shSt8tRREfD2SFEpDjKB3gD1gJA1pi3ZmwV8QgTewIJrZ2zxDM2g
 zZMs/6XwhVOGc8PPM95Vm2GTiv7Ox+YWz/Yhm6LBIg0L3VbyVrWL+COnFiaaTA1MRM
 A91X1DTYBrNlot9zlQ89akaJFO/1BLHV5bBxw/IC5z49gnrbrqK0S47tr+aUdpf0Of
 sWvTwz7B7GQEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Tohg6aL4
Subject: Re: [Buildroot] [PATCH] package/volk: bump to 3.2.0
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

On 16/06/2025 14:53, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou 
> <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
