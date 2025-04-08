Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91070C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3497F81118;
	Tue,  8 Apr 2025 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztIwXzxc5utF; Tue,  8 Apr 2025 17:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 555AB828F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 555AB828F8;
	Tue,  8 Apr 2025 17:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B58541F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C50840D92
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bh0QCZAeszAx for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 830C340527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 830C340527
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 830C340527
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:21:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1F82AB0055E;
 Tue,  8 Apr 2025 19:21:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Apr 2025 19:21:01 +0200
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 19:21:01 +0200
From: Julien Olivain <ju.o@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20250407190338.7436-3-maxime@leroys.fr>
References: <20250403190705.14994-1-maxime@leroys.fr>
 <20250407190338.7436-1-maxime@leroys.fr>
 <20250407190338.7436-3-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <e99b363282d9fc7299e64c3fc3e55d7a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744132863;
 bh=tqNaNhSKg+J62hdvexrgCq9KXKcR/PtJv8ehNjkpSyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VbV6cCbLwX2+mPF3gWKZduZ8GcZe/ABXkNJpPpnuKa2nA063nPe/R8i/XZ7NSONn1
 go2jjBR0obA/q1vbezUAF7Lfe3HxUTS/pl+AHCvhh5zVPGVtPecLgceh/jrFHeQZdd
 3+qgSYnOx2/FkUZKelvdCrXjgvJA0p2IE+rJPiF6qh8j33frJtL1EBalLCGIhF1s++
 Q4hy4nhnnFrasxSXj/lDJsmbvFtSyGpJ/DfnXofqHaqcHpidJ9xnsKOuQ10UwtxEYo
 G2kn1uKGpsPogDJJZbQWSxBSQ+4T0IryUWxvZwz5UrIQn6YZbZeMe6891wZTivBiDp
 mqqkgISJPpkWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VbV6cCbL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/frr: security bump to
 version 10.3
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

On 07/04/2025 21:03, Maxime Leroy wrote:
> Update FRR to the latest stable version (10.3, see [1]).
> 
> A new package option `BR2_PACKAGE_FRR_BFD` to enable or disable the
> compilation of the BFD daemon. This one has now a dependencies with the
> kernel headers 4.10 (i.e. IPV6_SRCRT_TYPE_4 from linux/ipv6.h [2]).
> 
> The configure options have been updated accordingly:
> - Versions of FRR before 9.2 used `sysconfdir` and `localstatedir` 
> as-is,
>   without appending `/frr`. The `/frr` suffix had to be passed 
> explicitly
>   to `./configure`, which did not align with standard conventions.
>   This behavior has since been fixed upstream [3]. As `sysconfdir` and
>   `localstatedir` are already set by `pkg-autotools.mk`, they can now
>   be removed from `frr.mk`.
> - The `--enable-shell-access` option has been removed as of FRR 10 [4].
> 
> [1] https://frrouting.org/release/10.3/
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ababeba4a21f
> [3] https://github.com/FRRouting/frr/commit/ff62df2e4484
> [4] https://github.com/FRRouting/frr/commit/afb034b0bb42
> Fixes: https://www.cve.org/CVERecord?id=CVE-2024-55553
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
