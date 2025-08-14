Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7382FCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1BD80895;
	Thu, 14 Aug 2025 20:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T20ecQ3FWhic; Thu, 14 Aug 2025 20:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699B68087D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 699B68087D;
	Thu, 14 Aug 2025 20:30:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5976D228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B850404AB
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMhj18-n83bd for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09105404A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09105404A7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09105404A7
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:29:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B54F0B977EFD; Thu, 14 Aug 2025 22:29:47 +0200 (CEST)
Message-ID: <4d626559-91a6-49a2-afff-6cfc7d3473a2@rnout.be>
Date: Thu, 14 Aug 2025 22:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <1cc31884-bcac-4b37-b83e-0bb3ef937f64@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <1cc31884-bcac-4b37-b83e-0bb3ef937f64@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1755203388; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3VrOjhtuXwha6ivREdmBSRsXokupiNFg/yxyWGxkVmw=;
 b=NyGFHwUjcZqS/H3KMX3YIUAwLLt1K79etwwr/W2FP3I3QLD6vQrtH/LiK4L3KnOUqN6p8X
 v1eXiinz4HyI3w+IPSJv+JWy7byf4VVttsj8ZiL2xQ7DSMwuf02KifsG0Tq/TF1RyGLdRo
 m9dwoS8z37tFm2uVgvjQSyvYEObzvCCEyiL1ysRJ30ozybNIP6fm7cF68JWnLGDQjKnN4P
 lQ7pzSCTYnzQuo5uwTnHkddG4jfibwWc+/S1AJtsKFe/fyTXHR7y1TLVjEIctxOEfRqNQS
 K20KlMG2ZzNdaORKjSoqrB5cc0Owu8l28vHSTHI7YgO4eXca9myv0q53g4KLlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=NyGFHwUj
Subject: Re: [Buildroot] Multiple uboot defconfigs
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

CgpPbiAwNi8wOC8yMDI1IDE2OjA4LCBMYW5jZSBGcmVkcmlja3NvbiB3cm90ZToKPiBJJ20gd29y
a2luZyB3aXRoIGEgZGV2aWNlIHRoYXQgY2FuIGJvb3QgZnJvbSBub3IsIG5hbmQsIGVtbWMsIGFu
ZCBzZGNhcmQuwqAgSSdkIAo+IGxpa2UgdG8gY29tcGlsZSB1Ym9vdCBmb3IgZWFjaCBvZiB0aGVz
ZSBjb25maWd1cmF0aW9ucyBpbiBvbmUgZ28gaW4gYSBzaW5nbGUgCj4gYnVpbGRyb290IGNvbmZp
Z3VyYXRpb24sIGJ1dCBpdCBsb29rcyBhcyB0aG91Z2ggeW91IGNhbiBvbmx5IHNwZWNpZnkgYSBz
aW5nbGUgCj4gdWJvb3QgZGVmY29uZmlnLsKgIElzIHRoZXJlIGFueW9uZSB0aGF0J3MgYWxzbyBk
ZWFsdCB3aXRoIHRoaXMgc2NlbmFyaW8/IG9yIGlzIAo+IHRoZXJlIGFueXRoaW5nIEkndmUgbWlz
c2VkIGZvciBjb21waWxpbmcgbXVsdGlwbGUgdWJvb3QgY29uZmlncyBpbiBhIHNpbmdsZSAKPiBi
dWlsZHJvb3QgY29uZmlndXJhdGlvbj8KCiAgVGhlIHByb2JsZW0gaXMgdGhhdCBVLUJvb3QgZG9l
c24ndCByZWFsbHkgc3VwcG9ydCB0aGF0IHNjZW5hcmlvLCBzbyB0aGUgb25seSAKdGhpbmcgeW91
IGNhbiBkbyBpcyB0byBkbyBfYWxsXyB0aGUgY29uZmlndXJlIGFuZCBidWlsZCBzdGVwcyBpbiBh
IGxvb3AuIFdpdGggCnRoZSBrY29uZmlnIGluZnJhIG9mIEJ1aWxkcm9vdCwgdGhhdCdzIHByZXR0
eSBtdWNoIGltcG9zc2libGUuIFlvY3RvIGRvZXMgaGF2ZSAKc29tZXRoaW5nIGxpa2UgdGhhdCwg
YnV0IHRoZXkgZG9uJ3QgaGF2ZSB0aGluZ3MgbGlrZSBgbWFrZSB1Ym9vdC1tZW51Y29uZmlnYCAK
d2hpY2ggbWFrZXMgbGlmZSBhIGJpdCBzaW1wbGVyLgoKICBTbyB0aGUgYmVzdCBwcmFjdGljYWwg
c29sdXRpb24gaXMgdG8gbWFrZSBhIHNlcGFyYXRlIGRlZmNvbmZpZyB0aGF0IGJ1aWxkcyAKanVz
dCBVLUJvb3QuIEFuZCBpZiB5b3UgYnVpbGQgYSB0b29sY2hhaW4sIHVzZSB0aGUgb25lIHRoYXQg
eW91IGJ1aWxkIGZvciB0aGUgCnJvb3RmcyBhcyBhIHByZS1pbnN0YWxsZWQgZXh0ZXJuYWwgdG9v
bGNoYWluLgoKICBPciwgb2YgY291cnNlLCB5b3UgY2FuIGNob29zZSB0byBtb3ZlIHRoZSBhZGRp
dGlvbmFsIFUtQm9vdCBidWlsZHMgb3V0c2lkZSBvZiAKQnVpbGRyb290IGVudGlyZWx5LCBpbiBh
IHBvc3QtYnVpbGQgc2NyaXB0LgoKICBSZWdhcmRzLAogIEFybm91dApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
