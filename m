Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47269C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04FB96F6BA;
	Wed, 16 Apr 2025 21:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XISne01-Jb6m; Wed, 16 Apr 2025 21:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9ABE6F738
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9ABE6F738;
	Wed, 16 Apr 2025 21:33:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C14C1159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B250C4125D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVxaIQpXor_q for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D18742465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D18742465
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D18742465
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE33B1C0083; Wed, 16 Apr 2025 23:33:02 +0200 (CEST)
Message-ID: <bf3a898b-8608-4860-9eb9-88f588b4b91f@rnout.be>
Date: Wed, 16 Apr 2025 23:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250409171044.775633-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250409171044.775633-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0f6NnSbRp5pJ3TiktH12Dv8G/R/cwmvjGCm6NOh9dYo=;
 b=ObVCdJoxrpZosu/xG9sI18P4/yZmnNm0h1zwEMHze+2sij3NuHYIjqTDnkLZoSWca9mvi/
 xE4aldokGNdly9i/gcI0woM0UV4tO9mfGJCOtscm7QfauXgoAa8uVHeqTR15TfSwKgiF4c
 WUiT688/6bGTzb9Mk5RnuaC/q11/NRqmLX2Fpoy61BTpJogl3i4x1kh3u+S0cylR7/PUNr
 Wk26qk94WGiuUZt5r/4kfurCIV3WEFHuvEgTU5UDa33ic7cczKAImYZ3Rmu02S/SeWI3lE
 9QC1Z4jaQTQ9OQK+JyZ3qEf0ThEEvffS3+8r0t1fuZg8yj4s6pF4PQOmhdX0hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [v2 PATCH 1/1] package/python-jinja2: security bump
 to version 3.1.6
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

Ck9uIDA5LzA0LzIwMjUgMTk6MTAsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlOgo+Cj4gLSBDVkUtMjAyNS0yNzUx
NjogUHJpb3IgdG8gMy4xLjYsIGFuIG92ZXJzaWdodCBpbiBob3cgdGhlIEppbmphCj4gICAgICBz
YW5kYm94ZWQgZW52aXJvbm1lbnQgaW50ZXJhY3RzIHdpdGggdGhlIHxhdHRyIGZpbHRlciBhbGxv
d3MKPiAgICAgIGFuIGF0dGFja2VyIHRoYXQgY29udHJvbHMgdGhlIGNvbnRlbnQgb2YgYSB0ZW1w
bGF0ZSB0byBleGVjdXRlCj4gICAgICBhcmJpdHJhcnkgUHl0aG9uIGNvZGUuCj4KPiBGb3IgbW9y
ZSBpbmZvcm1hdGlvbiwgc2VlOgo+ICAgIC0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRh
aWwvQ1ZFLTIwMjUtMjc1MTYKPiAgICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9wYWxsZXRzL2ppbmph
L2NvbW1pdC85MDQ1N2JiZjMzYjg2NjI5MjZhZTY1Y2RkZTRjNGMzMmU3NTZlNDAzCj4KPiBGb3Ig
bW9yZSBkZXRhaWxzIG9uIHRoZSB2ZXJzaW9uIGJ1bXAsIHNlZSB0aGUgcmVsZWFzZSBub3RlczoK
Pgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wYWxsZXRzL2ppbmphL3JlbGVhc2VzL3RhZy8zLjEuNgo+
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoK
IMKgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoK
PiAtLS0KPiAgIHBhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLmhhc2ggfCA0ICsr
LS0KPiAgIHBhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLm1rICAgfCA0ICsrLS0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLmhhc2ggYi9w
YWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0aG9uLWppbmphMi5oYXNoCj4gaW5kZXggYTg5YzYzYTBm
NC4uZmZkMGJjNTVjMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0aG9u
LWppbmphMi5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tamluamEyL3B5dGhvbi1qaW5qYTIu
aGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlw
aS5vcmcvcHlwaS9qaW5qYTIvanNvbgo+IC1tZDUgIDA4M2Q2NGYwNzBmNmYxYjVmNzU5NzFhZTYw
MjQwNzg1ICBqaW5qYTItMy4xLjUudGFyLmd6Cj4gLXNoYTI1NiAgOGZlZmZmOGRjMzAzNGUyN2Ji
ODBkNjdjNjcxZWI4YTliYzQyNGMwZWY0YzA4MjZlZGJmZjMwNGNjZWZmNDNiYiAgamluamEyLTMu
MS41LnRhci5nego+ICttZDUgIDY2ZDRjMjVmZjQzZDFkZWFmOTYzN2NjZGE1MjNkZWM4ICBqaW5q
YTItMy4xLjYudGFyLmd6Cj4gK3NoYTI1NiAgMDEzN2ZiMDU5OTBkMzVmMTI3NWE1ODdlOWFlZTZk
NTZkYTgyMWZjODM0OTFhMGZiODM4MTgzYmU0M2Y2NmQ2ZCAgamluamEyLTMuMS42LnRhci5nego+
ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAgM2I0OWRj
ZWU0MTA1ZWIzN2JhYzEwZmFmMWJlMjYwNDA4ZmU4NWQyNTJiOGU5ZGYyZTA5NzlmYzFlMDk0NDM3
YiAgTElDRU5TRS50eHQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tamluamEyL3B5dGhv
bi1qaW5qYTIubWsgYi9wYWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0aG9uLWppbmphMi5tawo+IGlu
ZGV4IDliOTViMzIxMmMuLjc0MzYwZWMyNTggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24t
amluamEyL3B5dGhvbi1qaW5qYTIubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0
aG9uLWppbmphMi5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgIAo+IC1QWVRIT05fSklOSkEyX1ZFUlNJT04gPSAzLjEuNQo+ICtQWVRIT05f
SklOSkEyX1ZFUlNJT04gPSAzLjEuNgo+ICAgUFlUSE9OX0pJTkpBMl9TT1VSQ0UgPSBqaW5qYTIt
JChQWVRIT05fSklOSkEyX1ZFUlNJT04pLnRhci5nego+IC1QWVRIT05fSklOSkEyX1NJVEUgPSBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYWYvOTIvYjMxMzBjYmJmNTU5
MWFjZjlhZGU4NzA4YzM2NWYzMjM4MDQ2YWM3Y2I4Y2NiYTZlODFhYmNjYjBjY2ZmCj4gK1BZVEhP
Tl9KSU5KQTJfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9k
Zi9iZi9mN2RhMDM1MDI1NGMwZWQ3YzcyZjNlMzNjZWYwMmUwNDgyODFmZWM3ZWNlYzVmMDMyZDRh
YWM1MjIyNmIKPiAgIFBZVEhPTl9KSU5KQTJfU0VUVVBfVFlQRSA9IGZsaXQKPiAgIFBZVEhPTl9K
SU5KQTJfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ICAgUFlUSE9OX0pJTkpBMl9MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRS50eHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
