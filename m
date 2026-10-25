Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E8606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LwFwDBIv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00D4060F0E;
	Sun, 25 Oct 2026 11:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urDCbIAfsDAi; Sun, 25 Oct 2026 11:59:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1BF4560F07
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929586;
	b=ofIgaNXtPqDrJB0BZbgocONA2TJ309uW9rBYT/WiWkFAh/8eSHSYcxjx8H+aefblw6r4
	 GCAo+DVLWIfWzVS/bGnI+1UA2fYj+j2MIrvkkeYBzRiwIkiT+y8shilb2DRz6wS5N/Pne
	 FpcRdmIy3AxBI4rR6zSC7Baox8njoZ/gJ9EJMkiGXh/TgG2knkURvmbMqArl42WY5rQPP
	 PQ4ftUxkHwS0xZfMPkb1A6Y6KzhNn/8zWqQKRdpfJb9YHFiH1lPV7iCbd4rnO+/cMCZRR
	 Dv8SQoBhD6uZgUcyhPihXs2BlkfFSbL5ouwFWGlXNsgiIbKxAHup7M1hKO5yHknkQnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929586;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=aNpI5mpD7mIJS9fzvv2/wjodLDXhmhNyDmH4mlJYyw/UDg2roBzFdyRDZSnrM+zsOVeb
	 Va51KG+F68bep73R6KjAXaQRXRSrkU3kX/qoAWeFbNsX3i9jQaSyQWZEH8uwWKbeM80ox
	 yd+4axJ5dkWXsdKs5hqk/sYiLsSJW616Nc8nanXWVDe0igD38Mr2FMPUQkozm1UZZkidw
	 W1zbwgAn1gZwuVxXUQH4g2WPedOBSgkY+Ho6xWH68r+Ud9SZJYzs9pQqsBZ05gR/T/wFE
	 bPdv8Wl9SnybZtlJ9L64QzlK5mnNJMi/mqICP3VNJuhAGHlG+XlwZNUWExElvFD2fLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929586;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LwFwDBIvGZDpyTu7HKu5XKwGUV2K9UQa8vMyPs7I6oVxSNavmTHAo10Bw2JTYw93+
	 hKeMI05UjBXVEKqvAdNdUtpTBTW+j3YN8fV7gTSKUrafk9DYaYJa8k8/uSicbbtfbN
	 s2Hc6xKkT9WtOT/BQpedFkY+6dPNDVekz+GIPplLOhPh53sIme93Aa9FUAmA71+zzM
	 O6Xlo82tPXhG6eoxqfE0DIMTGZViw/yfBTUBufMYngmFUklGE2YsDmMJY4yhFrn1Pb
	 glOps17azS5qr2CPVFEa+hpNJ+dYNGqP2yY46bwme593b4pH6pcsZQde9tWKO85fzI
	 vVEjrr1j8fv3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF4560F07;
	Sun, 25 Oct 2026 11:59:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 406DF43
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26C95401F1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpZSmqLgcTe5 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:59:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 624CF4009C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929583;
 b=JSL3rk/tzF3EBcNboswac59W795IPzuGiU7Gi9IsSMihiuvE5HaoEOr76A41x8Pc5FP2
 q5KZlYMtipmJZgcgvuZZmC/krsiid8E5jez42kEaVgdcDEsKrmnEgj2O7PGYvLNYIPW8I
 Qct6wFg5ymd5WC2zUvvswl7dcR2mzYZucbB5uOiSAtISl/YBWeRxdyXw+ZtUG708QL4pQ
 tRh8k2tsfX53LGyFQD+Evz8MLa9JCyi5pkQRoDXlSD1lCeWKBBA4eIUKriiGPlR9HjBQN
 VCebuFlHgHWdPuSk2afujLt5w47qy01e9dAT6bVQ3mIsdH59vSTP2Ffr3NWTrMJWgCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929583;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=bnLkYALyarnwRQZgMJ4txImdREkc9+v/mOVbfC50rH1zT92+bKliXzrBlQUTgcfD8j32
 pfygYpn+wNcJhpeIJp7exAZWf0HzDPNUoYDe8ccPvaD0z6tNfbZAXQOzWtdqFlDuDvK1D
 OKK6mzdB7D7Pj+LKrZMeCcqkWk1gKctO20G3a6HCATL7MMPWVUt9cccQZ+cC7ia6tPeIR
 hs9KBb1Y8VMGaftz8GEE3UV5E6ZpEiI3vVjACUL0ahcJBZ4+MG6dfZYzrc4jMuF8jogAT
 E2KfvWqs5Q6bW0GfMqWaWO9/vUfxK0muWLBw9TPqd4G2wf6sx7snU2qawoUiXQoCfEA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=f6j0R03E; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 624CF4009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B3277780375;
 Sun, 25 Oct 2026 12:59:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:59:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:59:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-12-james.hilliard1@gmail.com>
References: <20261023181818.920329-12-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <75a6d7e152e28e44eeaf56125274540c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-grpcio: bump to version
 1.84.1
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
