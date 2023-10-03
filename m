Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F37E7543E
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 09:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269F1820F1;
	Tue,  3 Oct 2023 09:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269F1820F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1VKWV-XTLhQ; Tue,  3 Oct 2023 09:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C62882102;
	Tue,  3 Oct 2023 09:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C62882102
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1B711BF410
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C5A41B46
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 09:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C5A41B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqjQcDN-bD4p for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 09:36:50 +0000 (UTC)
X-Greylist: delayed 71058 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Oct 2023 09:36:50 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFAC41B90
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net
 [46.105.58.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BFAC41B90
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 09:36:50 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.54])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 803FD27E36
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 09:36:46 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9dvr6 (unknown [10.110.208.180])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 41AEE1FEDF;
 Tue,  3 Oct 2023 09:36:46 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net ([176.31.235.81])
 by ghost-submission-6684bf9d7b-9dvr6 with ESMTPSA
 id 6TiwDq7gG2Wc6jUA6QqK6A
 (envelope-from <julien.boibessot@armadeus.com>);
 Tue, 03 Oct 2023 09:36:46 +0000
MIME-Version: 1.0
Date: Tue, 03 Oct 2023 11:36:45 +0200
From: julien.boibessot@armadeus.com
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAPi7W82neHWtun3WS8ZO1jOaEfWarwEnSvQdXLV9qHx=r7=cLw@mail.gmail.com>
References: <20231002135147.2707988-1-julien.boibessot@armadeus.com>
 <CAPi7W82neHWtun3WS8ZO1jOaEfWarwEnSvQdXLV9qHx=r7=cLw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4b75128a7a53e2fed27a1799f97a7828@armadeus.com>
