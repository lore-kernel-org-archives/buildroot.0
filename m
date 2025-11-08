Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51377CCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 19:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009874062E;
	Sat,  8 Nov 2025 19:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgK7RAFdsdYd; Sat,  8 Nov 2025 19:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 469AF404F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469AF404F4;
	Sat,  8 Nov 2025 19:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A8122CD
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714D080D98
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 19:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTAH0I2owrCU for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 19:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9034380D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9034380D6E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9034380D6E
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 19:39:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2C9472003D0;
 Sat,  8 Nov 2025 20:39:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Nov 2025 20:39:04 +0100
MIME-Version: 1.0
Date: Sat, 08 Nov 2025 20:39:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251108112532.786294-1-bernd@kuhls.net>
References: <20251108112532.786294-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c57ec3f1f0e3706b7bc4a66ce10149c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762630745;
 bh=nRb02Czegvc7A2UYKG2nbaGAcxlXNQ43+U9xB8OGal8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KNTPJYGYOqVFGRaA8vIgO0cNmcTHjYAYcvoemHS6F/ZixqH1HQKegVn0rDaETNjd8
 TxO++uugtzrg8cbEuiKFcT57LSOevXKjvhcpQ+N9hAHeQfD9hH0jYBHGjzGg7kDZsR
 246fsZoPowL6Dtg09JV5UByU7y91qgppc+txnVhtWctxs/k+LUU+8HfRskNxrIk841
 XWl4bPjyFqZ/VyxZmZlFSIbqOFGUlm8ViEfKuTJzjscUZUU54XwpGqcgPXHe4LV9Qb
 gqlG5mHoQD+FZQ7B/OYO+GZyuN9spZUWYdX6yvz30/yNMZ6c/USn9guG+KP8A+oe2z
 3WV7+2E2v3D2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KNTPJYGY
Subject: Re: [Buildroot] [PATCH v2 1/1] package/coreutils: bump version to
 9.8
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

On 08/11/2025 12:25, Bernd Kuhls wrote:
> Release notes:
> https://lists.gnu.org/archive/html/coreutils-announce/2025-01/msg00000.html
> https://lists.gnu.org/archive/html/coreutils-announce/2025-04/msg00000.html
> https://lists.gnu.org/archive/html/coreutils-announce/2025-09/msg00000.html
> 
> Removed patch which is included in this release.
> 
> Added tarball hashes provided by upstream.
> 
> With the bump to 9.8, the build will fail on systems that are not
> Y2038, such as some uClibc configurations.
> 
> In order to preserve the previous behavior, pass --disable-year2038.
> See the gnulib documentation for details [1]. Contrary to what the
> option name might suggest, it doesn't really disable Y2038 support,
> but only the check that the system is Y2038 compliant. So even with
> --disable-year2038, if the system is Y2038 compliant (uses a 64-bit
> arch, uses the musl C library, or uses the glibc C library with
> BR2_TIME_BITS_64=y), tar will be Y2038 compliant.
> 
> [1] 
> https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
