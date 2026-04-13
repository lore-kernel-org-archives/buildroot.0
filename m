Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6B6F531CA
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 21:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D0941E7E;
	Mon, 13 Apr 2026 21:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8z4nXkq5ZcjA; Mon, 13 Apr 2026 21:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68464128F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776114200;
	bh=fuHi7p5I3uXmBQPNwG0a89aJDY2s8UwceSB8YTglUbI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=brswFvOxQcWV8TXxkzJtVVoS/TbTDygWRZzrK5S5FretCYuDKWmj9RMV3Dmzcy8v/
	 hfXIJEzh1IYGa+qJZxJs/81VcAp89Nz5CT03U6j+lJMV6A4tURdQDijhP8xRmYsVyd
	 Vq2YMXFmAd9vnh7Gwyg2itoEEHh9UgbKzF5QN13R2j3wxbdLocsj7nirqCOOK7VQj2
	 +JJaZgh/FFewMhQvqbs6MGXkeRJy2w2b86CXynjkQrD69lXpojktppHdVLjSW/f9rb
	 +98k7Jg0pWBW5OPknsFY7OApEpj4PAfdkguz54AW7hwleNgLBbgIzM52U6z9HY+QCm
	 yGBS/DTzKOcZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68464128F;
	Mon, 13 Apr 2026 21:03:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98387237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89ADC4058D
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpDPDXKXk4Ku for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 21:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 603EE40545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 603EE40545
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 603EE40545
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:03:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D3157780389;
 Mon, 13 Apr 2026 23:03:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Apr 2026 23:03:12 +0200
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 23:03:12 +0200
To: =?UTF-8?Q?Mat=C3=A9o_Pourrier?= <mateo.pourrier@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thierry
 Bultel <tbultel@free.fr>
In-Reply-To: <20260413130010.415908-1-mateo.pourrier@smile.fr>
References: <20260413130010.415908-1-mateo.pourrier@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <9306cef2b5a453b2a47ba2e1f3a61b24@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776114196;
 bh=xSnyreug1Oomdzfxq3jioSrZbJOGInAWVsNMRvW1csU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e0A6Qe2/kjysSL/wMRIYTVHH9ZWw7XfzlLq827g7y2wPjabT9mQVCOtwYM5DLhDeZ
 yIY+pgAoiN0VUu+af7FIEPlPYld0DLLuPTqx65PVPezJWS98ALhYICKS/WCGKEit8n
 J8RAmY6RAA5UBojQXxVI6g9sYauM+3AB8j0pJK2ST6nNNySZONgd62VDoUomg7PXyR
 KtxcTM7hcCRruFTQGdjwRqf/34QCK7QH3WlG1YBGzr1bW98obfku+SfqTBqzN4r+lR
 dUv7xTn6suOJfgxVju5nmaO/o0svNEhYqBQQH42DOu8nGbLx7dBxe9f8z9MbwiOC0J
 ikr21jIqrgbFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e0A6Qe2/
