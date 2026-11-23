Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338E606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tz/0Xzfh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE526078D;
	Mon, 23 Nov 2026 20:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UiYC6sNcMZDz; Mon, 23 Nov 2026 20:12:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 38E836068B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795464766;
	b=L/P9gDmoamgnpprB6tk+fpQpHNGiDN+2vI2XoQc1TJzkrdPrLqFkZM7GKy+oV/d3NqFq
	 pfUQO94F8fD0cOmxnooPhlcGI6/QXvnGeWQq7Ycq3A5rNQsJMdCEEEDE0k/4ttD7VvCSl
	 pLj6xQyIoaRzvdgbL/RW951yHEHXTLY0iHcnbO18WlT3c2ktLp5eVGVEmhnkuHpSHmfLf
	 O2FWxvS9tMY8wrK1skY2NZMX93YltarVezwgb3XeWVII57Rmbzf9WSZb9bRk1HmZfEt3R
	 rgXo4tBv4f+emLvo0f03S+i705Yh2ET7GKnsa+nOfyGcQHX43M/dm9kzlJGjMgrO1Rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795464766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hHFENNrnvC8/YsHnT55e5Bq8bGQHzC3W1Ov3qVOWP/0=;
	b=VnaKr6QsA3xLldByzdWntQGBRju5q5rRiublGfnkgS559lzgrqZHixfD2QZGq2oNTSz1
	 NnmbSfLoiSwZs3N23m9eAV4uBO1abqN5uL429Jd0f1OjXbJYwpRzOI92lzZpWXTkjB72o
	 aEwGyX2PuMsQKQ157aTPqdfNlLqwWrmOHitQzVcn3EnMsA05cSbXJ1ACHeHm4NG1akocR
	 Ewltv5qI38xvy0fbUzfNXuy0ZxYNQv3vaWaqscve/AGyfVKnAl9EkejhsuvaRb3PtVRrJ
	 21g37Mer2ORhNjgYLGWKQd9j+cSPXWomn4RFU1JDBAg/OU59dMRfqZhwd/Gw1fZST3Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795464766;
	bh=hHFENNrnvC8/YsHnT55e5Bq8bGQHzC3W1Ov3qVOWP/0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tz/0Xzfh3rFP91nEhu7kgNwLdzMMbOmD+56o89cHbHSzJ/6XSG29RJjqGUdcA/vtA
	 CxT8GSh81+a2ZJJ48eDc/PggdF1vJHU0+srUkrkYShhdmKCKN5PIEwp1QEjMZdblfY
	 iS/eaCW465ygpfwnh0i9ufw7BgIJbqweyHJ58ISBX21MCdJgRYV7YCZeYVHdh6/AEw
	 5RdCfrPBQUNWozCCUNtUb56CzhaN8CwEXSRCEnOEonDu/PzBZthOAx6Xas7sZe3xzf
	 Bia5RGA5taJ6CMe8J9YnB5uk7DdWKi61rErod5LpdG9CIHMUZK41nXxaxeZ9tyyHFD
	 sOW5p+12qqSow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E836068B;
	Mon, 23 Nov 2026 20:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46F37260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32D9780C9C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODEiqN955t_X for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00F6C80C55
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00F6C80C55
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:12:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 115B013F8AD;
 Mon, 23 Nov 2026 21:12:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Mon, 23 Nov 2026 21:12:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 21:12:39 +0100
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <073f42e897525c61a26ac756cf05a3ed5e1d83d9.1795426541.git.yann.morin@orange.com>
References: <cover.1795426541.git.yann.morin@orange.com>
 <073f42e897525c61a26ac756cf05a3ed5e1d83d9.1795426541.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <2a908313b0198ccc8daa7fc4312ae39c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/4] package/distribution-registry: security
 bump to version 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 10:35, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Fixes CVE-2026-85747 and CVE-2026-46595.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
