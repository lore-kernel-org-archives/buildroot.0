Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZHdq2Cf3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7918560D8F;
	Fri,  6 Nov 2026 21:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayuNtO029vyE; Fri,  6 Nov 2026 21:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA4B260D71
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000022;
	b=W36gFqadEXd1srk34+rbYCakgsZ6+D3JKopM/b8QbR70w93G+u8cEI/NAXS9z+xxo9GQ
	 7kBkwYcLJlIaehA78Ry7XhwPzTxQezamBrCmbXXy1SYqFvaW4FNmrmbZFu7IJmwVyFQn6
	 +xdF7sQFfBVN9xDdKMMvvx7z3Wbniy7Lr8V0Y72L/5s6+tOJBlMI6MJYzCXrNNJfGSSg+
	 OrORW62Hje50EgAjlgMtyehyENUIqm2QPm9nrvwWPhz84LzGWDKi00z/qfmjvzo3ATUx6
	 R148lT9wgYCelL2eeA87VwZZOM3ixsvVy9p7Jd8+Zbg3VFkwk73kV7vkZoNjS7ubZWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=mk8QFDJt+4nUTWpZ3oeH4qZkK7594GGylSc6nAb0jePneiHIdsycUvc2m3Tj1Q40l2Fz
	 Fga9LlXRL8WsX23BbVpAQKcy3Tv3lCh0LU5qEpT4Dx6i0S22kt/5oJCYHrpjTGNPoZlEQ
	 u9lbBoBPQ/m21TMhOX5xy0TXwdJ/vzOkSk8MLyFZ6AicQ2jhvF1N3fQxF6sTihs4tGC5e
	 FMx50y9za2xHp4/aixj/3X2WUtGr9wFtOiQ4sJjmjfsW5T6FiqkeHBNqxKVnIg52oSROo
	 lcApFNe7+4aFx/QLzevvdPlYwx1kWR4fOyYcox/ElCvVtNOytX7+eQrsG11k4WHA1Ow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000022;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZHdq2Cf30XEhu4XftDdqYbVUlhbOKMENxb5XaF4s2UvNwaUW8ObyJn7w+OQ4QwJpx
	 rX3bkUJaLs/aIzGbNtixFJpGaKK7E9mhP73EH4jsGDfa+LvQ5yyhojrtK2GQPaUZLa
	 sZBikcH8xCDvnmFd+rfZM/6kabdmzZkaP5auatyli6GH5ysZsd5cPYCvIgohAReoOQ
	 iuo3s/1l2lNWzzX3NuDmX/O4wlkBq868aUnOLH4kINBvGm38wCCfkxlj/HfhiXamNJ
	 +Z8vehv373x1R433W3Km6TaJUErynVB4nOCoI/UtDvfVYmnM2TlfW9TvJ92fi72SUF
	 IlCzf+0vGJpgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4B260D71;
	Fri,  6 Nov 2026 21:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F35C0235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0F2E8168C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaMbwCsxkYyY for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:20:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4599181673
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4599181673
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:20:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5C7A019F58A;
 Fri,  6 Nov 2026 22:20:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:20:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:20:18 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-21-james.hilliard1@gmail.com>
References: <20261106191536.2120153-21-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <9a75084da6711760d43037134b861985@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pycryptodomex: bump to
 version 3.24.2
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
