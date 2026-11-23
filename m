Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24735606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 18:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=da4IiPo5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=bubbl-tek.com header.i=@bubbl-tek.com header.a=rsa-sha256 header.s=zmail header.b=8JWnKbRD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC64C60681;
	Mon, 23 Nov 2026 18:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYHWOWGJ4m1h; Mon, 23 Nov 2026 18:52:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E31260640
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795459951;
	b=VCIMsObkzw45nRJihFQlY6G2PuCJxbM6O8kCDaqfFa0jmUCXgZJLqLkqZYKXgK1O2C0+
	 arJTIPgiFMNZQMXGjlSh4Xaz6Mz5VJAe5ceW3/9sHtLLWupL3aKb1e0IAOFplp8DeyMr5
	 9dkz/wE1Wyd7rG9D4hirzGmYAFk3U93JPXaImmC7BSmlcjMOsmDFsJz+MwVN/kuymwaQ5
	 AX6i8T2YDuzyAY+vcqWMdzjAQfalfilbVAJ1fzslO8Jz01Lh1crK36J1kBE89CErw0KQf
	 xepHRYc6bTgEKkEe/AieYHrCjugSQCPcx3raBoE4B5EnFqk1783e8LWBtrj581pb52A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:MIME-Version:Importance:User-Agent:X-Mailer:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+mRqWhjJr7LWUVDP5jabRWfNZBGe3Jrh13vTKgU6FEE=;
	b=b6P1q9jC4rYTSHjvvB8+f/875pB9u8xvg02dokFRaJWBZb2PBiA9d09fTD93wwD61yRx
	 7WlXfd2CwJbCYOfZkP+rS2AxGLsARS20ugrknhIl4HrmYXQV9yZ8ZoS8lt+8oq4R/vlCy
	 2kRUV3zYjT4jkA5q47VU52QCqQgKQQ0Ii7lY57g0RpPdo6+7UkYHilOoiOBS7X7Xiigws
	 9FVmKS0bVGKbjUjHxj0Ym6jNocw6Y2JxM8iDZ5FN5ekjmg//NYxicddY5iXOMG5Ua5x0Q
	 38nmNGQIUfu1qi7/Y1WbXzkIm+n2eiCJjUGO0e5GI67cQ7hZsPpJ0RWm3IKQF7oHr6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795459951;
	bh=+mRqWhjJr7LWUVDP5jabRWfNZBGe3Jrh13vTKgU6FEE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=da4IiPo5YieyFyo2X+w917WzLHPULXqilcj93sNbgMaVC01kaosWKzOFJbDoN/234
	 sR2POS3F9xnnU1kddsVgmwnI3JVry3rJqRYz3HEWIHojTk1bJsGLS80iRRGglUg8n6
	 9doAfN7mpiqDpJgOplsYjGayQQ579YG6s4YCDtCh5KDKwSC0ikSWqQCAdaXwzgdPZi
	 91OdWWMdlneRvCPk0BwrdZEjO4/fx5DFV/vkq6MyAQwaRRgek/4vZvUqYmN+mP0EdB
	 Hin925QhxF+zdyrUzd5HaTGaL1CMo+b/RL0Lx+GrObiRpz42p6tznBfyK+K5jnS6/B
	 WT4EF58VVpdQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E31260640;
	Mon, 23 Nov 2026 18:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC6622B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924E14021C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SekqEHm5XQS for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 18:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5ED5B40093
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip=165.173.180.52
X-Greylist: delayed 907 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Nov 2026 18:52:28 UTC
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=bubbl-tek.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=bubbl-tek.com header.i=@bubbl-tek.com
 header.a=rsa-sha256 header.s=zmail header.b=8JWnKbRD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=165.173.180.52;
 helo=sender6-of-o52.zoho.com; envelope-from=aaron@bubbl-tek.com;
 receiver=<UNKNOWN> 
Received: from sender6-of-o52.zoho.com (sender6-of-o52.zoho.com
 [165.173.180.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ED5B40093
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:52:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=8JWnKbRDIqOPronOq0oT9m9lOoryiqJDkVFIIG41OqZsGEiEbxsTDvSoXSxUu9sHJdjTRfOuWC5SisKcIzvziAUoAwOHF8BQzQvoKIGEEvV6lhw9KSdS/TwEZQv90FQVnQRoyaiZMtPV596ZcndzPWE+4jteDlhi0Yj+KWYTgPg=;
 c=relaxed/relaxed; s=zmail; d=bubbl-tek.com; v=1;
 bh=N2A1r+rQ1golIfAYqK6aylDFfyowYzix2oBocpG/+3I=;
 h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1795459036711269.0711554981723;
 Mon, 23 Nov 2026 10:37:16 -0800 (PST)
Date: Mon, 23 Nov 2026 12:37:16 -0600
From: Aaron Sierra <aaron@bubbl-tek.com>
To: "Yegor Yefremov" <yegorslists@googlemail.com>
Cc: "buildroot" <buildroot@buildroot.org>,
 "Andy Shevchenko" <andy.shevchenko@gmail.com>
Message-ID: <1a209b2b616.51eb13e963198.391130447023137848@bubbl-tek.com>
In-Reply-To: <20261119073315.2434687-1-yegorslists@googlemail.com>
References: <20261119073315.2434687-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: Re: [Buildroot] [PATCH] package/iotools: fix build with musl on
 PowerPC
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yegor,

> From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
> Cc: "Andy Shevchenko"<andy.shevchenko@gmail.com>
> Date: Thu, 19 Nov 2026 01:33:15 -0600
> Subject: [Buildroot] [PATCH] package/iotools: fix build with musl on PowerPC

...

> Backport the upstream fix, which defines _LARGEFILE64_SOURCE instead. 
>  
> This issue has been present since commit aa7217276d0d ("package/iotools: 
> new package"), as scom.c already used this API in version 1.7. It 
> therefore affects 2024.11 and later, and all maintenance branches. 

Perhaps the backport request is a Claude quirk, since the patch to fix PPC/musl builds landed in the upstream master branch in February last year:
https://github.com/andy-shev/iotools/commit/7dd70b0208a5a9856f1d80ab8097736f88f2452b

Is it right to understand this as a request for a new upstream tag (1.9, perhaps) and corresponding package bump?

-Aaron

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
