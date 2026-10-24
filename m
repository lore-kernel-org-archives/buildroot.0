Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA669606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EsBjpddh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8236360ABF;
	Sat, 24 Oct 2026 11:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PyuHp3kJRIz; Sat, 24 Oct 2026 11:57:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B137760A9E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792843024;
	b=OSlxW/Qo1a3EiL4gHjmL5nI8ePoxjBeW+t+7Sld13yA4+w6LkiBYYQlHPRBjrnShJeDJ
	 EynZsI0LtY89FcXqYk63QdH1m1r4McZLxD26vZ01XOQ7gCRs2+xod+GgzVTWoKjg593zw
	 Jf7dDk3fxQRIZxpPLLcLTSW8LdhdSelMawdqa16YcQcrWStrGOyysD+8Wim10F/+VNaag
	 ir3saNj0MQbG+FVE0BmM2dHoqRDRUoMXX5DXRyhHTOKHqQPFsQO8X+6JL/2BRkKp/VZCX
	 1pAzCT+wEaKbXM7QFLAAx9bpa3cnHLQ9GtsXdds0sMJh4c5EFG/n4zNJDGOoPQS5oFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792843024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=e3X5fsx1LIYmaNpw9MmVTG0sFGfe5ht6ypbkq3BxtHF1dbs1EkMIh+0ZzHZtzOZHjet7
	 rKHnlY32rU28z4t5G/LTNJePuC+zz/R4lafeNRA/6SDDwNHEQMYwwkggMrcrdJjuTIsKo
	 dPP9JNCgQ/uLp3VWs2qHFFJPtpj4EFFyYfUvLwKU7W2Zh3c1xZldYghILf6y6d757byyo
	 Nb/7YDJ8VLUF71T3GrL6MMFAgrDBiZVegeHTKHthhnOOEqX7TXPY2pg42Rimjcsg7xY9p
	 HFtLZyyVkiUB+mn5wBA4Jv+fQNzTzzYhRf7LNUvnt9qqZ3n3DykCdDF7A77y7921WSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792843024;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EsBjpddhCBq5g7Qil9bnW5Jqnmk5MDvjZwEBVcPTnp3zwgpGjDllR1RMW01dabxtF
	 lfd3d3qEdPtgQzWN+QvGcFfp1j56uDaZCk1Tf2G93y19X2mHIeOjf/XHesg+sR/xDF
	 hqCL6eqzhvPRaYQZ+ZP3WRj62A9uHf6P5sknDEJEx8bcbaVmL5nPjs8RO7rcQlTogq
	 7W1VcNtzvCevyHC4/pzZs9LTXAEt8MsF/5Xxcjs8o70zgfta59apF90lUW27dWanBe
	 vgxYwCQDo6fcRlp8iKhLVjMxrqXDTHIYd/rxsaxDMrI2+4SGxzulI5ait1mJ++OPCc
	 Zcge27J8IDRqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B137760A9E;
	Sat, 24 Oct 2026 11:57:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE7943
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A67AF60A9E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLvy7gCNUdEC for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA8DA60746
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792843023;
 b=UVgwyKAPQ+Xoqax71doThqRenKiVn/ZWG/TeFC3X01D9xtxr1ySMa0xVzuNpHQZOPo5v
 sPwUYLALm87ZFtmXvqNz2R0XV/mhVi/sZ3bA4dqQUdVXVaVQEUGTwpxi33hmqwLV3X2cC
 ki1rHvp53ijyczvBLkLrXx3rvOJgTV1m9Hz8nkd0Cr3ki1nv7u8eVoJTGiokizn2ffs4v
 ey00SFnFvk+fHQalDgFr0QgiJlL99V7ChqLYVPMqDmTSOYIS5VkFjlMNvCt7RwUTd0bhN
 e+An/49H/zPEAEM/gaaoQ/X56QtLvVPy3vyTcASFnATS3UhLkVaa4eh8aYwgbR4CzDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792843023;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=GXxkjmrgYbcy9zGEqIP4rZJSS7VmJBWh2GNylzohoTii2So2wSo1FzTPUBOn+oJcC+Md
 7LcbDFM2IQG30uAm8hLAb+h4hq27aGKlXx9KiJbpnxbvbxdM8wyZBueDc9tUTUII5SmtU
 tGU37pKHODBU2HS/GVWvOABYtTPdSuwRv+h61Zaqr8O/gpO49+S6mAWWxfwdxw2CGWbmL
 0ME5Cmkk3U2/rAWh7/qjzD8pwGuTPLiUcgjn4e4sewN2z6VQ5J3r6PH1wZ+WvcBlF3BTD
 ZGenicyOC9QEX7oX/R0Xi/CCfAjuQnC0Cnf3wfjKLeP8/OflC5eg7zEHbrpPUhwytfg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gvqlJ5TA; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA8DA60746
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 573F6B0054E;
 Sat, 24 Oct 2026 13:56:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:56:59 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:56:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-30-james.hilliard1@gmail.com>
References: <20261023181818.920329-30-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <65d3924b707228bb4d3999812f923e70@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-wcwidth: bump to version
 0.9.3
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
