Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A1A606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H8CMWQYR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB506088D;
	Thu,  5 Nov 2026 19:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Hwj9l8KE21x; Thu,  5 Nov 2026 19:21:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A97A60885
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793906461;
	b=c+BBUuvB4MMk4PZHEVQAnBlbl6ErDUanUd5eSnLnHnxHqBRE10fmCDUJmEXfR+Y2XB+P
	 Yl8/yCkKhyue2xwjjJ65iukBI7YxKjpblJr6It2PiSfVtwaDwVyueMlB6ToHYW1zIQRXX
	 d0y1XuqnZel4pb/cJmMLVUhVKP/UdgYjihWlekoQQ0DaY6PS6SvdSHJLvR9J/GTjO6XmU
	 hz3s/EE+JY2HK4Ox1rP4j5OTPOeWIBJ22d7zS/WSsI7CUlKce2bGpwStSl5wsoZ1Nr7/Y
	 R0ZkpGWWCl6+2ewYaPFe0v/vSH3Q7+1CoYnLkHyE8ucDetG7xzRE61wsrBZVHf8TILQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=829w/L1/bMdtYT9X/f7An+noFGHg7krksHEVsh2z8t4=;
	b=BGWALlhIYR+eEMini6H41btJS0SuwZLlmHoEXKQJWxjuRhJJW/cBXTZjiPOjAsKk+oqh
	 i0qba62rLMCLTd6HB+7f/0u7Bwjd88ePFC9XG8mSytpvpyW1H4ia1/TlrEJgydzTswgB/
	 4h9yl/ELftCfLGqPlQmkkEHNnFo4mDGl1zgRKBbIRqzELl8pi3IB2hPKQt61JuE900eSr
	 Y7waKoQbYoGF4qyeLTe1YKTmrYrqeTHaypnPOUByh+ti1feCvvmC1oMPvrHfbTSLTE3Z3
	 Xzn9QUaIA7GaVb6ehXjJLUCP3NNJj8/jcF21HdFOr0lz5f9WWTawpvvjpLx9J8c2dZg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793906461;
	bh=829w/L1/bMdtYT9X/f7An+noFGHg7krksHEVsh2z8t4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H8CMWQYRpU4kYtuEbHLdGpv8WmDMB8K26bpLG0dxY0p4CAOqxSWJC708w96PsQahi
	 VlTw1tNWzYnUDAWj/KE5pGrikeFxXTi5yYkIQefhp3ztN9SCC8FzxXVrCSJRjPQTg7
	 qSv6cKVsxCoquSDrqBAlD/6DVGB8I04njKiGPm4vP97kUxb/ZnyNaE2hvyn/lkrw6a
	 00sil38nXOOrss6ugx/DI9GQASo3EeGlcJiJuEPVhtPRzbcak42BuYatS1IzL02eDY
	 Ro5zC5H1OQME/iead/+38YmjbK3mZt/OCVug6p8TiM9whWLBpsTRpDFKzTvFcXK+YE
	 rV9BUo8ijrrQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A97A60885;
	Thu,  5 Nov 2026 19:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44604B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E938111D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcpOJZbz32G8 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D9C768119B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9C768119B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:20:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 745B92003E3;
 Thu,  5 Nov 2026 20:20:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 20:20:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 20:20:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20261104222832.3296481-1-bernd@kuhls.net>
References: <20261104222832.3296481-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <d14ceb794788a9efcade387c36b12b50@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 23.1.5
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

On 04/11/2026 23:28, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-23-1-5-released/92716
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
