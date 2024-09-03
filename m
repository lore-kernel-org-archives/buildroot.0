Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46EFCD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F9EA6058B;
	Tue,  3 Sep 2024 21:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4xv_biw8ux5; Tue,  3 Sep 2024 21:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42BDB60773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42BDB60773;
	Tue,  3 Sep 2024 21:45:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 742C61BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60AD840339
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inSpC16W6AxS for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BBB640182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BBB640182
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BBB640182
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:44:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B2B4513F846;
 Tue,  3 Sep 2024 23:44:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 23:44:49 +0200
Date: Tue, 3 Sep 2024 23:44:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZteDUZoQYrmvwS8A@landeda>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
 <20240901-rgbmatrix-v2-2-3a10c3c367e4@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901-rgbmatrix-v2-2-3a10c3c367e4@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725399896;
 bh=TnTNJT0cGU0kswn+i7FVJtPL5da+VyAr3r4wXtjmGow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gJVs3HckD3OH2v0B1f/KbBcNz4PqZ3NDBzh+YSe4jV1Zqm6owqoBWMqaf/Mlkoa6X
 L1i+SWCb4TW3efcErbfOnXa8XnjikLa1bdqRWcVrclmk2w3ua9jW+/fjLHHfPhBVC3
 tv/knX9SP2ZfrQAyVNhmc3hs8A88OS7E3h60uRsRR9VGDxirKaf05r0ii28RYFZiIq
 t4DvXncYPVhrLxyerftvXohSRQGWd1qQH5KWb7jd9zT2YMJiWNjBybVWBdLiAwxuEm
 24vEziab9JsnpeEYDfphQ+lEk5P/I/kyD4rTp30rJ3eSR9JJO//XOHBWoSmqmyrn5D
 f2/xUNtogav2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gJVs3Hck
