Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114EAC7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8511C417B2;
	Sun, 11 Jun 2023 13:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8511C417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KioJCAg9vFRt; Sun, 11 Jun 2023 13:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3815B417B3;
	Sun, 11 Jun 2023 13:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3815B417B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E283D1BF2A3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA6A4417B3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA6A4417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WoMOBLCJ_ieI for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:32:43 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE0B417B2
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DE0B417B2
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:32:43 +0000 (UTC)
Received: from smtpclient.apple ([151.18.13.195])
 by Aruba Outgoing Smtp  with ESMTPA
 id 8L4YqAyaBhMrJ8L4YqChLd; Sun, 11 Jun 2023 15:25:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 11 Jun 2023 15:25:33 +0200
Message-Id: <EAF7E6E8-93D3-4272-9A0F-8ED956596F05@benettiengineering.com>
References: <20230611075148.327954-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230611075148.327954-1-bernd.kuhls@t-online.de>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailer: iPhone Mail (20F66)
X-CMAE-Envelope: MS4xfA8+rFKdUSDuoaWdNmkiYhsSLR7uAZwvAuaKEZXFufjyCwX/3jzmX0zcix1ZiqtYiEeh2Dy0k1RrVeyJ94Xbzfgn3SM4u3QcvxBE2DOB0PWVFdJiBB+O
 ggA58IFCNT+HznnmCF+Cndl642Drn7U8se2YuCsWqMVYtyKLKoKYGmJpFKiN/tQXUb3Pfhteg2kAFu9WSVdwHyPTZaqZ9r7kFuF9KNVk23c2fCVr6b5PjkZy
 9XCmjFiIT5aw1eNxOHsmzXiDGcHw/TN9x2Rm/lu4nP9WMpsNXp3qFEddtDX7Nkq9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686489935; bh=xmQnedkVFpCsl22sedYf5VDf5MQTDgVyIHy+7FTbIEA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Fun63iZh4fDN21m3uG0vJA30VTtg6y815M05ykhvErouNDUgtmXmRkHiJRLeDUH+r
 iRJPrzg96FvZGXZ/syZhIus4Z3SZMVJANRefCpYZxTXNuOU52tfb7DudJvLaj2m8OW
 2hCQOUmJEbHX6nxo60BYVKVxKVEYLTGwcQV1EyzPV27BY2dy4sSi40aUGpX8bcZAd3
 1V2PoqUWlpLxSAJOw6557oevloJ1f2A1m3rk3olkgsduGOGE8QHHg7gnfb0b5Urd/r
 F3wKp4XGkArEthVsG8Yn0e+b+fG6LSYb61Q77gmX7x5XVcOD/pvx3JHwCu4GPqj+qn
 95UE0MzKtxD1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Fun63iZh
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix static build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgo+IElsIGdpb3JubyAxMSBnaXUgMjAyMywgYWxsZSBvcmUgMDk6NTIsIEJlcm5k
IEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4gaGEgc2NyaXR0bzoKPiAKPiDvu79GaXhl
czoKPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9mMTcvZjE3YTU1NGM4
NmYwYjI0MzI3YjQ5ZmRjNzU2MTJjYzEzM2YxMjllZC8KPiAKPiBmOWRjNGJhYjlmNDU3NmVlZDNh
MjJjYTc1MTdiZmM4OGQ5ODEyYzM0IGJ1bXBlZCBuZnMtdXRpbHMgdG8gdmVyc2lvbgo+IDIuNi4z
IHdoaWNoIGluY2x1ZGVzIHRoZSBhZGRpdGlvbiBvZiB0aGUgdHdvIGZpbGVzIHBhdGNoZWQgaGVy
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUu
ZGU+Cj4gLS0tCj4gQWZ0ZXIgdHJ5aW5nIGZvciBhbiBob3VyIHRvIHJlZ2lzdGVyIGFuIGFjY291
bnQgdXBzdHJlYW0gSSBnYXZlIHVwCj4gYmVjYXVzZSBhbGwgbXkgcHVibGljIG1haWwgYWNjb3Vu
dHMgd2VyZSByZWplY3RlZC4gU28gSSB3YXMgdW5hYmxlIHRvCj4gc2VuZCB0aGUgcGF0Y2ggdXBz
dHJlYW0uCgpUaGFua3MgYSBsb3QgZm9yIHByb3ZpZGluZyBzdWNoIHBhdGNoLiBJIHdpbGwgc2Vu
ZCBpdCB0byB0aGVpciBNYWlsaW5nIExpc3QgYWZ0ZXIgZ2l2aW5nIGEgdHJ5LgpMYXN0IGRheXMg
SeKAmXZlIHNlZW4gdGhlaXIgZ2l0IHJlcG8gZG93biB0b28gYW5kIGluIGdlbmVyYWwgaXTigJlz
IHVuc3RhYmxlLgoKR2l1bGlvCgo+IAo+IC4uLi1ndWFyZC1kbGZjbi5oLWluY2x1ZGUtd2l0aC1I
QVZFX0RMRi5wYXRjaCB8IDQ0ICsrKysrKysrKysrKysrKysrKysKPiAxIGZpbGUgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25mcy11dGlscy8w
MDAyLXN1cHBvcnQtcmVleHBvcnQtZ3VhcmQtZGxmY24uaC1pbmNsdWRlLXdpdGgtSEFWRV9ETEYu
cGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZnMtdXRpbHMvMDAwMi1zdXBwb3J0LXJl
ZXhwb3J0LWd1YXJkLWRsZmNuLmgtaW5jbHVkZS13aXRoLUhBVkVfRExGLnBhdGNoIGIvcGFja2Fn
ZS9uZnMtdXRpbHMvMDAwMi1zdXBwb3J0LXJlZXhwb3J0LWd1YXJkLWRsZmNuLmgtaW5jbHVkZS13
aXRoLUhBVkVfRExGLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi4zYWY0Yjc1NjIzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbmZzLXV0aWxz
LzAwMDItc3VwcG9ydC1yZWV4cG9ydC1ndWFyZC1kbGZjbi5oLWluY2x1ZGUtd2l0aC1IQVZFX0RM
Ri5wYXRjaAo+IEBAIC0wLDAgKzEsNDQgQEAKPiArRnJvbSAyNzRlNGQyMTJjMzAxODMyNDJlNDhi
NjM5ODg5ODY1ODE5ZjNhYzMzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBCZXJu
ZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+Cj4gK0RhdGU6IFN1biwgMTEgSnVuIDIw
MjMgMDg6NTc6MTEgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBzdXBwb3J0L3JlZXhwb3J0OiBn
dWFyZCBkbGZjbi5oIGluY2x1ZGUgd2l0aCBIQVZFX0RMRkNOX0gKPiArCj4gK1Vwc3RyZWFtOiBw
ZW5kaW5nIHVwbG9hZAo+ICsKPiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kLmt1
aGxzQHQtb25saW5lLmRlPgo+ICstLS0KPiArIHN1cHBvcnQvcmVleHBvcnQvZnNpZGQuYyAgICB8
IDIgKysKPiArIHN1cHBvcnQvcmVleHBvcnQvcmVleHBvcnQuYyB8IDIgKysKPiArIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3VwcG9ydC9yZWV4
cG9ydC9mc2lkZC5jIGIvc3VwcG9ydC9yZWV4cG9ydC9mc2lkZC5jCj4gK2luZGV4IDM3NjQ5ZDA2
Li5kNGIyNDVlOCAxMDA2NDQKPiArLS0tIGEvc3VwcG9ydC9yZWV4cG9ydC9mc2lkZC5jCj4gKysr
KyBiL3N1cHBvcnQvcmVleHBvcnQvZnNpZGQuYwo+ICtAQCAtMyw3ICszLDkgQEAKPiArICNlbmRp
Zgo+ICsgCj4gKyAjaW5jbHVkZSA8YXNzZXJ0Lmg+Cj4gKysjaWZkZWYgSEFWRV9ETEZDTl9ICj4g
KyAjaW5jbHVkZSA8ZGxmY24uaD4KPiArKyNlbmRpZgo+ICsgI2luY2x1ZGUgPGV2ZW50Mi9ldmVu
dC5oPgo+ICsgI2luY2x1ZGUgPGxpbWl0cy5oPgo+ICsgI2luY2x1ZGUgPHN0ZGludC5oPgo+ICtk
aWZmIC0tZ2l0IGEvc3VwcG9ydC9yZWV4cG9ydC9yZWV4cG9ydC5jIGIvc3VwcG9ydC9yZWV4cG9y
dC9yZWV4cG9ydC5jCj4gK2luZGV4IGQ1OTdhMmY3Li5kOWE3MDBhZiAxMDA2NDQKPiArLS0tIGEv
c3VwcG9ydC9yZWV4cG9ydC9yZWV4cG9ydC5jCj4gKysrKyBiL3N1cHBvcnQvcmVleHBvcnQvcmVl
eHBvcnQuYwo+ICtAQCAtMiw3ICsyLDkgQEAKPiArICNpbmNsdWRlIDxjb25maWcuaD4KPiArICNl
bmRpZgo+ICsgCj4gKysjaWZkZWYgSEFWRV9ETEZDTl9ICj4gKyAjaW5jbHVkZSA8ZGxmY24uaD4K
PiArKyNlbmRpZgo+ICsgI2luY2x1ZGUgPHN0ZGludC5oPgo+ICsgI2luY2x1ZGUgPHN0ZGlvLmg+
Cj4gKyAjaW5jbHVkZSA8c3lzL3JhbmRvbS5oPgo+ICstLSAKPiArMi4zOS4yCj4gKwo+IC0tIAo+
IDIuMzkuMgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
