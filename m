Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DD606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CJa0ia0I
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B37B6407CA;
	Sat, 21 Nov 2026 16:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYKQ8Ya75JOL; Sat, 21 Nov 2026 16:07:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7AE2D407CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795277233;
	b=Ji2BP+gwvuWdDQYzKddOtbXapz6NriuESGzxJ/ZCiSavZosTPjw9H9iMuURPp9g81+Gu
	 +F5UrTzN3a7Z9OZm5T1CnFkA6AUXAdxAO05UJ4+uujQNtosOQWnnkpMQ2lChXLphNGG9d
	 Wxo/hxBtfBB1zV82IOYIVUiB6GZLHjeuTCWy45q4M8x+U0AdFkXD2oJW7us1sGiWLofry
	 PtkJEvIkfwZJ7ZuosIC7g+fNlmzLGW5jCms8llYNA8zIa/3zQ/LigMJFsY14N3gkRdYe+
	 t9mVCNNCKQBj2/t1aISohCKXWYtOkTj+8ua8E60GuNXX9Yj3QrrI5VYFfe8eWVJZxsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795277233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=DmYnUiOAHBEzHgNMoAohrZtLk2SpGOe+GOiPX0Lyr+Q=;
	b=dbYIzkuKrWwTaZS17QmnyiiNXnIOzL262J0jQXbjXB3Ge7Dq95kvsK26x8G0Ilr1TQof
	 W3VGMAc/u+F3i8O7zho7YAGE5HT8KYpvywoemEseawRNJ64UkNuI5dhn89FgsIrjjDJgx
	 MDOPafkl/hupmBjFOpKgYjdQr+KyyCuPIQAxCZQwGzswj3SB0/7839KBIzE/A6SDGKttx
	 C5jmZmyok6Epn8VGyR74pJvvgEjoEJ/sUoUkRi9QS4rcWApsweUIgTZrOwwZ2WDKUe9Tb
	 RllktazIMTIWkpf2QeyV6ATBj6wmB/0lBvHt0b/jRMfG5eNAry3RubDyEeno33CbinA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795277233;
	bh=DmYnUiOAHBEzHgNMoAohrZtLk2SpGOe+GOiPX0Lyr+Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CJa0ia0IIfqNMouYCskRR+fxL1UzRmhin4b21J3Wq+iv20+CkjIj1vJGb56lToVOO
	 wt3KCQzeE+ZnFgTmFzCrutliPDwTGT9WJjfWfb3+4T7VSe0LZ7gEky7BahZpn2oLJF
	 aPDRuaTuD4eoSCv8i9ojYJYJ7oObC24qIjPBshF+Ef+CDPr4YHzyOxRz+aMEe8zKPO
	 hCLcr4VSYfvGVvu8Wd4bF1GkkpQ2ZvxJ8qQbUcsKpDUPWdvk3KivvZku/msPzlUX1T
	 3Rhv2R9UO9Jw3875T7/Rge5Oxy2IJbbgkQRaCH9KR57ZEzRYDRgtrSh0pgqGptdsNK
	 z0sjK8bmABTHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE2D407CD;
	Sat, 21 Nov 2026 16:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E186E3A8
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C75EB80E18
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vU-z0_MVq5Ug for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 16:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 94BEF80DFA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94BEF80DFA
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:07:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 68EC8B0055A;
 Sat, 21 Nov 2026 17:07:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 21 Nov 2026 17:07:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 17:07:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261104220820.3290296-1-bernd@kuhls.net>
References: <20261104220820.3290296-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <131dc76663541d6f7dcfaefd0b2ebe46@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python3: bump version to
 3.15.2
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

On 04/11/2026 23:08, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3150/
> https://www.python.org/downloads/release/python-3151/
> https://www.python.org/downloads/release/python-3152/
> 
> Rebased patches using --zero-commit option.
> 
> Added new configure option --enable-static-libpython-for-interpreter
> https://docs.python.org/3/using/configure.html#cmdoption-enable-static-libpython-for-interpreter
> as proposed by Vincent:
> https://lists.buildroot.org/pipermail/buildroot/2026-October/815406.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
