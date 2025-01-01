Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAA1E77194
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2189405A1;
	Wed,  1 Jan 2025 22:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cbKORxOSdaV; Wed,  1 Jan 2025 22:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF55405A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF55405A3;
	Wed,  1 Jan 2025 22:22:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92EB9E0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6130480FF3
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhLlsaWluhXz for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 22:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D0AA80E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D0AA80E54
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D0AA80E54
 for <buildroot@busybox.net>; Wed,  1 Jan 2025 22:22:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 22852C0144
 for <buildroot@busybox.net>; Wed,  1 Jan 2025 22:22:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B23F660002;
 Wed,  1 Jan 2025 22:22:26 +0000 (UTC)
Date: Wed, 1 Jan 2025 23:22:26 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20250101232226.7719f6ad@windsurf>
In-Reply-To: <20241001193355.3966100-1-francois.perrad@gadz.org>
References: <20241001193355.3966100-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735770147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2haCZJtwebJytE6eWWWKcIAb1FcQ4MQjltdz2c/Py84=;
 b=KHyxH+wjk4ojHMYxEQNTwr84ndcPTdfJTNh6PC5LiQ9Z/uPiQWN0I8xY/QEyO+JGjou2TD
 lNcrDPU+0E+Nnv4/fc0bebUTcKeu5mG8HvwB+LYzxqDvEOQkBE76BxWQ093huLLGHP2wbJ
 Zk4A1KY3Nojuj+dyabo/lE0VveUFpDMdnX9zHN0IOpVpuf5ufqTUSWiOEmozxL1ULOixvG
 rvy8u0U2tjopY8XMUNTurDRpRw934cnpRycO71N5G/W8ODLBOA42pHrCJq88SVWgYFUKax
 VtyN6Xmi1mj7VmhSS8Zn0CDmLiQDHnlnoYhNbQpvXDDcM6BOVBwXGioOESh5fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KHyxH+wj
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.40.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gVHVlLCAgMSBPY3QgMjAyNCAyMTozMzo1NCArMDIwMApGcmFu
Y29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cgo+IHJlbW92ZSBt
ZXJnZWQgcGF0Y2gKPiAKPiBkaWZmIFJFQURNRToKPiAgICAgLVBlcmwgaXMgQ29weXJpZ2h0IChD
KSAxOTkzIC0gMjAyNCBieSBMYXJyeSBXYWxsIGFuZCBvdGhlcnMuCj4gICAgICtQZXJsIGlzIENv
cHlyaWdodCAoQykgMTk5MyAtIDIwMjMgYnkgTGFycnkgV2FsbCBhbmQgb3RoZXJzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+
IC0tLQo+ICAuLi5peHVwLXJlZ2V4LWVuZ2luZS1idWlsZC11bmRlci1VdXNlZGwucGF0Y2ggfCA1
NTQgLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvcGVybC9wZXJsLmhhc2ggICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxNCArLQo+ICBwYWNrYWdlL3BlcmwvcGVybC5tayAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA1NjQgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Blcmwv
MDAwMS1yZWdjb21wLWMtcmVnZXhlYy1jLWZpeHVwLXJlZ2V4LWVuZ2luZS1idWlsZC11bmRlci1V
dXNlZGwucGF0Y2gKClRoaXMgdXBkYXRlIGJyZWFrcyB0aGUgYnVpbGQgb2YgcGVybCBmb3IgdGhl
IHRhcmdldCB3aGVuCkJSMl9TVEFUSUNfTElCUz15OgoKICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5uZXQvcmVzdWx0cy9lMDcvZTA3ZmU4YmEzNDNiNjA2YWI0YWE2N2UwNDJjNjBjZTFmYjU3
MGMxNS9idWlsZC1lbmQubG9nCgpJbnRlcmVzdGluZ2x5LCBpbiB5b3VyIHZlcnNpb24gYnVtcCwg
eW91IGRyb3BwZWQgYSBwYXRjaC4uLiB3aGljaCB3YXMKbWVyZ2VkIHVwc3RyZWFtIGJ1dCBzZWVt
cyByZWxhdGVkLgoKQ291bGQgeW91IGhhdmUgYSBsb29rPwoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