Subject: Re: [Buildroot] [PATCH v2 2/3] package/python-rgbmatrix: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4sIEFsbCwKCk9uIDIwMjQtMDktMDEgMTY6MjkgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFRoZSAicmdibWF0cml4IiBweXRob24gbW9kdWxlIGlz
IHRoZSBQeXRob24gYmluZGluZyBmb3IKPiBycGktcmdiLWxlZC1tYXRyaXgsIGJ1aWx0IGZyb20g
dGhlIHNhbWUgc291cmNlIHJlcG9zaXRvcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCkkgZGlkIGEgZmV3IGNoYW5nZXM6CgogIC0g
YWRkIGNvbW1lbnQgZm9yIHByb3BhZ2F0ZWQgZGVwZW5kZW5jaWVzCiAgLSBhZGQgY29tbWVudCBv
biBtaXNzaW5nIGRlcGVuZGVuY2llcwogIC0gZHJvcCBjb21tZW50IGF0IGVuZCBvZiBfVkVSU0lP
TiBsaW5lCgpBcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
Cgo+IC0tLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCj4gIHBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4gICAgICAgICAg
ICAgICB8ICA4ICsrKysrKysrCj4gIHBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdi
bWF0cml4Lmhhc2ggICB8ICAzICsrKwo+ICBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9u
LXJnYm1hdHJpeC5tayAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgcGFja2Fn
ZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lm1rIHwgIDEgKwo+ICA1IGZp
bGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9D
b25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDA3YmQxNDk5ZDguLmIzNjY1YTc1
NjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZp
Zy5pbgo+IEBAIC0xMzQzLDYgKzEzNDMsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxl
cyIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24tcmVxdWVzdHMtb2F1dGhsaWIvQ29uZmlnLmlu
Igo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1yZXF1ZXN0cy10b29sYmVsdC9Db25maWcuaW4i
Cj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXJmYzM5ODcvQ29uZmlnLmluIgo+ICsJc291cmNl
ICJwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L3B5dGhvbi1ycGRzLXB5L0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24tcnBp
LWdwaW8vQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1ycGktd3MyODF4L0Nv
bmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmdibWF0cml4L0NvbmZpZy5p
biBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjNiMzliZDUwMGMKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9weXRob24tcmdibWF0cml4L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsOCBAQAo+
ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1JHQk1BVFJJWAo+ICsJYm9vbCAicHl0aG9uLXJn
Ym1hdHJpeCIKPiArCWRlcGVuZHMgb24gQlIyX2FhcmNoNjQgfHwgQlIyX2FybQo+ICsJZGVwZW5k
cyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUwo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfSE9TVF9QWVRIT05fQ1lUSE9OCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUlBJX1JH
Ql9MRURfTUFUUklYCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRo
b24tcmdibWF0cml4Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1h
dHJpeC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xNzUw
ODFlYjVkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9w
eXRob24tcmdibWF0cml4Lmhhc2gKPiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNvbXB1
dGVkCj4gK3NoYTI1NiAgOWE2ZGE1YjBhZDczMDg4M2E1ZmExOGFmYzU5YjEyOTdiNGIwNWViNTgx
YzJjMTRhZTUwYTM1ODMyOTZhNGJlZCAgcHl0aG9uLXJnYm1hdHJpeC1mNTU3MzZmNzU5NWJjMDI4
NDUxNjU4OTk2ZWVkZWE5NzQyNjg4YmJjLnRhci5nego+ICtzaGEyNTYgIDgxNzdmOTc1MTMyMTM1
MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJ
TkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmdibWF0cml4L3B5dGhvbi1yZ2JtYXRy
aXgubWsgYi9wYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5tawo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMmJkNWJjOTdiNwo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJp
eC5tawo+IEBAIC0wLDAgKzEsMjQgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+
ICsjIHB5dGhvbi1yZ2JtYXRyaXgKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsK
PiArIyBXaGVuIHVwZGF0aW5nIHRoZSB2ZXJzaW9uLCBwbGVhc2UgYWxzbyB1cGRhdGUgcnBpLXJn
Yi1sZWQtbWF0cml4Cj4gK1BZVEhPTl9SR0JNQVRSSVhfVkVSU0lPTiA9IGY1NTczNmY3NTk1YmMw
Mjg0NTE2NTg5OTZlZWRlYTk3NDI2ODhiYmMgICMgMjAyNC0wOC0xOAo+ICtQWVRIT05fUkdCTUFU
UklYX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGh6ZWxsZXIscnBpLXJnYi1sZWQtbWF0cml4LCQoUFlU
SE9OX1JHQk1BVFJJWF9WRVJTSU9OKSkKPiArUFlUSE9OX1JHQk1BVFJJWF9MSUNFTlNFID0gR1BM
LTIuMAo+ICtQWVRIT05fUkdCTUFUUklYX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gK1BZVEhP
Tl9SR0JNQVRSSVhfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gK1BZVEhPTl9SR0JNQVRSSVhfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlUSE9OX1JHQk1BVFJJWF9TVUJESVIgPSBiaW5kaW5n
cy9weXRob24KPiArUFlUSE9OX1JHQk1BVFJJWF9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1j
eXRob24gcnBpLXJnYi1sZWQtbWF0cml4Cj4gKwo+ICsjIEdlbmVyYXRlIGJpbmRpbmdzIHdpdGgg
Y3l0aG9uCj4gK2RlZmluZSBQWVRIT05fUkdCTUFUUklYX0NZVEhPTgo+ICsJJChNQUtFKSAkKFRB
UkdFVF9DT05GSUdVUkVfT1BUUykgLUMgJChARCkvYmluZGluZ3MvcHl0aG9uL3JnYm1hdHJpeCBc
Cj4gKwkJQ1lUSE9OPSQoSE9TVF9ESVIpL2Jpbi9jeXRob24gYWxsCj4gK2VuZGVmCj4gK1BZVEhP
Tl9SR0JNQVRSSVhfUFJFX0JVSUxEX0hPT0tTICs9IFBZVEhPTl9SR0JNQVRSSVhfQ1lUSE9OCj4g
Kwo+ICskKGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBp
LXJnYi1sZWQtbWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5tayBiL3BhY2thZ2UvcnBpLXJnYi1s
ZWQtbWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5tawo+IGluZGV4IDUzNDA4OTk2YTMuLjIzNTky
N2ZhMWMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1s
ZWQtbWF0cml4Lm1rCj4gKysrIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1s
ZWQtbWF0cml4Lm1rCj4gQEAgLTQsNiArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAKPiArIyBXaGVuIHVwZGF0aW5nIHRoZSB2ZXJzaW9uLCBwbGVhc2UgYWxzbyB1cGRh
dGUgcHl0aG9uLXJnYm1hdHJpeAo+ICBSUElfUkdCX0xFRF9NQVRSSVhfVkVSU0lPTiA9IGY1NTcz
NmY3NTk1YmMwMjg0NTE2NTg5OTZlZWRlYTk3NDI2ODhiYmMgICMgMjAyNC0wOC0xOAo+ICBSUElf
UkdCX0xFRF9NQVRSSVhfU0lURSA9ICQoY2FsbCBnaXRodWIsaHplbGxlcixycGktcmdiLWxlZC1t
YXRyaXgsJChSUElfUkdCX0xFRF9NQVRSSVhfVkVSU0lPTikpCj4gIFJQSV9SR0JfTEVEX01BVFJJ
WF9MSUNFTlNFID0gR1BMLTIuMAo+IAo+IC0tCj4gMi40NS4yCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
