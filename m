Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE63606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hCeBRYWK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7BB160746;
	Sat, 24 Oct 2026 10:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXRRhS3muGDB; Sat, 24 Oct 2026 10:34:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D7E276064B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838069;
	b=gERi7RLGmHjoP58PevmR6JA9Nr4Ivlui1D/FVyJr2U+qoyW6leUPcRmLrSpMeb0NIeNf
	 KLCQwf38qJ5N565+4tdRpQ/o9UcLN5THYxJ2llyEiB2Bab5jrthpUNp5uwWd3IXL6HY89
	 7XknouswxUX+hg8rhk4T2iZpj8Ez3bArf16rDD/oDFT7Mo4K/JJ0SjhhU2dezfdW8WgF5
	 CIazb0RgfKUNLFAPAa4cDBnRUJ6Elmnh1gmVuMtTlASzAHSYda+wxUyh9BTg2A87iJnAI
	 shNJ+KRZAlFFtNM4Q2qPpHM1sCVe6iGFzV598tZM84aY2c7sqshljMASHND7uGT0NZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=sdQx7iEQG6adiybk3hraHHVvU2mhxpacv7hTE89ZUM6LdgYArxTcGdQRXOgtHo0xm8Jf
	 962EWPeu7YdMPjFo/ttVQbu7WJQWBUOdQ2xZwy9Ugt8Pf56V6ByQD7ThA8zzTcV3Y9+in
	 HflMsOjyci3xQw9X7hhqtBbkzqz2K9FNyi3j6CTl0ilZDhdm3z6gY6jiht0K/CENDvSYl
	 2PDS31SjAc4Gxq+tqt1My9l2uYbAIArxtX3qqHFKa5Szfk4DIQ53plMXcc0I67s/fT8BK
	 wOY4QG3q2JL+LFGnMqabu5qeaRhZTx30hPgzDmuMWlv1eXZdxQX7KevnBzjgXVtqPkg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838068;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hCeBRYWKZx7CIvqh3JBFzUT/HwvzGFZeluiDorLNhpbJIIm3qO7kZHgPsJEQg+Vd6
	 kGfQVm1cwPP4n/1l5bEMy3ltdEgyuS2ab/f37Cd8uqLsaWjim9pNVJIYeaBqacCFKr
	 GAveCWbwDLoGHZ5xv8hbkCVPRnf7Xbgw1dmvA5zwBSozgRqCXCpNklzLSngvSbG8fu
	 3HqGFyges94n+XK1bRTIPoZRx/cRGdoW1R4/Tq9fKTtCzapXPwDgtnEKB9td8HMZg0
	 44k3g9K4mzwVfki4m4UwHB0l+TgYuRnF3Q89HrFIOxiidgLh+17JB+BKN91km438JY
	 o2HhIhbJ8HNvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E276064B;
	Sat, 24 Oct 2026 10:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47268356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D1184009E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vj33ylTrKqFz for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6194D40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838067;
 b=nJAGw16Ez+hwyCqR4SOzDaCih3vRjWrsmJ/WDc7jKeY5VZLW1Id0vA7fEd/7QxDL0e94
 qNyLxxmBcix3K6QLueIVqZoWkakEynNO1z/Ad3uoqvD5kgSEYYBcSZmTjj6gIM4hKYqef
 tgARwJeosme0Z4za/6hVUAs57CXJyV+Pl2kAoAmRICj6Kisl/DNoONdvgN9Y7qnMuM8Jq
 XPEnhQSGY19DCkpPIl8oGYtwdiqZD/YSR6XuQps/xVvMOYbbydvFLqDvgAXyhXIfRx1UX
 TcGU1m391NpFuCsn/IDTuDgINEEmLr7wJ1YPdI3uEh6dfavHYVlPvmEcT4oHK+DNbCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838067;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=W9yycWwh/LKYMLUw5HLGtqBz2CoV495J4AjitSfYFlRqp4YOtLL+UeX+cfjFhZgdMBzr
 YYRGTcriifLbAK0o+h4MuADP1hDZExBiskdHWeJN/7jzfsCEZnBoLIHRD3pkqHtPaA5m9
 r2+SwCKOeMXCfeC3bVv0QiuXDIXSqQxehedC7tPUtRUi2nGcwk8kdYxm3l1iid1KXHWTq
 hch1cidorYqmckdRAznl2Y2SWgk+jdr0f8j7U3VgNzY0f4aD3Y6A/d0MsOpp47GLYbhy/
 OUTJRzPrilo94cKPkkPSaTg75z/ndwY3lo3SA48xGVPk9ugQGqwTkf7ZokcKrSL0Y7Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h91NyVul; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6194D40068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E64AA5FFC0;
 Sat, 24 Oct 2026 12:34:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:34:22 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:34:22 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>
In-Reply-To: <20261023181818.920329-14-james.hilliard1@gmail.com>
References: <20261023181818.920329-14-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <43d109e1ba50816d68605477350e114d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-marshmallow-sqlalchemy: bump
 to version 1.6.0
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
