Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF96C636CC
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEED81E45;
	Sun, 19 Feb 2023 19:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DEED81E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8LBvkIW9GtH; Sun, 19 Feb 2023 19:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9220781DFF;
	Sun, 19 Feb 2023 19:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9220781DFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9811BF30A
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 19:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 245C760E96
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 19:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 245C760E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulO8vDkQ-U1W for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 19:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A95C60AFE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A95C60AFE
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 19:40:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp1-g21.free.fr (Postfix) with ESMTP id BE5C2B00565;
 Sun, 19 Feb 2023 20:40:08 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 20:40:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <701823a1b87f5b99a6bdb21aa8b573d7@free.fr>
References: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
 <20230219164822.142283-3-fontaine.fabrice@gmail.com>
 <701823a1b87f5b99a6bdb21aa8b573d7@free.fr>
Message-ID: <f74d086434367a724118ac0db0e6f2a4@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676835608;
 bh=mMc3bgagKoNSw33lDynLMM27hKG3Ny3HKCcAfDeExaQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fMxLbjUgU5BgGkaK/0DgUuTWExZmSLEi+nXKsV7h8PcDVjsMpNWkCgnKQ6Ym85chr
 3Ogy0oa+ACNnwlbQGx1QUvw3cEUDojzObZ+BB/IbmhxsfcGd9F7G1IjIcsLOR35nak
 Z8EHG+0mG6jxMRUmOpbtsDo17dCRLRuhm6Cbt5kkUNfDCfvFMGHMbVde80H8lU7CaW
 NQlBvN+0SaFCER7OOJ9m6jneQ0fGmghz7srqEW+6h8iD8U6BqXWFVZLOYowfO1OLbP
 XsODOLfWn2LXnElH9OFJVgExXuyLE0OvWr7qoC+OOclYnWZS6G7r3igHN1HrXX+Psa
 J9Mk6elxYsvyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fMxLbjUg
Subject: Re: [Buildroot] [PATCH v2,
 3/3] package/libjxl: security bump to version 0.8.1
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

