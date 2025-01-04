Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A328E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 20:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117DE606A6;
	Sat,  4 Jan 2025 20:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQUuXANaDiI4; Sat,  4 Jan 2025 20:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAF606070F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF606070F;
	Sat,  4 Jan 2025 20:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E21DDB4
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 20:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 096504022B
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 20:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNNpmDc2doG8 for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 20:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80A7C400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80A7C400C8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80A7C400C8
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 20:23:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8CE6019F54D;
 Sat,  4 Jan 2025 21:23:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35156])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jan 2025 21:23:24 +0100
MIME-Version: 1.0
Date: Sat, 04 Jan 2025 21:23:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250104152722.90914-1-thomas.petazzoni@bootlin.com>
References: <20250104152722.90914-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4d7ae2a437f08f2554aaf7371380d059@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736022208;
 bh=zwO+WJ0F/nEV9YefFU3WgCtD63DBGUBVgtvMxCaIkZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SFrOYIpnQ9+xb47bMv9FY9APf70ETeiC913AmT5kdrSQAvZ0rZxN02kOHRJ20qxAy
 zQPBWJYTCxDzqAp369OkEvPhG3yeBlm0/XZBm7P/OUKHUKTJKFo9k0O4e83c+h9XgD
 YMmMeiUaRobNgaxokXSlcUQrbE3URO58E+H0sOHPdiTkcqBfxcvYxK1c5B/N0pWmDl
 yo/S9vLoVXLF84iT5ki0e7LKuTTUp3fYmp9uZFVSduXSH+lshsPsG3SXpIQAvbLR8M
 vuKFJ9mKPXkFkzOmr+FInQKVibGnZcEuYh+wrmJpbFP9nsOnIP2CCehJmJZT1HkQFi
 zFxVI0YKo6NOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SFrOYIpn
Subject: Re: [Buildroot] [PATCH] package/php: backport upstream patch to
 fix/workaround xxhash issue
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

On 04/01/2025 16:27, Thomas Petazzoni via buildroot wrote:
> Since the bump of xxhash from 0.8.2 to 0.8.3 in Buildroot commit
> 4b8f2f3a5e45fe2962a9fcdb148d32198929e228, the host of host-php fails
> when host-xxhash has been built before.
> 
> This is due to the fact that host-xxhash installs
> HOST_DIR/include/xxhash.h, and the PHP code has an internal xxhash.h,
> but due to the order of CFLAGS, the one from HOST_DIR/include/xxhash.h
> gets included instead of the internal xxhash.h from PHP.
> 
> We initially tried to fix the order of CFLAGS, but that has proven to
> be challenging within the complicated PHP build system. Then, we opted
> for renaming the internal xxhash.h header of PHP, which we had
> implemented and were about to submit upstream. But while rebasing this
> fix on PHP's master, it turned out that PHP has an upstream commit
> "Sync headers installation", merged for PHP 8.4.0, which has the side
> effect of avoiding the issue. This commit moves xxhash.h into a
> subfolder, so it gets included as #include "xxhash/xxhash.h" now,
> which avoids the conflict with HOST_DIR/include/xxhash.h. Maybe not
> the best fix, but it does fix the issue and it's upstream.
> 
> Since this patch is tweaking the PHP build system, we need to do the
> equivalent of "autoreconf" but in the PHP world. It was already done
> for the target package, we simply add the same logic for the host
> package.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/583c054a564f90b8c884565070c5e17b43b89674/
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
