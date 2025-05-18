Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F64C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 752B880E9E;
	Sun, 18 May 2025 12:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zymHbGbAXCR; Sun, 18 May 2025 12:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FB380EBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FB380EBB;
	Sun, 18 May 2025 12:14:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EC2DDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30ACD40146
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WVUdEV0c-lJ for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48FC140142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FC140142
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48FC140142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:14:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F02CC1C0FAD; Sun, 18 May 2025 14:14:50 +0200 (CEST)
Message-ID: <96cb67cc-2f76-4d17-b6d1-f5bcd1f9c4ba@rnout.be>
Date: Sun, 18 May 2025 14:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
References: <20250430033319.87555-1-gael.portay+rtone@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430033319.87555-1-gael.portay+rtone@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747570491; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vD61FqgRZ9xFbr6hJircfOFF6smnYRgPfnuQx9duV0s=;
 b=ZOR0LcJ53g9L6QAyMGUj4QJPFsq/dXMnUg/m7JT2zqA8GPO+P1SjIT5XqbMPFcqX+/+WqY
 UyAvT+86X3vBcmet3R25yS5W3lwVkSU6ze8jGW3UX1QahWDgWqWfWJ3USqTMR8kwRidZfP
 xDyiQVYMUrtU3x94n4sNgb4Gp37WTd1CVUiVQTy56k+yAJgGIhBhzDjeb1DKWPUIx/VtDN
 WakVofzr3J0r06pVctbcNNB1LZJcn/IWBQTbeybGN02cIJfhku5q8nCvykxhYHerd+aX8Y
 stFsiBrWoPy3kWSjc+eY6q7J+npjI4sFOaXgtDViIqTmySziJusur1yfW2BTrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZOR0LcJ5
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi3_qt5we: remove
 proprietary-codecs
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

ICBIaSBHYWXMiGwsCgpPbiAzMC8wNC8yMDI1IDA1OjMzLCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4g
cXR3ZWJlbmdpbmUtY2hyb21pdW0gcGFja2FnZXMgdGhlIGNocm9taXVtIHNvdXJjZXMgYW5kIGl0
cyB0aGlyZC1wYXJ0aWVzCj4gZm9yIFF0LiBUaGUgYnVuZGxlZCBmZm1wZWcgZG9lcyBub3QgcmVj
b25maWd1cmUgdGhlIHByb2plY3QsIGJ1dCBpdAo+IGVtYmJlZHMgdGhlIHRocmVlIGhhcmRjb2Rl
ZCBjb25maWd1cmF0aW9uc1sxXSBpbnN0ZWFkOgo+ICAgLSBDaHJvbWl1bSBpZiBpc19jaHJvbWVf
YnJhbmRlZCBpcyB1bnNldAo+ICAgLSBDaHJvbWUgaWYgaXNfY2hyb21lX2JyYW5kZWQgaXMgc2V0
IChvciBpZiBpc19jaHJvbWVjYXN0IGlzIHNldCBhbmQgaWYKPiAgICAgaXNfYW5kcm9pZCBpcyBz
ZXQpCj4gICAtIENocm9tZU9TIGlmIGlzX2Nocm9tZV9icmFuZGVkIGlzIHNldCBhbmQgaWYgaXNf
Y2hyb21lb3MgKG9yIGlmCj4gICAgIGlzX2Nocm9tZWNhc3QgaXMgc2V0IGFuZCBpZiBpc19hbmRy
b2lkIGlzIHVuc2V0KQpbc25pcF0KPiBOb3RlOiBBZGQgdGhlIGNvbXBpbGVyIG9wdGlvbiAtbXRo
dW1iIHRvIHRoZSBjb21tYW5kLWxpbmUgZml4ZXMgdGhlCj4gYXNzZW1ibGVyIGlzc3VlLgoKICBU
aGF0J3MgYSBiZXR0ZXIgc29sdXRpb24gYmVjYXVzZSB0aGVuIGl0IGlzIHJlYWxseSBmaXhlZCwg
bm90IGp1c3QgZm9yIHRoaXMgCmRlZmNvbmZpZy4gU28gSSBzZW50IGEgcGF0Y2ggdGhhdCBkb2Vz
IGV4YWN0bHkgdGhhdCBbMV0gYW5kIG1hcmtlZCB0aGlzIG9uZSBhcyAKU3VwZXJzZWRlZC4KCiAg
SSBkaWRuJ3QgbWFrZSBhIHN1cGVyIGV4dGVuc2l2ZSBjb21taXQgbWVzc2FnZSBsaWtlIHlvdSBk
aWQuIElmIHlvdSBzZWUgYSB3YXkgCnRvIGltcHJvdmUgbXkgcGF0Y2ggZnVydGhlciwgZmVlbCBm
cmVlIHRvIGFsc28gaW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCAKYWxsIHRoZSByZWZl
cmVuY2VzIGFuZCBleHBsYW5hdGlvbnMgYW5kIHN1Y2ggdGhhdCB5b3UgaGFkIGhlcmUuCgogIFJl
Z2FyZHMsCiAgQXJub3V0CgpbMV0gCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA1MTgxMjExMzEuMjgyMTUzMC00LWFybm91dEBybm91dC5i
ZS8KCgoKW3NuaXBdCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
