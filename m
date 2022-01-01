Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 16:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F3181463;
	Sat,  1 Jan 2022 16:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtVZwDYfX4AE; Sat,  1 Jan 2022 16:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D740281465;
	Sat,  1 Jan 2022 16:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C41ED1BF4E4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 16:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B309360B69
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 16:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5VfvOR-qJ7y for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 16:05:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD19A60A74
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 16:05:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c59:844e:fd99:5f73])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EC2142003C8;
 Sat,  1 Jan 2022 17:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641053140;
 bh=yQpzuS787it20c4Jq7BjhI5xlomKa5V9yCr9TYbrwyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ugX1h80q2qO1E3Y+g/IOyl2D8yIOopaStrWEjMN4inlesV+WdoO7M14tk3vuv/EkO
 SqDsNSW0df4tCnAXuEpjnavaso5toC/hBQOYPK0/Iz/JF173iODRwOlWWw+NRIC3dL
 Px21c70BoaNmFqtfbU2zt1DiDCxhLX4RueU3L9R+qauwyQYur6OERI6o7WvKGFujEb
 BU+ojxzw8ooBh29j+F3CGYRthX13zWxW0omCtLtaxfw9hjM25JgGuCYwWtQI2louoD
 o8zGdliKb7L2WdWwCtMNmlYXRrCcHa9J82X48MKyXzDs7LaD8auk1lZFKWtXhM/s64
 rGwVhVR9Sowag==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 17:05:33 +0100
Date: Sat, 1 Jan 2022 17:05:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20220101160533.GE2777@scaer>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
 <20211112131258.2671293-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112131258.2671293-3-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/5] package/ulog: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTExLTEyIDE0OjEyICswMTAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IFRoZSB1bG9nIGxpYnJhcnkgaXMgYSBtaW5pbWFsaXN0aWMgbG9nZ2luZyBs
