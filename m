Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F560A2601
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NduIwadc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D25E813FF;
	Fri, 20 Nov 2026 17:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu1TxUmPlmlu; Fri, 20 Nov 2026 17:19:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6AF6881403
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795195168;
	b=G1/3CyraKUFfBa3jZiiIUWdu12TDCq1KMbeolpxD0K8Qfte3fIlW4PSAqW1yUEpWUvKR
	 xoUofKA20flaTj6CB/8vVeUBx1Ibk8E2pnfaBxHaxLUok03/enEICruBI7C0oVVZmB0nw
	 8hCXTdoDfj4ArD/Wq9nyzsIDUgEIC801TPbdxQD2kBsEWc2oRN0XYzqgrRwbMy/m0Djsn
	 zHTUv5Xc2X8cAdaJLv09kjl5C4SDnDMUwrcV/H2LYt32lE2vU1O6NJ07XZ820vSulGa4c
	 j2uwNrnWIHzF9FUXAK3iw82ZItTGuXbhpEiv5BMo0vOrbO7gfft86LXGSPQAhmztRMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=NNIS/faqOl8kJeA3ut/w4FQtkhk4Mxy3FBvtPKNA2H4=;
	b=WsxaRrVQODBScl1MFhFxJQpOkzWzz3ZibInGeXqZ0xmiVeByRu66+Aj1vePL2T3zrNSd
	 WXp3obL8Y6wwEw2gLH3HLLINuIAmz9jrfTXy9Pcp7/iBB289Fn0PgJNlf7ehj2Sx9dT3Q
	 LuKRW9Q+A88FC9cgxcAuxzcOyIcA7+acucbLKHlisMIqQdYdSLGc9XCo0wtGxgFkE9E2r
	 GVZVnot8h/ZYTbCDs9urNJK1mgs+uPigZPDR/rKiiV3TiirDjPl7mjAUVcaWrsYbZbQFY
	 SkMJegnkZa/8w9dVFGbq56d1OiBdXCuCm3I45WXh4q31+fdIKoO/0KaU9zrXJiBoCJQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795195168;
	bh=NNIS/faqOl8kJeA3ut/w4FQtkhk4Mxy3FBvtPKNA2H4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NduIwadcKr7FPq/7ztmjWtgUR9Dz6atI56+4plcCwpj6Q2iTAMXkviUdzUrHqqcGN
	 HltmkgJ9/DmAmWwamEGOsxgdif9avxM/cGztsLKh3ntHaHNfAtNPcu2Bj2m/WHFjOs
	 Keo6C2LV8UIrjPeffrJNGY5b1eWhS2gIQjPBCtEDgkKnSIz88wf6LyvXuVQZu/Xery
	 iDzASRBHKmR5LCRdDrrKSoWwq1IMFEd0yYkiKjqJj89XX6O7Znrl/5Pc1U5pd2UOcV
	 LpZqcrm90OqA/+781/0YeY0Wb/tmslw9VgmYC6RUV7OPRQldXNS4vUGx3Q9VyHlUz0
	 gsrL5bxbEg6GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF6881403;
	Fri, 20 Nov 2026 17:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2437170B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B456069A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o64RMQRsgNER for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 17:19:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D34986063A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D34986063A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:19:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 984CA13F88D;
 Fri, 20 Nov 2026 18:19:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 20 Nov 2026 18:19:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 18:19:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, "Claude Opus 5.5" <noreply@anthropic.com>
In-Reply-To: <20261116121441.6513-1-giulio.benetti@benettiengineering.com>
References: <20261116121441.6513-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <e7f70ed7c3897cbfa845e7fab4e80245@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/tmux: bump to version 3.8
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 13:14, Giulio Benetti wrote:
> Changelog:
> https://raw.githubusercontent.com/tmux/tmux/3.8/CHANGES
> https://github.com/tmux/tmux/issues/5584
> 
> COPYING hash changed because the informational header has been dropped
> and the copyright line now reads "Various Authors"; license is still 
> ISC.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
