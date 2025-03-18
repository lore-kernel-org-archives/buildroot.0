Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5CC35FF3
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77748403F5;
	Tue, 18 Mar 2025 20:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhH54trd5JUO; Tue, 18 Mar 2025 20:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133C040350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133C040350;
	Tue, 18 Mar 2025 20:58:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFDA7950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0A0A60BC7
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZCSOBRivVKQ for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 20:58:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9040608DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9040608DF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9040608DF
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:58:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 31D0419F576;
 Tue, 18 Mar 2025 21:58:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Mar 2025 21:58:23 +0100
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 21:58:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20250318113646.2509050-1-buildroot@bubu1.eu>
References: <20250318113646.2509050-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <400bd6bfba5432d25aecbe1288510dc9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742331504;
 bh=uvLLdTNxoSJPH6f2HwJAZJqb6EtOL1bZvnXySsFranU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DiVJ842bGZsk7mNJLjtHHJwwmEq4nFrNETQpMxxR+5fDQv5FqlMMdJfnW+LiVl33k
 D/GBhNCVaRvhFgNyvNnLuUQy8CkaZAdztLU0U56cvtwhvFIEzTlbFBurtkY2nMHet5
 hAW1QjzibvNsIXYiOxHZPbZCwJq6KXkb2KAmjvuSkiFUmXE8wle5teTdcgVb/wQzwq
 snkIIcbdxbof75H3aGFV0DzxP4VX0kzyaKqv5LH5pd0D41b99xNPNa7PTK8zeU+GjK
 rpnORE370D0IQUbzZ9JSZigOuPlUYG0JvuRuWtGMdAHYDiWZhClnE9gSNOVU2H/XaT
 81PvlNJVuBLPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DiVJ842b
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: bump to 2.2.4
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

On 18/03/2025 12:36, Marcus Hoffmann via buildroot wrote:
> Remove patch that is included upstream now.
> License hash changed due to copyright year update [1].
> 
> Release Notes: https://github.com/zlib-ng/zlib-ng/releases
> 
> [1] 
> https://github.com/zlib-ng/zlib-ng/commit/fc634263722f39bfcf52437b783db32ff53f2b36
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
