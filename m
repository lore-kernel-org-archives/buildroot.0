Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6011EC98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF8B80EAD;
	Tue, 22 Sep 2026 16:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3L-0E61UazH; Tue, 22 Sep 2026 16:50:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 63E1380E85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790095831;
	b=FWq0FH1tceWeWZ3bU/GByBkF03r1W6QV98q3TGKd7zj6VLAxn1EmJExAP5XuT8LhcA1J
	 p2U1vVOF86YmyKgbeldJX998Wilu/7XsIGeq+CYpxhDLPqMn1yYZjRjO7C6eNadAyJ2uN
	 saDE+GyvWt7jG1E7MsvJTyJV3lHw1u+4C7atTH4kU13MSxIT9AveRdUvDZzVIULAYvc02
	 7dio+/pYXpvYoF6pTOoKgIwBX0nq4IW0V8zXBIUQt7nAKeh+pxZKn367hLdx0N9uvQJ8f
	 S7PUztObKbCsanfME0dnDvuZ7z2KxNebUzYlSZ9MP+ONvutCE/ux+M2q1BgFJ8U/OTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790095831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=087y6sJEyiRXU43KJLfewHuCuB21i7ksuic1iyDzEt0=;
	b=Lu2+Hvlbr8Bcolw2UYkjlEXf5kc/Qqnr82h3pVWJ2sGR2BmGwRqvz/9SefPq9qpFCp5T
	 BdeMLdCiKvMtARrrM960kUmfW/teHwkLi1UF7/DDBQVNZAIuBy3YoqTukmrSPApllPKUU
	 EOgr2hitbGA/wZs7uBX7ZIYl4wMk5O3G/G74o8W6jKmrh6qmKqMks0yO5u4pOlYeW8Luj
	 iWIFD1sXvF7OozXnFU5QazIn1c0y5k38PGEqfl9AmwdZA9ummtlpZF9PpmFueS8O2gl11
	 x60h9/IlFPWvWzJgAJZouhw9r7GB9c6GBVyrs3Rdyz/R2X/Yhe5AGIlp7MzEsie/CFw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790095831;
	bh=087y6sJEyiRXU43KJLfewHuCuB21i7ksuic1iyDzEt0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rGP+J/hLJac2a/nnhbUal82DDoGkGbMmaGeFpajZ7mkcv//3FKpRHlkyTpPnhFM5j
	 X4P1d/nVzf3MQR4FdB6ldrLu9CaHHXruSLSw7rKpOD4KKdInX5HW3sPyq26743L6RU
	 TicnXrbFRug81pCdjsxJxufTnbCzKRzN07Bxsa/aYaiTbt3nXU3PJPUmpY/JAKCXNb
	 TPsfM576clNmVZB8xKekePUtewPncrJnPy7PXwk92NYoxwVu0KXzLTv+ZLKb8aFb+L
	 8t2aadTmEfMyEk2zyuUmfn+tGeuYsMPfO9Zd4A3iuu5GmAMh22M96nBh/RKKiF191s
	 hy4pwBmBYBilA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E1380E85;
	Tue, 22 Sep 2026 16:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EC75352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10D10606C1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bi1vchHOgBR3 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:50:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AED6E6067F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790095827;
 b=lFVb/9hDyiXZ97YYbDMHl03Qm7XieNwhO/9PYXkhjHlfdcQd7w24MsZoif76yuKJkMhJ
 rrgdmhRLq82LDbSm1oyG5OoDkvzlNlvjDRJozUrPYnk3KX1oOHC/B1ynx+gi7+9IowvAR
 EKJRPqglmq46nr120twtgbq2SiodNBOIyI4nlYhSq0x1OjC/9F5KHz0Uq2oF9Sd1VZuJT
 vTxL3VD9dAnUc0QFP3OCHYAYvAKMqXsWnKkxGHwVlqJGSoE/0UvKC6wQSqpTo2oYctIVr
 2by0fhIeBQmgGyWIX3qtv0TGnO/t/EDJuMvLX67rmcQgoB4M052JE5gBdHb5kZZOrOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790095827;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=F9MCgnuV92gf/DdmW37GpaI3RjvTYq1/UnOCT3I1vTk=;
 b=gAbNnp8/0pSWkyVy0hKAyx+Z8vxfFVwgG0x+ZklA8kU4dCxTeaJzRDsC6C47oUKVFtqf
 1HwrQK9eDSi7TNyxbftr2+NUxPgonEOArEjVWVSkLI+CkD1me2j/1lhWIDcokmy1FW6I+
 lE++MEViweFDINCI9HBbaBUu2GJA/M/FMoPkiIlfFnTKf2m50hLiRqOypIwJdBW9r/mCA
 lJW9Zs1ogSqffjEJFeSl5DNKI0F13iLiNVQYtuw3KH4A/KHi3QAsSzKxaY9LA60yqat6g
 CdEsHFFIE5IQrfCeL4sOCYO32gh8cc+m3KUBPlWrpaSgO2lF4atL2+4CoomBaOk3NpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QA1Z3K6S; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AED6E6067F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:50:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 68C3619F73B;
 Tue, 22 Sep 2026 18:50:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 18:50:24 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 18:50:24 +0200
To: Stephan Hoffmann <sho@relinux.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260921165437.1572124-1-sho@relinux.de>
References: <20260921165437.1572124-1-sho@relinux.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <36c4f51a2983dae8b36824e7df3dc6d4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libhttpserver: bump to version 2.0.0
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

On 21/09/2026 18:54, Stephan Hoffmann wrote:
> Version 2.0.0 requires C++20 and GCC 11 or newer.
> 
> This major release changes the API exposed to applications. However,
> the 0.x release series is end-of-life, so staying on version 0.19.0 is
> not a viable option.
> 
> The build system detects GnuTLS through its headers and links to it
> directly. Make this detection deterministic by following the
> libmicrohttpd SSL option and adding the corresponding dependency.
> 
> https://github.com/etr/libhttpserver/releases/tag/2.0.0
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
