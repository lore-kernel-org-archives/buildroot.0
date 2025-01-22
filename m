Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD8EC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F484030D;
	Wed, 22 Jan 2025 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25JwvAOwCbyd; Wed, 22 Jan 2025 20:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D851840330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D851840330;
	Wed, 22 Jan 2025 20:29:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2643959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C353940330
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVgaQcwXgU1w for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 20:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 822B84030D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822B84030D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 822B84030D
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:29:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B76A878034E;
 Wed, 22 Jan 2025 21:29:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49830])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jan 2025 21:29:44 +0100
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 21:29:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250121074217.18241-1-nemaakhilesh@gmail.com>
References: <20250121074217.18241-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a9dd315bd6d40b7a1c2e495ef180803b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737577787;
 bh=+uW1cnHUbzPm6VDs1dA1TCuZ3A7HUDjcZitfhVn9Vfk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nDAKla18ZO3I/F6VqhHIw4EreA6WVhD+XEn/M/IX2LwnhN/aUXblD51RvYldVv5/d
 c9Bu5QKVEqH4onxD3t75xB9b8XfEg4jh7+9zSEHslCm/GXrW+io6eBtibBQZVowBY2
 f5Jaw6jVI0DFnrhzsS9KYB1mvCighNOx3xjmV/gs0cQYABSmFnVH1GuoXx9ohnK9Fm
 u7Dq6IE5u+DWsocPygAxxwlMswLeMu7d4ZButaSSpswkw4NIv9AKDNV4SjL1MiBaNe
 NjOqWIvqbRLs84F4X6onhXQw8sYub2eBeugOTX5wcc6j40oxWM+8+W8edjfCLR32Bv
 Rz4Jt8klcN03w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nDAKla18
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.13.0
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

Hi Akhilesh,

On 21/01/2025 08:42, Akhilesh Nema wrote:
> Changelog - 
> https://github.com/iproute2/iproute2/compare/v6.12.0...v6.13.0
> 
> Drop 0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
> Upstream commit - 
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=c8b3ecc22ed0edaf0259eaf7d1a5c04f300ad6e4
> 
> Drop 0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
> Upstream commit - 
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=fa3949b792e275f75d7d6200dc2036ef7fff8816
> 
> Fixes:
> https://autobuild.buildroot.org/?reason=iproute2-6.12.0
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

I applied this patch to master, thanks!

I also see it is the third time you bump this iproute2 package.
If you are interested to maintain specific packages (and receive
build failure notifications about those), you can register yourself
in the DEVELOPERS files. See:
https://buildroot.org/downloads/manual/manual.html#DEVELOPERS
and
https://gitlab.com/buildroot.org/buildroot/-/blob/master/DEVELOPERS

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
