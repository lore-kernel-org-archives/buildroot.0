Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769A606A32D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VqFGeIV2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DA280DE3;
	Fri, 30 Oct 2026 21:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jMctkstNuXz; Fri, 30 Oct 2026 21:03:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1431A80F43
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793394219;
	b=SnSJjikIzDnFrVwU5Oczimt9V1Ep5h3U7LaorlqKzCR5OhF0WwXa/z272nJ+Zepaa/Rf
	 exqhfSXGGth/ds8S4wsbeVkA9ZQLgDTRKcUUWEqMZ+QmmN/bImEJNwLzr1+wuKK9MZ31I
	 cyrPsoiXVgpTawobwTBFF83PYdjyJrG9tOVCV8meOlDAfAa3bJ+3o5Et+j2ZCnMw8nnG2
	 As/pMm3GGU9TOXYn3oXpn8UGLuffMIZqpCFW9Ccp1hGYsDKe5Z6UFif/hgyMfNZvuUP6X
	 EaDB3pzM5vpGcCv7lAcYP+317hXGzd7VYlBV6LepCkphIQwYngmgiDrj2RWTxqHKl0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793394219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hrn9mPm1x7n1UWnI2JwMen2xCJR9urNjBIltruWFMC4=;
	b=DkunnXasSzUujhl5q4Wtdpfo9fB1Mulk/4XMFGVw0XgEy0zzxRgKy3chfrgM7ZZZYxyf
	 E1L6zuTb2HAWAshjhSspPoBjTXEOBoSeVxNCMCE/H5kJcDg2HIFw4EVunBxJ4NTecKSQ7
	 9lsllkKX6TM7IeaHv4caAYW/yHJAJiuAznk+e6QzRdbkEutM3ngYdFW6h7aHt6iWJy9nN
	 AsgSjIKxkD0UF+3/6ZQ9W18AkvMZg4En4OL7bJLOLAYOd5rEOJvgGx+jgq8TFfqPMcLer
	 T7SzvGczEEcFjgzNPyIznJ3E/E5VCnLiJ88Yd9PENiSP9umAvR7NEFC77E/rubJIEtw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793394219;
	bh=hrn9mPm1x7n1UWnI2JwMen2xCJR9urNjBIltruWFMC4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VqFGeIV2slBl2XQUhBFo+0Abm707FChrybu6YhUFWo3LjBCGKK/VpgaZWjh/PCd2f
	 OrMopRtW3hkMrL7jc3lQ1aGWxVrAgVacS27ZOAhJNRdjOZkJWDyOOhjC94N2r4UCkR
	 asTEZI1AU3IJXaMv+HcD/BNkplnyXYlkFzWS0IKE/DfdomZnFNT1NqGzn/CTOATyBW
	 QEe1pRETTGOjr8hXg4HnswE0yjXyAFEeLDJ14pUVNrZBQ/GQ5Sb0Fxbn4WoG+WDVUe
	 Dow4kghbgkee+ubJCpWzRt5OBEqKX4sMw7xHCvDeIsFeEkTQoy5CiWRPFo7rt8h9nW
	 tcCBQ/sNfIROA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1431A80F43;
	Fri, 30 Oct 2026 21:03:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB3CE235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B063A40B18
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qN92022ygRpU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 21:03:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D870840A76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793394217;
 b=A5wFvr7316oKu2ivc8FR/fJivP+ao4mNVx90i6bXORfMVkwjcK6FkeNsG5VhK7T7hr0o
 GFXPyOkHCe5Ro9EuzMi2qoCA3CZ6+1UmoMS76rqOLcT8lGvYcrlo7FKhkNutg5CYqew1n
 tiucnaZp/PRrnfI4PA597LOO7/eMSzk58ebrH9rBrLM1ox4pEcQOgW79wYBVZuoUikPag
 Dpgmr6D57alYwD21bA18fqqCDvmAcL+6EjA/qxM9fePswL/5PmQHhELP5pYDpgQxu5gi9
 3vSa178WQp2kzjXFS6cPo6qL09EcWW3nXSzBQoFLlZc64X7p+7GVCsiqgF6iOAcLDAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793394217;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=aEOZscZxGE1jcAY9NQPuJKg8DkPP2+EKXJGYOBsTvqY=;
 b=GCCx13vsH1qazZbze8xDgJ0Ugsr7/vfbYMAC3mvy6cz63BKZSVk1bASR3aH2c2Jw8LID
 ruvZwFVhZ5ToAJ1FGH8DBokCNxGaYmE6kGOOPAPRtgz1ypyAaRqN4wc5+dg8gTbYttLon
 i2kF18y58EpXmnktqJmUodrfXYsi/QIMK8+aubBbO3XXhrxs8O9e41Bm+0AXpRBROLcS0
 Wwq35PET1HNCqiPNCSdi+BTitawlZEWxj3UHtMJZd6eF8BMxNwSsyuX8MWNubtcRPo1bD
 CCE68Fl7bfM0YuPTjFfiXmlS2Dl6qskZT8O0Kj6NA6Ra24snTNYPP+AxKwN8lwBbhlA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g6hCN1oK; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D870840A76
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:03:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8B30B19F576;
 Fri, 30 Oct 2026 22:03:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 30 Oct 2026 22:03:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 22:03:33 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261030120306.3167071-1-angelo.compagnucci@gmail.com>
References: <20261030120306.3167071-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <fdea07f1bb74af0b4104ffb4f07f37a0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/sunwait: bump to latest git version
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 13:03, Angelo Compagnucci wrote:
> Upstream switched from C++ to C, so drop the C++ toolchain dependency
> and use the C compiler.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.

For info, I switched the commit id to the upstream tag 0.9.1. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/15b0457158bbe24264ab241cbe87c52b4d659f4e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
