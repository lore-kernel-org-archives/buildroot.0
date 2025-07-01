Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24146C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB4B60BC4;
	Tue,  1 Jul 2025 07:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbOblL-KhGCp; Tue,  1 Jul 2025 07:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218BE60D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218BE60D50;
	Tue,  1 Jul 2025 07:04:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 200FB179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1148160C14
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R72MNx8H200p for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:04:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41B2060BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B2060BC4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41B2060BC4
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B177B977599; Tue,  1 Jul 2025 09:04:28 +0200 (CEST)
Message-ID: <6902641c-7dd5-45c8-9406-db5d54670562@rnout.be>
Date: Tue, 1 Jul 2025 09:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, James Knight <git@jdknight.me>,
 buildroot@buildroot.org
References: <20250630023826.1163-1-git@jdknight.me>
 <ad972ec9-1dfb-4b88-906d-53981bd63771@grenoble.cnrs.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <ad972ec9-1dfb-4b88-906d-53981bd63771@grenoble.cnrs.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: ignore configs/ prefix on
 configuration events
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

CgpPbiAzMC8wNi8yMDI1IDA5OjQ4LCBFZGdhciBCb25ldCB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IEhlbGxvIGFsbCEKPiAKPiBPbiAyMDI1LTA2LTMwLCBKYW1lcyBLbmlnaHQgd3JvdGU6Cj4+IEFs
bG93cyBhY2NlcHRpbmcgYm9hcmQgY29uZmlndXJhdGlvbiBldmVudHMgdGhhdCBhcmUgcHJlZml4
ZWQgd2l0aCBhCj4+IGBjb25maWdzL2AgcGF0aC4gVGhpcyBwcm92aWRlcyBhIGNvbnZlbmllbmNl
IGZvciB1c2VycyB3aGVyZSBpdCBjYW4gYmUKPj4gc2xpZ2h0bHkgZWFzaWVyL3F1aWNrZXIgdG8g
dXRpbGl6ZSBzaGVsbCBjb21wbGV0aW9uIHRvIHByZXBhcmUgYSBidWlsZC4KPj4gRm9yIGV4YW1w
bGU6Cj4+Cj4+ICAgICAgbWFrZSBjb25maWdzL3FlbXVfc3BhcmM2NF9zdW40dV9kZWZjb25maWcK
Pj4KPj4gV291bGQgYmUgZXF1aXZhbGVudCB0bzoKPj4KPj4gICAgICBtYWtlIHFlbXVfc3BhcmM2
NF9zdW40dV9kZWZjb25maWcKPiAKPiBJIGRvbid0IGtub3cgaG93IHRoaXMgaXMgc3VwcG9zZWQg
dG8gd29yayBidXQsIGluIG15IGV4cGVyaWVuY2UsIHNoZWxsCj4gY29tcGxldGlvbiBvbiBidWls
ZHJvb3QncyBtYWtlIHRhcmdldHMgaXMgcGFpbmZ1bGx5IHNsb3csIGFuZCBkb2VzIG5vdAo+IHdv
cmsgd2l0aCBkZWZvbmZpZyB0YXJnZXRzLgo+IAo+IFdpdGggdGhpcyBwYXRjaCBhcHBsaWVkOgo+
IAo+ICAgICAgbWFrZSBxZW08VEFCPiDihpIgbWFrZSBxZW11Cj4gICAgICBtYWtlIHFlbXVfc3A8
VEFCPmFyYzY0PFRBQj4gICMgbm8gY29tcGxldGlvbgo+IAo+ICAgICAgbWFrZSBjb25mPFRBQj4g
4oaSIG1ha2UgY29uZmln4pCjICAjIHdoZXJlIOKAnOKQo+KAnSBpcyBhIHRyYWlsaW5nIHNwYWNl
Cj4gICAgICBtYWtlIGNvbmZpZ3MvcWU8VEFCPm11X3NwPFRBQj5hcmM2NDxUQUI+ICAjIG5vIGNv
bXBsZXRpb24KPiAKPiBJdCB3b3VsZCBiZSB2ZXJ5IGNvb2wgdG8gaGF2ZSB1c2FibGUgc2hlbGwg
Y29tcGxldGlvbiB0aG91Z2guCgogIEluIGJhc2gsIHlvdSBjYW4gdXNlIEN0cmwtYmFja3NsYXNo
IHRvIG9ubHkgdXNlIGZpbGVuYW1lIGNvbXBsZXRpb24sIG5vdCAKY29udGV4dC1zZW5zaXRpdmUg
Y29tcGxldGlvbi4gQnV0IHRoYXQgb25seSB3b3JrcyBpZiBpdCdzIGFuIGFjdHVhbCBmaWxlbmFt
ZSwgCmxpa2UgaW4gdGhlIGV4YW1wbGUgdGhhdCBKYW1lcyBnaXZlcy4KCiAgVGhlIGNvbnRleHQt
c2Vuc2l0aXZlIGNvbXBsZXRpb24gd2l0aCBUQUIgYWxyZWFkeSB3b3JrcyB3aXRob3V0IEphbWVz
JyBwYXRjaC4KCiAgU28gYmFzaWNhbGx5LCB0aGlzIHBhdGNoIGlzIGV4YWN0bHkgYSB3b3JrYXJv
dW5kIGZvciB0aGUgcHJvYmxlbSB5b3UgaW5kaWNhdGUgCihpZiB5b3Uga25vdyB3aGF0IGN0cmwt
YmFja3NsYXNoIGRvZXMpLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBDb250ZXh0OiBVYnVu
dHUgMjQuMDQsIGJ1aWxkcm9vdCBnaXQgbWFzdGVyCj4gCj4gUmVnYXJkcywKPiAKPiBFZGdhciBC
b25ldC4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
