Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87287606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qczFMnQG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59FBF81366;
	Fri, 20 Nov 2026 07:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBRhKMWENups; Fri, 20 Nov 2026 07:34:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79ED481370
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795160095;
	b=P7XAtV/9GtqBescXKHhD5FuJEpFHjzEROLpbQPOXlpvkXZEY+QvQ3PVtDaWK+aDUs873
	 z4zZWi9z8KG4N4JKCVb11NpLwyyGtOwZVE4MiOwyAvcVXdEVXQa6iLBPwmg2AcqEyWQ5T
	 YW529TsrqZs9fNsxQvt15yIFD18zbRX5kMSMATRUu5lNeqQFLN71T1Ync9nyCkxazwmd4
	 404NTUByJiNlI25gb3ws1s21qDts/LjKhVE0c34Gj6yljsPXZgyCdDQoUUlN5YZYzezLJ
	 9MRruC2IzcCilewdellRSqW35m2wdIvaycMZJ8eM6MjVVaTnz98KSyn/vF/vzTWZLWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795160095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gr3kuOTctkQaZWJk20KeyBX8I4WIajDAqExI3mL/Lek=;
	b=P21M0jj7iDLB/c9Wln10opmNro5FfZ8vBEoOeWcCvX4LOGcUCHIO6GMo9VUQSz3t/03g
	 wPGXp/pi80H1p+MNn02Vp7tkyHTJ6ScA3K9Il12dPKUs+OszjGI3FGKFESyFETtQzZKqn
	 C9crm7bIZ6F4/sS2aDCYSO+Q0KbbXkl1W+M7Fl1S0Ok7D6ppHTZeHnXlcAzLu241bN8q8
	 AdWt314eczawaObxUtJJsJfpZrNkkG6cVgE7AcPt7pZzKasNyet6bIGZcCf1pLPPA7Eah
	 1rgUKsm3coa/DlVJVShpeuXHQsDtwzd8UgvnnEWL0rEmYDqY962v3uc+nKA97tQZ3pQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795160095;
	bh=gr3kuOTctkQaZWJk20KeyBX8I4WIajDAqExI3mL/Lek=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qczFMnQGmB1NSkFktxqfTKCkxepL0Di89kJwE8UYSmRK674vjPwVdu78bZ4sqL/4a
	 qXfjKngHckPaBxieLv05sU7Td3+HSrzxHfWLn21BI4k/8epkn8peFyn6JzbMJoZSin
	 Z+dLkNyvJfu9rocuDcRkbXrRA+uiP12sVZ2V0rIGD+a642UTImaNlYkojuL8KwI0kV
	 wVLrx2M9Cc1M/2hTmWAwo4TgacDziTuhpa9/P9xlbQQsM92MvFJ42bYk6y3BCyVwpV
	 EM5NHIbl6EN90NnN7K2KawcLF4hyfqLTCUyHYuoad3kHU4nWuefyL/FFfsJpMXOHQi
	 UMZDDc1bvGGKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79ED481370;
	Fri, 20 Nov 2026 07:34:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B882FB
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B43D4606BD
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDzLO4W7bLEz for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:34:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87D1360619
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87D1360619
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:34:53 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6b86bbce3d1so768428a12.0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 23:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795160091; x=1795764891;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9GevQJprmEeL48ocFTKU+5CVLxnYrqaaA9rRGCFCGVU=;
 b=IC2ZKjsQ1abqmXv6I6wuhDuEyc2/yhS3FlpzayiyK2ALOU7h5ht/oneowEZ4flfboq
 dVPHs6y8A3jZmY1AN3ym9NdQXcil9PY+ahv9TKcm3nReqZ8XHEmrwcWFkCwxJo4SyKs/
 1YgGoPsHHBGO6HtKHvYv4gw2/wGVlwVFGWyE7DcXV3eajJmw7s77xtRYhua3YAqyal8v
 1ajoifxShWbtPud9EtmAlo5eSx8yCr4FbHlPvqd5PnMWEvG1DvMPlJwCRC/VMjKpH34Y
 czIqOseuC6q7TzwIKG87TUuQBfGK7W53Yl6Foa08rAQq3hmWNhC/a8dhWb7kj9c53yzD
 4YUw==
X-Gm-Message-State: APuU4Z/0FYO4DGC5RO5/cIGp0qqBpZPimpK7bZim19k3ANgwPj7k5yid
 53RKN3AbMRRG8pIwTlY6ErFStyVY5CA5eZVWzDcZItNQITz/r8gPtmW+OzaoblFvAR1BSPymofL
 W7aPWj/rh5gg7473V3blqtqxLPpPJN024S/3s
