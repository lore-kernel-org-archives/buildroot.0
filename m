Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB49C369C2
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 12:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FF780DD0;
	Mon, 21 Apr 2025 12:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qp8AUu-7p6YL; Mon, 21 Apr 2025 12:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5A080F63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5A080F63;
	Mon, 21 Apr 2025 12:02:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C45871C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA375405A2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP_XYDfzUTST for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 12:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDA23404D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA23404D2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDA23404D2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 14D3B19F57E;
 Mon, 21 Apr 2025 14:02:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 14:02:20 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 14:02:20 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz
 <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250420195754.2152991-1-gael.portay+rtone@gmail.com>
References: <20250420195754.2152991-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <9e6826be164f804185cb7bd764b3be3a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745236944;
 bh=3QFSlGT23lQlwAFa1h7tWVUKQEDmasGLXN6rGlBm25s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qc7D0staVGiE64hZrhZ41kJ5puS0aaY908wXhmFzyM1xaTEIyZ5Hac8YLK5QkZy1x
 NP6bL4VPWpmaSjtLdwzy/AFGgPVI3rgko6qgZ/DiZp434/g1wUc7wgbO0CVhjE8fqb
 jppMogcRkAcWNjR1SbHc4zsWpTOFHt9YCzkUmYlXMP4l9BfcK3NLkR1Iwoy9mITPsj
 Y/uULopT1zT2hxajMpG8aX7K/qZCcC/FgGEM6Ley7EVrzsIRSpqDRcMppfUmVuHRG5
 Ah1ceXbh1dhw6JSA8vq2AJNd2h8nnKlHBTLI33BMHDTIqafDfsFWeUqPdufmUoajLC
 zGX4OMv/HH8HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qc7D0sta
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*: move to external
 Bootlin stable toochain
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

T24gMjAvMDQvMjAyNSAyMTo1NywgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoaXMgbW92ZXMgdGhl
IGRlZmNvbmZpZyB0byB0aGUgQm9vdGxpbiBnbGliYyBzdGFibGUgZXh0ZXJuYWwgdG9vbGNoYWlu
Cj4gYXMgcGVyWzFdLgo+IAo+IFsxXTogCj4gaHR0cHM6Ly9lbGludXgub3JnL0J1aWxkcm9vdDpE
ZXZlbG9wZXJEYXlzRUxDRTIwMjQjUnVsZXNfZm9yX2RlZmNvbmZpZ3MKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
