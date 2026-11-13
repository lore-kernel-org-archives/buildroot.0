Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A0606A321
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zs2pQueh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6BA40E5B;
	Fri, 13 Nov 2026 10:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLSndpVm8Dap; Fri, 13 Nov 2026 10:39:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB34B40E42
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794566357;
	b=UvzRYIN7p8DrvccADcGGfc1umDEh9NevlY/4cZQnerlItJ/cKjnUxjQNKK+oAZUAxusW
	 6Z9+nsxaxqnPa/srSSAK3FmwicXEmrlf6YUy1f1//CKu/fPjO1/rWck9FfYlu7ZILt5bw
	 LspJRYsuQTTvsjz+R+nq2SHseSDG4M+dHcwWNGOKl3B0TY4ApBpkPG32SsWjegOJZTKad
	 PSobn5RqUVr9L4cwE0pa1HN+uDOP62vRwk8Zi8k0LoGwXumwaT7JTdbNTLCN81/lOXpbP
	 BMK3FUJYZm8XY2p91byvjaNxxLGwCPBZN4nhdN8vkNwMGzyTjiUL3ZcPxnecDDR+W1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794566357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=yWzKkjde1LLNLnMImngOO4kBXQD9X+nyFN2/pE9E59k=;
	b=phCU1gNzKhZYooKPhgCx9CLuwgCUPRCPWiwBAHRdGEMDFw+OLPW/NQSm+om/30tW+p2v
	 7PuHbVZsg3cBrhMde7+dWLltu+0AKvnMXgcMumuVBQcM/0+J1ZZRTUdAyyFRjR4U+Dxpy
	 b2g6TPjy/ws5v7GH0XZrfrtaF4vAzKr8pB7RFuIaR9XYps9mS5MnP61oVnIl/tvktojdo
	 F+y6IK1rYJvpKO45elaKZaa/fbiOVBcZANw9hLrIi3NoVirEHx2Ir3BGQoVJID1gFYjK+
	 8aMj7gicnbFmMVW6uhCig5WMaQ4NhHXBv1ACauarYr12LnQRoGEGwmP96AG7Sqkx/jg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794566357;
	bh=yWzKkjde1LLNLnMImngOO4kBXQD9X+nyFN2/pE9E59k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zs2pQuehizBK3A7snj5KEU2REonIHbGt838UQe43SuvTJB1LMQbN4m/Dgt+zIsyEP
	 tIUogA35jg/scgl3kq4TiUlWDc1qZCuyWoBwpo3wYvUpukocA4DmkS+QoZCdSk04qu
	 E78fXsnK3YpBwS7My4fw7XC2NI0+aZvAj4k7aE3KU540WgjY7n82ZHUUkfnxvApIIA
	 FLSd75kVZaPSN9tFWnCIiP+uCV0zk8tPFOi7pNQh3vyYs0EsN94mJEJ4tEBppZyCE9
	 26WILBF1DabkXsz/S2FGBefc8y8eq6MPUSni4blSt0ummxq9eJsucLpGflfiJB4hSi
	 QZQLYJcJLyAZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB34B40E42;
	Fri, 13 Nov 2026 10:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEF328C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E77E481DED
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQvMDx7Ka69O for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 10:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A786A81D73
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A786A81D73
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:39:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DCFC513FA38;
 Fri, 13 Nov 2026 11:39:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 13 Nov 2026 11:39:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 11:39:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261113062729.8725-1-bernd@kuhls.net>
References: <20261113062729.8725-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <cf18805427c36b8f14f868c6fd87927a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.27.4
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 07:27, Bernd Kuhls wrote:
> https://go.dev/doc/devel/release#go1.27.4
> https://groups.google.com/g/golang-announce/c/iY8TY0wWgbM
> 
> Fixes CVE-2026-97033, CVE-2026-97034, CVE-2026-97035, CVE-2026-97036,
> CVE-2026-97037, CVE-2026-97038, CVE-2026-97039, CVE-2026-97040,
> CVE-2026-97041, CVE-2026-97042, CVE-2026-97043, CVE-2026-97054
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
