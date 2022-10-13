Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467BC433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 17:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E5D60B48;
	Thu, 13 Oct 2022 17:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E5D60B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyoOxNijm7Fo; Thu, 13 Oct 2022 17:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25AA60B38;
	Thu, 13 Oct 2022 17:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25AA60B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A03771BF3EC
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 17:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A9D940CA2
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 17:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A9D940CA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-M0aK4xdi38 for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 17:10:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF194402F5
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF194402F5
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 17:10:55 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j1jRoREvLlrBMj1jRoUyb3; Thu, 13 Oct 2022 19:10:53 +0200
Message-ID: <8c244426-0886-42a3-6d09-c9798a517a00@benettiengineering.com>
Date: Thu, 13 Oct 2022 19:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20221013085733.4973-1-sebastien.szymanski@armadeus.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221013085733.4973-1-sebastien.szymanski@armadeus.com>
X-CMAE-Envelope: MS4xfKACzU9iB7PbprXYGxgDQ7tVII+t56SU+nqvQsrNTUJbF/b8QJmRsWXyJbj62/kbXzVNHqBg7TuAhx+RNBgEqsEcCfdZD1d9yzyb2xQmj+BnkaxBNoDv
 yBrWTkdWKUwvynqo3nsNV4towqFxU14QHkA5dlNsHs8ryAx2uQOATvWAr19hLqfzlhDig2TtvA22o+jfb/VF05GUOw5bygzveHvjAXqCWb60ta+xoS6vE6Nz
 PTbX6vCDI+OVQuaFqulUEgdkzcVbWueSpaKuz3hR1nc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665681053; bh=8mf2r7em/pKXZwb+nGVkFWK5q2nitrINFScfRyKEhgo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ZCDUv5KLUmWh0+S+IlDQ1n1N6502KaYddhsXTNd6c7zL3IRZ59wZ9JhySbL2RAw5T
 wqEzSCGvvnpkhV1qzJCXekDyjs7NFpaAQvFbLwMwNQksu7m2j8zlIIrVSwxlOEOdGi
 D4GwgpDKb0gnUMtfWZYjTlaVbdQtxWUPPsYuHXplOjVlyEtVBN1Q8DVwgvNGokpcWV
 Z69RomgXE4OrJKJ2fVDUgCW/CJMlVnchjjEqPlhLrjylbx2jonQZNEK+V746IVKE2j
 4McpRAYJpnqh6yizeJjS950QhEGRNhDgrslGIvXETqgpxaFoRgFkNWPskzQBOkMeiA
 +jF2Qp2zCuKFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ZCDUv5KL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mmc-utils: bump to version
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwKCk9uIDEzLzEwLzIyIDEwOjU3LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3
cm90ZToKPiBEcm9wIGZpcnN0IHBhdGNoLCB1cHN0cmVhbWVkOgo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS91dGlscy9tbWMvbW1jLXV0aWxzLmdpdC9jb21taXQvP2lkPTUyMGY1NGVi
OTQ4NDVlNTk3ODM3YWU5MDhhMDNiOTFhZThjODc1OGYKPiAKPiBEZXBlbmRzIG9uIGtlcm5lbCBo
ZWFkZXJzID49IDQuNCBmb3Igc3RydWN0IG1tY19pb2NfbXVsdGlfY21kCj4gCj4gRml4ZXM6IGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzAxZjc4MDgxYTUwNzQzZDFmYWE1
MGEwOTBjMDBiN2U5MGExN2ZhMzkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1h
bnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpSZXZpZXdlZC1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgpUaGFu
ayB5b3UKCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmlu
ZyBzYXMKCj4gLS0tCj4gCj4gQ2hhbmdlcyBmb3IgdjI6Cj4gICAtIG5lZWRzIGtlcm5lbCBoZWFk
ZXJzID49IDQuNAo+IAo+ICAgLi4uMDEtbW1jX2NtZHMuYy1maXgtYnVpbGQtd2l0aC1nY2MtNC45
LnBhdGNoIHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgcGFja2FnZS9tbWMtdXRpbHMvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgIHwgIDYgKy0tCj4gICBwYWNrYWdlL21tYy11dGlscy9t
bWMtdXRpbHMuaGFzaCAgICAgICAgICAgICAgfCAgNCArLQo+ICAgcGFja2FnZS9tbWMtdXRpbHMv
bW1jLXV0aWxzLm1rICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL21tYy11dGlscy8wMDAxLW1tY19jbWRzLmMtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOS5w
YXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21tYy11dGlscy8wMDAxLW1tY19jbWRzLmMt
Zml4LWJ1aWxkLXdpdGgtZ2NjLTQuOS5wYXRjaCBiL3BhY2thZ2UvbW1jLXV0aWxzLzAwMDEtbW1j
X2NtZHMuYy1maXgtYnVpbGQtd2l0aC1nY2MtNC45LnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggNzcyNWY5Y2E1ZS4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvbW1j
LXV0aWxzLzAwMDEtbW1jX2NtZHMuYy1maXgtYnVpbGQtd2l0aC1nY2MtNC45LnBhdGNoCj4gKysr
IC9kZXYvbnVsbAo+IEBAIC0xLDM3ICswLDAgQEAKPiAtRnJvbSA2MjA4Y2M3OGY2ZWZkMWZhZmM0
ZjViYzZhNDg3MjQ3YTM4M2RmODBmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1Gcm9tOiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtRGF0ZTogU2F0
LCAyOCBTZXAgMjAxOSAyMDo0NDo1MiArMDIwMAo+IC1TdWJqZWN0OiBbUEFUQ0hdIG1tY19jbWRz
LmM6IGZpeCBidWlsZCB3aXRoIGdjYyA0LjkKPiAtCj4gLUZpeCBmb2xsb3dpbmcgZXJyb3Igd2l0
aCBnY2MgNC45Ogo+IC0KPiAtbW1jX2NtZHMuYzoxOTE4Ojk6IGVycm9yOiBtaXNzaW5nIGJyYWNl
cyBhcm91bmQgaW5pdGlhbGl6ZXIgWy1XZXJyb3I9bWlzc2luZy1icmFjZXNdCj4gLSAgc3RydWN0
IHJwbWJfZnJhbWUgZnJhbWVfc3RhdHVzID0gezB9Owo+IC0KPiAtRml4ZXM6Cj4gLSAtIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2JmM2I2ZjlmNmVmMzliOTk4NDJiM2M5
MjQ5NWI3YmYzNTljNjgxNTgKPiAtCj4gLVNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC1bVXBzdHJlYW0gc3RhdHVzOiBzZW50IHRv
IGxpbnV4LW1tY0B2Z2VyLmtlcm5lbC5vcmddCj4gLS0tLQo+IC0gbW1jX2NtZHMuYyB8IDQgKysr
LQo+IC0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IC0K
PiAtZGlmZiAtLWdpdCBhL21tY19jbWRzLmMgYi9tbWNfY21kcy5jCj4gLWluZGV4IGZiMzcxODku
LjZiMDlmMjYgMTAwNjQ0Cj4gLS0tLSBhL21tY19jbWRzLmMKPiAtKysrIGIvbW1jX2NtZHMuYwo+
IC1AQCAtMTkxNSw3ICsxOTE1LDkgQEAgc3RhdGljIGludCBkb19ycG1iX29wKGludCBmZCwKPiAt
IAl1X2ludDE2X3QgcnBtYl90eXBlOwo+IC0gCXN0cnVjdCBtbWNfaW9jX211bHRpX2NtZCAqbWlv
YzsKPiAtIAlzdHJ1Y3QgbW1jX2lvY19jbWQgKmlvYzsKPiAtLQlzdHJ1Y3QgcnBtYl9mcmFtZSBm
cmFtZV9zdGF0dXMgPSB7MH07Cj4gLSsJc3RydWN0IHJwbWJfZnJhbWUgZnJhbWVfc3RhdHVzOwo+
IC0rCj4gLSsJbWVtc2V0KCZmcmFtZV9zdGF0dXMsIDAsIHNpemVvZihmcmFtZV9zdGF0dXMpKTsK
PiAtCj4gLSAJaWYgKCFmcmFtZV9pbiB8fCAhZnJhbWVfb3V0IHx8ICFvdXRfY250KQo+IC0gCQly
ZXR1cm4gLUVJTlZBTDsKPiAtLS0KPiAtMi4yMy4wCj4gLQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L21tYy11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL21tYy11dGlscy9Db25maWcuaW4KPiBpbmRl
eCA4NTBhZWFjNDQ1Li5hYzMyYWU2OGJmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbW1jLXV0aWxz
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbW1jLXV0aWxzL0NvbmZpZy5pbgo+IEBAIC0xLDEw
ICsxLDEwIEBACj4gICBjb25maWcgQlIyX1BBQ0tBR0VfTU1DX1VUSUxTCj4gICAJYm9vbCAibW1j
LXV0aWxzIgo+IC0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfM18w
Cj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzQKPiAgIAlo
ZWxwCj4gICAJICBNTUMgdXRpbHMKPiAgIAo+ICAgCSAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9j
Z2l0L2xpbnV4L2tlcm5lbC9naXQvY2piL21tYy11dGlscy5naXQKPiAgIAo+IC1jb21tZW50ICJt
bWMtdXRpbHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gaGVhZGVycyA+PSAzLjAiCj4gLQlkZXBlbmRz
IG9uICFCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfM18wCj4gK2NvbW1lbnQgIm1tYy11
dGlscyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBoZWFkZXJzID49IDQuNCIKPiArCWRlcGVuZHMgb24g
IUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzQKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2ggYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMu
aGFzaAo+IGluZGV4IGU4YjI4MjY2MTIuLjEyNTZmNjM0ODcgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2gKPiArKysgYi9wYWNrYWdlL21tYy11dGlscy9tbWMt
dXRpbHMuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNo
YTI1NiAgZmZjOGY3NzIzM2QxYmQzOWNlNGVjNjg4MzVhZDk0YWE2NzYyNjI0ZTRlOTZmYjYwMTAy
ZTg3YmE4MmRiMDgzZSAgbW1jLXV0aWxzLWQ0MGVjNTM1YjlkNGU0Yzk3NGU4YzJmYmZiNDIyY2Qw
MzQ4Y2M1ZTgtYnIxLnRhci5nego+IC1zaGEyNTYgIGMzMTY1MzkzYmNkNzEwNjI0ZTI5MDkzMjdh
NmZiZWI3MzZjNDdiZGJlNjZkZTFjMWEzNjRhYzczMjRkM2U0ZDYgIG1tYy5oCj4gK3NoYTI1NiAg
ZjZlZDFjYjJmMDJkNDlkZjQyNDRmODg3MmI0N2IyMjc4MGRkNjM0ZmExOWQ4NTcyOThjZTFiNzkz
NzUyNzc2ZiAgbW1jLXV0aWxzLWRmYzNiNmVjZGE4NGQyMTQxOGZiNDQwOGIzOWM1YzcxZGI0YzY0
NTgtYnIxLnRhci5nego+ICtzaGEyNTYgIGY1N2UzYzYxNjkxMTZhYTlmZjA2ZWVjOTU3MzRjYTAw
MGU0ZDAxOTY0NjdiYjIyMWU4MGU1MDUzMGM3NjgwODEgIG1tYy5oCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5tayBiL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGls
cy5tawo+IGluZGV4IGM4NDczNzg2OTIuLmJmOTQwOTY3ZWYgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9tbWMtdXRpbHMvbW1jLXV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0
aWxzLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAgCj4gLU1NQ19VVElMU19WRVJTSU9OID0gZDQwZWM1MzViOWQ0ZTRjOTc0ZThjMmZiZmI0
MjJjZDAzNDhjYzVlOAo+ICtNTUNfVVRJTFNfVkVSU0lPTiA9IGRmYzNiNmVjZGE4NGQyMTQxOGZi
NDQwOGIzOWM1YzcxZGI0YzY0NTgKPiAgIE1NQ19VVElMU19TSVRFID0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2piL21tYy11dGlscy5naXQKPiAgIE1N
Q19VVElMU19TSVRFX01FVEhPRCA9IGdpdAo+ICAgTU1DX1VUSUxTX0xJQ0VOU0UgPSBHUEwtMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
