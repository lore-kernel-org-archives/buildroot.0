Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6AFC369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD92E61B26;
	Wed, 16 Apr 2025 21:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-lxquHXmcvq; Wed, 16 Apr 2025 21:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1EB960A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1EB960A51;
	Wed, 16 Apr 2025 21:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A22A159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4065783365
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QD4X-mSwH81j for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51E1381F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E1381F49
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51E1381F49
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:22:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B6DD1C00C0; Wed, 16 Apr 2025 23:22:11 +0200 (CEST)
Message-ID: <39d2620d-ce4b-4475-8b85-4b2486501208@rnout.be>
Date: Wed, 16 Apr 2025 23:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20250330142842.2909327-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20250330142842.2909327-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838531; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PawHRPqT/i1ZXX1YuBmktD4Z0Ljls28K37aq3kKshqM=;
 b=aEEEXfvlsOB7DZvjx+hDKoyL41XLANYR0Gv19ldSS+EDYi77JZ5cnFzFEI2lNj8gRf03Le
 FApV4HbnxJAmysqzWqAr+nzT2AH2J3eghtjGUGTiJTvp4/QU8tgjkDAVXnAH4LEMTuYby3
 JghDh0CZFTXEHd2HDDn5qkSvVX2qCcOza0CUcZ+jQcAGPbRYEHJhvuSb+1it3PbUqsUnOv
 wPbkE+WoJpXHxrXXu5RoG72RYl10kCBpKGOvehEI/Ih8mBzAvci96+RalXAtQQFmKYeR1F
 dR2+iBo3kFUkSHHiVIGYriEkCZNWUfIEcSH9RcFO5z88So6drGZsBs/ZOt0nxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.5
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

Ck9uIDMwLzAzLzIwMjUgMTY6MjgsIFRob21hcyBEZXZvb2dkdCB3cm90ZToKPiBOZXdzOgo+IC0g
aHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJzb3VwLzMuNi9saWJzb3VwLTMu
Ni4zLm5ld3MKPiAtIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8z
LjYvbGlic291cC0zLjYuNC5uZXdzCj4gLSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3Vy
Y2VzL2xpYnNvdXAvMy42L2xpYnNvdXAtMy42LjUubmV3cwo+Cj4gQWxzbyBkcm9wIHRoZSBrcmI1
X2NvbmZpZywgd2hpY2ggd2FzIGRyb3BwZWQgaW4gY29tbWl0Cj4gaHR0cHM6Ly9naXRsYWIuZ25v
bWUub3JnL0dOT01FL2xpYnNvdXAvLS9jb21taXQvMTIzZWIwMjliZjNmYTA4ZjNjNDU2NzhjMGE0
M2FlNGI5MzBlNjYzMS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFz
QGRldm9vZ2R0LmNvbT4KCiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwgMjAyNC4xMS54IGFuZCAy
MDI0LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBhY2th
Z2UvbGlic291cDMvbGlic291cDMuaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS9saWJzb3VwMy9s
aWJzb3VwMy5tayAgIHwgNiArKy0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic291cDMvbGli
c291cDMuaGFzaCBiL3BhY2thZ2UvbGlic291cDMvbGlic291cDMuaGFzaAo+IGluZGV4IDIzYWYz
NDc5MDMuLjMyYWE3MzgyZmEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJzb3VwMy9saWJzb3Vw
My5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5oYXNoCj4gQEAgLTEsNCAr
MSw0IEBACj4gLSMgRnJvbSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnNv
dXAvMy42L2xpYnNvdXAtMy42LjEuc2hhMjU2c3VtCj4gLXNoYTI1NiAgY2ViMWYxYWEyYmRkNzNi
MmNkODE1OWQzOTk4Yzk2YzU1ZWYwOTdlZjE1ZTRiNGYzNjAyOTIwOWZhMThhZjgzOCAgbGlic291
cC0zLjYuMS50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJj
ZXMvbGlic291cC8zLjYvbGlic291cC0zLjYuNS5zaGEyNTZzdW0KPiArc2hhMjU2ICA2ODkxNzY1
YWFjM2U5NDkwMTc5NDVjM2VhZWJkOGNjODIxNmRmNzcyNDU2ZGM5ZjQ2MDk3NmZiZGI3YWRhMjM0
ICBsaWJzb3VwLTMuNi41LnRhci54ego+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgIHNoYTI1
NiAgYjc5OTMyMjUxMDRkOTBkZGQ4MDI0ZmQ4MzhmYWYzMDBiZWE1ZTgzZDkxMjAzZWFiOThlMjk1
MTJhY2ViZDY5YyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNvdXAzL2xpYnNv
dXAzLm1rIGIvcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5tawo+IGluZGV4IGYyZjk2YzJkZWYu
LjBkYjU4N2E5M2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5tawo+
ICsrKyBiL3BhY2thZ2UvbGlic291cDMvbGlic291cDMubWsKPiBAQCAtNSw3ICs1LDcgQEAKPiAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAgIExJQlNPVVAzX1ZFUlNJT05fTUFKT1Ig
PSAzLjYKPiAtTElCU09VUDNfVkVSU0lPTiA9ICQoTElCU09VUDNfVkVSU0lPTl9NQUpPUikuMQo+
ICtMSUJTT1VQM19WRVJTSU9OID0gJChMSUJTT1VQM19WRVJTSU9OX01BSk9SKS41Cj4gICBMSUJT
T1VQM19TT1VSQ0UgPSBsaWJzb3VwLSQoTElCU09VUDNfVkVSU0lPTikudGFyLnh6Cj4gICBMSUJT
T1VQM19TSVRFID0gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJzb3VwLyQo
TElCU09VUDNfVkVSU0lPTl9NQUpPUikKPiAgIExJQlNPVVAzX0xJQ0VOU0UgPSBMR1BMLTIuMCsK
PiBAQCAtNDUsOSArNDUsNyBAQCBMSUJTT1VQM19DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9u
PWRpc2FibGVkIC1EdmFwaT1kaXNhYmxlZAo+ICAgZW5kaWYKPiAgIAo+ICAgaWZlcSAoJChCUjJf
UEFDS0FHRV9MSUJLUkI1KSx5KQo+IC1MSUJTT1VQM19DT05GX09QVFMgKz0gXAo+IC0JLURnc3Nh
cGk9ZW5hYmxlZCBcCj4gLQktRGtyYjVfY29uZmlnPSQoU1RBR0lOR19ESVIpL3Vzci9iaW4va3Ji
NS1jb25maWcKPiArTElCU09VUDNfQ09ORl9PUFRTICs9IC1EZ3NzYXBpPWVuYWJsZWQKPiAgIExJ
QlNPVVAzX0RFUEVOREVOQ0lFUyArPSBsaWJrcmI1Cj4gICBlbHNlCj4gICBMSUJTT1VQM19DT05G
X09QVFMgKz0gLURnc3NhcGk9ZGlzYWJsZWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
