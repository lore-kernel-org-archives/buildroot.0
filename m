Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3768606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fb3ZhRql
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B66660612;
	Sun,  1 Nov 2026 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnx0ED0FLTok; Sun,  1 Nov 2026 15:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4E4860619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793545548;
	b=hngAVJ2JBBwppvrgpOcPbgFqT7R8sPzeQ13R1rUkO4MjLRDACxa2oBWHfQKOHkB52zW1
	 tLeQsTrpWSQAYR74igJ+imTZIOv3/3PsbEocgBH91ptEGXHind4i2vjKGlA6w7moGNZFq
	 4f8ZUNCqxqLts6jH8Q5EBbypzURfCF/v9MQyaXYQBiuuTvTYdFbRGGObv9rHw9I+X9Rnt
	 6KGzy5gnwrbHFjIUDLQXmQBr3qgbkCDWZYoSVZSUZWCYwkxnlzCJ2sEcys9HaAxIfJRnH
	 m1urmUMQjQlW0M6Gq7W8KSgq9ZooPesW7TllcrhlJHGPFOdd4pzdHKmmlItWNtYU3NA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=0N/gwWFx4ZyHy+AUqbqWZC6zZUYfe0XNZAZw1otjZYk=;
	b=d7VJp+LTC9C8R2d+OwXJ+YW3dvYyF2Qh+EVoQzJnFy4I6cNRxEr/vn4MO0z85Rfzk/KF
	 CoqbdfbZ361p4PocrgboFgYq/e1dFqpCdrhktnYuM3Sy9tWgsikruj+ugTPg8qWdAnPlS
	 WrF4nrk1FJQO07VjDeno/uK02Cg3TKTmRmJQb6PLNQPBKN6YXkyobR7qXTMsm+s/q98kj
	 xHQ3N/BoKTn8OWxwNCmOCm3f3fjtu9M/uPNrOegxeCz/kD1a5sUDlDy2JeMD2t6NDHNeT
	 vWT3aAE8+4x1oaaIYaDaALUjl8ETCNnIJPiJcl8te+6VP9p06+TNLDbo9DdrHliIybQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793545548;
	bh=0N/gwWFx4ZyHy+AUqbqWZC6zZUYfe0XNZAZw1otjZYk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fb3ZhRqlT5lATgMk3VwVzGeTnI0oLijkz+4iu+6cuVZ05x0nQf4UKywXnR1VZ5DAg
	 9W6j7wzb5ztSGAPnyj9UtU7eM+yyKc6TbDgDFeaPqPwsT+6luIh+6vdzaMxewmrHI/
	 SgFe+vAkdJeF99PPOvkKoKqBIZcN42z9d8qfvHZD9HLoke0lSnZ96F35oXvBkC9l/v
	 67fL7cnrfMjbk5unxuvrfYfhiG5rYmT74SObf4OLlMrSuXGC3JaRiUcDRibIdswk1C
	 ktIrElzZyVc3yuQyBWmVSMzOLXDvQhu/TToNUHHhFvrqur14gdOBNc+tzCRT84Ppuu
	 HWWQekKlRkr2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E4860619;
	Sun,  1 Nov 2026 15:05:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B8F4380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D67D60619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Cb-SrFzSplk for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:05:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1665460612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793545546;
 b=jthrCYDDfhVCponTWgsDcqQjLuVccfnWfG/DipZs7B09PXJLu9/7QZ5aqC7t9hcUc84W
 n1S47fJvK6hqeHgijxrtvXimv4kaRxQ1MwRy8x5NEq30f8zDMR/THt/N716K4fH0bMha3
 4pij5T1Oyseis3AJPEBBr3EpJ+a7uCgievOh24xiqOmCi3Rmhb0H7OUscEn6a9/RdS6nU
 x25CHC4ChRs/Imlz2SKqiVWKHRixeLVyQsI2M7UgoSk30c3YkNcwE6npqgvTOs+Zqv46H
 rl5yfdYW8n/ORutM1s09cp+Hm3SWj+CCwXUwsRb1zvurHMRb72RlGYx7Vq/ycsMyKWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793545546;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7G2XFnj8Q6x/qhL8wRQ0Q6WGQowWCviNCPd/SDDV8mo=;
 b=OhDXiRZ197vROWk/p3Z4W+u6P3kdkrF6tQtYKyuuy5krXBOzo1r9Don/vnu/D1qRGawE
 jhZFBz+lupNnRIY1U5yqLUp30M/M27t+wUgwvBO3r5U06vNmCtEb6Udsn2KSZsX1DyLSd
 it92vvrVkObCUdKRs/to8V1GICm4k2Mu+K3bU9hCHxWXdMSx+7LsI0TPgmVFltJF7ZUQz
 CdQJImZxvcg6mJP5rBXIus7URGfEW5Xs07BPTwhO7g3yIJLjBMOzzhzvK8K9K5CAKSrNB
 ZdqjdGN/J+vWR4X4nBGsJovxKPIjSeDEUcikrbDxXaGljla3n/IyN/jeKK+ISuz1v/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tJFJxdbA; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1665460612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CDA5460132;
 Sun,  1 Nov 2026 16:05:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:05:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:05:41 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20261031180838.2738700-1-james.hilliard1@gmail.com>
References: <20261031180838.2738700-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <46372a8eed2b627fa0d685d58ad8501e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydantic-core: security
 bump to version 2.50.2
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

On 31/10/2026 19:08, James Hilliard wrote:
> Fix validation bypasses affecting extra data keys in JSON models and
> aliased fields in TypedDict and dataclasses allowing extra data:
> 
> - 
> https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25
> - 
> https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
