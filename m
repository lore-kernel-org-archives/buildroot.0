Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE94606A333
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q05sMCLp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABE5810DA;
	Sat,  7 Nov 2026 10:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dms6u5vU2uOz; Sat,  7 Nov 2026 10:31:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07D2D811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047507;
	b=IHV5qK7yrnI3xQC9e25tAopKwVYIqqacU8WKkgNj4fYBagDkUBfQeSKdX2Hvwy88+tFI
	 2gZcZ1UWxynIhqWGppKIbVw4MiBGCeNxubM7oC1A19hUPRDhP7tgnZgqffCXgkVSBA/Da
	 th3wDwZ4GwqaNKeJ2H6jXOZB1CSlrmAqF8I1HCBZofPX00/HCKfvJEnhyBS50asCwQlns
	 4SXkLS4iajFSGKH7O6WASAO1nEpZVtmEYAsNgR8Xi1+ELFBEosuMdd0HseuZfmiEfVcsW
	 YSnZOKBtcNu4z8jVAC7MnM9JxMh9XnH0U/zU3caOhuxNS/EIOnNl2w3YLhuk8GYv/DQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=H0GOtVf3MvtH+3JWdnO4B2DmOEjGzjUfrPPW4JblLMA=;
	b=XIUWsj6r4VRLUD/7Mk+iESCoy+b7nmKbwfU/cFgDIPlYoUCONAWh1mFthFJVFlh+L11/
	 vg4MrT1chfQ1y9obvSlsd8AM6yc3ote8rjzcwtH7EODGpzUvHHFvKhhHWkoa2eK2OL6FX
	 g2xc5HYPHtuN06qSbUBGP9t96nJvJJpLfrC+BRESvSxJWTCYwTS6Q8tHGBzfaQKsumOAU
	 OoVT3vOBBT4PMRf9NI44jXa2ZjnFKZ38flFJKvmWDkWZsyKMSxmbN9N7nyccfO7691bVb
	 HU4So0qhMRG3Bpe/+mQlcwFQ5iPqcdEouN1/b0p34FMIP5rP2KADAn65fb4TQxXvqKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047507;
	bh=H0GOtVf3MvtH+3JWdnO4B2DmOEjGzjUfrPPW4JblLMA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q05sMCLpNRXR67LNBuLiDfvSIH3Xs9xRKCwALMX4BVmq49NNqcF23T1bAdO6WvYB9
	 5JvZ7NsCJMnlRa/0Kr+UykBPkJtEgr9rEzfyP/JboEnuok6RB2/xGJSRIv00St89/x
	 Ni1aJpBGBAjPNOOZFPqJ/tCZH7Gp8BxTvt+fWg8GQF8gwKPJWSnxce1/z0E00K87DE
	 c8zx1vOrvsp4XnPLwFQeFOwUrOgYs/cmRviuh3YtSClhZabzFrbD86tmp/fexaOmUd
	 AohWyCd4qlM23KxZvVuJoXPdDctAFEJB7iuHZ1pDdGxZCnF+5letWGYJaHPDw8KjJJ
	 17GlyYqpfjRYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07D2D811AA;
	Sat,  7 Nov 2026 10:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B3032A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D19F606C0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlOl7qB2TYpy for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:31:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76066606BA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76066606BA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E9BDE19F58A;
 Sat,  7 Nov 2026 11:31:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:31:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:31:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106214954.2687477-1-james.hilliard1@gmail.com>
References: <20261106214954.2687477-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <1dfbbb4f7f7cb9d97d24c8f41dbd6e9b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.16.0
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

On 06/11/2026 22:49, James Hilliard wrote:
> Add python-typing-extensions runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
