Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632BDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B5A401B5;
	Sun, 13 Feb 2022 16:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JT1PBrHbfmJJ; Sun, 13 Feb 2022 16:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372DA40110;
	Sun, 13 Feb 2022 16:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A99281BF421
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6AAE8183D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtLrmyhk0nQu for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:37:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2B4E81836
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:37:53 +0000 (UTC)
Received: from smtpclient.apple ([151.46.64.65])
 by Aruba Outgoing Smtp  with ESMTPA
 id JHsmnywc9ks1JJHsnn0XVA; Sun, 13 Feb 2022 17:37:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644770273; bh=jfpxOMffw5+IEF++1Api54/tZ1rXpFIssn5QjFU/cck=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=YsY92NbN57IG0Irg0sllqXVgu6rEbMnj71Im6JQrkLsy/JZFIHWfALeApwDq5AI66
 h/uldjSZd5jOqa40GpKnwE3UuW+d74t5Xv8ziQ8dAM/Z/K+gzPR2jKVjqJcDzSFMw7
 fIoOq7AFrmovgcw8757jom5gARi/SvtLgRJFogH/Dx5e7iFdt7MssYCdduzgJpA7+K
 CKvzokn6Lufz3K3SZ8AKOT/1JFsF4CDm8qmQxrOjbRdoffIRWlI7GRr2/J+kDdSy3L
 IrimQjj2dqUQQx/Z3GXgao/jK1HahE01zYABFEOKIqZst1CgWNNV9uBJuQwGVvPphV
 IjyZs0cgUhhKg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 13 Feb 2022 17:37:52 +0100
Message-Id: <0C0DD5FD-73D1-4DBB-AE31-4D8DE518D00B@benettiengineering.com>
References: <54fda3e6-1188-f104-4c6d-f1686df77bcd@mind.be>
In-Reply-To: <54fda3e6-1188-f104-4c6d-f1686df77bcd@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfDVKXfaRCbs199Z1n/EtoLmrosGYEivrq1P3X/3PjWG0I1fR6+fAXyGjyHKAgD4bG0/EURoYcMi1gHJz7W85jZfyxrRzXdBIAi4Hv7OvX6n36MrvfJuR
 ZKzygqyDPGJEmYXSFSJXmWq1Ncj3QtjWCC3AIMe6BSpPPyzsF4bJfsRA6BjBBZr9RgDmVeX8s2h7LaFydxgdBq2+JrKBE4jU6fcEHHJepaWSNsZZY8VHIJ07
 O+rFkMQ4kbrC2C8DhVhXa0aTNPkHMBuPVld96sqJrlM=
Subject: Re: [Buildroot] [PATCH] docs/manual: fix "+size = +" latex
 formatting
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEzIGZlYiAyMDIyLCBhbGxlIG9yZSAxNjoyOSwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+IAo+IO+7vwo+IAo+PiBPbiAwNi8w
Mi8yMDIyIDEwOjU0LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gCj4g
Tm90IHN1cmUgd2h5IHlvdSBzYXkgImxhdGV4IGZvcm1hdHRpbmciLCBidXQgT0suCgo6LSkgQXNj
aWktZG9jLCBJIHdhcyBzdXJlIG1hbnVhbCB3YXMgd3JpdHRlbiBpbiBsYXRleCBidXQgaXTigJlz
IG5vdC4KClRoYW5rcwpHaXVsaW8KCj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAKPiBS
ZWdhcmRzLAo+IEFybm91dAo+IAo+PiAtLS0KPj4gIGRvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMu
dHh0IHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC93cml0aW5nLXJ1bGVzLnR4dCBiL2RvY3Mv
bWFudWFsL3dyaXRpbmctcnVsZXMudHh0Cj4+IGluZGV4IDNlZWMwOTVkMGUuLjA2Zjg3NTU2ZWQg
MTAwNjQ0Cj4+IC0tLSBhL2RvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMudHh0Cj4+ICsrKyBiL2Rv
Y3MvbWFudWFsL3dyaXRpbmctcnVsZXMudHh0Cj4+IEBAIC0xODQsNyArMTg0LDcgQEAgaW1hZ2Ug
c2RpbWFnZS5pbWcgewo+PiAgKiBFdmVyeSBub2RlKCtzZWN0aW9uKywgK3BhcnRpdGlvbissICtm
aWxlKywgK3N1Ym5vZGUrKSBtdXN0IGhhdmUgYW4gb3Blbgo+PiAgICBjdXJseSBicmFja2V0IG9u
IHRoZSBzYW1lIGxpbmUgb2YgdGhlIG5vZGUncyBuYW1lLCB3aGlsZSB0aGUgY2xvc2luZyBvbmUK
Pj4gICAgbXVzdCBiZSBvbiBhIG5ld2xpbmUgYW5kIGFmdGVyIGl0IGEgbmV3bGluZSBtdXN0IGJl
IGFkZGVkIGV4Y2VwdCBmb3IgdGhlCj4+IC0gIGxhc3Qgb25lIG5vZGUuIFNhbWUgZ29lcyBmb3Ig
aXRzIG9wdGlvbiwgZm9yIGV4YW1wbGUgb3B0aW9uICtzaXplID0gKy4KPj4gKyAgbGFzdCBvbmUg
bm9kZS4gU2FtZSBnb2VzIGZvciBpdHMgb3B0aW9uLCBmb3IgZXhhbXBsZSBvcHRpb24gK3NpemUr
ICs9Ky4KPj4gICAgKiBFdmVyeSArb3B0aW9uKyhpLmUuICtpbWFnZSssICtvZmZzZXQrLCArc2l6
ZSspIG11c3QgaGF2ZSB0aGUgKz0rCj4+ICAgIGFzc2lnbm1lbnQgb25lIHNwYWNlIGZyb20gaXQg
YW5kIG9uZSBzcGFjZSBmcm9tIHRoZSB2YWx1ZSBzcGVjaWZpZWQuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
