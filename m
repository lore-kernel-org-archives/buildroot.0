Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D74C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA08E608DD;
	Wed, 16 Apr 2025 20:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMJROnsmlSjw; Wed, 16 Apr 2025 20:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89AF60E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89AF60E11;
	Wed, 16 Apr 2025 20:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DEE1159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EE4A81FC9
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBg-QfmeBvGq for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:55:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD64D81CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD64D81CD0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD64D81CD0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0ADFE1C05C0; Wed, 16 Apr 2025 22:55:08 +0200 (CEST)
Message-ID: <08cdb3fc-79eb-4c9f-a6c7-d52ee29271cf@rnout.be>
Date: Wed, 16 Apr 2025 22:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250323190602.3336195-1-bernd@kuhls.net>
 <20250323190602.3336195-2-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250323190602.3336195-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744836908; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=c3oQIKhMV0m9f9mQ9h230otopDH0K358nMY/5ViHsZg=;
 b=emN9GSbq+gtbiK6qZR9oFbzce0kq1z2+Mf0P1Z01hkWHSmPk8z/BH3xx3Xc19Uu6URhdI1
 VuH5lRq4+a8a7Y7qULQ01EzcMqhWvWKzlFgBARISXtiryaGwM7vHqwUtT56P6VUq/KHof5
 qbz8OT3hlwdmjz7cRkl3beb3GEwjpsuvXNbG943Ih2wN/Ehf+MXKjU7Q1d26veVz4PyYdF
 X8hx7Hk69oCMLWi9tfL20mVIu7viMnlsxo8F53NMXj3/6SnvyTUM721hQLK3NZBC3urQn3
 YFJ6mmv0ni3TGseoypZoGadcxO7ddbU/JNicEtgR6ty1U+vNwiTrbcTSRD/qZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/intel-vpl-gpu-rt: bump version to
 25.1.4
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

Ck9uIDIzLzAzLzIwMjUgMjA6MDYsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwg
dGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9pbnRlbC12
cGwtZ3B1LXJ0L2ludGVsLXZwbC1ncHUtcnQuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2UvaW50ZWwt
dnBsLWdwdS1ydC9pbnRlbC12cGwtZ3B1LXJ0Lm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2ludGVsLXZwbC1ncHUtcnQvaW50ZWwtdnBsLWdwdS1ydC5oYXNoIGIvcGFja2FnZS9pbnRl
bC12cGwtZ3B1LXJ0L2ludGVsLXZwbC1ncHUtcnQuaGFzaAo+IGluZGV4IDFmYzRkNDRhOGMuLmY0
OWM0NzMwY2MgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9pbnRlbC12cGwtZ3B1LXJ0L2ludGVsLXZw
bC1ncHUtcnQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvaW50ZWwtdnBsLWdwdS1ydC9pbnRlbC12cGwt
Z3B1LXJ0Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjb21wdXRlZAo+IC1z
aGEyNTYgIDI4YjFlYzM3Y2M3NDdkYjI5NmUwYThiZGQ4MjQyMDZhYTI2ZDE0NjIzNzM3YmNkOTRk
MjQ1MDA5OTc2Y2M1NTIgIGludGVsLXZwbC1ncHUtcnQtMjUuMS4zLnRhci5nego+ICtzaGEyNTYg
IDJlZTU5YTQ3YzI4MWY0MDJjZDc3MTE4ZWVkMWVjN2NlZjcwM2QyNTQzMmU5YTcxYjRiZTZiOTFl
OGMzMDRkNzIgIGludGVsLXZwbC1ncHUtcnQtMjUuMS40LnRhci5nego+ICAgc2hhMjU2ICBjMzFj
M2NjNWZkNjZkMTI1MGRiY2ExYzNkOTAxMWE5Zjg3NDUzNzQ0MmFjNzFjOGRlODBmMmYwZmVkMTNm
Mjk3ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW50ZWwtdnBsLWdwdS1ydC9pbnRl
bC12cGwtZ3B1LXJ0Lm1rIGIvcGFja2FnZS9pbnRlbC12cGwtZ3B1LXJ0L2ludGVsLXZwbC1ncHUt
cnQubWsKPiBpbmRleCA0YmI5OGM2ZDJmLi40MmVhZDYxZGMyIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvaW50ZWwtdnBsLWdwdS1ydC9pbnRlbC12cGwtZ3B1LXJ0Lm1rCj4gKysrIGIvcGFja2FnZS9p
bnRlbC12cGwtZ3B1LXJ0L2ludGVsLXZwbC1ncHUtcnQubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAg
ICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtSU5URUxfVlBMX0dQVV9SVF9W
RVJTSU9OID0gMjUuMS4zCj4gK0lOVEVMX1ZQTF9HUFVfUlRfVkVSU0lPTiA9IDI1LjEuNAo+ICAg
SU5URUxfVlBMX0dQVV9SVF9TSVRFID0gJChjYWxsIGdpdGh1YixpbnRlbCx2cGwtZ3B1LXJ0LGlu
dGVsLW9uZXZwbC0kKElOVEVMX1ZQTF9HUFVfUlRfVkVSU0lPTikpCj4gICBJTlRFTF9WUExfR1BV
X1JUX0xJQ0VOU0UgPSBNSVQKPiAgIElOVEVMX1ZQTF9HUFVfUlRfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
