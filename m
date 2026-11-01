Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B3F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QTVydOo2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D3A80CEE;
	Sun,  1 Nov 2026 17:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6IhlX8t7gnJ; Sun,  1 Nov 2026 17:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3D4F580CF1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552958;
	b=EaS34UYQxYgJ0GAxy9CZThdXO1GyXXwc5tZ8Vb6zeA4ecWRe7RfX3bHO5j1yRQIPu172
	 jFmDefziB3P/hzxgiJpXjBSBIQ0cWpW8dYxd0weA+ubjWf65HABa3Hl9qiVTFQcE4o4mw
	 SfRUp4Jq3d+Fo4gH0p+Sg3mfzYFI1gYVLZp9sV5fPP/pm9WMmAc883vPIVe5dWIrMy5DT
	 yrzxGJ0EZXkPqceCQ0c9NDgEIf0mxd34YnC45XBU3ZHKtT99nKeD8VJrvvOlK6BN8XfvJ
	 90Y0Dlnj8ZnJ79TD4BQhvggTvFbdsDEZZOChWkFRH7HpKJ8VcvkLqPacT5AIPUjm8wQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=N5ZO5tufbWO08neqWS/jq7wErZ0NRLvyfqvZA5f6MhoVlA8th3GSMY9wynHSg0UJ+c7b
	 u1s9m/0ViS2sTYUrtnATVc7Y2uwPeQkWSwdTsn9mgNlm9qYe1UQD54G2cRHoEyyDjGSF+
	 w3Sa+4EAUMf4syyNf21vcxA1oduSiOow5oV//T6pULOpMHSoa9vTGgTvdqooZclIlj5XC
	 w7U9mR4zOJK3Bzly7mLYVO4k7l4C9Cg+zlUwNNUPq/ARsXYedVsx+BA/w7rXes+BsRwpI
	 qR/O9AOjvunSKJGq/ntLh+Qu87Jc1rNXv76hWR5k6FURB/G+9974Ij/EXcFZDDGSvmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552958;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QTVydOo2DHOmoS61cowFJl0TWbwd1bPta2luNlz7SGYCw9EdOrtWesUypZGp0sB4B
	 1dsP2Tk0Ika/YjHvab9MZIpXREHaI6d6LzSpxpwnou1Qq3rAqKPgjCWdeLxkiA5P7Z
	 uUCdnNM1pLDDaNGJmZfL0ObXz6ATZHiafvxdMuAafP01j4gzMjw8QrRYPiE0PLlUiM
	 jUMrz4kcEh3+W53XFw7jw1H1Z2D4rhIAMmXvH4n3qhEYRV9dhfXgBz0oYxP3xMNzX7
	 j2L9ckw+GuW9FN5e22dzJiq5FOWbvXGD55cmgY4NZIaLnAVFJV6w+M/DwuPe1O6i5B
	 RqA2kDReWn+VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D4F580CF1;
	Sun,  1 Nov 2026 17:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6AA6323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B830D80CF1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6TOAYNR5PkC for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17C3180CEE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552956;
 b=SOYbaJp2ppwf57ICQax1I0k/rRmy84JmJ3H5Q+/Lctmhy2SV9rot9mxZNHGyS69NU8LM
 bOMCt8DXK6xsCdws8aqZSw09NDC0GprjX+82a3x8elSgdb0r+qzEGKxLDADVk3g8UxcfO
 Dm/w/H9J3Z4oEZByHl/UxRBJS8aWvvnFAaakUFibVk5VvE3z50sZZ5eb9l5OdkzYXZVvm
 FzQgQ8lqVLdrDk4S8t7hEdFZW3PriUy0/zmcurTqGsWCjh1BYXWVrcUw+dPyse+g4PG6G
 /gx4bgRzIhY145sKy+oZuVjWoQwMwVeuEslMhTkpKyhC4kfr6BZylTEnIqoDKdVOZGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552956;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=Ttth1mDVqENV/bEmYXroplvpM1TkMKi4mFgxC5FbAUO1tfe5y5hkWMOsaRLXxClAq7KY
 4DK6/4quNPuI0EIf7noMI+VDP9KFb1GcFEKO3dKlgn03tk/dNjXOx1UsN4nqlanRfTiME
 5BJH4Zgebj0Rgdo49LksFZqJk3Zp/bgHU56zfAYK9vA2/UIOqUdKjss2jVSmn9JUWfMPc
 58pme+gyhaxpYs/qPFMhjEQf2sfBRoYxN9okXYfQ2icF+RYmgkG+A1GRfyzzixo7FdAfg
 Zd4a3plqXmVLVCRNAVZCVozSJpyS+1O9gtX1cvNrDY1Y22k4lm9ETDSe9mPKJbHa5mg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RUL1JhWQ; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17C3180CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1CBA519F738;
 Sun,  1 Nov 2026 18:09:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:09:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:09:12 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-7-james.hilliard1@gmail.com>
References: <20261031172019.2683287-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <2bec145f6db01d79657b99c42c547515@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-hatchling: bump to version
 1.33.0
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
