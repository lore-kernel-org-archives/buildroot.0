Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AA4C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 08:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F678484B;
	Fri, 14 Feb 2025 08:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IydfnHNiRavQ; Fri, 14 Feb 2025 08:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF988484C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF988484C;
	Fri, 14 Feb 2025 08:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C672C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0DEE415DF
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvCOMdOoqpkM for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 08:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 742D3415F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742D3415F4
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 742D3415F4
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:08:18 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DDBA7352083F; Fri, 14 Feb 2025 09:08:15 +0100 (CET)
Date: Fri, 14 Feb 2025 09:08:15 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <Z6757/dNfhJcco7d@waldemar-brodkorb.de>
References: <20250214021416.392363-1-fancp2007@gmail.com>
 <20250214074235.917242-1-fancp2007@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214074235.917242-1-fancp2007@gmail.com>
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739520496; bh=9fVxwWZrOj33/m2be8TysEeUYYvbOqEnECwJO3ZEri0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9OqGtxQTBmpnTSzf91uqhSFvmszymFuKvR5rh8CF/I3h7rK7PjwOZ4G7D/N8Gr03
 8FxV8Bon/eOWG5I+RxYfubmk9z3m/hWM+AGVWs622mdX+boPVciyYUOqWV/PqIhSni
 U7Ge1PnWP0JcJjNzfxigbHN9rCcHwBRDRJxEm2m5yLAlfUK2bssfxX4l/ZWKLKWrLx
 YNrvqK1dYzOckNYkEy6NOaPLq2eWZDsDIc7F/XPffTYuQAfl3+gvxGBuX3f8za5/GN
 u/z5RUic0oYy8hZdp3sP7jC46GHfqwvIusiEUAPKzyup5wuTi2qcXA9SYiipeSklUF
 2NFACkps2kWcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=I9OqGtxQ
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix configure options
 for readline/editline support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2NvdHQsClNjb3R0IEZhbiB3cm90ZSwKCj4gVGhlIGF1dG9zZXR1cCBzY3JpcHQgd2lsbCBz
a2lwIGNoZWNraW5nIGZvciByZWFkbGluZS5oIHdoZW4gY3Jvc3MtY29tcGlsaW5nLAo+IHdoaWNo
IHdpbGwgY2F1c2UgbGluZS1lZGl0aW5nIHN1cHBvcnQgZm9yIHRoZSBzcWxpdGUzIHNoZWxsIHRv
IGFsd2F5cyBiZSAibm9uZSIuCj4gCj4gSW4gdGhpcyBjYXNlLCBpZiB0aGUgLS1lZGl0bGluZSBv
cHRpb24gaXMgcHJvdmlkZWQsIGFuIGVycm9yIHdpbGwgYmUgcmVwb3J0ZWQ6Cj4gRVJST1I6IEV4
cGxpY2l0IC0tZWRpdGxpbmUgZmFpbGVkIHRvIGZpbmQgYSBtYXRjaGluZyBsaWJyYXJ5Lgo+IAo+
IEhvd2V2ZXIsIHdlIGNhbiBlbmFibGUgcmVhZGxpbmUgb3IgZWRpdGxpbmUgc3VwcG9ydCBieSBz
cGVjaWZ5aW5nIHRoZSBDRkxBR1MKPiBhbmQgTERGTEFHUyB2YWx1ZXMg4oCL4oCLaW5zdGVhZCBv
ZiBoYXZpbmcgaXQgaGFuZGxlZCBhdXRvbWF0aWNhbGx5IGJ5IHRoZQo+IGF1dG9zZXR1cCBjb25m
aWd1cmUgc2NyaXB0Lgo+IAo+IEluIGFkZGl0aW9uLCB0aGUgbGliZWRpdCBwYWNrYWdlIGFjdHVh
bGx5IGRlcGVuZHMgb24gdGhlIG5jdXJzZXMgcGFja2FnZSwKPiBqdXN0IGxpa2UgdGhlIHJlYWRs
aW5lIHBhY2thZ2UuIFNvIHdoZW4gdXNpbmcgdGhlIGxpYmVkaXQgcGFja2FnZSwKPiBhbHNvIGFk
ZCB0aGUgbmN1cnNlcyBkZXBlbmRlbmN5LgoKU29tZWhvdyBpdCBkb2VzIG5vdCBhcHBseSBjbGVh
bmx5IHdpdGggZ2l0IGFtOgpBcHBseWluZzogcGFja2FnZS9zcWxpdGU6IGZpeCBjb25maWd1cmUg
b3B0aW9ucyBmb3IKcmVhZGxpbmUvZWRpdGxpbmUgc3VwcG9ydAplcnJvcjogcGF0Y2ggZmFpbGVk
OiBwYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWs6NDQKZXJyb3I6IHBhY2thZ2Uvc3FsaXRlL3NxbGl0
ZS5tazogcGF0Y2ggZG9lcyBub3QgYXBwbHkKUGF0Y2ggZmFpbGVkIGF0IDAwMDEgcGFja2FnZS9z
cWxpdGU6IGZpeCBjb25maWd1cmUgb3B0aW9ucyBmb3IKcmVhZGxpbmUvZWRpdGxpbmUgc3VwcG9y
dAoKQW55IGlkZWE/CgpiZXN0IHJlZ2FyZHMKIFdhbGRlbWFyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