SGkgYWdhaW4gRmFicmljZSwKCk9uIDE5LzAyLzIwMjMgMTg6MDcsIEp1bGllbiBPbGl2YWluIHdy
b3RlOgo+IEhpIEZhYnJpY2UsCj4gCj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgdXBkYXRlIQo+IAo+
IEkgc3VjY2Vzc2Z1bGx5IHRlc3RlZCB3aXRoIHRoZSBjb21tYW5kOgo+IAo+ICAgICBzdXBwb3J0
L3Rlc3RpbmcvcnVuLXRlc3RzIFwKPiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+
ICAgICAgICAgdGVzdHMucGFja2FnZS50ZXN0X2xpYmp4bAo+IAo+IE9uIDE5LzAyLzIwMjMgMTc6
NDgsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4+IFNlY3VyaXR5OiBGaXggT09CIHJlYWQgaW4g
ZXhpZi5oCj4+IAo+PiBodHRwczovL2dpdGh1Yi5jb20vbGlianhsL2xpYmp4bC9yZWxlYXNlcy90
YWcvdjAuOC4xCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJqeGwvbGlianhsL3JlbGVhc2VzL3Rh
Zy92MC44LjAKPj4gCj4gCj4gVGVzdGVkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZy
Pgo+IFJldmlld2VkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
Pj4gLS0tCj4+IENoYW5nZXMgdjEgLT4gdjIgKGFmdGVyIHJldmlldyBvZiBKdWxpZW4gT2xpdmFp
bik6Cj4+ICAtIEFkZCBwYXRjaCB0byBmaXggY3Jhc2gKPj4gCj4+ICAuLi5lbnRhdGlvbi1mYXVs
dC13aGVuLUpQRUctaXMtZGlzYWJsZWQucGF0Y2ggfCA0NCAKPj4gKysrKysrKysrKysrKysrKysr
Kwo+PiAgcGFja2FnZS9saWJqeGwvbGlianhsLmhhc2ggICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPj4gIHBhY2thZ2UvbGlianhsL2xpYmp4bC5tayAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPj4gcGFja2FnZS9saWJqeGwvMDAwMS1kanhsLWZpeC1z
ZWdtZW50YXRpb24tZmF1bHQtd2hlbi1KUEVHLWlzLWRpc2FibGVkLnBhdGNoCj4+IAo+PiBkaWZm
IC0tZ2l0Cj4+IGEvcGFja2FnZS9saWJqeGwvMDAwMS1kanhsLWZpeC1zZWdtZW50YXRpb24tZmF1
bHQtd2hlbi1KUEVHLWlzLWRpc2FibGVkLnBhdGNoCj4+IGIvcGFja2FnZS9saWJqeGwvMDAwMS1k
anhsLWZpeC1zZWdtZW50YXRpb24tZmF1bHQtd2hlbi1KUEVHLWlzLWRpc2FibGVkLnBhdGNoCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjNkNzA5Yzk1NmIKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysKPj4gYi9wYWNrYWdlL2xpYmp4bC8wMDAxLWRqeGwtZml4LXNl
Z21lbnRhdGlvbi1mYXVsdC13aGVuLUpQRUctaXMtZGlzYWJsZWQucGF0Y2gKPj4gQEAgLTAsMCAr
MSw0NCBAQAo+PiArRnJvbSA1MDRmMzVjODIwNDI0OGFlNmY5NzI3OGU4YjdjNmNjNTg1M2ExYjk0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgCj4+IDIwMDEKPj4gK0Zyb206IEp1bGllbiBPbGl2YWluIDxq
dS5vQGZyZWUuZnI+Cj4+ICtEYXRlOiBGcmksIDEwIEZlYiAyMDIzIDIxOjMxOjMwICswMTAwCj4+
ICtTdWJqZWN0OiBbUEFUQ0hdIGRqeGw6IGZpeCBzZWdtZW50YXRpb24gZmF1bHQgd2hlbiBKUEVH
IGlzIGRpc2FibGVkCj4+ICsKPj4gK1doZW4gbGlianhsIGlzIGNvbXBpbGVkIHdpdGhvdXQgSlBF
RyBzdXBwb3J0LCBieSBjb25maWd1cmluZyBmb3IgCj4+IGV4YW1wbGUKPj4gK3dpdGg6Cj4+ICsK
Pj4gKyAgICBjbWFrZSAtRENNQUtFX0RJU0FCTEVfRklORF9QQUNLQUdFX0pQRUc9VFJVRSAuLi4K
Pj4gKwo+PiArZGp4bCBjcmFzaGVzIHdpdGggYSBzZWdtZW50YXRpb24gZmF1bHQgYXQ6Cj4+ICto
dHRwczovL2dpdGh1Yi5jb20vbGlianhsL2xpYmp4bC9ibG9iL3YwLjguMS90b29scy9kanhsX21h
aW4uY2MjTDM2Nwo+PiArCj4+ICtUaGUgY3Jhc2ggY2FuIGJlIHJlcHJvZHVjZWQgd2l0aCB0aGUg
c2VxdWVuY2U6Cj4+ICsKPj4gKyAgICBnbSBjb252ZXJ0IElNQUdFOkxPR08gcmVmLnBwbQo+PiAr
ICAgIGNqeGwgcmVmLnBwbSBlbmMuanhsCj4+ICsgICAgZGp4bCBlbmMuanhsIGRlYy5wcG0KPj4g
Kwo+PiArVGhlIGNyYXNoIGhhcHBlbiBiZWNhdXNlIG9wdF9qcGVnX3F1YWxpdHlfaWQgZG9lcyBu
b3QgZ2V0Cj4+ICtpbml0aWFsaXplZCBhdDoKPj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9saWJqeGwv
bGlianhsL2Jsb2IvdjAuOC4xL3Rvb2xzL2RqeGxfbWFpbi5jYyNMMTA3Cj4+ICsKPj4gK1RoaXMg
Y29tbWl0IGZpeGVzIHRoZSBjcmFzaCBieSBhZGRpbmcgYSB0ZXN0IG9uIG9wdF9qcGVnX3F1YWxp
dHlfaWQuCj4+ICsKPj4gK1NpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUu
ZnI+Cj4+ICtbUmV0cmlldmVkIGZyb206Cj4+ICtodHRwczovL2dpdGh1Yi5jb20vbGlianhsL2xp
Ymp4bC9wdWxsLzIxNzgvY29tbWl0cy81MDRmMzVjODIwNDI0OGFlNmY5NzI3OGU4YjdjNmNjNTg1
M2ExYjk0XQo+PiArLS0tCj4+ICsgdG9vbHMvZGp4bF9tYWluLmNjIHwgMSArCj4+ICsgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+ICsKPj4gK2RpZmYgLS1naXQgYS90b29scy9kanhs
X21haW4uY2MgYi90b29scy9kanhsX21haW4uY2MKPj4gK2luZGV4IGI3NTUzMDFmY2IuLjQyYjg4
OWU3Y2UgMTAwNjQ0Cj4+ICstLS0gYS90b29scy9kanhsX21haW4uY2MKPj4gKysrKyBiL3Rvb2xz
L2RqeGxfbWFpbi5jYwo+PiArQEAgLTM3MCw2ICszNzAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y29uc3QgY2hhciogYXJndltdKSB7Cj4+ICsgICAgIGFyZ3MuY29sb3Jfc3BhY2UgPSBmb3JjZV9j
b2xvcnNwYWNlOwo+PiArICAgfQo+PiArICAgaWYgKGNvZGVjID09IGp4bDo6ZXh0cmFzOjpDb2Rl
Yzo6a1BOTSAmJiBleHRlbnNpb24gIT0gIi5wZm0iICYmCj4+ICsrICAgICAgYXJncy5vcHRfanBl
Z19xdWFsaXR5X2lkICE9IC0xICYmCj4+ICsgICAgICAgIWNtZGxpbmUuR2V0T3B0aW9uKGFyZ3Mu
b3B0X2pwZWdfcXVhbGl0eV9pZCktPm1hdGNoZWQoKSkgewo+PiArICAgICBhcmdzLmJpdHNfcGVy
X3NhbXBsZSA9IDA7Cj4+ICsgICB9Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmp4bC9saWJq
eGwuaGFzaCBiL3BhY2thZ2UvbGlianhsL2xpYmp4bC5oYXNoCj4+IGluZGV4IGU3MWQzMmU2MWQu
LjZiNGM5ZDhkMGEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbGlianhsL2xpYmp4bC5oYXNoCj4+
ICsrKyBiL3BhY2thZ2UvbGlianhsL2xpYmp4bC5oYXNoCj4+IEBAIC0xLDQgKzEsNCBAQAo+PiAg
IyBMb2NhbGx5IGNvbXB1dGVkOgo+PiAtc2hhMjU2Cj4+IDMxMTRiYmExZmFiYjM2ZjZmNGFkYzI2
MzI3MTcyMDlhYTZmODQwNzdiYzRlOTNiNDIwZTBkNjNmYTA0NTVjNWUKPj4gbGlianhsLTAuNy4w
LnRhci5nego+PiArc2hhMjU2Cj4+IDYwZjQzOTIxYWQzMjA5YzllMTgwNTYzMDI1ZWRhMGMwZjli
MWFmYWM1MWEyOTI3YjlmZjU5ZmZmMzk1MGRjNTYKPj4gbGlianhsLTAuOC4xLnRhci5nego+PiAg
c2hhMjU2Cj4+IDg0MDU5MzIwMjJhNTU2MzgwYzJkOGMyNzJlZmYxNTRhOTIzZmViMTk3MjMzZjM0
OGNlNWY3MzM0ZmIwYTVlZGUKPj4gTElDRU5TRQo+PiAgc2hhMjU2Cj4+IDkxOTE1ZjhhZTA1NmE2
OGEzYzViZGYwNWQ5ZjZmNzhiYjY5MDNlMjdhOGNhM2E4NDM0YzllNGFjODczMDA1NzUKPj4gUEFU
RU5UUwo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJqeGwvbGlianhsLm1rIGIvcGFja2FnZS9s
aWJqeGwvbGlianhsLm1rCj4+IGluZGV4IGI0ZGZiZWNmODIuLmY2MDMzMjdiZjYgMTAwNjQ0Cj4+
IC0tLSBhL3BhY2thZ2UvbGlianhsL2xpYmp4bC5tawo+PiArKysgYi9wYWNrYWdlL2xpYmp4bC9s
aWJqeGwubWsKPj4gQEAgLTQsNyArNCw3IEBACj4+ICAjCj4+IAo+PiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+PiAKPj4gLUxJQkpYTF9WRVJTSU9OID0gMC43LjAKPj4gK0xJQkpYTF9WRVJTSU9O
ID0gMC44LjEKClRlc3RpbmcgYSBiaXQgbW9yZSB0aG9yb3VnaGx5IG9uIHRvcCBvZiBicmFuY2gg
bWFzdGVyIGEgY29tbWl0IDFjOTYyMmEsCndpdGggY29tbWFuZDoKCiAgICAgdXRpbHMvdGVzdC1w
a2cgLXAgbGlianhsIC1hCgpyZXZlYWxlZCBzb21lIG5ldyBidWlsZCBmYWlsdXJlcyBmb3Igcmlz
Y3Z7MzIsNjR9LiBPdXRwdXQgc2hvd3M6CgogICAgIC4uLgogICAgICAgYm9vdGxpbi1yaXNjdjMy
LWdsaWJjIFsxNy80NV06IEZBSUxFRAogICAgICAgYm9vdGxpbi1yaXNjdjY0LWdsaWJjIFsxOC80
NV06IEZBSUxFRAogICAgICAgIGJvb3RsaW4tcmlzY3Y2NC1tdXNsIFsxOS80NV06IEZBSUxFRAog
ICAgIC4uLgogICAgIDQ1IGJ1aWxkcywgMTEgc2tpcHBlZCwgMyBidWlsZCBmYWlsZWQsIDAgbGVn
YWwtaW5mbyBmYWlsZWQsIDAgCnNob3ctaW5mbyBmYWlsZWQKClRoZXkgYXJlIGFsbCBmYWlsaW5n
IGF0IHRoZSBzYW1lIHBsYWNlLCB3aXRoIGVycm9yIGluIGxvZzoKCiAgICAgCi9ici10ZXN0LXBr
Zy9ib290bGluLXJpc2N2NjQtZ2xpYmMvYnVpbGQvbGlianhsLTAuOC4xL2xpYi9qeGwvZW5jX3h5
Yi5jYzogCkluIGZ1bmN0aW9uIOKAmGp4bDo6SW1hZ2UzRiBqeGw6Ok5fU0NBTEFSOjpUcmFuc2Zv
cm1Ub0xpbmVhclJHQihjb25zdCAKanhsOjpJbWFnZTNGJiwgY29uc3QganhsOjpDb2xvckVuY29k
aW5nJiwgZmxvYXQsIGNvbnN0IEp4bENtc0ludGVyZmFjZSYsIApqeGw6OlRocmVhZFBvb2wqKeKA
mToKICAgICAKL2JyLXRlc3QtcGtnL2Jvb3RsaW4tcmlzY3Y2NC1nbGliYy9idWlsZC9saWJqeGwt
MC44LjEvbGliL2p4bC9lbmNfeHliLmNjOjIyMzoyMTogCmVycm9yOiB2YXJpYWJsZSDigJhzdGQ6
OmF0b21pYzxib29sPiBva+KAmSBoYXMgaW5pdGlhbGl6ZXIgYnV0IGluY29tcGxldGUgCnR5cGUK
ICAgICAgIDIyMyB8ICAgc3RkOjphdG9taWM8Ym9vbD4gb2t7dHJ1ZX07CiAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgIF5+Cgo+PiAgTElCSlhMX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGxp
Ymp4bCxsaWJqeGwsdiQoTElCSlhMX1ZFUlNJT04pKQo+PiAgTElCSlhMX0xJQ0VOU0UgPSBCU0Qt
My1DbGF1c2UKPj4gIExJQkpYTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRSBQQVRFTlRTCgpCZXN0
IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
