Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EAED2ECF7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 15:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938E84F20E;
	Tue, 20 Jan 2026 15:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnF1csLQAMUc; Tue, 20 Jan 2026 15:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D6C4F202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768921248;
	bh=GTQ6YeKO2Kcpw80iO7IbNaoyi+gp3t3/QLcjulRb3n4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SFiNrmqWkl37pOC+7thl0BIP/F5LptuuTFAWvKWMRafaxOtYBbEf/H/E0p54j787S
	 sZfVYVOA1vURF6YOV8rzXAoOPW1qeHaEfTwD3RB2uNucdO8wUzVpvuyZ2oS7ZyKkO5
	 6QyG2+Nl0K2761X0PFRkhHoz7Fl94rLm0LIqtkneCW/gpcHv7pxqd0dUpvx+/6DQ9X
	 vTDxNZJh4OlCZTr9ytcNY3h7a7f9X+wUVWz5NQEuNLZ6xPHzqR0YLHZnj0uI4I4eSH
	 Sk5tYVTZt7zD1lPUrq6ZXfm6J2Jpb8eXvkCLFke8AhdwU1oAgUu3Bq2pNiDpw4Foc7
	 9VwRM5q7mtwyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D6C4F202;
	Tue, 20 Jan 2026 15:00:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5F8122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 15:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB5004F202
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 15:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdwwJK83v6qq for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 15:00:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A7004F201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A7004F201
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A7004F201
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 15:00:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1vqyeA1WtM-0136gy; Tue, 20
 Jan 2026 16:00:42 +0100
Date: Tue, 20 Jan 2026 16:00:41 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <aW-Ymbk7AVbk18gB@probook>
References: <20260120090726.43100-1-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120090726.43100-1-br025@umbiko.net>
X-Provags-ID: V03:K1:bsmy7VCzMQYoNLmRDKo5K7hWvBM9HNZUH6e1YEWSR+emb88LAiX
 /dbQ4NpT9BEFYduhrEolEwFpxyWL+M9BLLKGDdEMkgSIiTkopALWSzRwkLx+idzHHufFYVU
 Ly3OYZngKl2/D9MugGiBfs93F33v4n6NxWPo+oEBdQ1qFu8enMRZ0lUZ/+eJ8VnwIzK1u+m
 kSQTQHg1042NfvUzlwPGg==
UI-OutboundReport: notjunk:1;M01:P0:uHM+Fb7OmaY=;OJkCCJnUJ6uC0SzhqZfZ0PzghBJ
 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
 oj4Z294typfffZ0Gkq+Tm+GyZGyMQuLahtC4FI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1768921242; x=1769526042; i=j.neuschaefer@gmx.net;
 bh=HIgZgaLK3+/a97V/0LrIP+btH5hzFbrZagJgh3X2rOo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AP43L4x8YTRQyEQfxU8drnoOS2t3hw3kD7z7izIhefieLcirAkDxiCfCBcLWJnta
 MVidYmWhAORzXCM36nJ0dFMtZIilbIde/LTLpQTWPTLSR45vFCpUP4I4LCQUbVtUE
 bJKvlNCb0Z2Fjf2PA9wFbSROK26jbQx21MiC19hBRUaBqgH8GBdI0px5Ni7FEdwH2
 BqUjAxLu99iKlMY/UCnom+tYF6qsfTYI3fwv000/SdnUHiOHoXPTK+KIe2BmL5yJK
 nJWTkYtfCxvfV9axpqkDa6sVWFrqZD8GvKMA0aRO5qQe4rC9vv8nCOCDIEE+37MQ/
 g/kZ2dzxO81L8k/6aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=AP43L4x8
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: fix shellcheck warnings
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTA6MDc6MjRBTSArMDEwMCwgQW5kcmVhcyBaaWVnbGVy
IHdyb3RlOgo+IFNoZWxsY2hlY2sgY29tbWl0IDRmODFkYmUgWzFdIGFkZGVkIFNDMjMyOSAoZnVu
Y3Rpb24gaXMgbmV2ZXIgaW52b2tlZCkKPiBhbmQgZml4ZWQgU0MyMzE3IChDb21tYW5kIGFwcGVh
cnMgdG8gYmUgdW5yZWFjaGFibGUpLiAKPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2tvYWxh
bWFuL3NoZWxsY2hlY2svY29tbWl0LzRmODFkYmU4MzkwOTFhMDZhNWNmYWVhNjk1Y2YxYzQ1MWZm
MDc1NjUKPiAKPiAkIHNoZWxsY2hlY2sgcGFja2FnZS9tcGQvUzk1bXBkCj4gCj4gSW4gcGFja2Fn
ZS9tcGQvUzk1bXBkIGxpbmUgMTM6Cj4gc3RhcnQoKSB7Cj4gXi0tIFNDMjMyOSAoaW5mbyk6IFRo
aXMgZnVuY3Rpb24gaXMgbmV2ZXIgaW52b2tlZC4gQ2hlY2sgdXNhZ2UgKG9yIGlnbm9yZWQgaWYg
aW52b2tlZCBpbmRpcmVjdGx5KS4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAo+IAo+IENoYW5nZSBzaGVsbGNoZWNrIGV4Y2VwdGlv
biBudW1iZXIgaW4gaGVhZGVyIG9mIFM5NW1wZC4gCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVh
cyBaaWVnbGVyIDxicjAyNUB1bWJpa28ubmV0Pgo+IC0tLQoKTG9va3MgZ29vZCwKClJldmlld2Vk
LWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKVGhhbmtzIQoKPiAg
cGFja2FnZS9tcGQvUzk1bXBkIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tcGQvUzk1bXBkIGIv
cGFja2FnZS9tcGQvUzk1bXBkCj4gaW5kZXggYWM5NzFlMDRhMi4uNDgxZWU3MGEyMCAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL21wZC9TOTVtcGQKPiArKysgYi9wYWNrYWdlL21wZC9TOTVtcGQKPiBA
QCAtMiw3ICsyLDcgQEAKPiAgIwo+ICAjIFM5NW1wZAlTdGFydHMgTXVzaWMgUGxheWVyIGRhZW1v
bi4KPiAgIwo+IC0jIHNoZWxsY2hlY2sgZGlzYWJsZT1TQzIzMTcgIyBmdW5jdGlvbnMgYXJlIGNh
bGxlZCB2aWEgdmFyaWFibGUKPiArIyBzaGVsbGNoZWNrIGRpc2FibGU9U0MyMzI5ICMgZnVuY3Rp
b25zIGFyZSBjYWxsZWQgdmlhIHZhcmlhYmxlCj4gIAo+ICBEQUVNT049Im1wZCIKPiAgUElERklM
RT0iL3Zhci9ydW4vJERBRU1PTi5waWQiCj4gLS0gCj4gMi41MS4wCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
