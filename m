Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD48CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0265340B92;
	Fri, 17 Oct 2025 16:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_ULzeVqz9rP; Fri, 17 Oct 2025 16:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8BD40ACC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8BD40ACC;
	Fri, 17 Oct 2025 16:40:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 001A5D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA7566109E
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nyiexot4h-2T for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04AEC60FE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AEC60FE3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04AEC60FE3
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:40:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 794752003DA;
 Fri, 17 Oct 2025 18:39:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Oct 2025 18:39:56 +0200
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 18:39:56 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251016092124.800402-1-buildroot@bubu1.eu>
References: <20251016092124.800402-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <f33888640ed46624eb755a44e4c3d9b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760719198;
 bh=QEVZ6IKzlT9wgCvQoK+CjLvsF04WuLpcdaxpUl9tPaM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iDFemftHjOx2OVBXJjJLf0syJo6Eg4k+yZKJzuIMpJyh8+2RAFzwEvaWU8QLpi0tK
 JylslwYVgMr4Kz4OS2Ltrza6MwOkeGN32XliLlb6UlUVbPBlXy6hSyvQgINqVNymW6
 lJQlYijOVurr3mZyx64gOzJlnjCBO9PB6u2+ldEWjQeBdwQTUn8A/5t0shszQz0zCh
 Z2eCRPdvEBVPM0kmrYf/LuSVWN1p9420yhgncoyQvmO35pgO7OBSJduvMlVokgZGb0
 i0VLlaqAiK3qyfL0pwTPav8ICrdlTqx7jyHcjsw0SQ1UPIYr3apFj+DgtyMSlpNgZE
 Gn/aS/Pe3tfvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iDFemftH
Subject: Re: [Buildroot] [PATCH] package/python-charset-normalizer: bump to
 3.4.4
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

On 16/10/2025 11:21, Marcus Hoffmann via buildroot wrote:
> Changelog:
> https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md#changelog
> 
> Upstream setuptools-scm build dependency. Also the upper bound of
> mypy(c) is currently high enough that we can remove the
> --skip-dependency-check hack.
> 
> mypy(c) is now also optional if CHARSET_NORMALIZER_USE_MYPYC isn't set
> to one. As we don't really care about the performance optimization in
> the host package we can skip the mypyc step and remove the dependency 
> on
> mypyc for the host package.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
