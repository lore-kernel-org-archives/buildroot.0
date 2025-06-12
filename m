Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C7C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52EA14065F;
	Thu, 12 Jun 2025 19:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSH6kRD37rZV; Thu, 12 Jun 2025 19:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF794066A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF794066A;
	Thu, 12 Jun 2025 19:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89F951BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 873D881B58
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TibAEFJu4Xjf for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4E9F8176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E9F8176B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4E9F8176B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5ACF81C00EF; Thu, 12 Jun 2025 21:55:14 +0200 (CEST)
Message-ID: <55513e72-d961-4ac9-a407-b63617e67d94@rnout.be>
Date: Thu, 12 Jun 2025 21:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
References: <20250610144753.92545-1-buildroot@bubu1.eu>
 <7507ddd1-1148-42f8-b9a5-3fc970978322@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <7507ddd1-1148-42f8-b9a5-3fc970978322@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NTUgtQ33Kd6MbIuE8IKUXlK8dRawq02HnkNJUGOZTFE=;
 b=TfB32zss6Q8/uAiDu2TysATOop5w5mjoOwszx33/IkzMwK0haavcg1rUyHbRb0B86VFaGf
 cjMH/OSHxnjSsx7da5xvRHIq8ttkhLw6ShhzrM2PATqsaa0wSE+fGnZhwvGbE+0NL1V5Ck
 A/pne1FucTB4Mkzf/TRgq5pYYi/GS0Tg5RVyFn/jd2MAhBBVQEWY/Y4SZ+XFsBIjGNccqd
 nC7zHsx+jkPGuZxqHN5A70JUMs0xIZrFzVsvOsVeBS7vOpjO477LdSKaleqsIj+rjmuXkh
 AvN6XKTDL8580Oz6hc8WEngoQ8vWZTFfvLLHnEUA9uIvvG+gK4WkmUR+lAXT7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TfB32zss
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.2.3
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

