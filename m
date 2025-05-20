Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB56C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC92610BD;
	Tue, 20 May 2025 17:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g1GuzOyv3cC; Tue, 20 May 2025 17:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5CF610A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A5CF610A7;
	Tue, 20 May 2025 17:21:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2A1D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDC35610BE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRKz73PeYRup for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7870610A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7870610A1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7870610A1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:21:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 00CF919F73F;
 Tue, 20 May 2025 19:21:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:21:35 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:21:35 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518174501.2148919-1-bernd@kuhls.net>
References: <20250518174501.2148919-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <908c7ea2e35c84bdae59e1c1f5d0e75d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761697;
 bh=IWOaRNC/xViiWurKeUB3uqTfVaU0YO8DmSuvLEKHm/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dA535HXA4IV6XjNLxPpH5MeAYgq+ivuylTtLvnvjcm+bntVxihchLsbUTvj4IbM+D
 mYyvd+wrHkabQ+xHveWMd5dxldC582It3JCIpN2Wcd7SlZmhOhWHmu9iKgKRg7CRXV
 hEOdoGZ0Rg64K9fdXDI2lc34bytZh7vlDVSQz9Xxvjkq7lL1NSKeYwvIRVth2OUuEb
 Yo0pu+DKforr5f082Cyj6GLFqNRU9yYrN5lQsgFRkESmrCv3BpcbeCoflDgAfsVK/5
 WyIxWC/dyKrZkqtvrQ77/MAeutd2/E4Cf5s1LUOaMKVorlDLLf/JwEIRpfri00PoHc
 eiTU2JFTykhlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dA535HXA
Subject: Re: [Buildroot] [PATCH 1/1] package/gkrellm: bump version to 2.4.0
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

On 18/05/2025 19:45, Bernd Kuhls wrote:
> Changelog:
> https://git.srcbox.net/gkrellm/gkrellm/releases/tag/gkrellm-2.4.0
> 
> Updated license hash due to copyright year bump:
> https://git.srcbox.net/gkrellm/gkrellm/commit/b6bc5b379564a5df72d3b047df655652976937fb
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