X-Gm-Gg: AZFdTZd14LNz6B2KGr4nCcuax+U9WhV9uvVv4OvS+6uK3Ep1CCyyrnnte16pL/VWqdn
 Jgo+fHUjklTNygIMbW1YbTeL98EtbEoKsNz3kbqBhG5uE/BFP9xB2E7/KD4M6AlZHTd1DLkHoHg
 Qga0c3pBKPVVAfeiKNeYwXMdtZBGVBn4WO0j876djXwV53uY5KwOy57Z609faprGUtNOCGW3fot
 MLk4Iwxz4B2BKeaIlDEnKeUwcpPvEzlTXs6H1QfhmYfdoxQp/Y14ZIz4lWp+IPXyxZPL9s69xDT
 FNkEpo4vXydwnSAfnm5ke1+8QijmJVzbRXzhjyh07P6XM6BenG+BCZwYQ0/QI0Ig84i2jwgjKxU
 SRHbITfEp9JRSnOeRloNLs97zl/oPoqun2phjrEsGkb3HVDgjdU6NEqMytzE=
X-Received: by 2002:a05:6402:1e90:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6ba37ebe297mr1243200a12.40.1795160091012; Thu, 19 Nov 2026
 23:34:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119215005.2674763-1-yegorslists@googlemail.com>
 <f9dd7769-bf02-410c-80fc-d29e91382213@bubu1.eu>
