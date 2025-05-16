Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19278C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E7240C9D;
	Fri, 16 May 2025 10:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAQxv3h08mfW; Fri, 16 May 2025 10:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69944089E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69944089E;
	Fri, 16 May 2025 10:42:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB1261AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA1C4086A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dku0uHMgKoCZ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E87C34085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87C34085A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E87C34085A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:42:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08CA11C10FB; Fri, 16 May 2025 12:42:14 +0200 (CEST)
Message-ID: <c00c9048-dc49-4cbe-8e0c-ad8767c1fdc6@rnout.be>
Date: Fri, 16 May 2025 12:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
 <20250418-ffmpt-v1-2-5540e2621486@gmx.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418-ffmpt-v1-2-5540e2621486@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=G7MMS+lkkiBeOjF0Tz0skprpqfVNH+KpfsTaE1v7V0E=;
 b=C7hmlOm5YjeEfth4FAfK5sOqao0BB+jlN8jS3h67RaZBz5W3mWFAtX8zmO9UUWdji1y5Xo
 GXMHQeyybyz7i66kJj+ZPdQYzvtO24TAbXafmBwOWUul6Ml2TJtpWYST65YA1TASTA+b+7
 9/Q3+p7e7P+XZWDXcRcVBNdx62Km9/tfBq7sCUzG5JgPSG5xivnLxDNxoV8RLAmTonWwOO
 wA9qWxh0HoFiYA1dFjGWyKBrxoicuuT7sn87yIu+TV2qZYduFkZHGoRYQXRdhuAbxKkw/9
 4TpRIXGzsd/URc1xOyFUi0qch7j5mKsVDwgELbD7+IOV03PqXXIv+rswtw6kvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=C7hmlOm5
Subject: Re: [Buildroot] [PATCH 2/2] package/ffmpeg: add support for
 libopenmpt
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wNC8yMDI1IDEwOjAzLCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IENvbmZpZ3VyZSBmZm1wZWcgdG8gdXNlIGxpYm9wZW5tcHQgaWYgYXZhaWxhYmxlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cgog
IEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0t
LQo+ICAgcGFja2FnZS9mZm1wZWcvZmZtcGVnLm1rIHwgNyArKysrKysrCj4gICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmZtcGVnL2Zm
bXBlZy5tayBiL3BhY2thZ2UvZmZtcGVnL2ZmbXBlZy5tawo+IGluZGV4IDkzODcwYjA0NzA5NTg1
NmNiZGViYWIzNDFkMmYzODEwZWQ4NTExMjkuLjc5OTIwMWM4MjA5Y2I5NjQ3MDE4ZWU1NzUyNzg1
MDNjMDA0ODEwOGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9mZm1wZWcvZmZtcGVnLm1rCj4gKysr
IGIvcGFja2FnZS9mZm1wZWcvZmZtcGVnLm1rCj4gQEAgLTM2Miw2ICszNjIsMTMgQEAgZWxzZQo+
ICAgRkZNUEVHX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtbGlibW9kcGx1Zwo+ICAgZW5kaWYKPiAg
IAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJQk9QRU5NUFQpLHkpCj4gK0ZGTVBFR19DT05GX09Q
VFMgKz0gLS1lbmFibGUtbGlib3Blbm1wdAo+ICtGRk1QRUdfREVQRU5ERU5DSUVTICs9IGxpYm9w
ZW5tcHQKPiArZWxzZQo+ICtGRk1QRUdfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1saWJvcGVubXB0
Cj4gK2VuZGlmCj4gKwo+ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9TUEVFWCkseSkKPiAgIEZGTVBF
R19DT05GX09QVFMgKz0gLS1lbmFibGUtbGlic3BlZXgKPiAgIEZGTVBFR19ERVBFTkRFTkNJRVMg
Kz0gc3BlZXgKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
