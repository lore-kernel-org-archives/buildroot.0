Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC01DC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9930983F3E;
	Wed, 16 Apr 2025 21:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2NrMOhxuUw1; Wed, 16 Apr 2025 21:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8148483A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8148483A99;
	Wed, 16 Apr 2025 21:33:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2AF8159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C860E83A99
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLmRaaceMkB7 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C494F83AD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C494F83AD3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C494F83AD3
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D60891C00C0; Wed, 16 Apr 2025 23:33:45 +0200 (CEST)
Message-ID: <48ec9192-ea90-49af-b013-98e4376bdef4@rnout.be>
Date: Wed, 16 Apr 2025 23:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
References: <20250410201154.1128082-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250410201154.1128082-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vB7IUTm4xtMJd/P9d0r68vAhe0npRtSIf1iwP4v+r8g=;
 b=bQ+BZfNlVKX56gnnropfZXIVSlgat5pnuwU8YywgYP5UdYuksAaugdeFHzIm11GDLFQENF
 ptj8ciPsjdWJAdrF/qJ92Iivdf6lA/0WxFrcAMPO+YBz4doFs6XI13ukTW7tHysNWcZb08
 35G1+flfnyHWqIibUZq0rPJ3xfNKTyohuaXmoStfjGox80mZh8AHR9debCa4JLb6yYWBU+
 Ga/KmY0Cf4+ERWmZneSuLs5+m71ON+hCzcCvOmMhVftZLGy70XOCWcMcw+4V6coJnUabA0
 b3eOEM6TA5dXxiHFR/Pb41piVvXL5M3o5Z87mPlA3fc87qecXLHY2PMHd3qfEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 5.1.8
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

