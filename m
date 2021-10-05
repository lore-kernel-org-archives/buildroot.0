Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5680C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 490456120D
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 490456120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 134A940165;
	Tue,  5 Oct 2021 13:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2A3I0tJfRG6U; Tue,  5 Oct 2021 13:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24F3A40769;
	Tue,  5 Oct 2021 13:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E01981BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC5040811
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0jG-hPoyzqH for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 13:53:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6289040816
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 13:53:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7C4276001B;
 Tue,  5 Oct 2021 13:53:11 +0000 (UTC)
Date: Tue, 5 Oct 2021 15:53:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211005155310.7832c4e4@windsurf>
In-Reply-To: <20211005131122.3070186-1-herve.codina@bootlin.com>
References: <20211005131122.3070186-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pecl-dbus: new package
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

SGVsbG8gSGVydsOpLAoKVGhhbmtzIGZvciB0aGlzIGNvbnRyaWJ1dGlvbiEKCk9uIFR1ZSwgIDUg
T2N0IDIwMjEgMTU6MTE6MjEgKzAyMDAKSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxp
bi5jb20+IHdyb3RlOgoKPiBUaGUgcGVjbC1kYnVzIHBhY2thZ2UgcHJvdmlkZXMgYSBQSFAgZXh0
ZW5zaW9uIGZvciBpbnRlcmFjdGlvbgo+IHdpdGggRC1CdXMgYnVzc2VzLgo+IAo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9kZXJpY2tyL3BlY2wtZGJ1cwo+IAo+IEJhc2VkIG9uIGluaXRpYWwgd29yayBm
cm9tIE5pY29sYXMgQ2FycmllciA8bmljb2xhcy5jYXJyaWVyQG9yb2xpYS5jb20+Cj4gCj4gU2ln
bmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gLS0t
Cj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiAr
Cj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
Cj4gIHBhY2thZ2UvcGVjbC1kYnVzLzAwMDEtcGhwOC1jb21wYXQucGF0Y2ggICAgICB8IDE2MSAr
KysrKysrKysrKysrKysrKysKPiAgLi4ubGl0eS13aXRoLXBocDgtY2FsbF91c2VyX2Z1bmN0aW9u
X2V4LnBhdGNoIHwgIDMxICsrKysKPiAgcGFja2FnZS9wZWNsLWRidXMvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgIHwgIDE1ICsrCj4gIHBhY2thZ2UvcGVjbC1kYnVzL3BlY2wtZGJ1cy5oYXNo
ICAgICAgICAgICAgICB8ICAgMyArCj4gIHBhY2thZ2UvcGVjbC1kYnVzL3BlY2wtZGJ1cy5tayAg
ICAgICAgICAgICAgICB8ICAyNSArKysKPiAgLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3BlY2xfZGJ1cy5weSAgIHwgIDMyICsrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAyNzQgaW5zZXJ0
aW9ucygrKQoKVGhhbmtzIGZvciB0aGlzIG5ldyBwYWNrYWdlLiBJJ20ganVzdCB3b25kZXJpbmcg
YWJvdXQgdGhlIHBhY2thZ2UgbmFtZS4KVGhlIHVwc3RyZWFtIHByb2plY3QgaXMgaW5kZWVkIG5h
bWVkIHBlY2wtZGJ1cywgd2hlcmUgcGVjbCBzdGFuZHMgZm9yCiJQSFAgRXh0ZW5zaW9uIENvbW11
bml0eSBMaWJyYXJ5Ii4gQnV0IGFsbCBvdXIgb3RoZXIgUEhQIHBhY2thZ2VzIGFyZQpuYW1lZCAi
cGhwLTxzb21ldGhpbmc+Ii4gU2hvdWxkIHdlIG5hbWUgdGhpcyBwYWNrYWdlICJwaHAtZGJ1cyIg
PwoicGhwLXBlY2wtZGJ1cyIgPwoKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGVjbC1kYnVzLzAw
MDEtcGhwOC1jb21wYXQucGF0Y2ggYi9wYWNrYWdlL3BlY2wtZGJ1cy8wMDAxLXBocDgtY29tcGF0
LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5iZWY5YTFm
YTA1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcGVjbC1kYnVzLzAwMDEtcGhwOC1j
b21wYXQucGF0Y2gKPiBAQCAtMCwwICsxLDE2MSBAQAo+ICtGcm9tIDdmZGU0ZGQ0ZDI2ZDJhNGI3
OTU3YTEwMTBjNmVhOWU0Yjk0MGZjNjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206
IFN0ZWZhbiBTYXJhZXYgPHN0ZWZhbkBzYXJhZXYuY2E+Cj4gK0RhdGU6IE1vbiwgMTggSmFuIDIw
MjEgMjM6MjI6NTIgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBwaHA4IGNvbXBhdAo+ICsKPiAr
VGhpcyBwYXRjaCB3YXMgcmV0cmlldmVkIGZyb20gdGhlIHBlbmRpbmcgdXBzdHJlYW0gcHVsbCBy
ZXF1ZXN0Cj4gK2RvbmUgYnkgU3RlZmFuIFNhcmFldi4KPiAraHR0cHM6Ly9naXRodWIuY29tL2Rl
cmlja3IvcGVjbC1kYnVzL3B1bGwvOAo+ICsKPiArU2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5h
IDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CgpQZXJoYXBzIHlvdSBjb3VsZCBqdXN0IHBpbmcg
b24gdGhpcyBwdWxsIHJlcXVlc3QsIHRvIHNheSB0aGF0IGl0IGFsc28Kc29sdmVkIHRoZSBwcm9i
bGVtIGZvciB5b3U/Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BlY2wtZGJ1cy8wMDAyLUZpeC1j
b21wYXRpYmlsaXR5LXdpdGgtcGhwOC1jYWxsX3VzZXJfZnVuY3Rpb25fZXgucGF0Y2ggYi9wYWNr
YWdlL3BlY2wtZGJ1cy8wMDAyLUZpeC1jb21wYXRpYmlsaXR5LXdpdGgtcGhwOC1jYWxsX3VzZXJf
ZnVuY3Rpb25fZXgucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLjFlNTc5ZTQyNzIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9wZWNsLWRidXMv
MDAwMi1GaXgtY29tcGF0aWJpbGl0eS13aXRoLXBocDgtY2FsbF91c2VyX2Z1bmN0aW9uX2V4LnBh
dGNoCj4gQEAgLTAsMCArMSwzMSBAQAo+ICtGcm9tIDhjZjY2YzRiNWRkNjU3Y2ExNDU1MmIyN2E0
MjkwMWRiMGE1ZTkyODAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEhlcnZlIENv
ZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgo+ICtEYXRlOiBNb24sIDQgT2N0IDIwMjEg
MTc6MTM6NDUgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBGaXggY29tcGF0aWJpbGl0eSB3aXRo
IHBocDggLSBjYWxsX3VzZXJfZnVuY3Rpb25fZXgKPiArCj4gK1RoaXMgcGF0Y2ggZml4IGNvbXBh
dGliaWxpdHkgd2l0aCBwaHA4IHJlcGxhY2luZwo+ICtjYWxsX3VzZXJfZnVuY3Rpb25fZXggYnkg
Y2FsbF91c2VyX2Z1bmN0aW9uLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxo
ZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CgpBbmQgc3VibWl0IHRoaXMgdXBzdHJlYW0gPwoKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9wZWNsLWRidXMvQ29uZmlnLmluIGIvcGFja2FnZS9wZWNsLWRi
dXMvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5h
NTMxMzk3NzU0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcGVjbC1kYnVzL0NvbmZp
Zy5pbgo+IEBAIC0wLDAgKzEsMTUgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1BFQ0xfREJVUwo+
ICsJYm9vbCAicGVjbC1kYnVzIgo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTICMgZGJ1cwo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGRidXMKPiArCXNlbGVjdCBC
UjJfUEFDS0FHRV9EQlVTCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWE1MMgo+ICsJc2VsZWN0
IEJSMl9QQUNLQUdFX1BIUF9FWFRfTElCWE1MMiAjIFJ1bnRpbWUgZGVwZW5kZW5jeQoKSSB3YXMg
d29uZGVyaW5nIGlmIHlvdSBuZWVkIGJvdGggQlIyX1BBQ0tBR0VfTElCWE1MMiBhbmQKQlIyX1BB
Q0tBR0VfUEhQX0VYVF9MSUJYTUwyLCBpLmUgZG9lcyBwZWNsLWRidXMgbGluayBkaXJlY3RseSB3
aXRoIHRoZQpsaWJ4bWwyIG5hdGl2ZSBsaWJyYXJ5ID8KCgo+ICtQRUNMX0RCVVNfVkVSU0lPTiA9
IDMxNWQxNzU1OGM3NjE0ZDAyZTkyM2Q4OTgyMzFlNTFjODZhMjU3ODkKPiArUEVDTF9EQlVTX1NJ
VEUgPSAkKGNhbGwgZ2l0aHViLGRlcmlja3IscGVjbC1kYnVzLCQoUEVDTF9EQlVTX1ZFUlNJT04p
KQo+ICtQRUNMX0RCVVNfTElDRU5TRSA9IFBIUC0zLjAxCj4gK1BFQ0xfREJVU19MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRQo+ICtQRUNMX0RCVVNfREVQRU5ERU5DSUVTID0gcGhwIGRidXMgbGlieG1s
MiBob3N0LWF1dG9jb25mIGhvc3QtcGtnY29uZgo+ICsKPiArUEVDTF9EQlVTX0NPTkZfT1BUUyA9
IFwKPiArCS0td2l0aC1waHAtY29uZmlnPSQoU1RBR0lOR19ESVIpL3Vzci9iaW4vcGhwLWNvbmZp
ZyBcCj4gKwktLWVuYWJsZS1kYnVzCgpwZWNsLWRidXMgY2FuIGJ1aWxkIHdpdGhvdXQgZGJ1cyA/
IT8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
