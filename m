Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72173606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ecXyOlK/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A0E81687;
	Fri, 23 Oct 2026 20:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDGanuMBtQtn; Fri, 23 Oct 2026 20:26:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 849528167E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787200;
	b=mK4RsdYnIwhbdgSNw/9FS6Kdw5KCZ7RZ3m97A4wzYyJ3TIbCCoVlDR2dYjUZCitZfWM/
	 vKeizdIO6iLw6EnPVPvlxVK3IS6Qozu4T0QqSTVr3yYWRPBHNKFvd7Pzd3Be5lKqYgAjI
	 JelEMx4aFO0js2k9FuWZKBDnBesoGYxTUuq+g9JUhvIIOqQ92OvqTLM2HDIoeIZb0GewB
	 VcaTTE3QDxF7p/pwRUZKO0NiZwJOQy83dYhw6WwyN2FlOskfnFBZV8wpmvx4G7CRt4aO9
	 pfWsRbgjTJueDrEsFyKiF6Zb4Vu+Ctw26ZezH3yTtRYxChRW/Nr2ELKkN0riIPQYn2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=UOGNUBiMQANQQDQUfH5hU96n3ZB9zBbRIOAhnmEBEayhYUQSfuEKjy7RMpOWilrnX6JV
	 ISoN38tcIenlBqjTlxddCP7O8TWMxo3RuZahZmzvIb+hBYqBx634A8NWKdJRCmredNiqe
	 0sIbcMZ0RF0ow2qWjhOa5zgdVUp1DXcijiXy2slMueItIkuTsqZ6hltNbn79KqavHtrft
	 r7Msqs2LmbCdW6f93MEPvW6kP9mPr9M/OHuqva+WANbcTCvB2e05eXyzTE6+2gXY8WKjv
	 dUrJQnbCJL0/5CtV5rBAl6jvl4wSMAwVorObZyLQtI/cqObiUPPHe0VDKdThytGE27Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787200;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ecXyOlK/ShCKpraZN+w28haXVOMN8UcJZKsghrvYggV68evJrlOkD8pDCE77WElEy
	 vIoJkvFfhW5fD91MoyDXDmyrV2z1I+pgDQmX61Ragtah1KmuxXknacHe/h9JYeD2r8
	 KuKh2OEZjc5IKDw/adLcb9pO/OVByRyl/82Vmp8ACLMftg/MwwI/6gj/xMCcSIPYoy
	 o5kLfyS4FofF1YaZjhH6ivlpovMRkmOojseoIcWgh/nE/I74Y/G8+5venHZOfPmyQt
	 u8m30AtozfxzFpF20KaYLl+uzeieAdbkDRNJm+89BPHViMzId0KMLrgd9k3oi7+Kag
	 nrwndCPBt54hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 849528167E;
	Fri, 23 Oct 2026 20:26:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9064D3C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AAD60A59
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo0Qm_pxlslv for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:26:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1FCA60652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787199;
 b=g2VFaH3YJJWaL+4k0zAZ421mWguAy5k+4R6/0ZIGVWUl7VdbtJeNLvlw/4N+qdCdCL9O
 ZCz8RBn3YfOEFmSyNYikzATYUzeRe9rv6NcV/NDDAkDQfI9N8HF6k4+Ko9lh+Xf5JOh03
 QguFPA1B9kZ19Hm3e+U9Amie6Qex2pjjYCAgULN0/0fXTQNHpua9wXviFmKV+AuZtgTMF
 528KGU2yrFq7sSWbJwTvUO8WKfxFqYFQMJv5M0gaLxkwvZuu21cU4HHHHzBZHXc/bQ3w/
 U9wEBnUtJRQ1UUdGODns9nMcf5SPuy+TuQfzuHFNNxraWRCQ0SPxiO3sr6rTCuLUMUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787199;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=a0eIzLI8s+zY5Sflqd2SZ4YYKkXv7Bp/qEUm2IisU61T0Xme661EvPjD74SoM19Cqfce
 QsV273TivA+t/9BOFLgXQ0SMCu5jlqXh81y/BGJyIsPrPxFA061a70Gh23g5j2YX6bTV0
 pC5cZPDS5ko6SHmz3L9U8p17gkbNnBzuT1sWs8ydA9TdoxIFnNHFZx0cXnCk+ocisSXCw
 aldCR7H54P/PvVMgGYxe/GP7W9Ef8jQyqJEStbEdbXaKFbDCAZcuaabju/kqh8KPH195d
 E1RWJwAJPAbo2AptWj0bbBoTTvgIP5Z90qOez2wsRDPp0vQyAGU05OsKZ8Ta+CmeFCw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u4NCaQDT; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1FCA60652
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9445E13F846;
 Fri, 23 Oct 2026 22:26:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 22:26:35 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 22:26:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-6-james.hilliard1@gmail.com>
References: <20261023181818.920329-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <89739ec45b87f0ce0e5d0aec2d65a0b4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-bsdiff4: bump to version
 1.3.1
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
