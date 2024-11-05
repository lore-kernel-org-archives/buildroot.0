Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A69D40D08
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 23:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEE740611;
	Tue,  5 Nov 2024 23:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayt2RlW-XWF2; Tue,  5 Nov 2024 23:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F324061D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F324061D;
	Tue,  5 Nov 2024 23:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0A84B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAFAC6069E
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4DEIqmPtRfD for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 23:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=wilfred.opensource@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E708D60667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E708D60667
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E708D60667
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:23:09 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7ea12e0dc7aso4094061a12.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 15:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730848989; x=1731453789;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jCqLlaf0WFZLZfzYukQZPaFzhjd74O94gODCTwS400=;
 b=APZ78ZjTOxdVSDXY0xdzAwTCN7RbND/FEieET5ptHHFdf4lAET7qRx5lY/4fTxfOBd
 1zSjS/1MKWimQTTpnOJSOMSAdgwPGEssAecM5+j1CLDpWcDmFvzENLjVHeU2yiyQ2bco
 MhPb/DS3fVqV0mh6LwWN0ri/BY764fSOsGQYTwlFikcQhs5bSIJ6YlKIOC80yVxHFNZn
 +9SjUGNHXw4CsZqq5rRoBmpi82kNx5MS7Wurdr+J0fp7GXinNmCwDEFv41lDZfr7ofxr
 9sABSBJf4ima5aZ85FV9CYQlszEDTCTelWbLpGVWPynxCuEY1v1dQgE6S+k1v/Kq5oAb
 lhAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGf9SKugL9kbjKrndSA1VV3r6/7+eSeizb+o0KN8nN3ItTixQQwCNRiy97oj40BGDjCtmLjOuk0EE=@buildroot.org
X-Gm-Message-State: AOJu0Yy3Rd2hMWezQOSC5cD1GuTek+p1GfwKei+tq8hZWnDQVvQ+KYdH
 d4fHtWGSnR3TdyP+qIO2O+OoYik6zBF5pjZGMQMpKJUwSuoXW/BX
X-Google-Smtp-Source: AGHT+IEyeoRSq2vqb1Qt7RuWCZG2WqaRhPcezZQ0SfXcNTIfqUdPuqtWDPYGKQ/EjcjO76SdEUtQgA==
X-Received: by 2002:a17:90b:38c3:b0:2e2:e937:7141 with SMTP id
 98e67ed59e1d1-2e94c2e4777mr26716888a91.20.1730848988996; 
 Tue, 05 Nov 2024 15:23:08 -0800 (PST)
