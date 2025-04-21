Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE498C369C2
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 11:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B8B80DBF;
	Mon, 21 Apr 2025 11:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTvxJaes-P3Z; Mon, 21 Apr 2025 11:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAC8F80DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC8F80DE9;
	Mon, 21 Apr 2025 11:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F0061A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 256C140AA4
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id od2dgNSeT0eH for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 11:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75A0240191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A0240191
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75A0240191
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:31:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E17062003C3;
 Mon, 21 Apr 2025 13:31:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 13:31:40 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 13:31:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Julien Corjon
 <corjon.j@ecagroup.com>
In-Reply-To: <20250420191136.2119524-1-gael.portay+rtone@gmail.com>
References: <20250420191136.2119524-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f322ce9f2814a34a15afd06712062dfc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745235106;
 bh=ahWUps3kEUXCKsPCX+sU1MkxXtDVnftYU1NMV5GrnC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ChR255RJfROgR3JMazKRGt7OBPb3hw7jXUZ1rS/uwr+ZCd+aDQo4maBnyFCJidF0B
 uQnWDde9Z0Bjqubr3EYzi9u7leMhDOGQrBANGUMbNfZHLhRDbC5aMwpbRetu79mTRs
 3QT+DJL812nNvwy5bKwH8MC8sN1C4qdQkNQMo41H4w8udUEawdDdY+mdatTODQaX5M
 ZtUbhjbxb4Ku2lKfjL7QxZMcDm7ThIU8vYqYLldECbzpElKhERzRLcs5vmgKtmo6hO
 d5ZT2/CapfrNO2wqyVuRGYb42QPyNRX1AJyDqR0xfKfcQAexiJjQLMbptyMpmuzqlo
 iATbQYtU+cTAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ChR255RJ
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine: drop unused file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAvMDQvMjAyNSAyMToxMSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoaXMgZHJvcHMgdGhl
IGZpbGUgY2hyb21pdW0tbGF0ZXN0LmluYyB0aGF0IHdhcyByZW1vdmVkIHNpbmNlIGNvbW1pdAo+
IDY3NWNiYWY5YWEgKHBhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZTogYnVtcCB0byB2ZXJzaW9uIDUu
MTUuOCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9u
ZUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
