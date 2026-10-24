Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBAF606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LHj/h3EK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9844860611;
	Sat, 24 Oct 2026 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5UN_kJibyxq; Sat, 24 Oct 2026 21:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB2E060615
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876217;
	b=I+TBetoR2vEXU8gd3Vlb84LaoMbPGp55AsYFpV0oh/iKw+8vdumnyh/QdxbYSJakDyoj
	 g9t2Uzlq1wfH7nF6B+yFCa7cYA6TtUQF8wD8E/h84uwFCJV9PqGoQHvL8yJv6DESpFoL5
	 Xi4Obv2vNFJotgd6dWwq1Jqo8EI4kP1j/feRi2Zui3XFgLtofWIka3oC8TnqsLCda85NS
	 2iAkHrK/WljJmc0X2B4dPIk59BfCqsvbu7MJLJtZWoTA9+TivJ1HrK9NZsWiSPounGcKJ
	 xWZZq71p6FlmXWfH3CWguePvQFhgYsNb3MmjEHNatNpodzCJ57oR2AMBFhLDDKxbDOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JFm5OTMjVRX8J3t2MmNxiyjglMHmk8lUbScAX0g4fFQ=;
	b=l52v9RmRzMnVaQgX4JTkG2REyfDFkaYWE9PyEqBUF/GDK0D6E1D1EdOZzaz0D6SU48xG
	 Bnxvi9pOg7BwUJbHH+n3cttd/GUQlbV/3Rhxj66K7CiJQhO3D/tJnd5lE6Ccyd6O2r7P6
	 BK0Ot0swui1by6gwa8lPdujvGUBuOj0LB+XzsXG5Cy5GqBuMkmKZpylybAvOTBoSxOsZr
	 NByNXOfWWMGORFYXxazd5FAt6RonV13uEdPvfZPDLYUQgd0Pc5yf3EVeTDD8EZaAbQCVl
	 VK+nze7duuNNcIFe1NnsaT2ZfYUVipB6Rab1duseNDdrT7qd09K0F2tdgFIJ2KPcAAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876217;
	bh=JFm5OTMjVRX8J3t2MmNxiyjglMHmk8lUbScAX0g4fFQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LHj/h3EK03kHcRhvbqE6RXMktLRbJWwj8iHrMj0BSJ6hr4/Qid1usbVRpat1OOXIP
	 82gzYN1q898m15obUKQEt/bnSOTfu6f9yHWXta52Tk9Op9CAXNOloA+1xzU96nFBQ7
	 sHOft5xmpAKVidIUeaeUCmVwABfO4D1iJ7EZIUNKoA4RNvz75PjLoIHEvCGCtyiwol
	 QVebKtnU9oV0ekohV4DFuUeZdgvfYlJ4QE21ubNzrCElb65boG35i9JJJKBnmX/jZB
	 aqOcKdAR2ZFeRKmQJ39Xt1GP5mjbcC5pmaJYPKBc0DvsEdngbFETAenFzQTpRceLwm
	 Ug1vrVwQKxEOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB2E060615;
	Sat, 24 Oct 2026 21:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E0462F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FB5A60615
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0z7KI_cFABNd for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:10:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18ED960611
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876215;
 b=jNuMSmJIFHudLia4pF5IYNzpG5gBPY5c4qoc8vFzvzHwAUUxz3ROg0+fBMLVTkQ/Oma1
 o6rwldwdWwPiNSe1f8i+f/N0Hl3zjv/h1LGG8I6it6HNu7gaHBKbqFNDeVswmY7UdsFBm
 IisS16muQS/dOKvQseSPhbZA+Q++X0fEtD6I7KWEjAYAqIz0b/HQc+UaFoS8nWD36AM+O
 oScvhPQCcNipATD73MVY0Ld1VdjbW583zU0JHuryOKAifnW9ED0ylwZhFR7QQE2jnnShn
 xxdn55JQvyedfp4sq+yNqJgJAHpkQ7s9/XzYU/SLPfxFIiqu8zKz/OhqpjmcMUykptg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876215;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6+mRKuuceMtrFPhYHm0TK1Nvtd1nTLvniRbII5OT2xY=;
 b=aGyi1IHpFCwTK3gEXCToYsSG1AAlqHCLqFgdZRse0y6T8UYM2+I9MM3dh3FV9k9RDrlP
 R+B55spWkv9FikwFTarFf42o6+fnX8jimHBdn9HM8hqN1t5ITKtGbaMvc+8eEkTUgwnMg
 PS/jlb8q9KRRAtLsBBEfRPfaRnUYw/lGMUTFU3muY29Ah9EkvMku+l427UkFDg05mOdqI
 fxkbCr1FoYn7A7gnTvv8h+il/G0wDBy+p+ItaupiI3bl3b8KkHIkSk68WMZ2UuaqORuXy
 f5vDE1wecmzJ3932J1hlhSk4yePZLZRarAN1ItCGhSbQGlo0xAxP/La+P6hP7dFpQ9Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pV7fhhNE; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18ED960611
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:10:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9F5E41A131A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D2FE60769;
 Sat, 24 Oct 2026 21:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD97E10328DD2; 
 Sat, 24 Oct 2026 23:10:10 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:10:09 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: a.mestdagh3@gmail.com, aaron.mestdagh@barco.com, buildroot@buildroot.org
Message-ID: <at0en-vX3QeYjLvk@windsurf>
References: <CACXRmJgcK7muMCy4CDejE8ZiZ3z==C5j9oP0doqcLQK=J53xDw@mail.gmail.com>
 <20261024190338.329172-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024190338.329172-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/fluent-bit: bump fluent-bit to
 5.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 09:03:38PM +0200, Thomas Devoogdt wrote:
> From: Aaron Mestdagh <aaron.mestdagh@barco.com>
> 
> Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion
> and improved OpenTelemetry processing.
> 
> The 5.x releases also add Google Cloud Storage output, Windows Event
> Tracing input, NVIDIA GPU metrics, and new metrics processors, alongside
> FIPS, TLS, and proxy improvements.
> 
> Signed-off-by: Aaron Mestdagh <aaron.mestdagh@barco.com>
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

I've updated the Upstream: tag to point to the commit merged upstream,
and applied. Thanks a lot!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