Subject: Re: [Buildroot] [PATCH 1/1] package/dracut: bump to dracut-ng-110
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWF0w6lvLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2guCgpPbiAxMy8wNC8yMDI2IDE1OjAwLCBN
YXTDqW8gUG91cnJpZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBCdW1wIGRyYWN1dCBwYWNrYWdl
IHNvdXJjZSB0byB0aGUgbmV3ZXN0IHZlcnNpb24gb2YgdGhlIHByb2plY3QsIAo+IGRyYWN1dC1u
ZywgcmVsZWFzZSAxMTAuCj4gCj4gVGhlIG9yaWdpbmFsIGRyYWN1dCBwcm9qZWN0IGlzIG5vdyBp
bmFjdGl2ZSBmb3IgYSBsb25nIHBlcmlvZCBvZiB0aW1lLgo+IERyYWN1dCBjb21tdW5pdHkgaGFz
IHRyYW5zaXRpb25lZCB0byB0aGUgZHJhY3V0LW5nIGZvcmsgdG8gY29udGludWUgCj4gZGV2ZWxv
cG1lbnQuCj4gVGhlIG1pZ3JhdGlvbiBlbnN1cmVzIHJlZ3VsYXIgdXBkYXRlcyBmb3Igc2VjdXJp
dHkgYW5kIGJ1ZyBmaXhpbmcsCj4gYSBiZXR0ZXIgc3VwcG9ydCBvZiBtb2Rlcm4gc3lzdGVtZCBm
ZWF0dXJlcyBhbmQga2VybmVsIHJlcXVpcmVtZW50cy4KPiBJdCBhbHNvIGFsbG93cyBhbGlnbm1l
bnQgd2l0aCBtYWpvciBMaW51eCBkaXN0cmlidXRpb25zIChGZWRvcmEsIEFyY2ggCj4gTGludXgs
IEdlbnRvbyksCj4gYW5kIG90aGVyIG9wZW4gc291cmNlIHByb2plY3RzIChZb2N0bykuCj4gCj4g
Q2hhbmdlcyBtYWRlIDoKPiAtIGRyYWN1dC5tazogY2hhbmdlIHNvdXJjZSB0byBkcmFjdXQtbmcg
MTEwCj4gLSBkcmFjdXQuaGFzaDogYWRhcHQgaGFzaCB0byBkcmFjdXQtbmcgMTEwCj4gLSByZW1v
dmUgdW51c2VkIHBhdGNoIDAwMS1kcmFjdXQuc2gtZG9uLXQtdW5zZXQtTERfUFJFTE9BRC5wYXRj
aAo+IC0gZHJhY3V0Lm1rOiBmaXggdW51c2VkIHN5c3RlbWQgc3ltYm9saWMgbGlua3MgYnVpbGQg
ZXJyb3IKPiAtIENvbmZpZy5pbjogYWRhcHQgZnMvY3Bpby9Db25maWcuaW4gdG8gbWVudGlvbiBk
cmFjdXQtbmcgdXBncmFkZQo+IC0gQ29uZmlnLmluLmhvc3Q6IGFkYXB0IGRyYWN1dCBDb25maWcu
aW4uaG9zdCB0byBtZW50aW9uIGRyYWN1dC1uZyAKPiB1cGdyYWRlCj4gCj4gVGVzdGVkIHdpdGgg
YnVpbGRyb290IHRlc3Qgc3VpdGUsIGFuZCBzdWNjZXNzZnVsbHkgcGFzc2VkIHRoZSA2IGRyYWN1
dCAKPiB0ZXN0cyA6Cj4gLSBUZXN0Q3Bpb0RyYWN1dEdsaWJjCj4gLSBUZXN0Q3Bpb0RyYWN1dEds
aWJjTWVyZ2VkVXNyCj4gLSBUZXN0Q3Bpb0RyYWN1dE11c2wKPiAtIFRlc3RDcGlvRHJhY3V0TXVz
bE1lcmdlZFVzcgo+IC0gVGVzdENwaW9EcmFjdXRVY2xpYmMKPiAtIFRlc3RDcGlvRHJhY3V0VWNs
aWJjTWVyZ2VkVXNyCgpJIHRyaWVkIHRoaXMgcGF0Y2ggKGluIHRoZSByZWZlcmVuY2UgQnVpbGRy
b290IERvY2tlciBpbWFnZSksCmFuZCB0aGUgbm9uICJNZXJnZWRVc3IiIHRlc3RzIGFyZSBub3Qg
Ym9vdGluZy4gU2VlOgpodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vcGlw
ZWxpbmVzLzI0NTAyOTkzOTkKCkFsc28sIHRoZSBwYXRjaCB3YXMgZ2VuZXJhdGluZyBmZXcgY2hl
Y2stcGFja2FnZSBlcnJvcnMuIEkgZml4ZWQKdGhvc2UgYmVmb3JlIHRlc3RpbmcsIHNlZToKaHR0
cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2NvbW1pdC84NTA1NjcwMmM3NWQw
NmMzYzNlMDU5NDA4NDY2ZDMxMTc2ZGY4OTg4CgpZb3UgY2FuIHJ1biBpdCBvbiB5b3Ugc2lkZSB3
aXRoIHRoZSBjb21tYW5kOgp1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQoKPiBT
aWduZWQtb2ZmLWJ5OiBNYXTDqW8gUG91cnJpZXIgPG1hdGVvLnBvdXJyaWVyQHNtaWxlLmZyPgoK
Q291bGQgeW91IGludmVzdGlnYXRlIHRoZSBydW50aW1lIHRlc3QgZmFpbHVyZXMsIHBsZWFzZT8K
CkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