Received: from [192.168.0.69] ([159.196.5.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057d3bb8sm84461225ad.246.2024.11.05.15.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 15:23:08 -0800 (PST)
Message-ID: <1f0d1c80538b0564374b3ed51760c0b0218d87bf.camel@gmail.com>
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>
Date: Wed, 06 Nov 2024 09:23:04 +1000
In-Reply-To: <20241105182308.1216274-1-ju.o@free.fr>
References: <20241105182308.1216274-1-ju.o@free.fr>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730848989; x=1731453789; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5jCqLlaf0WFZLZfzYukQZPaFzhjd74O94gODCTwS400=;
 b=CrvXb0BeVl72RzC4kAknq2sg5Lj9h5ytGFwDZfJ0uIEbJccEFuUTC+03yHtmpnrHYL
 PDsr/yqzWN1RAgvrRjb0KMisHuHIuXnsar2uerpOZxDFngBMtzNT+JyV4NqzshaFFH0J
 kcjilR21XyZDWqLdzDzgjATutRhRsaYH59Amnp+wordqtN5rNr3lWHETwBeANJYIAyg2
 3SXQ6E765NoSogKCa6V0AVAmvzdSGq+8fQKQ1SSFWdTgcs6UaD6dQxZnIE3Rzar1yYiU
 oTPA6Z6Wu0rEgrEEGqfRG37BxDas6MGANtbWj7I3PQGkhFHcLmAjUiC8h9WkZ1sW7J/d
 k2fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CrvXb0Be
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: fix build due to
 missing macro definition
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMDI0LTExLTA1IGF0IDE5OjIzICswMTAwLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToK
PiBDb21taXQgOTY3YmE1Mzg2ICJwYWNrYWdlL2xpYnNwZG06IGJ1bXAgdmVyc2lvbiB0byAzLjUu
MCIgWzFdCj4gaW5jb3JyZWN0bHkgcmVtb3ZlZCB0aGUgIjAiIHRvIHRoZSBMSUJTUERNX0VOQUJM
RV9DQVBBQklMSVRZX01FTF9DQVAKPiBtYWNybyBkZWZpbml0aW9uLgo+IAo+IFRoaXMgcmVzdWx0
cyB0byBsaWJzcGRtIGJ1aWxkIGZhaWx1cmUgd2l0aCBlcnJvcnMgbGlrZToKPiAKPiDCoMKgwqAg
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9idWlsZC9saWJzcGRtLQo+IDMuNS4wL2luY2x1ZGUvaW50
ZXJuYWwvbGlic3BkbV9jb21tb25fbGliLmg6MjAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmcm9tIC9idWlsZC9saWJzcGRtLQo+IDMuNS4wL2xpYnJhcnkvc3Bk
bV9jb21tb25fbGliL2xpYnNwZG1fY29tX2NvbnRleHRfZGF0YS5jOjc6Cj4gwqDCoMKgIC9idWls
ZC9saWJzcGRtLQo+IDMuNS4wL2luY2x1ZGUvaGFsL2xpYnJhcnkvcmVzcG9uZGVyL21lYXNsaWIu
aDoxNTQ6Mzg6IGVycm9yOiAjaWYgd2l0aAo+IG5vIGV4cHJlc3Npb24KPiDCoMKgwqDCoMKgIDE1
NCB8ICNpZiBMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX01FTF9DQVAKPiDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4KPiAKPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNz
dWUgYnkgYWRkaW5nIGJhY2sgdGhpcyBtaXNzaW5nICIwIi4KPiAKPiBGaXhlczoKPiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvODhjYjc3YTJlNmI0NjAyOGY5ZmI3ZjAz
MjUzNDhhMWIxYjhmZDkzMQo+IAo+IFsxXQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC85NjdiYTUzODZkNGUxNTEwMmRiODhhOWZhYWUxODQ1YjNl
NjlkYzZmCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4K
ClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPgoK
VGhhbmtzIQoKV2lsZnJlZAo+IC0tLQo+IFBhdGNoIHRlc3RlZCAoY29tcGlsYXRpb24gb25seSkg
aW46Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8x
NTI4NTIzNDczCj4gLS0tCj4gwqBwYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5tayB8IDIgKy0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5tayBiL3BhY2thZ2UvbGlic3BkbS9saWJz
cGRtLm1rCj4gaW5kZXggMDgxYmZmYjljMS4uMDNhYzlhNzBmOCAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2xpYnNwZG0vbGlic3BkbS5tawo+ICsrKyBiL3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1r
Cj4gQEAgLTIwLDcgKzIwLDcgQEAgTElCU1BETV9UQVJHRVRfQ1BVX0ZBTUlMWSA9ICQoY2FsbAo+
IHFzdHJpcCwkKEJSMl9QQUNLQUdFX0xJQlNQRE1fQ1BVX0ZBTUlMWSkpCj4gwqBMSUJTUERNX0NG
TEFHUyA9IFwKPiDCoAkkKFRBUkdFVF9DRkxBR1MpIFwKPiDCoAktRExJQlNQRE1fRU5BQkxFX0NB
UEFCSUxJVFlfRVZFTlRfQ0FQPTAgXAo+IC0JLURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX01F
TF9DQVA9IFwKPiArCS1ETElCU1BETV9FTkFCTEVfQ0FQQUJJTElUWV9NRUxfQ0FQPTAgXAo+IMKg
CS1ETElCU1BETV9FTkFCTEVfQ0FQQUJJTElUWV9HRVRfS0VZX1BBSVJfSU5GT19DQVA9MCBcCj4g
wqAJLURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX1NFVF9LRVlfUEFJUl9JTkZPX0NBUD0wCj4g
wqAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
