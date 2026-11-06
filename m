Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944AD606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gln955Hh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F1F606EB;
	Fri,  6 Nov 2026 17:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6jicDGwESCL; Fri,  6 Nov 2026 17:29:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A4E1C6073B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793986194;
	b=G0aq/O9I8V5PU6CvqW3aSDQ5ETP/YKu5TDJ9xq0viDA+aeylO3dNBpVrwWLLuxRm1g50
	 6iYryfQ/nUNzbaar95UdZNe4WYMVaLluCEmFUG6rIVVx8oIB8OnT1PEuHDT/KMSf04CUt
	 zxzBF5Du2yNHaF/zVrv2FX4ShFdUT0NMMLNYHppDnBPbWNFYwbLnhp9BQJtk9GLOic+2q
	 qxkblQf3HbGSoooJ/799MfMXUOF/V50lktYvmL1UoXRqP4EAiooP6W77h0+sHFwUiV42J
	 Hbl15ggMvPrZdwEv4PDoOEJsyNkbKsacej8typ0uwQbzSN7J4KS8bTLKX3byEqEP7SA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793986194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=1aMBIIlbOXpYJhywUa8lHidvtyuSOQTOlla/g7DdYdw=;
	b=aI6fs5zzSqji5P1Ki2WMctqWpqKd0+USS8pkkryiTERTFe9EbYo+PcFVjGYfgnHbi6NU
	 o5JUzzfZaIvCbv+jO3uwTh9h2w7DefEgrsSoxzaXq5qEJozBNpL3K8kEY5LDKGgA6LJCX
	 HenJt01CDBoJ5hN31ZfCQHUkYBjwQ9FNGm1oxgENdmmhDN4aCXqlGiGe+I7UhEX+ckilC
	 WFBOwEen1dhJcTq7aJIfmxI0oNd4w+b6TbuOZKmrzt1MQyGdZlXWs8hJZ2AIP+GMXWfUB
	 vHNTvRQ2+DnYjymlz/3eLOc4giv8Gg7FYBizgTlNo7oqqsznPCOPkmJfiDQFhOI5e6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793986194;
	bh=1aMBIIlbOXpYJhywUa8lHidvtyuSOQTOlla/g7DdYdw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gln955Hhrre5hJA5kk9hKwWMkbcwZSrGBRHIH7V8VFf+v+v5KgqOmgyPLW+8PkJTY
	 Wz42jftfa8CmeExyIxpAkcSEJ6Zm2rxU93CZ4ZIvYbvSFW20agMYIIVgmuHG0QFdrG
	 nlFdM3Wx0IgthH85eR0rDipxw4rBmNoQO8kvGgSKo9nu/Qtzd1rg0nkkqz9z79YxU9
	 61lz/EcVN9SQj22LjXou7paN/NMntkLK0NjiBEp8ZQ1G1EoyD1Ng6NT0QT2eRHHt3X
	 ghDi4b0LwJZMb/EqoDei4xV2NBE+Z2q26YZHH6yY73zDanNK9pvfEmZq6iWSwkxbB2
	 WYkISm8WbxJTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E1C6073B;
	Fri,  6 Nov 2026 17:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C401A32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B588A8129E
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJ6Rd8of-JFZ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:29:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0E7298129C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E7298129C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:29:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C5E255FFA3;
 Fri,  6 Nov 2026 18:29:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:29:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:29:48 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20261104092351.1669074-1-yegorslists@googlemail.com>
References: <20261104092351.1669074-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <59e0b7ee7b0c9738b688ba8b1b50640e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/openocd: fix build with jimtcl
 0.84
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

On 04/11/2026 10:23, Yegor Yefremov via buildroot wrote:
> jimtcl 0.84 replaced the isproc member of Jim_Cmd with a flags field,
> so openocd 0.12.0 fails to build against it:
> 
> src/helper/command.c:51:19: error: 'Jim_Cmd' has no member named 
> 'isproc'
> 
> Backport the upstream fix, which checks JIM_CMD_ISPROC at compile time
> and thus also keeps working with jimtcl 0.83. Its context had to be
> refreshed for 0.12.0.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
