Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B05C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 17:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8F5D4011B;
	Mon,  8 Jul 2024 17:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJ8oAxknaLU8; Mon,  8 Jul 2024 17:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8651040148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8651040148;
	Mon,  8 Jul 2024 17:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8261BF348
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6688640148
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEwl_b7mBjSY for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 17:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B241F4011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B241F4011B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B241F4011B
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 17:25:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266fd395eeso767915e9.3
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 10:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720459544; x=1721064344;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7Ft8QyKcCuolj+SssPS9Yy8TLbflDVbY7+UPhI+S/A=;
 b=UDRjSl8gT/P6gpUz3u9wd6SHcy0MvsKTSVLbAnoYOGFcpCAb5I9De/QT6YZGxlCQqp
 6Jw5/HQtpif/AhvT2FybsMZPpBxLuwtu1zmsN4/dVOwa3/JaQwLwVx19kLK64tVuZnyj
 LpIM+MmQhCWWeX96rbFi0TKSm0AjLIUOZ6Z/C0yAW3DMUT4b+DXQvQtzjzmMVYFD0lP/
 YbtkwunF37S1/jprOzT8H4QMMp4JBBrQexxhng4oGiM1Xfyn8N4KdtXlSXQwK2oR1qmZ
 pnyapRQyj+MlKQX6kfYNapMc/j23I+3Xf5QTVkYAjjyIEqz3jvy8eZtWz2Mq/0rlCccs
 2XLQ==
X-Gm-Message-State: AOJu0Yz+ybb5zfTTZFh+mk5M+81cqJ3aFPdTnxQrzHbBNPrTWc9DHv+V
 hNAn8GzBYSv4pCx0Quph9HtcBdjTZnhnvgpSPRsDbQEykWL2d0xCrWGqcWdKyrW/VCvqGf+vEZz
 K
X-Google-Smtp-Source: AGHT+IH9XW3/R+g1sRJ0HFVmIhlAX0WB9pHV7TguYItI4xRpzsbomceupjvmpKv51iaUSGagXMbGLA==
X-Received: by 2002:a5d:5f88:0:b0:367:8847:5bf4 with SMTP id
 ffacd0b85a97d-367cea46d6emr234628f8f.10.1720459544328; 
 Mon, 08 Jul 2024 10:25:44 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e02esm322894f8f.3.2024.07.08.10.25.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 10:25:43 -0700 (PDT)
Message-ID: <fafd6760-ba52-4d19-814f-75245e12e1f5@mind.be>
Date: Mon, 8 Jul 2024 19:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Mailing List <buildroot@buildroot.org>
References: <541495c8-6ebf-4161-81d2-217f2165efa5@mind.be>
Content-Language: en-GB
In-Reply-To: <541495c8-6ebf-4161-81d2-217f2165efa5@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720459544; x=1721064344; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7Ft8QyKcCuolj+SssPS9Yy8TLbflDVbY7+UPhI+S/A=;
 b=dx91yBXt8SB87duAEhaucoTwwsMb7a725PbNY5uMfjM2hasq041+N5bVdMCZczO6/k
 A/7DwRaguYr8BQZR2Qu3179lhRurGP21hRPj5yP77b0uF/tv68TXwG9ED9wdgBQAvAu5
 uD2bQhcwv6U4eRP5UvacYnoPo9nnFa6s0CQqO94FhxLe32QjBDZnug6y4eU70A6ENVFG
 u7BrCI9Ok0Bw553odMRyw7pDSqabvFskaTlLg9UoqjJtdfP6HDtKfs84R8LVv8WIYXTd
 Sl41kpguuTUqI97YqX+fXSMva5UL4T8Z2LxcRBXNGeH8udv78RDzOkCXfY+yw5TBBNx6
 qcbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dx91yBXt
