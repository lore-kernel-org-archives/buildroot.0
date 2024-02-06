Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161CAC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D845F82112;
	Tue,  6 Feb 2024 12:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRyrLHC18kgf; Tue,  6 Feb 2024 12:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDFC282155
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFC282155;
	Tue,  6 Feb 2024 12:42:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 218AD1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0841E60B6C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0841E60B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKx66R7-8B8o for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:42:08 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2081E60AEB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2081E60AEB
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 25BB62C80CDD
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:42:06 +0100 (CET)
Message-ID: <a7c57251-16f3-4c1f-b271-df3108f2d8bc@bubu1.eu>
Date: Tue, 6 Feb 2024 13:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240108064820.3450359-1-james.hilliard1@gmail.com>
 <0eb549da-1140-4071-8e58-376d9dd5f434@bubu1.eu>
Content-Language: en-US
In-Reply-To: <0eb549da-1140-4071-8e58-376d9dd5f434@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707223326; bh=vIClEU2K/Cm7CeeFmsS+CMnUDtD5kdlStG2nlq/baRE=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=MIRgx/ObK8bLCUDwjdXCs7iw4CwLdbJLz8UvpfKom19lQno4KgYw0JDeGZrfSZZ65
 h9StRTtRYd8woWFn1PKj79WCFDF3GltvpptQFx2i+FjwvHQnoMVFkRMQ24d+OxBC7V
 idrauzC09YqhBVWibfcWtdI2PZFCSdeYa1bou56uWJt6Q7p/1R/tKlEwmEF6QGyzt3
 uuoQp02ODs4m0OwCCYsxTI0sqGQ8Cfo78Mxfa0oES+0f8/aKzBu6kwrQQQqN4AaSzs
 h3mXks2M7I9FsTi/YkDX4oyJhTTG3YWiquPKCv0SpNG0YbauDnjmBRXiUduO91GfDn
 /bWMW/hhXPfKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=MIRgx/Ob
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.2.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiAwOC4wMS4yNCAxNDowMywgTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gSGkgSmFtZXMsCj4gCj4gT24gMDguMDEuMjQgMDc6NDgsIEphbWVzIEhpbGxpYXJkIHdy
b3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KPj4gLS0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLWFueWlvL3B5dGhvbi1hbnlpby5o
YXNoIHwgNCArKy0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLWFueWlvL3B5dGhvbi1hbnlpby5ta8Kg
wqAgfCA0ICsrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24t
YW55aW8uaGFzaCAKPj4gYi9wYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8uaGFzaAo+
PiBpbmRleCAxY2VhNTQ5YmMxLi5lNzdkMzAyNDljIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5
dGhvbi1hbnlpby9weXRob24tYW55aW8uaGFzaAo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1hbnlp
by9weXRob24tYW55aW8uaGFzaAo+PiBAQCAtMSw1ICsxLDUgQEAKPj4gwqAgIyBtZDUsIHNoYTI1
NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9hbnlpby9qc29uCj4+IC1tZDXCoCA1OGQyODhk
ZDg0ZTI4ZTI1MDdmZjljZTdlNDYyMDAxMMKgIGFueWlvLTMuNy4xLnRhci5nego+PiAtc2hhMjU2
ICAKPj4gNDRhM2M5YWJhMGY1ZGVmYTQzMjYxYThiM2VmYjk3ODkxZjJiZDdkODA0ZTBlMWY1NjQx
OWJlZmExYWRmYzc4MCAgCj4+IGFueWlvLTMuNy4xLnRhci5nego+PiArbWQ1wqAgMjJlNjYwZmZm
MWE1ODRlNzIyODFmMGQ2YTA4M2U0ZTDCoCBhbnlpby00LjIuMC50YXIuZ3oKPj4gK3NoYTI1NiAg
Cj4+IGUxODc1YmI0YjRlMmRlMTY2OWY0YmM3ODY5YjZkM2Y1NDIzMWNkY2VkNzE2MDVlNmU2NGM5
YmU3N2UzYmU1MGYgIAo+PiBhbnlpby00LjIuMC50YXIuZ3oKPiAKPiBUaGlzIHdhcyBpbnRyb2R1
Y2VkIGluIHRoaXMgdmVyc2lvbiBiZWNhdXNlIGZhc3RhcGkgZGlkbid0IHN1cHBvcnQgYSAKPiBu
ZXdlciB2ZXJzaW9uLgo+IAo+IEZhc3RhcGkgMC4xMDguMCBzdXBwb3J0cyBzdGFybGV0dGUgMC4z
MiBub3csIHdoaWNoIHN1cHBvcnRzIGFueWlvIDQuMi4wLgo+IFNvIEkgdGhpbmsgdGhlc2Ugc2hv
dWxkIGJlIGJ1bXBlZCB0b2dldGhlci9pbiB0aGUgc2FtZSBzZXJpZXM/CgpOb3cgdGhhdCBtb3Jl
IHJlY2VudCBmYXN0YXBpIGFuZCBzdGFybGV0dGUgdmVyc2lvbnMgYXJlIGF2YWlsYWJsZSB0aGlz
IApjYW4gYmUgYXBwbGllZC4KCj4gCj4gCj4+IMKgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYg
Y2hlY2tzdW1zCj4+IMKgIHNoYTI1NiAgCj4+IDUzNjFhYzlkYzU4ZjJlZjVmZDJlOWIwOWM2ODI5
N2MxN2YwNDk1MDkwOWJiYzgwMjNiZGI4MmVhY2YyMmMyYjDCoCBMSUNFTlNFCj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8ubWsgCj4+IGIvcGFja2FnZS9w
eXRob24tYW55aW8vcHl0aG9uLWFueWlvLm1rCj4+IGluZGV4IDgwNDA0YWM2NjAuLjMyYzIyODYx
NTcgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWFueWlvL3B5dGhvbi1hbnlpby5tawo+
PiArKysgYi9wYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8ubWsKPj4gQEAgLTQsOSAr
NCw5IEBACj4+IMKgICMKPj4gICAKPj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gLVBZVEhP
Tl9BTllJT19WRVJTSU9OID0gMy43LjEKPj4gK1BZVEhPTl9BTllJT19WRVJTSU9OID0gNC4yLjAK
Pj4gwqAgUFlUSE9OX0FOWUlPX1NPVVJDRSA9IGFueWlvLSQoUFlUSE9OX0FOWUlPX1ZFUlNJT04p
LnRhci5nego+PiAtUFlUSE9OX0FOWUlPX1NJVEUgPSAKPj4gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzI4Lzk5LzJkZmQ1M2ZkNTVjZTk4MzhlNmZmMmQ0ZGFjMjBjZTU4
MjYzNzk4YmQxYTBkYmUxOGIzYTlhZjNmY2ZjZQo+PiArUFlUSE9OX0FOWUlPX1NJVEUgPSAKPj4g
aHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzJkL2I4LzczMzNkODdkNWYw
MzI0NzIxNWQ4NmE4NjM2MmZkM2UzMjQxMTE3ODhjNmNkZDhkMmU2MTk2YTZiYTgzMwo+PiDCoCBQ
WVRIT05fQU5ZSU9fU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPj4gwqAgUFlUSE9OX0FOWUlPX0xJ
Q0VOU0UgPSBNSVQKPj4gwqAgUFlUSE9OX0FOWUlPX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4g
Cj4gTWFyY3VzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
