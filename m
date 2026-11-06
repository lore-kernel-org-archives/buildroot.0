Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF36606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Jmd8H2lr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495AC60D7E;
	Fri,  6 Nov 2026 21:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMCQV2oCRXg2; Fri,  6 Nov 2026 21:19:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 74B3C60D8A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999978;
	b=NgQk6zXOhxjsWz6m5mmpqZrssL0p3k9wSr8QsrT2iK+MUZ7f2U6tiKtZeAC7pkyhyOyh
	 4LBoeGNHKFMeZl8hx9CTzTCJFAnp5Bq51Wl0K24SEcJ0CIKzFT4WqVXpL5djWNwHsFLRM
	 8peaeqST3L0xqQAffWR2i7uKtOaTKAPp4e1Wrs8eSS2LoNdUJN/bZDTMyab5ZR0uOyJLK
	 qe7mqKRP395BbFhT8dDgx6N3Rzv8bpkN1wDonrRjrlDbtbuw4PRZxcatJZ3opJdPD3/RP
	 hJyBjki3YbIo3b2hDrZkiZuEt9zZSzs5PHww6emOsmb5oueUOaiKeB5ZujoED5oqCZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999978;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=nXHtNNcdJaV+tk0cYFpgZIcveC/4IzR5wPF/qpATkZFr+IS8hY5U8uvuXQNpVulyHzht
	 OztcZkjsipFbyUcQg8nVgxGv64DcyDVPw7xiCS0b71Xvkepzi0jWz8Mv+903E8qBXv1BB
	 DiS0XpgYblAtNqfCQhgb4uoNMwO+Xu5+bRJbny/HkSZS9FvEdFAH9L9sYtpzgV3EnsgFO
	 27VlUFbKSX+f2bqT8qWdrywEZQQV6TzIFmjog8eCV9ZoFRhs8U4fPNbDubBEAsJR13wT5
	 zRN8fT987cAkpvikk3uFRKYJw8Rc08/9yS0KB4qxx3hcief9It/MEHheJ6kVqhjQ0Sg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999978;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jmd8H2lrjmHQ9+FTK4aTn2APhDP3M8IRQYYkh+CA/5ehDydso5yfmFDQgtQpdT+R4
	 xGzXu22pqaj8l73weiBpttVEeOFtDSHIaAKu4VY00lrzjzBDEi6V7oDhn5mkTszqJv
	 4iN/emOc+G7/X1a/U3qeevGGU6myePKynPIS6kvMrkXnk+ySWbrUxwJ4XD3iG6wAR8
	 D4LbPopOQ+qzhILLCa3NUFnnKs7aWd44uUFAuJQIYbbqA/hsKR64HOikoe12vF0nCO
	 c0P9rVvHdII6Cx9pMIsDvYj+skRsRk5tfarrAFRZYN8J0YXFnA7bQ8VOuI/K5Dl9GQ
	 tH4wI9KjQO6nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B3C60D8A;
	Fri,  6 Nov 2026 21:19:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CEB9235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 134F14094D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bW0T5sL_VoZ2 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54F7540907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54F7540907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 239E25FFA3;
 Fri,  6 Nov 2026 22:19:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:19:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:19:33 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-17-james.hilliard1@gmail.com>
References: <20261106191536.2120153-17-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <55dc1d103fa6f502f6718f4d0830d60c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-mypy-extensions: bump to
 version 1.2.0
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
