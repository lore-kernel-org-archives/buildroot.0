Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D1C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 19:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B1E8102A;
	Tue, 25 Feb 2025 19:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTY3ixO4fZMZ; Tue, 25 Feb 2025 19:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F14981010
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F14981010;
	Tue, 25 Feb 2025 19:45:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC9AE2DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 906F440D69
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geIu757Y3A5G for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 19:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6132C40D66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6132C40D66
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6132C40D66
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:45:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 956AA60128;
 Tue, 25 Feb 2025 20:45:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Feb 2025 20:45:11 +0100
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 20:45:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250225180318.1885826-1-yann.morin.1998@free.fr>
References: <20250225180318.1885826-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <8a5775f9904d37fcef385d35c40cd884@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740512712;
 bh=5Z8ZTHrhVTloh2OkHrKua1wIk9RMFxw0naK2YNKM3N0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K8luCXil2pLALKrJwl/C7cXXwlXXomvw7VnFjZBwz9g5CYnYv0fqAHcCSNzaGl9lR
 lEgk+l/nOinQgOW8S4ZxVHcldU8p0UAmrgzgLaHiwmTmAje8jxjBv/0SoiElxrnAA1
 5nnz3n1wmaTHIZsz/Q6bZ6cfjYgmFeQSkB7yfi8aIePQDvdHGo9KjQN+2HJpf11Ufr
 wHzE9hbhEdmCWRfYkO/nMwF8nB8NzHMO8iqxLYbdrjC4gG0Wqf1806caUYL9wDWKnO
 mPsjCtlt/13nNLW93FF4ytaAyysfV36xxcUkfE8Zw88Opb2UwN6Qo0Nqo7FobRKsYg
 qG86vzTJXzBpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K8luCXil
Subject: Re: [Buildroot] [PATCH] package/mokutil: fix dependencies of comment
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

On 25/02/2025 19:03, Yann E. MORIN wrote:
> Since the package was introduced in 2e6e121496bf (package/mokutil: new
> package), the dependencies for the comment about missing dependencies
> are not all inverted compared to the actual dependencies.
> 
> Notably, gcc and headers versions should be negative, not positive,
> dependencies. This makes the comment visible even when said 
> dependencies
> are met.
> 
> Fix that.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
