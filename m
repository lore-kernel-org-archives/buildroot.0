Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E64EC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CA3404D7;
	Sun, 15 Jun 2025 10:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDuI9QYUsRm5; Sun, 15 Jun 2025 10:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DEB7404B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DEB7404B1;
	Sun, 15 Jun 2025 10:30:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43224231
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34CBB80DDC
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vM9ieh--_hyG for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C76A80CD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C76A80CD1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C76A80CD1
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:30:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BF3C520039E;
 Sun, 15 Jun 2025 12:30:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 12:30:16 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 12:30:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250614111002.66221-1-bernd@kuhls.net>
References: <20250614111002.66221-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <70b06c159518d56ba6ce60cd51976a5b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749983420;
 bh=/SpQ6fvrpwGqBwikBVyDnqqsel8y8siC9ZhK+v0Q6uo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=faKM1lm+buqLNpQ9ExhPlRlCGBtHm9mMJ/ZALXUbdZupuGz7yVEmz72rFxGTl+6yv
 pwhY2ps0k/49KiiQDkJ8EFsQjxmX2ip0+gEnOd6wNbRDilshb5LmrvN7+ykwxMB0cQ
 iwaG3dktOGxPDg3GjANpE6ebnu4xR5RQVNjGR5nA+OGFLY9yG3bf1O5dMFuQbLhprN
 ni13P9W2DxyXYgGJqjWg48R8IvuCf6IXymAkXhhrRkRvjy6S/qT/4qjYEJVhNaa4xM
 v2cQd5GXMsGMOI6lCOA3kSAwyKBBtON5GeFF5dBxfj/o/nxlhjaiTHqqCnh02Z7Jmz
 oeKzdG2BZ6DOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=faKM1lm+
Subject: Re: [Buildroot] [PATCH 1/1] package/libebur128: remove package
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

On 14/06/2025 13:10, Bernd Kuhls wrote:
> libebur128 was added to buildroot in July 2016 with commit
> a32d29cd84789d7406022c7bb9861e5bda530013 to provide an external
> dependency for ffmpeg.
> 
> ffmpeg removed this external dependency and switched to an internal
> version in November 2016 with upstream commit
> http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=005d058f4230f3207ebcf1131df7426d4f57392f
> which was first included in ffmpeg version 3.3.
> 
> Buildroot bumped ffmpeg to version 3.3 in April 2017 with commit
> 21d93a1351ca8d4e5185c22a81becdaf08a9bdd3 and forgot to remove the
> dependency to libebur128.
> 
> This went unnoticed until libebur128 fails to build with cmake 4.x.
> Upstream saw its last commit four years ago. Instead of fixing an
> unused package we removed it from buildroot.
> 
> Fixes:
> https://autobuild.buildroot.org/results/e629bd151cc539f01b909e44d07e17451a29ba27/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