aWJyYXJ5IGRlcml2ZWQgZnJvbQo+IEFuZHJvaWQgbG9nZ2VyLgo+IAo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9QYXJyb3QtRGV2ZWxvcGVycy91bG9nCj4gCj4gU2lnbmVkLW9mZi1ieTogSGVydmUgQ29k
aW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+ClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS91bG9nL3Vsb2cubWsgYi9wYWNrYWdlL3Vsb2cvdWxvZy5tawo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZmFiMTZlODBkOAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL3Vsb2cvdWxvZy5tawo+IEBAIC0wLDAgKzEsNDQgQEAKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHVsb2cKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICsKPiArVUxPR19WRVJTSU9OID0gMDM4OWQyNDMzNTIyNTVmNjE4MjMyNmRjY2Rh
ZTNkNTZkYWRjMDc4Zgo+ICtVTE9HX1NJVEUgPSAkKGNhbGwgZ2l0aHViLFBhcnJvdC1EZXZlbG9w
ZXJzLHVsb2csJChVTE9HX1ZFUlNJT04pKQo+ICtVTE9HX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4g
K1VMT0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArVUxPR19ERVBFTkRFTkNJRVMgPSBob3N0
LWFsY2hlbXkKPiArVUxPR19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiArCj4gK2RlZmluZSBVTE9H
X0JVSUxEX0NNRFMKPiArCSQoQUxDSEVNWV9UQVJHRVRfRU5WKSBcCj4gKwkJJChBTENIRU1ZX01B
S0UpIGxpYnVsb2cKPiArZW5kZWYKPiArCj4gK2RlZmluZSBVTE9HX0lOU1RBTExfU1RBVElDX0xJ
QlMKPiArCSQoSU5TVEFMTCkgLW0gNjQ0ICQoQEQpL2FsY2hlbXktb3V0L3N0YWdpbmcvdXNyL2xp
Yi9saWJ1bG9nLmEgJCgxKS91c3IvbGliLwo+ICtlbmRlZgoKU28sIGl0IGxvb2tzIGxpa2UgeW91
IGFyZSBhbHdheXMgZ29pbmcgdG8gaW5zdGFsbCB0aGUgc3RhdGljIGxpYnJhcnksCmJ1dCB0aGUg
cGFja2FnZSBkb2VzIG5vdCBoYXZlOiAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCgo+ICsK
PiArZGVmaW5lIFVMT0dfSU5TVEFMTF9IRUFERVJTCj4gKwljcCAtUmFmICQoQEQpL2xpYnVsb2cv
aW5jbHVkZS8qICQoMSkvdXNyL2luY2x1ZGUvCj4gK2VuZGVmCj4gKwo+ICtpZmVxICgkKEJSMl9T
VEFUSUNfTElCUyksKQo+ICtkZWZpbmUgVUxPR19JTlNUQUxMX1NIQVJFRF9MSUJTCj4gKwkkKElO
U1RBTEwpIC1tIDc1NSAkKEBEKS9hbGNoZW15LW91dC9zdGFnaW5nL3Vzci9saWIvbGlidWxvZy5z
byogJCgxKS91c3IvbGliLwoKQWx0aG91Z2ggaXQgaXMgdmVyeSBpbXByb2JhYmxlIHRoYXQgdGhl
IGRlc3RpbmF0aW9uIGRpcmVjdG9yeSBkb2VzIG5vdAphbHJlYWR5IGV4aXN0LCB0aGF0IGlzIHN0
aWxsIGEgcG9zc2liaWxpdHksIGVzcGVjaWFsbHkgaW4gdGFyZ2V0Ly4gQW5kCmZvciBjb25zaXN0
ZW5jeSB3aXRoIGFsbCB0aGUgb3RoZXIgcGFja2FnZXMsIHlvdSBtdXN0IGNyZWF0ZSB0aGUKZGVz
dGluYXRpb24gZGlyZWN0b3J5IGZpcnN0IGJlZm9yZSB5b3Ugc3RhcnQgY29weWluZyBtdWx0aXBs
ZSBmaWxlcyBpbgp0aGVyZS4KCkFsc28gZm9yIGNvbnNpc3RlbmN5LCB1c2UgZWl0aGVyICdjcCcg
b3IgJyQoSU5TVEFMTCknLCBub3QgYm90aCAsIGluIHRoZQpzYW1lIC5tayAoeW91IHVzZWQgJ2Nw
JyBmb3IgaGVhZGVycywgYW5kICckKElOU1RBTEwpJyBmb3IgbGlicywgYWx0aG91Z2gKSSBkb24n
dCBzZWUgYSByZWFzb24gbm90IHRvIHVzZSB0aGVtIGNvbnNpc3RlbnRseSkuCgpPaCwgYW5kIHNo
YXJlZCBsaWJyYXJpZXMgZG8gbm90IG5lZWQgdG8gYmUgK3gsIHNvIC1tIDY0NCBpcyBlbm91Z2gu
Cgo+ICtlbmRlZgo+ICtlbmRpZgo+ICsKPiArZGVmaW5lIFVMT0dfSU5TVEFMTF9UQVJHRVRfQ01E
Uwo+ICsJJChjYWxsIFVMT0dfSU5TVEFMTF9TSEFSRURfTElCUywgJChUQVJHRVRfRElSKSkKPiAr
ZW5kZWYKPiArCj4gK2RlZmluZSBVTE9HX0lOU1RBTExfU1RBR0lOR19DTURTCj4gKwkkKGNhbGwg
VUxPR19JTlNUQUxMX1NUQVRJQ19MSUJTLCAkKFNUQUdJTkdfRElSKSkKPiArCSQoY2FsbCBVTE9H
X0lOU1RBTExfU0hBUkVEX0xJQlMsICQoU1RBR0lOR19ESVIpKQo+ICsJJChjYWxsIFVMT0dfSU5T
VEFMTF9IRUFERVJTLCAkKFNUQUdJTkdfRElSKSkKPiArCSQoY2FsbCBBTENIRU1ZX0lOU1RBTExf
TElCX1NES19GSUxFLCB1bG9nLCBsaWJ1bG9nLCBsaWJ1bG9nLnNvKQoKU28sIHdoYXQgaGFwcGVu
cyB3aXRoIEJSMl9TVEFUSUNfTElCUz15PyBUaGUgLnNvIHdvdWxkIG5vdCBleGlzdCBpbiB0aGF0
CmNhc2UsIHdvdWxkIGl0PyBCdXQgdGhlbiwgdGhpcyBpcyB3aGF0IHdvdWxkIGJlIHJlZ2lzdGVy
ZWQgaW4gdGhlCmF0b20ubWsuLi4KCkFuZCB3aXRoIEJSMl9TVEFUSUNfTElCUyBub3Qgc2V0LCB0
aGVuIHRoZSAuYSBzaG91bGQgbm90IGJlIGJ1aWx0IChvciBhdApsZWFzdCBub3QgaW5zdGFsbGVk
ISksIHlldCB0aGUgaW5zdGFsbGF0aW9uIG9mIHRoZSBzdGF0aWMgbGliIGlzCnVuY29uZGl0aW9u
YWwgKGFuZCBzZWUgdGhlIGZpcnN0IGNvbW1lbnQgdG9vKS4KCkl0IGlzIGRpZmZpY3VsdCB0byB1
bmRlcnN0YW5kIGlmIGFsbCBvZiB0aGUgc3RhdGljLXNoYXJlZCBjb21iaW5hdGlvbnMKYXJlIHN1
cHBvcnRlZCwgc28gY291bGQgeW91IHBsZWFzZSBjaGVjay9jbGFyaWZ5IHRoaXM/CgpJZiB0aGUg
dGhyZWUgY29tYmluYXRpb25zIGFyZSBpbmRlZWQgc3VwcG9ydGVkLCB0aGVuIGJvdGggdGhlIHNo
YXJlZCBhbmQKdGhlIHN0YWljIGluc3RhbGwgbWFjcm9zIHNob3VsZCBiZSBjb25kaXRpb25hbC4g
T3RoZXJ3aXNlLCBwcm9wZXIgZ3VhcmRzCnNob3VsZCBiZSBhZGRlZCBpbiB0aGUgQ29uZmlnLmlu
LgoKVGhvc2UgY29tbWVudHMgYXBwbHkgdG8gYWxsIHRoZSBwYWtjYWdlcyBpbiB0aGlzIHNlcmll
cy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICtlbmRlZgo+ICsKPiArJChldmFsICQoZ2Vu
ZXJpYy1wYWNrYWdlKSkKPiAtLSAKPiAyLjMxLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
