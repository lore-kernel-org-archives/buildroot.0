Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF4C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA85681AD1;
	Sat, 17 May 2025 21:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFkyXm5qm81s; Sat, 17 May 2025 21:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED7981AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED7981AF3;
	Sat, 17 May 2025 21:20:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BFD4E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6B7740A21
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1sLE5hVvSKE for <buildroot@buildroot.org>;
 Sat, 17 May 2025 21:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EF8C40481
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF8C40481
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EF8C40481
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10A631C0AEC; Sat, 17 May 2025 23:20:39 +0200 (CEST)
Message-ID: <9747b5e9-a268-4a96-973b-c7e55d8267e7@rnout.be>
Date: Sat, 17 May 2025 23:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240731145754.330678-1-gael.portay@rtone.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20240731145754.330678-1-gael.portay@rtone.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747516840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=he0KKGeoretS8l5gfW6FGIE5Y49TvAYc4i62vK7I0Wg=;
 b=I/uP861bbT6RxPZiAWKKMwQKYTgcLr06ppynIx8zGp5oAWeblMkkwWL2wKbJUFLC1U1vk1
 YnLSKrFR30RLdWE6pQtk5q54zei1ym7CcAuJsTmZGuDBgcZmuWFEXECt3897/OLaqct/xJ
 iSE2zs9EwUuiM17CfGs2vGxq9XEYc64J+N0WEEvhsky+00mTHZoMIV11YcWLK6V/94cny6
 /kqEbajjwaYdCxx+SQhI99m/AmEQGolF+gT+Ax4vgAj1JL8X/rw08q0mPYAKh7bXBZZ9xK
 eGZ0CEqgR7PbCh5v33gtoqhu9rRD+7tJ6gnEYOSfiaGcpO67p4t3+0YnTNPVuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=I/uP861b
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine: add missing opus
 dependency
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

CgpPbiAzMS8wNy8yMDI0IDE2OjU3LCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhlIHBhY2thZ2Ug
b3B1cyBpcyBzZWxlY3RlZCBidXQgaXQgaXMgbm90IGxpc3RlZCBpbiB0aGUgZGVwZW5kZW5jaWVz
Lgo+IAo+IFRoaXMgYWRkcyBvcHVzIHRvIFFUNVdFQkVOR0lORV9ERVBFTkRFTkNJRVMuCj4gCj4g
Rml4ZXM6Cj4gCj4gCSQgbWFrZSBxdDV3ZWJlbmdpbmUKPiAJKC4uLikKPiAJRVJST1I6IEZlYXR1
cmUgJ3dlYmVuZ2luZS1zeXN0ZW0tb3B1cycgd2FzIGVuYWJsZWQsIGJ1dCB0aGUgcHJlLWNvbmRp
dGlvbiAnY29uZmlnLnVuaXggJiYgbGlicy53ZWJlbmdpbmUtb3B1cycgZmFpbGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+CgogIEFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFj
a2FnZS9xdDUvcXQ1d2ViZW5naW5lL3F0NXdlYmVuZ2luZS5tayB8IDEgKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NXdl
YmVuZ2luZS9xdDV3ZWJlbmdpbmUubWsgYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUvcXQ1d2Vi
ZW5naW5lLm1rCj4gaW5kZXggNTI5YTgzZGY2Yy4uZjg0ZjA1NmU5NCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUvcXQ1d2ViZW5naW5lLm1rCj4gKysrIGIvcGFja2FnZS9x
dDUvcXQ1d2ViZW5naW5lL3F0NXdlYmVuZ2luZS5tawo+IEBAIC03OCw2ICs3OCw3IEBAIFFUNVdF
QkVOR0lORV9ERVBFTkRFTkNJRVMgKz0gXAo+ICAgCWxpYnZweCBcCj4gICAJbGlieG1sMiBcCj4g
ICAJbGlieHNsdCBcCj4gKwlvcHVzIFwKPiAgIAlzbmFwcHkgXAo+ICAgCXdlYnAKPiAgIAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
