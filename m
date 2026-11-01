Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E73606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qr0wvK1E
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 437AB40619;
	Sun,  1 Nov 2026 17:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URHK35D0Cnai; Sun,  1 Nov 2026 17:08:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 726BC4062B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552884;
	b=QG6xhW3y17BgMkPIe5Uwfy2bwqIL2mrJannzIrQ1qpzjXIlXghA4haIC5debQAzCqTJ8
	 7bVjrdxPuxmGHI+6W3TYAa9rM1Nt1VkRrYCPteKvLoMiOPk5i3uLnRodHpNfFca7CoJno
	 ME2fyAVYkAmbLIfye1hdwR4PaV1uXMfr25R6KxzijtrrhzCgUWzxcP+DrRiL0YZkVes1/
	 2ibTNRsPhFm05P79jDcDG1uatZ5KhaD0BzJMkBvXCAKKZW4/pMO5RU+bkhTHYsMEDT/8g
	 s2HUxyyyJhd9mWaIeQvxyFWolVSFpD2YBY7BhA8G+KX2ypsUhfV6pzyAzFpLZFS7QKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=gDn4bDnJw5qW4maH7g+qmqWY4HG2ed6Gj9//KNAse7ZrSpC24TmwdqDf5PXXo0tWfQmt
	 sIYE0oJuObKlvh2j91MAjVZ/lWQUqU297UIlcB9FasGGRrMBZwiLw0HPRrVppspJ07/HL
	 2N8KRk3Uy/opCROpcKU9Hk+IGM2sXJzkWmEBmK8jf6243able6ZVV71Be44gyX5tZi5rc
	 aG1OKUSbD6D616xRFMjKGB2/7lkEmytet9lnoWf6/DNQIi6B7H7pNxPfa49CEqAXbPJhb
	 pfPdvUumBrxE80UJcMD/xk7yZiHlXANXBwGCb4ZAV65It/aVZyACSvDAZz/slnOaaIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552884;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qr0wvK1EST0af7YmrD3WA8M4s15LyFv0mpboHX2MVc5Ao4JXXfM1EwSMRKewY7LOk
	 JRM5A2qWJp/iVQgCbusXE+OYDflFzllNhgokXWS+eM1lc0uuzp8reHtkxYmwnyZOAd
	 YIQnff4Lze/SjjWWF6VneUd5fBKBEHHyGRtPJg0z1ISxB95Q7vB5sw3FcUsXk/pifF
	 ehJObcWs6PUBaeUwAjxV8pGhtWhQwSNE9j3aPA20IMIrBTAIw5fcMiIB/VriSEv85j
	 MeCLiu0KG+6SMX9uQGqsSenroaDanKqMP5bOd7ODhwq4+h1q/6JtkIrZkaBa11c4IQ
	 DENCnv0ny8epA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726BC4062B;
	Sun,  1 Nov 2026 17:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C93D380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4267360711
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUSZBVWMBDaS for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5C34D6061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552844;
 b=f29SDEiOelJG8kYUzrWfH4K5V5+SVNL3+TTgujFRRZOg5NtkWpoRdeEYM2eH3HRolKlN
 tFetKNmTFFWSAsERVZAvPCAJzcL1KQphH4uLsSt4YGd36jYGQaE1cV/cZzOGQz1JyLJDB
 XAVH7dGtERibuFPFEgUfx/mcsdqcfFWo/upmJV3poZqx8EGGOsq27MgsA6t23hNM4OXPw
 P9PD6kLCZDqnL3ByymLQzjR1afksUeKEszCtLepPgpoW8/Mg21hiefdviPEa9qYMfsXKB
 2+vE2N/PGPHnx8Wu5vDWDFMZnnjYm8jVkBR2vMma07G2aigPKwCDVj02ywAkZhjbCYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552844;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=S7PbisHYY+CaBKwN0zlB1RTHRRcvMg0MONjoGRcmjax/zfhQ4yTrqIPYMQJnBHevDyVp
 BIUXoDMiM0MfDy4ROV71Ca2ibImtwrykfpoMGaOROSFOuo5hn9IRL77LgQRdq2f/jXtWR
 XpTIlrqAsxeTAPg289nixzcUAEs28PwWY94D4ZEvmpkpqT87XQhc9Dj8OnEjWPbioDKqT
 MUxoZgURwxXvnSKkgQ8QhZmvoelnHnJu0ujYP70Af3cxX1dtw5O8eVDrNcSCDWk2yGbaQ
 1Z6F9Ptbt7OwiWKZLipHwGS5U8goHIGJqadK0oIc3iFPG/IcHLe1nT8wzuJNO70L4ig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SMGR70UI; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C34D6061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C7B61B00548;
 Sun,  1 Nov 2026 18:07:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:07:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:07:19 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-1-james.hilliard1@gmail.com>
References: <20261031172019.2683287-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <f42f37a441056b8f3f402d95abe9d271@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-cachetools: bump to version
 7.2.7
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
