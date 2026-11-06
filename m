Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEFC606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JVPpoH/3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5596608CA;
	Fri,  6 Nov 2026 21:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhSLbT6HhK8V; Fri,  6 Nov 2026 21:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0FD7460AA1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000203;
	b=fvblnATuo7URFhzXH8T/pwDl8wlwNYlB+SPvnqrZqrcU6ccUOb2Obkcnzr1kyz3yroBW
	 Q5e3eeZf7+5fAOtat3fAz0HXoDGNQWhpVAwm5WVrjetOHOfAWCuqg8tMtrQ/j0ecLdDLD
	 xtADBvE5g9eTEOvfwnBYlEjcmRHgrvGriU5GKMzoTpBL11PqQNXjarsdiGqcwceAtMIGC
	 ZnqU08kAJRPAdNWeudIk0BWRWN51TWhpj677rIc630yeIsHis7sx6EdgIyzraJxxlED6s
	 bsb/2zYY3pnwsT6qzdP7RroqSWcU4xoLDt5U5Y/wwVxjv6mD3UZfwRzdKFAVFztiWAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=SxwOOZdq+XRpATB/YMV0dHmBjEVHpcMsAI3QUFpATf1lUHigO4duKe2m0ghQOwcaVirF
	 UNVOLLgG68bjCQMBtypgWjN6gFlq4Fsjq4pT/TsbcOrzJ0Gr00c0959CWlphkoD3cVEBV
	 0NDC/8rBEKNSb5Sdx4mVAGtO7AbAqviOE2Pjtv/mQC09lFQ28UpYNYwY16PeI7SJSxK1j
	 9aCq2MnBP5GE2iHTFiTLTDyUYXBoiZvuE4a6Gdurvgt3A0UvkWNMCQGUYCpk02bCFz/Ut
	 wKjfpvTc4aL2od9/kR6tin27SInnXs3t8ecgC3sP2cg+5n3Q152SBgPeSYPgLVUgb6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000203;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JVPpoH/3FUBzSDDIPiPa8mscyXFhH/+v+FcfKYT1TEP3Ptx8umMabRTzf/Fc8QgE/
	 pEmu/3ScVj3tgCtKffg+86L63JHFa/N5zshTHqLFObFtLiEw0Qs6yulMWn+6AOg4xV
	 1m28Wo3RspVG9744Ryu91hV7btTCcFAhbZXGUssMz0ZwBuu9r+vXnbiRkcTV3cs6GL
	 mhZ/lUuEsyLJl3zKrU5RHShC9DRu0Az13JifQuV9KM6rtJcCwgITUYytyK2k0Zt0Tc
	 UYr2fb7jireOyqqRar4QKJKn3v8edo5/YTs+9gjhIyD5FoKxnjftven52FOK1xxAGs
	 5lNkaASye3fOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD7460AA1;
	Fri,  6 Nov 2026 21:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 062C031F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBB8A81701
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5KURxjcXaCF for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DC4981700
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DC4981700
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B174E780316;
 Fri,  6 Nov 2026 22:23:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:23:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:23:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-33-james.hilliard1@gmail.com>
References: <20261106191536.2120153-33-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <63bdb36dd6fdb619758a3f0dc9028ce3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-ujson: bump to version 6.1.0
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
