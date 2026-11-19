Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE9606A325
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MdV5kpBF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77FE60E24;
	Thu, 19 Nov 2026 21:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJ2ZQY6PyGAS; Thu, 19 Nov 2026 21:42:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E3AD660E1C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795124573;
	b=Nu/Lspdkvn1VFWfu/pPCxYqLwYVXmykOSp+yu48n5lSfp6Fa3F5VWjdcGt++MWbvzWm8
	 Pk5u2YpdJOmJsYloxL+Mpx4KCeFOz9K0g0FDHRsFUP6xO0WlpgBNfF65dW7NbUDof2DgR
	 9rExJAmo2tjrrr3ahzdAPmwDLoswGOUaTGtXO17ITjFgPet1RvaZZbmlRcq+P+555g8wy
	 mAC/u7XkeISpXY9TXrCMlfgy5OVyIiDn/+UIO7CeHsKGcgPwxoFJ7I5pvqVtViVOAuQT5
	 YVNaNLzYqmqm8T8WIAx7WiD3FmVFX36qZPn16q8xj2P2v5WqpQ9aP/KrP4439Tmi+3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795124573;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=at7zQ3stmwWZ7EEgMBo39H1+MoX/QIqQG7anED93ewQ=;
	b=fYoW8Vy+8jbfn8yfPhb6UsQJNafHqxiGu3inkMUlLgZgT2vkUOdOfiKR+usKoF+A9RYm
	 jOP6affMh62Dx7oqdIR+deTIHaelVhKtEmGWBRLCzU9cQzH2FcHYSfENs4L5yzhWuZgA4
	 aSbpbWE/w+/qmpR9uVmoDQ1nMtcskJc4jljXfB7eYNTDsdGpDpqz0cFW/+YH5yvuM6b8r
	 DwXG7ZYaDNx5HURCSlGQlJBy1ilA+ekb7AsDa/ObLzL1vXe94GfxqQNP0ZNgRn35scJCZ
	 d8rPG/lUp3rfESnHi7V+jUyRCMdp055EtxK5wD+EHBMs9x3XkyHlb3dimTSz/mSm3+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795124573;
	bh=at7zQ3stmwWZ7EEgMBo39H1+MoX/QIqQG7anED93ewQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MdV5kpBFcJ0CMR7+gR53kRR2vFmCZYN2EAdpfRP0/kpUo6QmYWfTcGu7SNOXyC89B
	 tFrEBvx2j7EJfZCLJEhoxCMENOmNQxQuyHtaigyqkvlQg/yULkv9MSMmFIVTJ0gIJl
	 vjs0eiMRqlAvaDfqJmIDY2WnA2APW7g5sxzoba7A/HEzyqL2USoQ5TteQVoVloL9Yd
	 lChWIaeBujGYmgQvjoR6yWj1o6gK3VQgiPAcCuClOJWEjFcRyasnL5yzvWwDc9wf+R
	 QYrIB7Ic3Cl0hPjAiJAbKvCQKQWiJLaWHf3ylTnbzOdlLXH1whysgg0nHOkPJEqlMY
	 RxGO+sl3qjI2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3AD660E1C;
	Thu, 19 Nov 2026 21:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E816D3A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5EED40099
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tEnTw6nOmdA for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 21:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B9DC640079
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9DC640079
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:42:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 579F713F88D;
 Thu, 19 Nov 2026 22:42:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 19 Nov 2026 22:42:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 22:42:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20261118212846.1258063-1-bernd@kuhls.net>
References: <20261118212846.1258063-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <98097e9cd9a972d5c9d5076fde3ae4b0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 23.1.6
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

On 18/11/2026 22:28, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-23-1-6-released/92877
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
