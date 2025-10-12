Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F3BCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 17:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20CB0607B3;
	Sun, 12 Oct 2025 17:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtBzodfwwmwc; Sun, 12 Oct 2025 17:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782C5606B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782C5606B9;
	Sun, 12 Oct 2025 17:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0AF712B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 17:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D294240072
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 17:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXI5Eyx2Ze_V for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 17:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2C6F40093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2C6F40093
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2C6F40093
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 17:10:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C58DD2003C1;
 Sun, 12 Oct 2025 19:10:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 19:10:01 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 19:10:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thijs Vermeir <thijsvermeir@gmail.com>
In-Reply-To: <20251012152216.92949-1-bernd@kuhls.net>
References: <20251012152216.92949-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c56e2e728fd94213ac1d6906584a27bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760289003;
 bh=rClzQFOXlPOuWEQtGKh7nbnalQfpEruko1DfQS9NTxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hDT8izFhA0eiNNgOj+VQRKV8vtd/FHltbxY7vSfi5hANv+sbD+ftXVWvKfCh0Ffik
 3rvX6X5yuApIbrCwNmVqBRA2D9rPepsn/nO3ysowP0tWoxWrGIJOdg7x13EYFX/w48
 KvwXJ1wqmzWdvfV/5XVc3YB+CPhQYbYVkPCteYMJZ4f0dP4HQu2CUfMw4y3f0n2gXv
 8Cnrim6Q/OWo6YNkNAm6MC2KJHPJd8XkFSrUxiLvTq3osDDwPhal5VKVhwOWBafPig
 Fd3NqXCcld3x+B4+x+G2Kq/rMSEhxQMZBjMt15HEHRH/gYdn5WqXe+HBySQ7luh2So
 CDo/NCt1jMREQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hDT8izFh
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: bump version to 4.1
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

On 12/10/2025 17:22, Bernd Kuhls wrote:
> Release notes:
> 4.1: 
> https://mailman.videolan.org/pipermail/x265-devel/2024-November/014095.html
> 4.0: 
> https://mailman.videolan.org/pipermail/x265-devel/2024-September/013940.html
> 3.6: 
> https://mailman.videolan.org/pipermail/x265-devel/2024-April/013664.html
> 
> Rebased patch 0001 and removed patch 0002 due to upstream commit
> https://bitbucket.org/multicoreware/x265_git/commits/4bf31dc15fb6d1f93d12ecf21fad5e695f0db5c0
> 
> Added patches 0002 & 0003 to fix build with CMake 4.x.
> 
> Added patch 0004 and adjusted _CONF_OPTS to fix non-NEON build.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
