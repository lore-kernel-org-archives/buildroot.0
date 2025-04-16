Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14950C369CA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5FB60D6F;
	Wed, 16 Apr 2025 20:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCT7ZqUBF7mc; Wed, 16 Apr 2025 20:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D4B66101C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4B66101C;
	Wed, 16 Apr 2025 20:59:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C3C5159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CD8460B22
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05do3Q8WWQjm for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C21560A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C21560A51
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C21560A51
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 637D51C0AEC; Wed, 16 Apr 2025 22:59:26 +0200 (CEST)
Message-ID: <c1e71011-07ae-44e6-a654-c996a364475f@rnout.be>
Date: Wed, 16 Apr 2025 22:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250217114018.1876535-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250217114018.1876535-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837166; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bAhP/tXfmTqwJrB76BdV9pWLmw1p67SPpgpvodXKrhw=;
 b=FlWRlOPs3leQJDP3grJ61Vjn4d3CuHvt/avCgEVwzOtip7soeXIn4Qne/kf40X1gc4yCNa
 MtAjTTSyW4VTirfEgPsACvlTd5CT4aGaQKSgXk2koH4WEFAxzledr9HxVxO61m7DVEPPbH
 ujl3EGYNUF+QcQq0lRLBuNw1bQtzqpY6KusfqclKJOXRuhNUA1WUhw6Ksr7Z4F/bqego/q
 TtMXNnXt1aS6bn6KozjaBPOiOVttlS2J+oPWVTjQJ8S7uh8r/NfrI1zC5O+7ShGBsrwKml
 O6f04ss/CeHqyz9KCMEwmlCLiWM7s7Qd7rnSN/WPkjNWdA1b1gZJ9j1KrYWJdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.8.2
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

Ck9uIDE3LzAyLzIwMjUgMTI6NDAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKIMKgQXBwbGll
ZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAg
IHBhY2thZ2UvcHl0aG9uLW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4uaGFzaCB8IDIgKy0KPiAgIHBh
Y2thZ2UvcHl0aG9uLW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4ubWsgICB8IDQgKystLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5oYXNoIGIvcGFja2Fn
ZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5oYXNoCj4gaW5kZXggMWIyOTUxMjdmNi4u
MzRlMGYxZGEzMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhvbi1t
YXR1cmluLmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhvbi1tYXR1cmlu
Lmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIHZl
bmRvcmluZwo+IC1zaGEyNTYgIGRhNGFiNWE4NGMzNWQwYWIwMGMwZmI2Mzk3NWYyNWM0OTdkNjU3
MGRjZGVhYWUwZWMwZjdkOWY3MGYxZDUzODIgIHB5dGhvbi1tYXR1cmluLTEuOC4xLWNhcmdvMi50
YXIuZ3oKPiArc2hhMjU2ICAwZThmZGNkNmNmM2Y0ZjdlMDE4YTYyNGUzNWI3MzFkMDA5NzFiMDlh
NzE1MTVlNjEwOGRmNDM0MDdjZDY4NGViICBweXRob24tbWF0dXJpbi0xLjguMi1jYXJnbzIudGFy
Lmd6Cj4gICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICAgc2hhMjU2ICBh
NjBlZWE4MTc1MTQ1MzE2NjhkN2UwMDc2NTczMTQ0OWZlMTRkMDU5ZDMyNDllMGJjOTNiMzZkZTQ1
Zjc1OWYyICBsaWNlbnNlLWFwYWNoZQo+ICAgc2hhMjU2ICBlYTc4ODJjNTU5NzMzNzY2YWQwODM0
M2JkZTFkMWVjODBhNDk2N2MwM2E3MzhmYjhlMDA1OGVmNjI4OWY3YjdjICBsaWNlbnNlLW1pdAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhvbi1tYXR1cmluLm1rIGIv
cGFja2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5tawo+IGluZGV4IGI5ODE2ZTIx
MTkuLjZhOTliYmYzNzYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tbWF0dXJpbi9weXRo
b24tbWF0dXJpbi5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLW1hdHVyaW4vcHl0aG9uLW1hdHVy
aW4ubWsKPiBAQCAtNCw5ICs0LDkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gICAKPiAtUFlUSE9OX01BVFVSSU5fVkVSU0lPTiA9IDEuOC4xCj4gK1BZVEhPTl9NQVRVUklO
X1ZFUlNJT04gPSAxLjguMgo+ICAgUFlUSE9OX01BVFVSSU5fU09VUkNFX1BZUEkgPSBtYXR1cmlu
LSQoUFlUSE9OX01BVFVSSU5fVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9NQVRVUklOX1NJVEVf
UFlQSSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy85YS8wOC9jY2Iw
ZjkxNzcyMmEzNWFiMGQ3NThiZTliYjVlZGFmNjQ1YzNhM2Q2MTcwMDYxZjEwZDM5NmVjZDI3M2YK
PiArUFlUSE9OX01BVFVSSU5fU0lURV9QWVBJID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2UwLzhmLzY5Nzg0MjdjZTNmNzJiMTg5MDEyZTE3MzFkMWQyZDI3YjMxNTFj
YWE3NDE2NjZjOTA1MzIwZTBhMzY2Mgo+ICAgUFlUSE9OX01BVFVSSU5fU0lURSA9ICQoUFlUSE9O
X01BVFVSSU5fU0lURV9QWVBJKS8kKFBZVEhPTl9NQVRVUklOX1NPVVJDRV9QWVBJKT9idWlsZHJv
b3QtcGF0aD1maWxlbmFtZQo+ICAgUFlUSE9OX01BVFVSSU5fU0VUVVBfVFlQRSA9IHNldHVwdG9v
bHMtcnVzdAo+ICAgUFlUSE9OX01BVFVSSU5fTElDRU5TRSA9IEFwYWNoZS0yLjAgb3IgTUlUCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
