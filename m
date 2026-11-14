Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5398B606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pqgw3iQ3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D17814BD;
	Sat, 14 Nov 2026 12:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIEfZXD_wLks; Sat, 14 Nov 2026 12:14:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4429D814A0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794658446;
	b=bjj8OmFqFQ/EuuyyygXShepKHYKGdTSYVejoSirFHtTNpOg4V5Cxnjs8an56mfIwvQBM
	 HEPFCLcIKfHH43UB1pBp7IEm+Q33nZfjDSr80tyiHLMiuBirea9618oUoiaoDng9E0Jec
	 7LIohBj01Z8MrDaZ5AgdZZXYM48fqrNi29m2AZo1LpfkHO2WReECWgQElWax/r7dv+ziN
	 Ygw4a9luHtoNpvsrrrjx1UG943Ja/pqBwO+3vRsCRcCxa7lVhRnfOOzQN9y5KsxtBu4X6
	 /XjJdzGX3kMK1I3LBgtabnAt9thsLQBjLPEMD/WBmmwPymqTfHWeA4sdZGMXx8XNIyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794658446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XtWsBfE+tX+4QWeTNjMXmXyED0ijHdU0Pp6JFP33/y4=;
	b=K1SnSdqoWHYUSZdnNqElI559M3pi0nxAUwmSCUvTKWqGGQAoyd+9iZ7b6Atu0DGClYtK
	 TM7NyOyHn1gANEujYoRDz9l+W8eK6Qmo+5aMYqVVowVaYuLsLnLVYLR0TtydPi3LxpJVC
	 ih8HtAvU7RUfyKc/Y4y/nYMdEn2PLSMG4dPtyqfF50aEUZ4PQi5yGqDsIODKnkegnGEpq
	 YpsI4B3E5eJl/2u5w/YoHw7l+WbqJTjfeiM+QrjMME/vZyMkcYXW8wfHnIq+7XUTV8+za
	 EkKbLFKAu12Gaog+yyfCpBoRahAmIfwQxrWG/PNzAtsXbOP0F4dbfgJMjBoDV/Hwk3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794658446;
	bh=XtWsBfE+tX+4QWeTNjMXmXyED0ijHdU0Pp6JFP33/y4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pqgw3iQ3zR7lFShh97ykmxGEwwkQLZPGE32j30Z+F1pj1GJ8+WqFVuIUVY1QMmlkH
	 vKC0tozxFQcyYp/T9+gOoWozYcRI52SUZto4ChbEUyhRWFSqwHjCIgoyskfWAdVLti
	 xbWqPINQuMMf6ufmKJeIdJQVRC3JrI8iWC+zJz9ZD4kx5Tg0j5K+qJSCvBDKYmPS7R
	 0Ri5avE/CPdM+EF5FP5itGfr4EPEXqsxIDRTfDr4S+ZlBQ9jpyFHwHYlTXRh09SsrW
	 KYRlNO0WDXgBlUUB0u/ozJ0/Kp/0+YiafYGCV5OIHciy054N+0ij/dWwcquX1NmkOe
	 J3wrw4OK6i3Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4429D814A0;
	Sat, 14 Nov 2026 12:14:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26CAED7
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 12:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F2EB6066A
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 12:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2K4sLFiX02f for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 12:14:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD3636065A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD3636065A
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 12:14:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0EC5A13F879;
 Sat, 14 Nov 2026 13:13:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 14 Nov 2026 13:13:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Nov 2026 13:13:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261113225401.2300017-1-bernd@kuhls.net>
References: <20261113225401.2300017-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <3a4bd2cf4b8bb16fd5371eb1916fe7d2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-77-g438677ef4
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 23:54, Bernd Kuhls wrote:
> Fixes CVE-2026-84243:
> https://gitlab.com/gnutools/glibc/-/commit/438677ef498552b28c2060060c9e3947373f1e2c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
