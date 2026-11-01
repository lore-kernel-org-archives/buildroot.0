Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R0EjCURp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FB0605E0;
	Sun,  1 Nov 2026 17:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMSVNmsJ1edK; Sun,  1 Nov 2026 17:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 070CA605F1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553050;
	b=cktU0k5iu71f3dvzzFbY5laG19Lu2JDH8W3ssAtPEHrrccCg0C8+sF0JyecS1vz0DBfk
	 IupXdA2n7t8wXSBlbxa2N8dtE1bal0T8C4QVA5UCTarxNL2yBYgy40HzLrAm3LDtmruZC
	 tlu1eEL2Ar9eFjC6ni8DAZqRy9BDWFtCQJ58gfpl8v1j+f7u3KLNYD5JUU/GpH5rsLQKA
	 o0ADUouzXgnHL3u6AhiYV05DwoN/HkRW6BHX2OlN7DHOq6kDxbRjCjZ+bAmuHW+IrIB3b
	 bpoMwhKfcCZyBKsv7PTcfFj4iNiwN+58IiDrd3t2XqWoy5sXyKlhNpaZiVhiVy9vNMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=UL7zQhyR5UnFAIzBD4cNCCO07WGkDgfgXW61LG0C+MHKwlHykzAorNyhRkja25/uuaqZ
	 ySRokzQ0ggVDUd1WWlpochI2PS9BdYPlMZsAv2yBqniw+Q51AEbYP9PRfdBlRewtmmvuV
	 af6zZoBCpWX6QZcY0MEGs7pjAOyCFdncFp+Sw5f6ypx/QxH4RxoClnkZeBCWeF845HDRA
	 jB5xpVP84Rp1o9rTfye7vXDiZqfw5/2wJmJEQ9sY7PzRnrYFqSKwCLApntB6ROp/qp8DY
	 0m56nTqxX2+oOslXc4w2GQAs/0bJblP4lTjYQKMgBV0jRSxxhPmRnsO6enCfPauyfZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553050;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R0EjCURpuQi4luCGbe0B8hgGbLOF5B73LyHzB8xZLXTpDTlu2lwmYQJ8Y//L83eg0
	 JjpeN9aZL68/8y+GBlLOzwnN9vLROfRtua+BkmSQTzYtAnfG8y/RhGKehIrzbHOpRb
	 fMVCvMTKUlJONImyAGqCTposYXLnY2B28TRc39TSY+kjF6ZcEcD6ujEM+5zT5/HEDS
	 WkakfiYSdpvB/QZR2IppLargXZpF+vkPWaWthfs8DRAr4S8CQFZTlywRNiC4/TC47G
	 m/FXKk5xGLK9YjOdPQlcng7aOk0XwcOCcjgb3uoHh+MxdKnF6r11jI5Vou53tst0In
	 tFp6GNDasbLAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 070CA605F1;
	Sun,  1 Nov 2026 17:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A172AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09D3D40076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id At5XdXHuKtL3 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:10:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 708464004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553048;
 b=A/GURHmvEtW1WYFXCpAMAvTSwCo1jrmgDFr5dJdLsLYkRyGp2b1CzowSuOAPoeVff8ha
 rXLzUazrRHVMH2zy57e1fNioSkrx+em13SQZqDb4ZdDdXFAM5E2p/NujA8PtEhpjZQAos
 QxMbvLif3zlR/J4A8kngFNIAJu+ZH81u0XtavZsL1gfYGjnuSR+J4zQXxAhziiBUexTV0
 04xI5022IJGmQnfKMRmt71pPgCsIwD4axLf/2zr8xq9oQPSVBzWbBZgtIXQ66U8p3d53P
 LQYcT/MHIa8NrhBHjsF1A/1Jhyer2Mim10wS7G/XMwptUw9oOatP/lP+i54KsrNVS+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553048;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=OnTxw1hdt8pySFsPJWrLhus57ihgYb+WBTXuJJbRokFiOIyzDjK3Q+Z4BoJYhwsffDHf
 7Ef9BOLbZrANnwqnZEKSTJlLb4R8ruY2BwgzWcAakKGoKiNvFJjEdqxf+YpSxPq55myvr
 4LJc4lhyqC8wmxXWFPqRVlOPxG4P+cqvoniQ+S4cXiXI3qjKO2qgujy52abABJ71jbop6
 njsDi8jZIA+9tYeGEi5fPITRl6A9K729/xbv9NjhdE+ahlZ+xA4ZYL9YZ6Z64vB8AGAFA
 W0LElp9TPqVcAB/WrFQOUH0VceMAHgIZ4nbsKUCrvhqrTd+H+QT8RNUR6D+t7/F/tmA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KaFuRVqN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 708464004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2F66819F59C;
 Sun,  1 Nov 2026 18:10:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:10:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:10:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-13-james.hilliard1@gmail.com>
References: <20261031172019.2683287-13-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <81b106875c1f53eb04daaa07801fd45f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-multidict: bump to version
 7.2.1
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
