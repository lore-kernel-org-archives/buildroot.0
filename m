Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD3C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 18:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D3C610C8;
	Thu,  1 Dec 2022 18:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D3C610C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0e7Qyilk6E9; Thu,  1 Dec 2022 18:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98D260777;
	Thu,  1 Dec 2022 18:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98D260777
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A74821BF286
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 18:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FEE8607C1
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 18:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FEE8607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuAWzckXpTDS for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 18:33:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D9C60777
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86D9C60777
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 18:33:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95C17D6E;
 Thu,  1 Dec 2022 10:33:56 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.6.188])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3741A3F73B;
 Thu,  1 Dec 2022 10:33:49 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 19:33:34 +0100
Message-Id: <20221201183337.1588407-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3 next] bump edk2 version
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGUgaW50ZW5kIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIGlzICJqdXN0IiB0byBidW1wIHRo
ZSBlZGsyIHZlcnNpb24uCgpUbyBkbyB0aGF0LCBidW1waW5nIHRoZSBlZGsyLXBsYXRmb3JtcyB2
ZXJzaW9uIGluIHN5bmMgaXMgbmVjZXNzYXJ5LgoKQSBzbWFsbCBkaWZmaWN1bHR5IGlzIHRoYXQg
c29tZSBNYXJ2ZWxsIGZpbGVzLCB3aGljaCBhcmUgbmVjZXNzYXJ5IGZvciB0aGUgZWRrMgpNQUND
SElBVE9iaW4gcmVjaXBlLCBoYXZlIG1vdmVkIG91dCBvZiB0aGUgZWRrMi1wbGF0Zm9ybXMgcmVw
b3NpdG9yeSBpbnRvIHRoZQplZGsyLW5vbi1vc2kgcmVwb3NpdG9yeS4KVGhlIHByb3Bvc2FsIGlz
IHRvIGFkZCBhIG5ldyBlZGsyLW5vbi1vc2kgcGFja2FnZSwgd2hpY2ggaXMgaW5zcGlyZWQgZnJv
bSB0aGUKZWRrMi1wbGF0Zm9ybXMgcGFja2FnZSBjcmVhdGVkIGJ5IERpY2suCkJlY2F1c2UgbGlj
ZW5zZXMgaW4gdGhlIGVkazItbm9uLW9zaSByZXBvc2l0b3J5IHZhcnkgcGVyLXBsYXRmb3JtLCB3
ZSBjb3B5IG9ubHkKdGhlIE1hcnZlbGwgQXJtYWRhIERldmljZXRyZWUgZmlsZXMgd2UgbmVlZCBm
b3IgdGhlIE1BQ0NISUFUT2JpbiwgZm9yIHRoZSBzYWtlCm9mIGxlZ2FsLWluZm8gc2ltcGxpY2l0
eSwgYnV0IHdlIHByZXBhcmUgdG8gYWRkIG1vcmUgaW4gdGhlIGZ1dHVyZS4KCkRpY2ssIGNhbiBJ
IGFsc28gYWRkIHlvdSB0byBERVZFTE9QRVJTIGZvciB0aGlzIG5ldyBlZGsyLW5vbi1vc2kgcGFj
a2FnZSwKcGxlYXNlPyBMZXQgbWUga25vdyBpZiB5b3UgYWdyZWUgYW5kIEkgd2lsbCByZS1zZW5k
LgoKT3RoZXIgYWx0ZXJuYXRpdmVzIHRvIGF2b2lkIGEgbmV3IHBhY2thZ2UgY291bGQgYmUgdG8g
c3dpdGNoIHRoZSBlZGsyCk1BQ0NISUFUT2JpbiByZWNpcGUgdG8gQUNQSSAoYnV0IGhvdyB3b3Vs
ZCB3ZSB0ZXN0PyksIG9yIHRvIGRyb3AgdGhlIHJlY2lwZQpjb21wbGV0ZWx5LCBhcyB0aGUgc29s
aWRydW5fbWFjY2hpYXRvYmluX2RlZmNvbmZpZyBpcyBub3QgdXNpbmcgZWRrMiBhbnl3YXkuIExl
dAptZSBrbm93IGlmIHRoaXMgaXMgcHJlZmVycmVkLgoKSW4gdGVybSBvZiB0ZXN0aW5nLCB0aGUg
cWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnLCB3aGljaCBpcyB1c2luZyBlZGsyLCBydW5zCmZp
bmUgb24gUWVtdS4KClRoZSBmb2xsb3dpbmcgY29tYmluYXRpb25zIG9mIGVkazIgcGxhdGZvcm1z
IGFuZCB0b29sY2hhaW5zIGJ1aWxkIG9rIChvciBza2lwKToKCiAgICAgICAgICBmdnAgICBhcm0t
YWFyY2g2NAogICAgICAgICBzYnNhICAgYm9vdGxpbi1hYXJjaDY0LWdsaWJjCiAgICAgICAgIHZp
cnQgICBib290bGluLXg4Ni02NC1nbGliYwogICAgICAgc2dpNTc1ICAgYm9vdGxpbi14ODYtNjQt
bXVzbAogICAgICBkZWZhdWx0IHggYm9vdGxpbi14ODYtNjQtdWNsaWJjCiAgICAgb3ZtZi14NjQg
ICBici1pMzg2LXBlbnRpdW0tbW14LW11c2wKICAgICBzb2xpZHJ1biAgIGJyLWkzODYtcGVudGl1
bTQtZnVsbAogICAgb3ZtZi1pMzg2ICAgbGluYXJvLWFhcmNoNjQKICAgIHNvY2lvbmV4dCAgIGxp
bmFyby1hYXJjaDY0LWJlCiAgdmlydC1rZXJuZWwKClRoZSBmb2xsb3dpbmcgcHl0aG9uIHRlc3Rz
IHJ1biBvazoKCiAgdGVzdHMuYm9vdC50ZXN0X2VkazIuVGVzdEVkazIKICB0ZXN0cy5ib290LnRl
c3RfZ3J1Yi5UZXN0R3J1YkFBcmNoNjRFRkkKICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1
Ylg4NjY0RUZJCiAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJpMzg2RUZJCiAgdGVzdHMu
ZnMudGVzdF9pc285NjYwLlRlc3RJc285NjYwR3J1YjJFRkkKICB0ZXN0cy5mcy50ZXN0X2lzbzk2
NjAuVGVzdElzbzk2NjBHcnViMkh5YnJpZAoKSWYgYW55b25lIGNhbiB0ZXN0IGVkazIgb24gYWN0
dWFsIGhhcmR3YXJlLCBmZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5CmFwcHJlY2lhdGVkLgoKVGhp
cyBwYXRjaCBzZXJpZXMgaXMgZm9yIHRoZSBgbmV4dCcgYnJhbmNoLCBwbGVhc2UuCgpCZXN0IHJl
Z2FyZHMsClZpbmNlbnQuCgoKVmluY2VudCBTdGVobMOpICgzKToKICBwYWNrYWdlL2VkazItcGxh
dGZvcm1zOiBidW1wIGluIHN5bmMgd2l0aCBlZGsyLXN0YWJsZTIwMjIwOAogIHBhY2thZ2UvZWRr
Mi1ub24tb3NpOiBuZXcgcGFja2FnZQogIGJvb3QvZWRrMjogYnVtcCB2ZXJzaW9uIHRvIGVkazIt
c3RhYmxlMjAyMjA4CgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogLi4uZVBrZy1Vc2JCdXNEeGUtZml4LU5PT1BULWJ1aWxkLWVycm9yLnBhdGNo
IHwgNDggLS0tLS0tLS0tLS0tLS0tLS0tLQogYm9vdC9lZGsyL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogYm9vdC9lZGsyL2VkazIuaGFzaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGJvb3QvZWRrMi9lZGsyLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA5ICsrLS0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvZWRrMi1ub24tb3NpL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICB8IDExICsrKysrCiBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kuaGFz
aCAgICAgICAgfCAgMyArKwogcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1rICAg
ICAgICAgIHwgMjkgKysrKysrKysrKysKIHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0
Zm9ybXMuaGFzaCAgICB8ICAyICstCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZv
cm1zLm1rICAgICAgfCAgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwg
NTQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgYm9vdC9lZGsyLzAwMDEtTWRlTW9k
dWxlUGtnLVVzYkJ1c0R4ZS1maXgtTk9PUFQtYnVpbGQtZXJyb3IucGF0Y2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kuaGFzaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5tawoKLS0gCjIuMzUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
