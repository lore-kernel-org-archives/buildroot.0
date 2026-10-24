Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB6606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RJ0A5Ds5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E0260A59;
	Sat, 24 Oct 2026 10:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwGLMXv6r1ZV; Sat, 24 Oct 2026 10:35:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3F28D6073E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838144;
	b=b2EUOsN3+ua4rFl+Wl8EgwQb4uDXhl1WYXBY83sx38ad2BwuhlixNehEd6uQK9jRckpj
	 srJnzFtR5Xy32CU47haHDVDMAwshvItW6VLTEGbqDoXSdHGuxA6I7CzCbCVSfAv3dVHS5
	 tebKra/q0yeinrg4DOc02vUaKXFs28NgJsDQ+t2JoodTdjczb1pl5c9BlGPKgqG/NsFAf
	 OP4rliN0Fw0WoabxAEeSta2owFYWFFzyOnsLLrvSSbiJyEQR5TowV61VehlVQC0mvrd70
	 Eimbdk22vAtCiHi3O05fsIRLkdfjqkEdqI/+xS8mBZ4rK0h4oCXvngmA6THmcb0H8dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=PVhA1oQv4YlsCS+IoMWHvOIpHCQPRw1k4aLHWJHFDNxHDwwlztAeUvL+UPRHSgBX5Fc/
	 W8qXJ3lx7NEDASWH48gk3J4BKhk+z5TsH4ukDT7kEYafZCU9QztffvFJ7o8KMre87NJZu
	 z7WhlTbfqAAxLKwxeC098DQORNhYFYUuQdAlk1iNfrTmQ/G5F6QDYIigtVVBLDpyXbvyv
	 vGvLdnzpmGa+xh31irh4XKFZUFIQa4zDGxw/dmFRLKZCx0t+MDhlGSabg4iJ6ZgH1CNio
	 kCuqfJsWz9eZVOEIYKTDGqahhbUuEJWBSL6XB2W7EfLQgb53Uzkwj8CC7kGJjl3A5MQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838144;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RJ0A5Ds5eoYwlY+5d3z/rADmGnycK2hsS0AypiUDPmF4Tya6e4cdhAE/2NrMAunn/
	 KNGzlZyTbVDJ4C692sac+IKMtVF4BE971c3twbf6vpW0Z/CEOBr1X/+SGw5h3F67hb
	 5e3cJhp5OyORpBvdq20DIxVwEI3g5dBxEWoXzEs58G36FTwNcoTaLNTbqQQyN/GYJl
	 oocMtTKwo+Eu8kh79ibv4t//9M9FdUSS8xBJJ9BqlGdXztmn6WpuNWRFtw2M8s3CCf
	 udzRrWDL5sllAHn4yDgpLnmdH7y8mWx18YEWXOcf6kWoZX1t5DGMjMNNSQnpIV1Ubf
	 85e0Ut7Q7IkSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F28D6073E;
	Sat, 24 Oct 2026 10:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 464EC4D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C789816D3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw13A1niTE69 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 90813816A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838142;
 b=bPsQaz0YagtnwTxPJSXXRcqPvimh7q06ok6WvFf/QWidLL1aLM0oQ8+zFXZ76Ak+rBfa
 NhL5NSIuLt+ESXYFAD1CHuez474uzpvgWgZb7V6Rg3Jvwqt0tsBOjqZY3Yyj2E/5vH5ne
 r47a0cHwpmkaYT+HlQ+QTCXb3mLWg47JMlH0Rnaia2KM8Nh16kgb+LqJ3+gTkJdIeavBJ
 GNRJibiak+7rtgDHsLBqPr4PgRLoHZ2jPdXSj53yvPmPhcx8WQe0G5AxH9AVcRWLQa50C
 WVGNvyQSIGDBUjupyBOI5Jfn7m0nW47bIFVcayJak1Fsjo3acp/l5g4v06eJjqqE3xQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838142;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=eNGmg07pxj2AmSj3lqi1793Sj3hXHmu0JBSBj9Mq4TQpNxxRTZI3nPvrRrFzmryhW6kE
 UGJz120kO5seQ5OhN9jaBNMGdZbRVzhW05ahjr06OimnWa3xUD8YbmHcsP8M76iV8ZGjL
 Qmw1YxGthjO1XCz6PnhPEyrQMtD+/B8NOjigUvYXP8HS2etQ82nAp59hHL506GUYDoW+4
 hgG6cUdUp4Q4yiOgauz3/mEdqMzrltONpL86yU4DIh1w9R1M/xdQGz8oO8RLQ4c+18UPy
 Blg4as0Lnn5h/IJMLgATbFXvVav3rjbrxPveBgZBVvz7/r16ZcsMqmLSQqw8RkJ6WDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="utigZNk/"; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90813816A2
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3234E19F5A7;
 Sat, 24 Oct 2026 12:35:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:35:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:35:39 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-19-james.hilliard1@gmail.com>
References: <20261023181818.920329-19-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <176e67753557411aa180d90a0778a47c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pyroute2: bump to version
 0.9.7
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
