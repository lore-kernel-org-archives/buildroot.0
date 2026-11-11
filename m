Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3E606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jPcQdI3w
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 520DA60897;
	Wed, 11 Nov 2026 21:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziYTt0Xs_Aev; Wed, 11 Nov 2026 21:50:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 309BB608C2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794433824;
	b=eu9yMwC3tmliAsrQGmE+adBvMdCkrK5FG1uOq2FzHQVfmDvPdtBcz3dGMHEUW5hbUssy
	 RDotpcMsPUKO8t/ouA8pmjF7FA4ntFM4RPRp4H8duWXEDlpWC9c5OFtP5rG+m0zPLe2r8
	 YGoG/Po6Kr1E1E0RqKcXyw5nYLJ56ooKmYNYQYB1nlm7U/f5fwQkkyXo2riaLM+kmJVlG
	 HKCb3Ph8bsUlMEw8pHvB479jySAgYF8OhTeic3QA48PkBf//hSP+C/sj0yqrzjLJGqGB2
	 67rQRrlvF25Oe/H/4+yzxw5PLnidJ+Axsu1DKhEYpU4KDNrW3gqhOdJ2saZH8teM/aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794433824;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ZK34ucm5GeNFvaQZ2wxqDvXGz1m/pkGCCWbKsXUBbuk=;
	b=CLiNTqvB0EzExpgflTWnm5IlXOsVztFpzG0uugbj4IvUP/0hZXl0mKPT/FlLzfUzS3rM
	 9E3dgKhq1yWvmzZ5zlq7v+9F7DRnsrfWx99CgCYwJf0pLtnm4C0eekK/3N7JVK4ieKuOo
	 RuhgVRyJlvl9NsapLE9bmy29Ylyowo1375vlnC1nIBcE8Gd3QCwj/pE6WOVZ75V7F7A2Q
	 IVCyig/lY75BU1HIcgFRYSGw1sdbrKndXfDl7stYEa4H8l+AfnfR5fxfiFuvCrE2FPxxf
	 kbSxcgoX0Y+y8Tj9anV8+bCwXEQobGncYB986OcgISTDBCeM3L5hyvCzecC7AdpLW1Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794433824;
	bh=ZK34ucm5GeNFvaQZ2wxqDvXGz1m/pkGCCWbKsXUBbuk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jPcQdI3wmBAZwPFBa9FqjhfVYX+z+4aAHhUIm9ly5nqvYbanJ21IJFfg9P9XN3vYK
	 45ftDGh3NVeq8DUZT4Uo3oKhoazIYUuTFYfxg/WY9mN7IZMkT/QQQY6ud0FOmTF7xo
	 c97NFVM2DsDPIfBhLpMZv8kQaHfLu4owN2uY6RKOqNFPSCcJDcaNR/JPV0SCuwk3YW
	 A4THwj6Zau3vM++0+ZdNl0aVQajlbDIoVQnmqPsD2UZ03wJ8EwRMswziWhBnnY6E7V
	 jIO1qEVkO7XqL3aDMOil6NnGdDv6c06kJrn+OKRhrGxqIoRWKDK81lrYONM5DfBR8y
	 j3psVAHjvmduw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309BB608C2;
	Wed, 11 Nov 2026 21:50:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0051BE09
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 21:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4E4840D4F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 21:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JZSb_RBC5lt for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 21:50:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B95640D48
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B95640D48
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 21:50:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F2B4D5FFB4;
 Wed, 11 Nov 2026 22:50:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 11 Nov 2026 22:50:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 22:50:10 +0100
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Refik
 Tuzakli <tuzakli.refik@gmail.com>, Erik Larsson
 <karl.erik.larsson@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260203153617.80012-2-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
 <20260203153617.80012-2-laurentiumihalcea111@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <038f45857e8a36217ee809f0d77eb60b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 01/10] package/freescale-imx: add i.MX95
 support
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

Hi Laurentiu,

On 03/02/2026 16:36, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Introduce support for the i.MX95 SoC, which has 3 revisions:
> A0, A1, and B0. For now, this includes support solely for the B0
> revision.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

After some rework, I applied this series to master, thanks.
For the details of my changes, see:
https://gitlab.com/buildroot.org/buildroot/-/commits/dc10246725957f68dfea7a47a2d3b1726567452f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