X-Sender: julien.boibessot@armadeus.com
X-Originating-IP: 82.65.105.106
X-Webmail-UserID: julien.boibessot@armadeus.com
X-Ovh-Tracer-Id: 16189877712270643573
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfeeigdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhenucggtffrrghtthgvrhhnpefffefhiedvveelheeuvdffhfdvleeftedvvdetleeghfeltefhhfegffevieekveenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpshhouhhrtggvfhhorhhgvgdrnhgvthenucfkphepuddvjedrtddrtddruddpkedvrdeihedruddthedruddtiedpudejiedrfedurddvfeehrdekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
Subject: Re: [Buildroot] [PATCH 1/1] package/ltris: bump to version 1.2.7
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrICEKCkxlIDIwMjMtMTAtMDIg
MTU6NTUsIEZhYnJpY2UgRm9udGFpbmUgYSDDqWNyaXQgOgoKPiBIZWxsbyBKdWxpZW4sCj4gCj4g
TGUgbHVuLiAyIG9jdC4gMjAyMyDDoCAxNTo1MiwgSnVsaWVuIEJPSUJFU1NPVCAKPiA8anVsaWVu
LmJvaWJlc3NvdEBhcm1hZGV1cy5jb20+IGEgw6ljcml0IDoKPiAKPj4gTGF0ZXN0IHJlbGVhc2Uu
IEFza2VkIGJ5IGF1dG9idWlsZC5idWlsZHJvb3QubmV0Lgo+PiBSZW1vdmUgaW50ZWdyYXRlZCBm
aXguCj4gCj4gWW91IGZvcmdvdCB0byB1cGRhdGUgLmNoZWNrcGFja2FnZWlnbm9yZQo+IAoKT3Vw
cywgSSd2ZSBtaXNzZWQgdGhhdCBmZWF0dXJlIGluIEJSLiBBbSBJIHN1cHBvc2VkIHRvIHJlbW92
ZSBmaWxlIGVudHJ5IAppbiB0aGlzIGZpbGUgYW5kIHRoYXQncyBpdCA/CgpCZXN0IHJlZ2FyZHMs
CgpKdWxpZW4KCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBCT0lCRVNTT1QgPGp1bGllbi5ib2li
ZXNzb3RAYXJtYWRldXMuY29tPgo+PiAtLS0KPj4gLi4uL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdp
dGgtZ2NjLTQuOC5wYXRjaCAgIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBwYWNrYWdlL2x0
cmlzL2x0cmlzLmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiBwYWNrYWdlL2x0
cmlzL2x0cmlzLm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAzIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4+IGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaAo+PiAK
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0aC1nY2MtNC44
LnBhdGNoIAo+PiBiL3BhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0aC1nY2MtNC44LnBh
dGNoCj4+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCBkNmJiZjZhOTQ2Li4wMDAw
MDAwMDAwCj4+IC0tLSBhL3BhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0aC1nY2MtNC44
LnBhdGNoCj4+ICsrKyAvZGV2L251bGwKPj4gQEAgLTEsMjAgKzAsMCBAQAo+PiAtRml4IGJ1aWxk
IHdpdGggZ2NjIDQuOAo+PiAtCj4+IC1TaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPj4gLVtVcHN0cmVhbSBzdGF0dXM6IGh0dHBzOi8v
c291cmNlZm9yZ2UubmV0L3AvbGdhbWVzL3BhdGNoZXMvMjhdCj4+IC1JbmRleDogbHRyaXMvc3Jj
L2Jvd2wuYwo+PiAtPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+PiAtLS0tIGx0cmlzL3NyYy9ib3dsLmMgICAocsOpdmlz
aW9uIDQyMSkKPj4gLSsrKyBsdHJpcy9zcmMvYm93bC5jICAgKGNvcGllIGRlIHRyYXZhaWwpCj4+
IC1AQCAtODI4LDkgKzgyOCwxMCBAQAo+PiAtICovCj4+IC0gdm9pZCBib3dsX2luaXRfYmxvY2tf
bWFza3MoKQo+PiAtIHsKPj4gLSsgICAgICBpbnQgaTsKPj4gLSAgICAgICBpbnQgbWFza3NpemUg
PSBzaXplb2YoYmxvY2tfbWFza3NbMF0ubWFzayk7IC8vIHNhbWUgZm9yIGFsbAo+PiAtCj4+IC0t
ICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCA3OyBpKyspIHsKPj4gLSsgICAgICBmb3IgKGkgPSAw
OyBpIDwgNzsgaSsrKSB7Cj4+IC0gICAgICAgICAgICAgICBibG9ja19tYXNrc1tpXS5yeCA9IDI7
Cj4+IC0gICAgICAgICAgICAgICBibG9ja19tYXNrc1tpXS5yeSA9IDI7Cj4+IC0gICAgICAgICAg
ICAgICBtZW1zZXQoYmxvY2tfbWFza3NbaV0ubWFzaywgMCwgbWFza3NpemUgKTsKPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbHRyaXMvbHRyaXMuaGFzaCBiL3BhY2thZ2UvbHRyaXMvbHRyaXMuaGFz
aAo+PiBpbmRleCBmNjk2ZTNhZjE3Li5hYmU2ODUzZDliIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdl
L2x0cmlzL2x0cmlzLmhhc2gKPj4gKysrIGIvcGFja2FnZS9sdHJpcy9sdHJpcy5oYXNoCj4+IEBA
IC0xLDMgKzEsMyBAQAo+PiAjIExvY2FsbHkgY29tcHV0ZWQ6Cj4+IC1zaGEyNTYgIAo+PiBhN2Jj
NmM1ZmM2NTM5Yjg4NTA1MDc3YTFiNDU4MGVkYzliMTc5Y2UwYTZiODI5YzU4ZmJkOTQxNmNmNDU2
MTk1ICAKPj4gbHRyaXMtMS4yLnRhci5nego+PiArc2hhMjU2ICAKPj4gMTI5MWM2YTY0MmQwNmI5
ZWUxNTNhYzBhMmU3ODU1YTJjOTgzZTgzOWM2MThmMWEyOTRkZjA0ZDgyOTUyNWNiMCAgCj4+IGx0
cmlzLTEuMi43LnRhci5nego+PiBzaGEyNTYgIAo+PiA2N2Y4MmUwNDVjZjdhY2ZlZjg1M2VhMGY0
MjY1NzVhODM1OTE2MWEwYTMyNWUxOWYwMmI1MjlhODdjNGI2YzM0ICAKPj4gQ09QWUlORwo+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9sdHJpcy9sdHJpcy5tayBiL3BhY2thZ2UvbHRyaXMvbHRyaXMu
bWsKPj4gaW5kZXggOWI1OTYxMzQxNy4uOTg5MDJkZTQ0YyAxMDA2NDQKPj4gLS0tIGEvcGFja2Fn
ZS9sdHJpcy9sdHJpcy5tawo+PiArKysgYi9wYWNrYWdlL2x0cmlzL2x0cmlzLm1rCj4+IEBAIC01
LDcgKzUsNyBAQAo+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiAKPj4gTFRSSVNfU0lURSA9
IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L2xnYW1lcy9sdHJpcwo+PiAtTFRSSVNf
VkVSU0lPTiA9IDEuMgo+PiArTFRSSVNfVkVSU0lPTiA9IDEuMi43Cj4+IExUUklTX0xJQ0VOU0Ug
PSBHUEwtMi4wKwo+PiBMVFJJU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+PiAKPj4gLS0KPj4g
Mi4yNS4xCj4gCj4gQmVzdCBSZWdhcmRzLAo+IAo+IEZhYnJpY2UKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
