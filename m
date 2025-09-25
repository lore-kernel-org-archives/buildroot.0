Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE74ACAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA694125E;
	Thu, 25 Sep 2025 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPn12Uy_4WMv; Thu, 25 Sep 2025 20:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F030A40F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F030A40F96;
	Thu, 25 Sep 2025 20:42:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B563E177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BBDC843F7
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6Q1Dtor9Rav for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:42:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71C77843F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C77843F5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71C77843F5
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:42:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 85AEA20039E;
 Thu, 25 Sep 2025 22:42:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Sep 2025 22:42:14 +0200
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 22:42:14 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250916224602.2935203-1-james.hilliard1@gmail.com>
References: <20250916224602.2935203-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7b659fdc59f99a7bc145b62380e8ad3f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758832939;
 bh=AWOz0sxwat548nApzCVrphZSaZJfovuIXPvdCvzUanc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EMkGn3jLkdkDkxY3cw7Lgue/y8t93O8hhQnh+PRxNLzhE46JTVVlREq6XhoRl4Wni
 r6TRhj+7SPb8cqf5gB2pL7KnlAVt/Dj0OP3GaniFK61ql5g3+6so2/ip8bWfR/0cmy
 XHEezLtoSg5sUm++R+hNjwLjYgiiN/c1MqzcG/KMgacvkwpJjjZa+C55tDr0WBVUBA
 EKbiOnbblp0jf1EtSIP9rjE6xN5hPPdSGuA4xL4b5CLWmkmzksaUvEBwZZ7FaijuKw
 uG39RUf5laQT1i0lV1hbrX2c66/ia1kNqEYDIgS7b4LmIkYjLjHlWV49F/6gTnLqSX
 F9P5LfF5ETQ0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EMkGn3jL
Subject: Re: [Buildroot] [PATCH v2 1/2] package/go: bump to version 1.25.1
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

On 17/09/2025 00:46, James Hilliard wrote:
> Building Go 1.24 and later requires Go 1.22.6 or later for bootstrap.
> 
> To support this we use our previous Go version 1.23.12 as the version
> for go-bootstrap-stage4 and have the build for Go 1.25.1 depend on
> go-bootstrap-stage4.
> 
> Go version 1.23.12 is the latest go version we can build using
> go-bootstrap-stage3.
> 
> The package build for go-bootstrap-stage4 if effectively identical to
> go-bootstrap-stage3 with only the Go version and stage number changed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Christian Stewart <christian@aperture.us>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
