Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E24606A323
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AteY1ffJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD20811A2;
	Sat, 24 Oct 2026 10:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvS_4tSGP1KC; Sat, 24 Oct 2026 10:35:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDC1681463
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838123;
	b=pX8CsABhXSS54IMbC57ayFg/W/rkxjTJ74oq0aqXgaB0Y7NHmQu5BOn/SEgUPUcs35Uq
	 a+e3FF3sRQUzcy7ZXfMrcbTPHt5gVKFSPX9zUDmxGMJkhf/wKEvNgV/ZuL7UAnwYjPTow
	 xBlF0w53NaPCS30Oii3pxfIFCnbK3MpR+Fu4NNSrTWUnCldVOMeJD1HKbr+a4unjD91iT
	 wNrupe3r7Q2qQ+J9mSE6BZnULbR+VPtJ4rAvTdlLyxb0sH1p2qL4aSEerseYWi8SJn7tD
	 vqf4puJMB7/oO0MYkyxVPLWIkuTTN5nNkfpEuK2FT3kajgEwf1L0hjEoWMS4/+zchNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=jPlhk/AW6eki3W6nUd+vhBylIoDHzBYN80MaDH4Z4bMRIhVUAVlSb9sTCuxQUEyxWkqe
	 rBNcTbrJBhvPmfo9wFl+Eqdsxmtblk3rJUu8YmGqExXZrHvIxllk3ENupSTLeTImj0uwO
	 xqZHAb6sQRlr4L4J5mVveIhN6BatB/YKIjt4rc8vB/Iy9P+dKiVfNrta8MD2FsJwUVh58
	 MrWZpCmfOwZFvPnf87joTbTaEovVZ38lI50CVlWxT6IUJ9ayfjyHczrnBZlRtgOjGttYR
	 s7aFltiFAff3YIXQEY/sIOrX0Rphbug25HwOQlOhDVpCmhTbsDxj8xzO8O8JE+qdkBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838123;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AteY1ffJ/jnfUknyqFhZN2+ziiko2qPDz2UbW/XQD1G8RGgORP2DiWXOhFNG/2490
	 RWpy4k4zS/dng8+v6Jvhdpx/otecfA3fWgEGNzXgBqnqQ8kZ6r0ehbYvWcXVhhOjtW
	 wGmwmPDueELAwDEqjS/l7tyT+W5MlQSLGQRyeTzzLH3BAtwAOjuP1HXy94eQnD/87w
	 YghX4xREmnJ9YvU0RUtMt5i9AP1FhXEdXSUUVUNKfLkdEOYE0mZ91kXEcwv6IqSXIL
	 b8H23TkNPeo7pqUOSj9HdIS+fCWTv1NLM80y0qBPrfyKTNshRAvRI55m4j78W1jVzp
	 rnkyQmTVUV9QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC1681463;
	Sat, 24 Oct 2026 10:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76144380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67E6E40A80
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzijyFLeHTdL for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B34A4409C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838122;
 b=e/m5EmoNyra1k+T5Y/epdhufCB0nc9yW6A/HNidImYyLnfHs+sBOi4ktbquFwRil/C+k
 ekCuB0LLAaixXk/j58CwAaQjVR+qmWwjO1qHa+6rg6VN3wkZ8mQeofzY69vHA4TPNPbsx
 1DQxT+csuqzb36RqtAuoR5StTXnXx7zJC7DeZVjLsCUotAr/iWCYUaEdlfKmsHPBhmGpA
 10/OsilrFeFus+gT+2CJdvPo8F3ExLt6v1DtK467bRNwxQX6GiHlbI3xDEsSZy6pxvkPl
 /WSNzgZ998md+5W1D1jO8AtxQMGuCSanVyOZ+qcq+Br7AthwOSLjM9XuVryYC8wI+iQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838122;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=BaQ75hXNf14mblEthZcccNF+kMg2NSqhIT1Ad4Lwt2rcxD582V3B0j8gA6i43OXfOhsc
 y/FA7hkZur44VDjdUpWu9MFH08qVxKQRYLK0WG+ji3MY0KH7LEYnjLtWntntLJraYFVEa
 IXj4d/xxomr+jztkZPT8BajSIwqcuHjQ7+EVE4E1bL6uv7ZjIF/R0XxpJD1NiKV2A7d8L
 G8Y09rqe7KMqIKl1JCXvgmJO9kPI6phFw3d73g4HHOMHDOjwqh651w3xYUcLZoRUdW8dh
 K7ICE5wGaEYn7hPV3cOWIjL2uRuwqfNhcPBMTnMMLN2CoxnSduq4Lt8nACrrRAqI+UQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n9q6CkAy; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B34A4409C8
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5EE8D13F8A2;
 Sat, 24 Oct 2026 12:35:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:35:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:35:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261023181818.920329-18-james.hilliard1@gmail.com>
References: <20261023181818.920329-18-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a3457388c0b1974b399b0b4939b5a2a6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pylru: bump to version 1.3.2
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
