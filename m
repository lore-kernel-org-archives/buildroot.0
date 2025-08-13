Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C7CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 15:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E66394172A;
	Wed, 13 Aug 2025 15:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mpb9EcJl5enG; Wed, 13 Aug 2025 15:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B65041721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B65041721;
	Wed, 13 Aug 2025 15:29:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CCD7938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E71BE6084A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2M6hXxLu0jA for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 15:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F15F060820
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F15F060820
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F15F060820
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:29:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 44936B00573;
 Wed, 13 Aug 2025 17:29:25 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 Aug 2025 17:29:25 +0200
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 17:29:25 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250811160210.3238772-1-fiona.klute@gmx.de>
References: <20250811160210.3238772-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <da0d7e1f31bec9ae102316b65dd85fde@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755098967;
 bh=djRz8jTizq4cT9egkziqdXEWu26i8OPYA3ef5SlhIzY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YNM9Q1+PTkkl2qi0P6h3oer5mIZ12oz95z/MNDH21E9tfDC7Y79xFs7spYX5KaPn2
 yEimp9p/THQQ5zkzH9vG88qq6OqCjMt9tM/hzE1qFPpLE6FMTy+G+uTC7ytLB3vX48
 Q/qIJvTDMPbjeCrKZSOkXVXiuXds+tZ5mPThC1Xu/q+40gRvo3g7oEoQjFkX+Vwp3K
 nY5USCeEtBh+79zDodyLZEjmUlHhBUJzskPFaOs1p50Hrr4XA7tuSJqh2GT8mdRF53
 GVdCIPBd8wfrjsD9AvFulJFX8MhHHSrkSUqAl+if856q7g8Hw0A9LdWg5ssVZtWwep
 uDmOj3ROh569Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YNM9Q1+P
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pyroute2: bump to
 version 0.9.4
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

On 11/08/2025 18:02, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> From 0.9.1 the pyroute2 core is async, the synchronous API remains
> available as a wrapper.
> 
> Upstream changelog:
> https://github.com/svinota/pyroute2/blob/0.9.4/CHANGELOG.rst
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to next, thanks.

For info, I made few minor changes, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/786557d859dba7e52c883e5215e53e93fac13b88
https://gitlab.com/buildroot.org/buildroot/-/commit/7b3bf7b29c49848dd29d778f4041dd90cd5556cc

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
