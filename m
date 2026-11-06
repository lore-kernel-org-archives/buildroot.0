Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F8606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ns8MK+ww
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D0760DBC;
	Fri,  6 Nov 2026 21:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hseOSp4uTyDn; Fri,  6 Nov 2026 21:22:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B77360DA4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000143;
	b=iVN2pCqSXDlT0x7q0Eb3PTMQ4456DA5ngloKYbffLUifgKwECe4QGR0Y7bXIBETO8Dnx
	 W/YSPcpjpcxP9+X84P0C3obc95Z5MuASAff3BKdZqOHoD+WrweJt+5nDbJFXzbuiym+Qm
	 H3W5eOeXn0036guPJMJvths3mPcUK+d12ZNQoPkepsWT2FrsLUSAQXhaUV1XOKXYcTajl
	 NPP5Ji6jQrFxkPZ2bX0Ou77E0It3DXcNf8LZhvShywtvnWQsJHao7VypH4i1le0dJJ/kX
	 +so4a5/PYaAH+vrIiaaPyz88V4nwz/nnlWVjc1AsmzswXEQkdPwB+tNaYetaATkffFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=IzOx0TvI2Zd5++UawhXeDje1itnR5dPRA5Dbov97clUwsFVBO+xYFXHvT0Kwro+TZZwD
	 FJomtFMYd77NH9vG6zDG44CqVD8kF176CTw/aZl/7p+Mgw5C3aNnUvMJcE46toW+OuvPU
	 ITMaRuvMkRlE1I+7dYD635E36HVpv/OSLLxHEUqdB6zAm1OZi7LRRUKcg4jxikSa5FfW0
	 As0o+UolSwlIwqnrNGWJpCxerfYhJqk7tk52kUkHsRLnDyr5HK0AhYKaJVFbu/zVsDQdI
	 +Zlc4XiwyOGxROhtcPRhqZhrIh+ds7aIXXqJBZOBQJxTV5imTGLtNFKgEN9W5AcGNDA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000143;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ns8MK+wwyk6+7F/lRKhnKfOaItQDAZWC667wVvCx9uRpi8W+YFz/qG91OPxNty7Ok
	 Ael3Gku2w3AgaBisbMDqyNOCoB0iVvkVhukoGDA8QbGN7Q3YhjEYeLhbvhKBk0Aii9
	 RVANX8vNXF2e9N6GglwwRaxg195/D9wi8Mz3CYVjrNPGUjjJKmjiNPGSbse074V8pq
	 21i16myWv4PfGVHzsz2OB5gYs/SgghuW3FAYqQKtR7AbxnnClwLluVPvN1wApQh8fu
	 jTaEpiiVhDVrUlgP3uT+HHd9EOk8Soh9Zs8PXPpwVUypGOw8tSDrREspNonekD3A19
	 mJsRoLUPy2G/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B77360DA4;
	Fri,  6 Nov 2026 21:22:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21E0331F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0806360DA4
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQCmHujhvtnI for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:22:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6189F60D92
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6189F60D92
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4E9F05FFB4;
 Fri,  6 Nov 2026 22:22:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:22:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:22:18 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-29-james.hilliard1@gmail.com>
References: <20261106191536.2120153-29-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <297f7d793ccb7f46e681bf5bb1a4f846@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-typer: bump to version 0.28.0
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