In-Reply-To: <f9dd7769-bf02-410c-80fc-d29e91382213@bubu1.eu>
Date: Fri, 20 Nov 2026 08:35:20 +0100
X-Gm-Features: AclHuK-hLUn3QdmZlZWaH1NvLuWmy7pgXrlET3jrgQROzXOag9N9yG1dWgO_ud0
Message-ID: <CAGm1_kuZo3xa6Y41Zqyt-kopNRwQWoxyrjaU+dJZsbS5=ESbRg@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Olivier Singla <olivier.singla@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/shellinabox: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFyY3VzLAoKT24gRnJpLCBOb3YgMjAsIDIwMjYgYXQgMzo0MOKAr0FNIE1hcmN1cyBIb2Zm
bWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PiB3cm90ZToKPgo+IEhpIFllZ29yLAo+Cj4gbGV0J3Mg
Z2l2ZSBPbGl2aWVyIGEgYml0IG9mIHRpbWUgdG8gcmVwbHkuIEJ1dCBJIGFsc28gaGF2ZSBhIGZl
dwo+IGNvbW1lbnRzLiA6KQo+Cj4gT24gMTEvMTkvMjYgMjI6NTAsIFllZ29yIFllZnJlbW92IHdy
b3RlOgo+ID4gc2hlbGxpbmFib3ggaXMgZGVhZCB1cHN0cmVhbTogaXRzIGxhc3QgcmVsZWFzZSwg
Mi4yMCwgZGF0ZXMgZnJvbSAyMDE2Cj4gPiBhbmQgaXRzIGxhc3QgY29tbWl0IGZyb20gSmFudWFy
eSAyMDE5Lgo+Cj4gSXQncyBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkIGFuZCBjb25mdXNpbmcgdGhh
biB0aGF0Lgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9zaGVsbGluYWJveC9zaGVsbGluYWJveC9yZWxl
YXNlcy90YWcvdjIuMjEgd2FzCj4gcHVibGlzaGVkIFNlcCAyMDI1LiBCdXQgaXQncyBhY3R1YWxs
eSB0YWdnaW5nIGEgY29tbWl0IGZyb20gMjAxOSB0aGF0Cj4gYWxzbyBqdXN0IHB1c2hlZCBjb2Rl
IHRoYXQgZ290IHJlbGVhc2VkIGluIGRlYmlhbiBpbiAyMDE4IGFscmVhZHkuCj4gKnNpZ2gqIChz
b21lIGNvbnRleHQgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vc2hlbGxpbmFib3gvc2hlbGxp
bmFib3gvY29tbWl0LzRmMGVjYzMxYWM2Zjk4NWUwZGQzZjVhNTJjYmZjMGU5MjUxZjYzNjEjY29t
bWl0Y29tbWVudC0zMjI5NTI4MCkKPgo+IEJ1aWxkcm9vdCBjYXJyaWVzIHRoZSAyLjIwIHJlbGVh
c2UgKyB0aGUgQ1ZFIGZpeC4gKGJ1dCBtaXNzaW5nIHRoZQo+IHNlbGludXggcG9saWN5IGFkZGl0
aW9ucy4uLiBidXQgdGhvc2Ugd291bGRuJ3QgYmUgdXNhYmxlIGluIGJ1aWxkcm9vdAo+IGFzLWlz
IGFueXdheSkuCj4KPiBBbmQgYWxzbyBkZWJpYW4gYXBwYXJlbnRseSBjYXJyaWVzIGEgbmV3IHNl
Y3VyaXR5IGZpeCBmb3IgdGhpcyB0aGF0IGdvdAo+IG5ldmVyIG1lcmdlZCB1cHN0cmVhbTogaHR0
cHM6Ly9naXRodWIuY29tL3NoZWxsaW5hYm94L3NoZWxsaW5hYm94L3B1bGwvNTQwCj4KPiA+IEl0
IG9ubHkga2VlcHMgYnVpbGRpbmcgaW4gQnVpbGRyb290IHRoYW5rcyB0byBsb2NhbCBmaXhlcywK
Pgo+ID4gYW5kIGFzIGEgd2ViIHNlcnZlciBleHBvc2luZyBhCj4gPiB0ZXJtaW5hbCwgaXQgaXMg
bm90IHNvbWV0aGluZyB0byBrZWVwIHNoaXBwaW5nIHVubWFpbnRhaW5lZC4KPgo+IFRoaXMgcGFy
dCBoZXJlIGlzIG5vdCByZWFsbHkgcmVsZXZhbnQgYW5kIGFzIGl0IHN0YW5kIGFsc28KPiB1bnN1
YnN0YW50aWF0ZWQuIChJdCBhbHNvIHJlYWRzIGxpa2UgdGhlIHR5cGljYWwgTExNIHRleHQgb3V0
cHV0LCBpdAo+IHNvdW5kcyBoZWxwZnVsIGJ1dCBkb2Vzbid0IGFjdHVhbGx5IHNheSBhbnl0aGlu
ZyB1c2VmdWwuKSBTbyBlaXRoZXIKPiBzcGVjaWZpY2FsbHkgbWVudGlvbiB0aGUgb3BlbiBzZWN1
cml0eSBpc3N1ZSBvciBkcm9wIHRoaXMgcGFydC4KPgo+ID4KPiA+IFJlbW92ZSB0aGUgcGFja2Fn
ZSwgYXMgc3VnZ2VzdGVkIGJ5IFBldGVyIFsxXSwgYW5kIGFkZCBhIGxlZ2FjeSBvcHRpb24KPiA+
IGZvciBpdC4KPgo+IFRoaXMgcmVtb3ZhbCAoaWYgaXQgaGFwcGVucywgbGV0J3MgZ2l2ZSBPbGl2
aWVyIGEgYml0IG9mIHRpbWUgdG8KPiByZXNwb25kKSB3aWxsIGJlIGFwcGxpZWQgdG8gbmV4dCAo
b3IgbWFzdGVyIGFmdGVyIHRoZSBuZXh0IC0+IG1hc3Rlcgo+IG1lcmdlKS4gU28gdGhlIGxlZ2Fj
eSBoYW5kbGluZyBuZWVkcyB0byBiZSBmb3IgInJlbW92ZWQgaW4gMjAyNy4wMiIuCj4KPiBXZSBz
aG91bGQgcHJvYmFibHkgYWxzbyBwaWNrIHVwIHRoZSBzZWN1cml0eSBmaXggZm9yIDIwMjYuMTEg
YW5kIG9sZGVyLgo+Cj4gSWYgeW91IHJlc2VuZCB0aGlzLCBjYW4geW91IGJhc2UgaXQgb24gbmV4
dCBhbmQgY2xhcmlmeSB0aGUgY29uZnVzaW5nCj4gcmVsZWFzZSBoaXN0b3J5PyBJJ3ZlIG1hcmtl
ZCBpdCBhcyAiQ2hhbmdlcyByZXF1ZXN0ZWQiIGZvciBub3cuCgpUaGUgd2hvbGUgc3RvcnkgbG9v
a3MgcmVhbGx5IGNvbXBsaWNhdGVkLiBMZXQncyB3YWl0IGZvciBhIGZldyB3ZWVrcy4KQWNjb3Jk
aW5nIHRvIE9wZW5IdWIsIE9saXZpZXIgd2Fzbid0IHJlYWxseSBhY3RpdmUgc2luY2UgMjAyMDoK
aHR0cHM6Ly9vcGVuaHViLm5ldC9jb21taXR0ZXJzLzk4NDg4NQoKSSdsbCB0aGVuIGFwcGx5IHRo
ZSByZXF1aXJlZCBjaGFuZ2VzLgoKWWVnb3IKCj4gPgo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
LmJ1aWxkcm9vdC5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNjExMTkxMDMxMDMuMjYw
MjQzMC0xLXllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tLwo+ID4KPiA+IFN1Z2dlc3RlZC1ieTog
UGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+ID4gQXNzaXN0ZWQtYnk6IENs
YXVkZTpjbGF1ZGUtb3B1cy01LTUKPiA+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5
ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+IC0tLQo+Cj4gWy4uLl0KPgo+IEJlc3QsCj4g
TWFyY3VzCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