Ck9uIDEwLzA0LzIwMjUgMjI6MTEsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKPgo+IC0gQ1ZFLTIwMjUtMjY2
OTk6IFBvdGVudGlhbCBkZW5pYWwtb2Ytc2VydmljZSB2dWxuZXJhYmlsaXR5IGluCj4gICAgICBk
amFuZ28udXRpbHMudGV4dC53cmFwKCkKPgo+IEZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWU6Cj4g
ICAgLSBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS0yNjY5OQo+ICAg
IC0gaHR0cHM6Ly9naXRodWIuY29tL2RqYW5nby9kamFuZ28vY29tbWl0LzhkYmI0NGQzNDI3MTYz
NzA5OTI1ODM5MWRmYzc5ZGYzMzk1MWI4NDEKPgo+IC0gQ1ZFLTIwMjUtMjc1NTY6IFBvdGVudGlh
bCBkZW5pYWwtb2Ytc2VydmljZSB2dWxuZXJhYmlsaXR5IGluCj4gICAgICBMb2dpblZpZXcsIExv
Z291dFZpZXcsIGFuZCBzZXRfbGFuZ3VhZ2UoKSBvbiBXaW5kb3dzCj4KPiBUaGlzIENWRSBpc24n
dCByZWxhdGVkIHRvIGJ1aWxkcm9vdCBoYXMgaXQgaXMgb25seSBhcHBsaWNhYmxlIG9uCj4gV2lu
ZG93cyBidXQgdGhpcyBwYWNrYWdlIHZlcnNpb24gYnVtcCBmaXggaXQuCj4KPiBGb3IgbW9yZSBp
bmZvcm1hdGlvbiwgc2VlOgo+ICAgIC0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Q1ZFLTIwMjUtMjc1NTYKPiAgICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9kamFuZ28vZGphbmdvL2Nv
bW1pdC9lZGMyNzE2ZDAxYTZmZGQ4NGIxNzNjMDIwMzE2OTUyMzFiY2VlMWY4Cj4KPiBGb3IgbW9y
ZSBkZXRhaWxzIG9uIHRoZSB2ZXJzaW9uIGJ1bXAsIHNlZSB0aGUgcmVsZWFzZSBub3RlczoKPiAg
ICAtIGh0dHBzOi8vZG9jcy5kamFuZ29wcm9qZWN0LmNvbS9lbi81LjEvcmVsZWFzZXMvNS4xLjgv
Cj4gICAgLSBodHRwczovL2RvY3MuZGphbmdvcHJvamVjdC5jb20vZW4vNS4xL3JlbGVhc2VzLzUu
MS43Lwo+ICAgIC0gaHR0cHM6Ly9kb2NzLmRqYW5nb3Byb2plY3QuY29tL2VuLzUuMS9yZWxlYXNl
cy81LjEuNi8KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVA
bWluZC5iZT4KCiDCoEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAog
wqBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5o
YXNoIHwgNCArKy0tCj4gICBwYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5tayAg
IHwgNCArKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5n
by5oYXNoIGIvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28uaGFzaAo+IGluZGV4
IDY2MzIyNDZhZjguLjFlMTk3MDA0ZDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tZGph
bmdvL3B5dGhvbi1kamFuZ28uaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRo
b24tZGphbmdvLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgICMgbWQ1LCBzaGEyNTYgZnJvbSBo
dHRwczovL3B5cGkub3JnL3B5cGkvZGphbmdvL2pzb24KPiAtbWQ1ICAyNzJlOTUxZGJjNGNjYjc4
NTRjNWE2OWFhNTY1MDc0OSAgRGphbmdvLTUuMS41LnRhci5nego+IC1zaGEyNTYgIDE5YmJjYTc4
NmRmNTBiOWVjYTIzY2VlNzlkNDk1ZmFjZjU1YzhmNWM1NGM1MjlkOWJmMWZlN2I1ZWEwODZhZjMg
IERqYW5nby01LjEuNS50YXIuZ3oKPiArbWQ1ICA4MDI0N2E4YjQ4Y2RhYzU1ZTVhZDNmYjY4MmFi
NzFhMyAgRGphbmdvLTUuMS44LnRhci5nego+ICtzaGEyNTYgIDQyZTkyYTFkZDI4MTAwNzJiY2M0
MGEzOWEyMTJiNjkzZjk0NDA2ZDBiYTA3NDllNjhlYjY0MmYzMWRjNzcwYjQgIERqYW5nby01LjEu
OC50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gICBzaGEy
NTYgIGI4NDY0MTVkMWI1MTRlOWMxZGZmMTRhMjJkZWI5MDZkNzk0YmM1NDZjYTYxMjlmOTUwYTE4
Y2QwOTFlMmE2NjkgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGphbmdv
L3B5dGhvbi1kamFuZ28ubWsgYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5t
awo+IGluZGV4IDgxZDUyNmNhMzUuLmI2NGQ4ZTRjZDEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
eXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28ubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1kamFu
Z28vcHl0aG9uLWRqYW5nby5tawo+IEBAIC00LDEwICs0LDEwIEBACj4gICAjCj4gICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLVBZVEhPTl9ESkFOR09fVkVSU0lPTiA9IDUuMS41Cj4g
K1BZVEhPTl9ESkFOR09fVkVSU0lPTiA9IDUuMS44Cj4gICBQWVRIT05fREpBTkdPX1NPVVJDRSA9
IERqYW5nby0kKFBZVEhPTl9ESkFOR09fVkVSU0lPTikudGFyLmd6Cj4gICAjIFRoZSBvZmZpY2lh
bCBEamFuZ28gc2l0ZSBoYXMgYW4gdW5wcmFjdGljYWwgVVJMCj4gLVBZVEhPTl9ESkFOR09fU0lU
RSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lNC8xNy84MzRlM2Uw
OGQ1OTBkY2MyN2Q0Y2MzYzVjZDRlMmZiNzU3YjdhOTJiYWI5ZGU4ZWU0MDI0NTU3MzI5NTIKPiAr
UFlUSE9OX0RKQU5HT19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2th
Z2VzLzAwLzQwLzQ1YWRjMWI5MzQzNWQxYjQxODY1NGE3MzRiNjgzNTFiYjZjZTBhMGU1ZTM3YjJm
MGU5YWViMWEyZTIzMwo+ICAgUFlUSE9OX0RKQU5HT19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4g
ICBQWVRIT05fREpBTkdPX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gICBQWVRIT05fREpBTkdP
X0NQRV9JRF9WRU5ET1IgPSBkamFuZ29wcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
