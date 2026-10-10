Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91BCCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8CA60727;
	Sat, 10 Oct 2026 12:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6YGjDyD_etP; Sat, 10 Oct 2026 12:31:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B9A40607B2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635498;
	b=It+dJkpPoPqucte+LfaEPSuNR014zbDxT3IfGl/azH7dwE1/Fee9qHOFAWzUa7LnrUlE
	 a9/76HbXnr37Kis4CK2nPAaDNe/HQkmjpv0paUbl70V8szKuJJpP0y7XplBYzBpXdOUWM
	 I8duAN6Xs8WIyKLvoES/PzJQkGPpDfi+OeGQkqzIpc/V+x3ZcnbD/bMJIHPis0sI1Ku3F
	 mFarRYCameMq/frMiwiIpqHYQojZFDEvy3hWKcgbyWp4dHT7QZcrEnuR3mI4eXftOk4kT
	 CJsiD5VHelA6JhZnpXl8aH+WdDe0rRJltu/UlOJJMqqIcEts7Ca8v0c9eZTEk8BqwGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=PvMmEnXKcs+ew6KLoor2q3e/Sj38V62bZmIuyHTw7v0=;
	b=CBDzMmmFanV0I7TqaHEpFfnWVC/oNlksWTOQU32Bs1cxK/Ntk+ZlYlvvn4qMbF8RLmbf
	 lor5raOx5dQmu2twawuWv+dpL30tvEYEKA8dXr9Aj1m3GBOk1wEmrtH+Ha513jmRnnBJP
	 o/nQKM+LoYgI5I2394OQgPGGCEAgwZumKQfcSvwNUKvTjidnw7rq46o44SN8EOHBQkuFZ
	 gmB/tlUtC/TgUdzjjv7Vdra1yZ+4cfNP7erFCiI5pososRWXpEy38vFtT9q9phN/e6Ly4
	 XRDrOJjamvjt/jz6xbGunt5QOuJVeSN0lcqsM5JZ3NZcCk7mJAzu5iEyuFZ2bVWXXBw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635498;
	bh=PvMmEnXKcs+ew6KLoor2q3e/Sj38V62bZmIuyHTw7v0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q71eiBx+bAvoOf6MtpxPgUdzCGJHGNTPTK8+Z91MD2i/A+5dZyrfqu2QRF7zPSKDr
	 RABQ/owfn51tkWexloOQn6lHL+e8+YjvAQAs1pdZMArqxt+ZAEaWVBAywhzAIQ+6Lf
	 FbV0AoS8+pdwebD+gesYOuYejnFiLbA0LaJsdj/uKBFiwixZ+tyzGX7GeNqj5EsSDf
	 JmlWsYU8P5QA/myFlp7vGE3i1YsNwODcPIuEkjZsWzPga2S0M2AK0lx5Q2NtHvTj4J
	 srd61+p5tMzHpE2j23CUOJjkbH0/xMaOcVeDPl8NPCTRZebA4LuOtG5i49vLOvXgrP
	 9I1J3nZP9sTzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A40607B2;
	Sat, 10 Oct 2026 12:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB139317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD4DD4010A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XO4YRfHRP7IF for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:31:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CE08040004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635497;
 b=mT7uzMA+ogDPMueI63miZ9JRTwLWXg0qpVoGwXkzpl5DMyGznjsEkg8WZziSimeI3myO
 YnQptZauzN+oBIsNEFni5Aoo4434ptR+M4koZYnBR9ms3PuPC3CfgjT517zebrqT4L2xq
 ZsShHGYEuf/euZw2rPEX69pjlc0aSZmsgQxdfnEFfGBa7awiUY0jWj2DnEcNqoUWXm+yy
 RiytAG1yI5q3lkskobH7ZD2X+t0dgAey5yt1Fu0AXa4SPNTX0R8lo6jS9iinw9OX0TTx2
 ChZHdSeloGE5OMKY3j/ioU/0jTBxqqJFHIfmGO/r3QM5GvNO90EnVew6vaaXa/iKw0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635497;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=X2i7Wt8yE6GTuXTUxycGoziFy+DNYQXbWo3Lb4WM8Z0=;
 b=c5xd3+oO2Q/mQ/aPxPHDy08ERv6B1rMlAEnpgD6zj1zB2YlB3cc+SgF3WELDvUIio8MZ
 PSKX5/E2R5mnG9E3mUzdyXrCSS7q0kDOeDY1nSCrzZ2yro6xBkOg5PNI6sW3L/Yk9BVl5
 rscujbbxCGkuTuDLZuqfL3NroF4K8O3iIkkD2xAHJdEx81b8B0ZZFOOJbhyNXS5npQSln
 DIudxm0TUxJWMASIeEg/HEW6esgjZlq9r2hqNo+AJvnSIdi43DMb6Iz938tGCuYkvlZT1
 pxw0KMglnvTHbhGIrUfW7dBHDEeE5Fmjpqd1ZkNChUROrdIYI+1j/keFvUGMkSHPmdw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kbZpJ2bf; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE08040004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:31:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 819A16012D;
 Sat, 10 Oct 2026 14:31:33 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:31:33 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:31:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-5-james.hilliard1@gmail.com>
References: <20261003224447.744966-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <46a7da1641d3103ad9fb4006f9137797@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.40.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/10/2026 00:44, James Hilliard wrote:
> Add the python-opentelemetry-api runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
