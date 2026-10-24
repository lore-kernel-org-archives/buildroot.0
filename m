Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85403606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WiVYCjXA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F1B8183D;
	Sat, 24 Oct 2026 14:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nHm0PJvvA7C; Sat, 24 Oct 2026 14:28:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B5A4817D3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792852084;
	b=b2numJdtxteSz8rTjKVF6a0pNkjzoeqnx918OvPWcUwiKqFHW5x8H8xVa4Ow1LijAVbW
	 xuq6Z8Onaw4NmtllszxhgnPcVmSSihiBklZKcgqK9+jJJU1dz9onFIUfjEjKBRky6PJMT
	 97EuU324GaE1qk8PxDQdQ166p1i+nhWxAb26yXB46Yo98glMHO0rmNkKrAtiUxE0MJfwl
	 DRdPFAJH7a+goGlKJQCAV8dlZ9gRtAhxjEjXxrmgutqJI+dwvvdEw2ZiS1x3U5m48N1K3
	 MYaQg+vig66PGuWUZi5SMS46Gbw8paINwzo4aSURP6eW0ACTu22mwgVUufVKNzHKmRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792852084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=XRE5qDUuKOB4Mu+VSGrDbFCY9MoQyDnVNO4imrlKyPuP/RFbG/cSSN6NSAtmC0734Lds
	 K5gyGsBhnX5iM6uDbKqNSOQHmDZUqlNXihmOXiPG0CMZIDrHWbmkMwzm5wxwY3+XMtnW2
	 x42pTUj9eR4X8bXWal2ErdwgNM4TUZSLySpX1UFsfg+CQYidZkXBOgxSwRPM3UifEVTvu
	 /Oe83e+IAXnaDDs6Tlewx7x1XDAOeIudYTAj1p/S/zXUS2zEo260ASHVxw5auHujEbaYJ
	 5mbrR4HwHS1mDcpbh0GFOK0LZ1DHJ5d4HEZfyo0wNmuJR42N5M0M9PsXNYoD1znNrKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792852084;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WiVYCjXAzDm4pN6y/AB0vc0Dw7AM5ZtQiHv0VzFhHEo4EsAjxm5qfc8FZVymv/8J2
	 OW4ExvJ6dX6ZrOo3airGUQje4DlkHef++jkwdFAymG8SFMtLHji964ehMxedl/youM
	 KQfETbNyUVn5bJUo9ctYz3y6p7r6RxfbSB8cvbqQmhXohBNdlQkQP6XIC4azZmTcFM
	 Z5/PHciwVVejk5ydM9VMHVhjgoLIdyhtKwmgG//BGZ73yAo2lQpgJ1xEe9+Ns473+s
	 NrxmiR5D4XQ99vij0/88Ov0Q1z3gbnVc2Ie50rEdEsoobA1fIOOYaLZJwmrWkc/wN9
	 xCH45K6+MzD7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5A4817D3;
	Sat, 24 Oct 2026 14:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D85D380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83ACA817D3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dO8XBAi6TqX for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:27:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F5D081771
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792852078;
 b=OtghlpgEsth8brQsFRV7noEEqOg3eCs9tOZxtz4SD9gNc9/EQgluXRXYAxAN22lZVtIr
 b6/pqEkLpYSYORShErUOS9ygsuk/+oS3HmiouY62ivquSVEuQm6LU3BOwTzr84QnkoJfs
 enfbrtHkwFngaprYGGUaL/3/XpD1+duXRqfM8h1ZhSxwX46swaPPk0XZupiTdcuBuBxxn
 1+egDabiKawLWvZQA8IwbMsJyi7fXn0kgZUT2qT2/PKhCOkQGxwvYzfsi6yrcJZUujQbQ
 G9Sptncz8MjJ9fY3tXvKjVM7fsNcD++2/x5lKXxYngZMm9CUpNvkW5DjOlOEUY07GVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792852078;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=qF3yPFw1xvzjV0G5dFBMNZFfo0JAZp9a568nSNpYWWlwd4f2Ls4YtS7an4wLViAggeds
 Vr5ePgUzVqaCIrtPFhdRmORkRcZR91wmQMcQB0GboTKSikb2IxYQPwvoctHKQNeEhU0yZ
 UvFDQ7rwcC+MEZwUUQNZkajnbDH9oe8AZNmK4WmrBvSAyXHfCJqrNnR6570l0sm0jiXu8
 ScF4ptZi8vHpE8bwRXCr4oipDGFiuFXnscH7QR95+ZLOepiNvERMz+EdxGtyZ4iZRKAdw
 mu1GHFiEU9r43bBtLGx0U1w976fgxx5/Zc1fRI554pC0bvoYgtk9FMFhwDec0Tv8tqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pf72HQpk; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F5D081771
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:27:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EEE2E19F57B;
 Sat, 24 Oct 2026 16:27:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 16:27:52 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 16:27:52 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261023181818.920329-4-james.hilliard1@gmail.com>
References: <20261023181818.920329-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <5dbd19a918b8d0fb242ec5567a1df34c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-boto3: bump to version
 1.43.118
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