Subject: Re: [Buildroot] Buildroot hackaton coming weekend (12-15 July 2024)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA4LzA3LzIwMjQgMTk6MjQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
YWxsLAo+Cj4gwqBXZSdyZSBnb2luZyB0byBoYXZlIGEgbWFpbnRhaW5lciBoYWNrYXRvbiB0aGUg
Y29taW5nIHdlZWtlbmQsIHdoZXJlIHdlJ3JlIAo+IGdvaW5nIHRvIHRyeSB0byBtYWtlIGEgc2ln
bmlmaWNhbnQgcmVkdWN0aW9uIG9mIHRoZSBwYXRjaHdvcmsgYmFja2xvZy4KPgo+IMKgWW91IGNh
biBoZWxwIGJ5IHNlbGVjdGluZyB5b3VyIG93biBwYXRjaGVzIGFuZCBwYXRjaCBzZXJpZXMgYW5k
IGZlZWRpbmcgdGhlbSAKPiB0byB1cywgaW4gcGFydGljdWxhcjoKPgo+IC0gUGF0Y2hlcyB3aGVy
ZSB5b3UgY2FuIGRvIGEgcmVzcGluIGR1cmluZyB0aGUgd2Vla2VuZC4gV2UnbGwgbWFrZSBzdXJl
IHRvIAo+IHJldmlldyB0aGVzZSBmaXJzdC4gSWYgYSByZXNwaW4gaXMgbmVlZGVkIGFuZCB5b3Ug
Y2FuIGRvIGl0IGR1cmluZyB0aGUgCj4gd2Vla2VuZCwgdGhlbiB3ZSBjYW4gc3RpbGwgYXBwbHkg
dGhlbSBkdXJpbmcgdGhlIGhhY2thdG9uLiBJZiBubyByZXNwaW4gaXMgCj4gbmVlZGVkIHdlJ2xs
IG9mIGNvdXJzZSBhcHBseSB0aGVtIGRpcmVjdGx5Lgo+Cj4gLSBQYXRjaGVzIHdoZXJlIHlvdSBj
YW4gZG8gYSByZXNwaW4sIGJ1dCBvbmx5IGFmdGVyIHRoZSB3ZWVrZW5kLiBUeXBpY2FsbHksIAo+
IHdoZW4gcmV2aWV3aW5nIGEgcGF0Y2gsIHdlIHRyeSB0byBtYWtlIG5lY2Vzc2FyeSBjaGFuZ2Vz
IHJpZ2h0IGF3YXkgYW5kIGFwcGx5IAo+IGRpcmVjdGx5LiBIb3dldmVyLCB0aGlzIHRha2VzIGV4
dHJhIHRpbWUuIFNvIGlmIHlvdSBrbm93IHlvdSdsbCBiZSBhYmxlIHRvIAo+IHJlc3VibWl0IHNv
b24sIHdlIGNhbiBza2lwIHRoYXQgYW5kIGNvbmNlbnRyYXRlIG9uIGp1c3Qgd3JpdGluZyBhIHJl
dmlldy4gVGhpcyAKPiB3YXksIHdlIGNhbiBoYW5kbGUgbW9yZSBwYXRjaGVzIGR1cmluZyB0aGUg
aGFja2F0b24uIE1lcmdpbmcgdGhlIHVwZGF0ZWQgCj4gc2VyaWVzIGFmdGVyIHRoZSBoYWNrYXRv
biBzaG91bGQgZ28gcXVpY2tlci4KPgo+IMKgWW91IGNhbiBmaWxsIGluIHRoZXNlIHNlcmllcyBv
biB0aGUgZnJhbWFwYWQ6IAo+IGh0dHBzOi8vbXlwYWRzMi5mcmFtYXBhZC5vcmcvbXlwYWRzLz8v
bXlwYWRzL2dyb3VwL2J1aWxkcm9vdC1lajNnbnQ5aGYvcGFkL3ZpZXcvYnVpbGRyb290LWhhY2th
dG9uLTIwMjQtMDctMTY5enA5OHQKCiDCoEFjdHVhbGx5IHRoaXMgVVJMIGlzIGJldHRlcjoKCmh0
dHBzOi8vbXlwYWRzMi5mcmFtYXBhZC5vcmcvcC9idWlsZHJvb3QtaGFja2F0b24tMjAyNC0wNy0x
Njl6cDk4dAoKSXQgZG9lc24ndCBoYXZlIHRoZSBzdHVwaWQgd2FzdGUgb2Ygc3BhY2UuCgoKIMKg
UmVnYXJkcywKIMKgQXJub3V0CgoKPgo+IMKgSWYgeW91IGRvbid0IGhhdmUgdGltZSB0byBjb21w
bGV0ZSBhIHJlc3BpbiBkdXJpbmcgdGhlIHdlZWtlbmQsIGJ1dCB5b3UgY2FuIAo+IGJlIGF2YWls
YWJsZSBvbiB0aGUgSVJDIGNoYW5uZWwgdG8gYW5zd2VyIHF1ZXN0aW9ucywgdGhhdCBjYW4gYWxz
byBmaXQgaW4gdGhpcyAKPiBjYXRlZ29yeS4KPgo+IMKgSWYgeW91IGhhdmUgYSBzZXJpZXMgcGVu
ZGluZyBmb3Igd2hpY2ggeW91IGFscmVhZHkga25vdyB0aGF0IGEgbmV3IHZlcnNpb24gCj4gd2ls
bCBiZSBuZWVkZWQsIHlvdSBjYW4gdGFrZSB0aGUgZm9sbG93aW5nIGFjdGlvbnM6Cj4KPiAtIE1h
cmsgaXQgYXMgQ2hhbmdlcyBSZXF1ZXN0ZWQgaW4gcGF0Y2h3b3JrLgo+Cj4gLSBJZiB5b3Ugc3Rp
bGwgd291bGQgbGlrZSBhIHJldmlldyBiZWZvcmUgeW91IGRvIHlvdXIgcmVzcGluLCBwdXQgaXQg
aW4gdGhlIAo+IGNvcnJlc3BvbmRpbmcgc2VjdGlvbiBpbiB0aGUgZnJhbWFwYWQgbGlua2VkIGFi
b3ZlLgo+Cj4gLSBJZGVhbGx5LCB5b3UgY2FuIGZpbmlzaCB0aGUgcmVzcGluIGJlZm9yZSB0aGUg
d2Vla2VuZCwgc28gdGhlcmUncyBhIGNoYW5jZSAKPiB3ZSBjYW4gc3RpbGwgYXBwbHkgaXQuCj4K
PiDCoElmIHlvdSBoYXZlIGEgcmVsYXRpdmVseSBvbGQgcGF0Y2ggKHNlcmllcykgcGVuZGluZywg
aXQgYWxzbyBoZWxwcyBhIGxvdCBpZiAKPiB5b3UgY2FuIHJlYmFzZSwgcmV0ZXN0IGFuZCByZXNl
bmQgaXQgYmVmb3JlIHRoZSB3ZWVrZW5kLiBJdCBjYW4gdGFrZSBhIGJpdCBvZiAKPiB0aW1lIHRv
IHJlZnJlc2ggb2xkIHBhdGNoZXMgdGhhdCB3ZSd2ZSBsZWZ0IHRvIGJpdHJvdCBmb3IgdG9vIGxv
bmcuIEl0J3MgYWxzbyAKPiB1c2VmdWwgdG8gZG8gdGhpcyBmb3IgcGF0Y2ggc2VyaWVzIHRoYXQg
YXJlIG5vdCB5b3VyIG93biBidXQgdGhhdCB5b3UgaGF2ZSBhbiAKPiBpbnRlcmVzdCBpbiAoYmVj
YXVzZSB5b3UgY2FuIHByb2JhYmx5IGRvIGJldHRlciB0ZXN0aW5nIHRoYW4gd2UgY2FuLCBpZiB5
b3UgCj4gaGF2ZSBhIHNwZWNpZmljIGludGVyZXN0IGluIHRoZSBmZWF0dXJlKS4KPgo+Cj4gwqBQ
bGVhc2UgcGF5IGF0dGVudGlvbiB0aGF0IHlvdXIgc2VyaWVzIHBhc3NlcyBjaGVjay1wYWNrYWdl
LiBBbHNvLCBydW4gYW55IAo+IHJ1bnRpbWUgdGVzdHMgdGhhdCBhcmUgcmVsYXRlZCB0byBpdCAo
aXQncyB2ZXJ5IHVzZWZ1bCB0byByZXBvcnQgdGhlIGxhdHRlciBpbiAKPiB5b3VyIGNvbW1pdCBt
ZXNzYWdlLCBiZWxvdyAtLS0pLgo+Cj4KPiDCoEl0IGFsc28gaGVscHMsIGFzIGFsd2F5cywgaWYg
eW91IGNhbiByZXZpZXcgYW5kL29yIHRlc3Qgb3RoZXIgcGVvcGxlJ3MgCj4gcGF0Y2hlcy4gRXNw
ZWNpYWxseSB0aGUgbW9yZSBjb21wbGV4IG9yIGNvbnRyb3ZlcnNpYWwgb25lcyBhcmUgaW50ZXJl
c3RpbmcsIG9yIAo+IHRoZSBvbmNlIHdoaWNoIGhhdmUgYSBsb25nIGJ1aWxkIHRpbWUuIFBhdGNo
ZXMgd2hpY2ggaGF2ZSBhIFJldmlld2VkLWJ5LCAKPiBUZXN0ZWQtYnksIC4uLiB0YWcgZ2V0IHBy
aW9yaXR5Lgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