CgpPbiAxMi8wNi8yMDI1IDIxOjU0LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAK
PiBPbiAxMC8wNi8yMDI1IDE2OjQ3LCBNYXJjdXMgSG9mZm1hbm4gdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPj4gRm9sbG93dXAgcmVsZWFzZSB0byA1LjIuMiB0aGF0IGNvbXBsZXRlcyB0aGUgbWl0aWdh
dGlvbnMgZm9yCj4+IENWRS0yMDI1LTQ4NDMyWzFdLgo+Pgo+PiBGdWxsIGNoYW5nZWxvZzogaHR0
cHM6Ly9kb2NzLmRqYW5nb3Byb2plY3QuY29tL2VuLzUuMi9yZWxlYXNlcy81LjIuMy8KPj4KPj4g
WzFdIGh0dHBzOi8vd3d3LmRqYW5nb3Byb2plY3QuY29tL3dlYmxvZy8yMDI1L2p1bi8xMC9idWdm
aXgtcmVsZWFzZXMvCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRy
b290QGJ1YnUxLmV1Pgo+IAo+ICDCoEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFNv
cnJ5ISBSZXBsaWVkIHRvIHRoZSB3cm9uZyBtYWlsLCBJIGFwcGxpZWQgdGhlIGJ1bXAgdG8gdjUu
MS4xMC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQK
PiAKPj4gLS0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2gg
fCA0ICsrLS0KPj4gwqAgcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28ubWvCoMKg
IHwgNCArKy0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1k
amFuZ28uaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby8gCj4+IHB5dGhvbi1kamFuZ28uaGFz
aAo+PiBpbmRleCAxNGVkMTNmZDZjLi4wZGQ2ODcxNjRlIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LWRqYW5nby9weXRob24tZGphbmdvLmhhc2gKPj4gQEAgLTEsNiArMSw2IEBACj4+IMKgICMgbWQ1
LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZGphbmdvL2pzb24KPj4gLW1kNcKg
IDc4MjU3N2Y1MzJlZmFiMzJmODExOWE3MDcxZjU1ZDA0wqAgZGphbmdvLTUuMi4yLnRhci5nego+
PiAtc2hhMjU2wqAgODU4NTJlNTE3Zjg0NDM1ZTliMTM0MjEzNzljZDZjNDNlZjViNDhhOWM4YjM5
MWQyOWEyNmY3OTAwOTY3ZTk1MiAgCj4+IGRqYW5nby01LjIuMi50YXIuZ3oKPj4gK21kNcKgIDBi
MjI2NmI0YTFhYWVkOTQyZTBhOTRjZThhMTg5MTNkwqAgZGphbmdvLTUuMi4zLnRhci5nego+PiAr
c2hhMjU2wqAgMzM1MjEzMjc3NjY2YWIyYzVjYWM0NGE3OTJhNmQyZjNkNThlYjc5YTgwYzE0YjZi
MTYwY2Q0YWZjM2I3NTY4NCAgCj4+IGRqYW5nby01LjIuMy50YXIuZ3oKPj4gwqAgIyBMb2NhbGx5
IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPj4gwqAgc2hhMjU2wqAgYjg0NjQxNWQxYjUxNGU5
YzFkZmYxNGEyMmRlYjkwNmQ3OTRiYzU0NmNhNjEyOWY5NTBhMThjZDA5MWUyYTY2OSAgCj4+IExJ
Q0VOU0UKPj4gwqAgc2hhMjU2wqAgZGNhYzFjODZjYjdhYjQ5MTcwMmJkYjRjNDFiZTY4MGZhZmRl
NTE1MzY3NDhjYzhhYWVlMzg0MGVlYzUzZWQxNyAgCj4+IGRqYW5nby9jb250cmliL2dpcy9tZWFz
dXJlLnB5Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5n
by5tayBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby8gCj4+IHB5dGhvbi1kamFuZ28ubWsKPj4gaW5k
ZXggZTM2YWI1Mzg1ZC4uNzdlOWExMTgzOSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24t
ZGphbmdvL3B5dGhvbi1kamFuZ28ubWsKPj4gKysrIGIvcGFja2FnZS9weXRob24tZGphbmdvL3B5
dGhvbi1kamFuZ28ubWsKPj4gQEAgLTQsMTAgKzQsMTAgQEAKPj4gwqAgIwo+PiAgIAo+PiAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+PiAtUFlUSE9OX0RKQU5HT19WRVJTSU9OID0gNS4yLjIKPj4g
K1BZVEhPTl9ESkFOR09fVkVSU0lPTiA9IDUuMi4zCj4+IMKgIFBZVEhPTl9ESkFOR09fU09VUkNF
ID0gZGphbmdvLSQoUFlUSE9OX0RKQU5HT19WRVJTSU9OKS50YXIuZ3oKPj4gwqAgIyBUaGUgb2Zm
aWNpYWwgRGphbmdvIHNpdGUgaGFzIGFuIHVucHJhY3RpY2FsIFVSTAo+PiAtUFlUSE9OX0RKQU5H
T19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnLyAKPj4gcGFja2FnZXMvMzkv
MTcvNDU2N2VlMTJiYjg0MTE0YzU0NGQ1YzRhNzkyZTcyMjZkYjUxN2FjNzhmNTUyMTExZTlkYzYy
ZDFkZTE0Cj4+ICtQWVRIT05fREpBTkdPX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3Rl
ZC5vcmcvcGFja2FnZXMvYzYvIAo+PiBhZi83N2I0MDM5MjYwMjVkYzZmN2ZkN2IzMTI1NjM5NGQ2
NDM0Njk0MTg5NjVlYjUyOGVhYjQ1ZDA1MDUzNTgKPj4gwqAgUFlUSE9OX0RKQU5HT19MSUNFTlNF
ID0gQlNELTMtQ2xhdXNlLCBNSVQgKGpxdWVyeSwgdXRpbHMvYXJjaGl2ZS5weSksIEJTRC0yLSAK
Pj4gQ2xhdXNlIChpbmxpbmVzLmpzKQo+PiDCoCBQWVRIT05fREpBTkdPX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFIFwKPj4gwqDCoMKgwqDCoCBkamFuZ28vY29udHJpYi9naXMvbWVhc3VyZS5weSBc
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
