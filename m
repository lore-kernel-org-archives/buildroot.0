Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161C3C48BEB
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863E241B37;
	Thu, 22 Feb 2024 10:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GofFiJtmTI-w; Thu, 22 Feb 2024 10:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9421341B46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9421341B46;
	Thu, 22 Feb 2024 10:09:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2130D1BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C87640488
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFMFJoTtaVEh for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.142;
 helo=cczrelay02.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 569C64032A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 569C64032A
Received: from cczrelay02.in2p3.fr (cczrelay02.in2p3.fr [134.158.66.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 569C64032A
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:09:15 +0000 (UTC)
Received: from [134.158.124.135] (clrelecpo09w.in2p3.fr [134.158.124.135])
 (authenticated bits=0)
 by cczrelay02.in2p3.fr (8.14.4/8.14.4) with ESMTP id 41MA9CXV003317
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 22 Feb 2024 11:09:12 +0100
Message-ID: <29a0ee9e-f370-4bbd-9901-72c0206bcc4d@clermont.in2p3.fr>
Date: Thu, 22 Feb 2024 11:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <c90e4512-405c-40fb-b597-1a04d7449afa@clermont.in2p3.fr>
 <d2a4dc21-1140-497d-91d6-2dde78e98cd0@smile.fr>
 <a6433199-1362-4d80-9ccf-389d8e7ed517@clermont.in2p3.fr>
 <643b99fe-655d-45b9-80dd-f47bb53efcb2@smile.fr> <ZdWYBJ7mt1L2CTjL@landeda>
 <d74f4d3c-bbd2-4dea-96df-77122691ce9f@clermont.in2p3.fr>
 <c7fe916e-a476-4df3-872d-0cd422e78a85@clermont.in2p3.fr>
 <8a008e9a-410f-406a-8e8c-0ce1724c1643@smile.fr>
From: David Picard <david.picard@clermont.in2p3.fr>
In-Reply-To: <8a008e9a-410f-406a-8e8c-0ce1724c1643@smile.fr>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clermont.in2p3.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-socfpga-hwlib: add new
 package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T0ssIHRoYW5rcy4gU28gSSBndWVzcyBteSBwYXRjaCBjYW4ganVzdCBiZSBkaXNjYXJkZWQuIENh
biBJIGRvIGl0IG15IApzZWxmIG9uIFBhdGNod29yayA/IElmIHNvLCB0byB3aGF0IHN0YXR1cyBz
aG91bGQgaXQgYmUgY2hhbmdlZCA/CgpMZSAyMS8wMi8yMDI0IMOgIDE2OjMzLCBSb21haW4gTmFv
dXIgYSDDqWNyaXTCoDoKPiBIZWxsbyBEYXZpZCwKPgo+IExlIDIxLzAyLzIwMjQgw6AgMTM6MjUs
IERhdmlkIFBpY2FyZCBhIMOpY3JpdMKgOgo+PiBPciBzaG91bGQgSSBhZGQgTElCRk9PX0VYVFJB
X0RPV05MT0FEUyB0byBteSBhcHBsaWNhdGlvbiBwYWNrYWdlID8KPiBTZWUgYW4gZXhhbXBsZSBo
b3cgdG8gdXNlIF9FWFRSQV9ET1dOTE9BRFM6Cj4KPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9wYWNrYWdlL3Rlc3NlcmFjdC1vY3IvdGVz
c2VyYWN0LW9jci5taz9yZWZfdHlwZT1oZWFkcyNMNTgKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21h
aW4KPgo+Cj4+IExlIDIxLzAyLzIwMjQgw6AgMDk6MzYsIERhdmlkIFBpY2FyZCBhIMOpY3JpdMKg
Ogo+Pj4gU28sIHNob3VsZCBJIHN1Ym1pdCBhIHBhY2thZ2UsIHVzaW5nIHRoZSBMSUJGT09fRVhU
UkFfRE9XTkxPQURTIGZlYXR1cmUgPyBXaGF0Cj4+PiB2YWx1ZSB3b3VsZCB5b3UgcmVjb21tZW5k
IGZvciBMSUJGT09fRExfRElSID8KPj4+Cj4+PiBEYXZpZAo+Pj4KPj4+IExlIDIxLzAyLzIwMjQg
w6AgMDc6MjgsIFlhbm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoKPj4+Pj4+IEkgZGlkIGl0IG9uIHB1
cnBvc2UuIFRoaXMgcGFja2FnZSBpcyBjYWxsZWQgYSBsaWJyYXJ5LCBidXQgaXQgcmVhbGx5IGlz
IGEgYnVuY2gKPj4+Pj4+IG9mIEMgZmlsZXMuIFlvdSBvbmx5IHVzZSBhIHN1YnNldCwgZGVwZW5k
aW5nIG9uIHlvdXIgaGFyZHdhcmUuIFRoaXMgY29kZSB3YXMKPj4+Pj4+IG1hZGUgdG8gYmUgY29t
cGlsZWQgaW4gdGhlIGFwcGxpY2F0aW9uLCBub3QgYXMgYSBjb252ZW50aW9uYWwgbGlicmFyeS4K
Pj4+Pj4+IEkgY291bGQgY29weSB0aGUgZmlsZXMgdG8gU1RBR0lORywgYnV0IGNsZWFuaW5nIHdv
dWxkIGJlIG1vcmUgY29tcGxpY2F0ZWQgYW5kIGl0Cj4+Pj4+PiB3b3VsZCB3YXN0ZSBzb21lIGRp
c2sgc3BhY2UuCj4+Pj4+IE9rLCBtYXliZSBpcyBzaG91bGQgbm90IGJlIHBhY2thZ2VkIGluIEJ1
aWxkcm9vdCB0aGVuLgo+Pj4+PiBXaGVuIGEgcGFja2FnZSBpcyBidWlsZCBieSBCdWlsZHJvb3Qs
IGl0IGNhbiBnZW5lcmF0ZSBhIGJpbmFyeSwgYSBsaWJyYXJ5IG9yCj4+Pj4+IHByb3ZpZGUgc29t
ZSBoZWFkZXIgZmlsZXMuCj4+Pj4+IElmIHlvdXIgYXBwbGljYXRpb24gZG9lc24ndCBidW5kbGUg
aW50ZWwtc29jZnBnYS1od2xpYiBzb3VyY2VzIGJ1dCBpdCByZXF1aXJlcwo+Pj4+PiBpdCB0byBi
dWlsZCBpbiBCdWlsZHJvb3QsIHlvdSBjYW4gdXNlIExJQkZPT19FWFRSQV9ET1dOTE9BRFMgdG8g
YWRkIGFuIGV4dHJhCj4+Pj4+IGRvd25sb2FkIHN0ZXAuCj4+Pj4gSSBhZ3JlZSB3aXRoIFJvbWFp
bi4gSXQgZG9lcyBub3QgbWFrZSBtaXVjaCBzZW5zZSBJTUhPIHRvIGp1c3QgZHJvcAo+Pj4+IHNv
dXJjZSBmaWxlcyBsaWtlIHRoYXQuIEFuZCB0aGUgX0VYVFJBX0RPV05MT0FEUyBtZWNoYW5pc20g
aXMgZXhhY3RseQo+Pj4+IHRhaWxvcmVkIHRvIHN1Y2ggY2FzZXMuCj4+Pgo+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
