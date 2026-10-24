Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D8606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bjl9OwLA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53B481757;
	Sat, 24 Oct 2026 11:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiP1JEbJeAKM; Sat, 24 Oct 2026 11:57:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EA1CA8175E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792843038;
	b=Cz4zB9NjktSmEKUynQLudz7N0OasxQM50vEuBHkNqDh7+LRhQ9u0xeVhnGUxxk8zmPEJ
	 xIJMaIO4HtQ25rcD2y65JJaPELZzCtSDyumgBN7DijcOM4rsoRhKNB3bZVjXDf71qOayZ
	 XD133Ft+f25avJNoipnjelC/+td7YQzUFXNZVFYhTk4syQ3p9/HLyFYvVlFdgJw7D+UGx
	 hpRHCmrck1Et7HYz30Kjpk5oINjWl8/SGVYjRAAMqHv4Lv20gJfQIpzDO8Fp04RmofpeJ
	 PLmKi59VruO/we0puFZOsGumhQjEMVaQ5d3K4L7rnRGqJKnv6SDgKAiPDGXjdU6FX0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792843038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=MTdiruWFQ+q6QQsq/tUzPWeAKi5RIIU/SJrEsNt6XamTbHS2kxYufwLAKktwalg2hsXC
	 XsZPsj0h+aIT0sHQFFrBXIa0HvjJqbUx2wKxGXIp+WNLknsdUO++4nJFA2ChJvsNSFFGv
	 UhjWHti76NR6axR+4T/yAoTfEhZByiKgVnju15pMqUTz4Y3P42LDOnKlGCoz0PlAaG45j
	 BTXGK9Z3Yekc43PzIgWujw5LgykdoIYDzKFjl7S0LHFxdT4fiV8yIPSbJypHa1EZmaJWu
	 QKP88c4d+NI2+yP8lEDePKjZMZUSttmeDb5zeAV3Z7NNVrvzm6b2+LPlwoc+pEu73WA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792843038;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bjl9OwLAi4O9T3Ov6ionM/RlNfgBDkpwH1hpfkGjYn9NOhpueznv/mfkkM1J2ehq8
	 QRHcr9/S+N7ncafBQTcB8y3s8P5wlpnQlhAgfwBINpooS7xSFluF85gLUzL/96GIqO
	 YXHh6dO2yRzoK5Q2bpnTpDO8d0i+EdLABhwnq4PvrfQTB4Fw05Fubs1B1EPjtzVb9r
	 bxadGHNkseTjTCA/SvLXG9KJX+n6YBYI7+1JHTgIFqyVEWSQ/gh/ffOakK/XZ2wdQt
	 TugpzKtMsqHuf6HVjglUEs4jSqgTxt5iJZAWvXo5UKUvcZEqc0n/EjhvOhwUyNREFB
	 /+Gghg1WbUIKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA1CA8175E;
	Sat, 24 Oct 2026 11:57:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6A1E43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C85508175E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IesGmISc8ytN for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:57:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2264681757
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792843036;
 b=EdxL/haaGEl2OViyy/l86cOh4ebbhSKLvaD3Ifdk5OR/kej8vOmROOlXWB7szTAo+AYa
 g/pd8XZd8wcVnnRbyVL3e2GWowzzptdAjpKK2c7Cr15M58XLwUNlYfrO5m+7bN2TQXjTX
 vXLKJ+gEDF+/izAdoUQ1hmLEO7FZ0IdjhhQ+sBOJHnJqXrn9pV72l4jGZWFYKmSdbhevK
 g2Dhee5h2IenorSKU5qSRT10ccf3WIJHUq16Eu5iafHgMp1NoM6mx24OLDyLVaElDnntr
 pkj7efQ9ZhDYEmbBmehNYxgg0YXgcHZpPrJCKq/LtabFIUDFROvpRlbag9zuY86pZTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792843036;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=gwSkZkwDL5SNX6yoReSzHXoHZ/Ux3dkbvUiLChaaG6FX2FYimOjLHN320BjrNoLUWZxU
 28CPW/l5sM6gZeMQu6f9sp7LRQFL7jbfBGI0eKB4tiW2o351zIm6i/BZ3YPOm5LNImKf5
 IT+vVhOBFpo3H/BEtIpNByi/V67rwe1ClZKP1GTiSakTPnU2NwgvNr1ibo7h3b1TQFadT
 eTDCeZ3PrhRchHd658Rc8ZZkGBHX8DXRtMUtd6XOFOjPcwAHjSyi1gGEjUdJd5C8qOIIh
 d7ZHtNPgTqOLr8m22FdGyOHqvMyTxd0eW0YZ2rS6OFeh7nOuw7OVwpfVhzD3mc+4KLw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m8RAF416; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2264681757
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AF2FC2003C8;
 Sat, 24 Oct 2026 13:57:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:57:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:57:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261023181818.920329-31-james.hilliard1@gmail.com>
References: <20261023181818.920329-31-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <fea4cce660c08c8a452ed094ec63a2e2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-websockets: bump to version
 17.3
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
