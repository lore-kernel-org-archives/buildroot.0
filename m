Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C38E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 08:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F9260E39;
	Thu, 19 Dec 2024 08:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6SfW6xalOVj; Thu, 19 Dec 2024 08:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB626124B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB626124B;
	Thu, 19 Dec 2024 08:18:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B945ECE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A65C960E39
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3WUjmkY38u2 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 08:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3430360E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3430360E21
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3430360E21
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:18:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1962019206; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 08:18:15 +0000 (UTC)
Message-ID: <3ce8e3d1-5fcb-4386-bb91-fdcb49d3ca85@korsgaard.com>
Date: Thu, 19 Dec 2024 09:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241218220907.762527-1-peter@korsgaard.com>
 <347c6f7297fe983edb7a5658a19605e0@free.fr>
 <193ddef0750.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <193ddef0750.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Q9LfwlNabYRH7KbOOfaQXKC9oI/+2pg5V1nammntuIKYH493TDNcj25+Yi08c5xAH7cGto39HzxrpKtBdBqUfcA5s5zKqASquy9/QU09un9fnImWyeIXNyvk2r+76sZUfwHV0rLsaCpXR389W3wgCpDUwTJmiknPDkxb1rkb/zXgj8ndzHFEF8QRKYTovKfCl3mp5AOe7dDafvD7y3gMlcHXC0omwGuRyRq1ueT9hl4GDkysrc+RhkjUJtG+VjNXTf2Q0YTYoXR5ozPbGbxITSKNv5vzdVuMjA+JAb4UOmtt+3I9rcm2r10uRrsqitqCU68TMoX0n7/V+sS7h8ZRSQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=4+RPEXcaKq4nT0FBPAzQP35cEAOXyy/XqdmTkvVxNuM=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Q9LfwlNa
Subject: Re: [Buildroot] [PATCH] package/dpdk: security bump to version
 24.11.1
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

T24gMTIvMTkvMjQgMDk6MDAsIFZpbmNlbnQgSmFyZGluIHdyb3RlOgo+IEhpIEp1bGllbiBhbmQg
UGV0ZXIsCj4gCj4gVGhhbmssIHlvdSBoYXZlIGJlZW4gcXVpY2sgb24gaXQuIEZvciBteSBhbmQg
bWF5YmUgc29tZSBvdGhlciBwZW9wbGUgb2YgCj4gdGhlIEJ1aWxkcm9vdCBjb21tdW5pdHksCj4g
IMKgIMKgLSBob3cgZGlkIHlvdSB0cmFjayBhbmQgZGV0ZWN0IHF1aWNrbHkgdGhlIG5lZWRlZCBD
VkUgb24gYSBwYWNrYWdlID8gCj4gRG8geW91IGhhdmUgYSBzcGVjaWZpYyBub3RpZmljYXRpb24v
YWxlcnQgc2NyaXB0ID8KCldlIGRvIGhhdmUgdGhlIENWRSBpbmZvcm1hdGlvbiBpbiB0aGUgcGFj
a2FnZSBzdGF0czoKCmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9zdGF0cy9tYXN0ZXIu
aHRtbAoKQW5kIHRoZSBwZW9wbGUgbGlzdGVkIGluIERFVkVMT1BFUlMgc2hvdWxkIGdldCBhIG1h
aWwgd2hlbiB0aGVpciAKcGFja2FnZXMgaGF2ZSBhIENWRSBsaXN0ZWQsIGJ1dCBpbiB0aGlzIHNw
ZWNpZmljIGNhc2UgSSBzaW1wbHkgc2F3IHRoZSAKYWR2aXNvcnkgYXMgSSBhbSBzdWJzY3JpYmVk
IHRvIHRoZSBvc3Mtc2VjdXJpdHkgbGlzdDoKCmh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0
cy9vc3Mtc2VjdXJpdHkvMjAyNC8xMi8xNy8zCgo+ICDCoCDCoCAtIHdoZW4gZG8geW91IG5lZWQg
YW4gYWNrJ3Qgb2YgdGhlIGRldmVsZXBlciBvZiBhIHBhY2thZ2UgPyBJZiBuZWVkZWQuCgpJZGVh
bGx5IGV2ZXJ5IHRpbWUgdGhlcmUgaXMgYSBwYXRjaCBwcm9wb3NlZCBmb3IgYSBwYWNrYWdlIHlv
dSBtYWludGFpbiwgCmJ1dCBoZXJlIHRoZSBwYXRjaCB3YXMgdmVyeSBzaW1wbGUgc28gSnVsaWVu
IGp1c3QgYXBwbGllZCBpdC4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
