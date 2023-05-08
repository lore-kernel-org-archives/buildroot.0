Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87C8C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64935428C1;
	Mon,  8 May 2023 21:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64935428C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lxvGvUO2YCf; Mon,  8 May 2023 21:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0316B428BF;
	Mon,  8 May 2023 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0316B428BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDAD1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 362C761308
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362C761308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCvrlhCfXS8b for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 21:02:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F3561114
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4F3561114
 for <buildroot@buildroot.org>; Mon,  8 May 2023 21:02:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3FC53780507;
 Mon,  8 May 2023 23:02:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 23:02:39 +0200
Date: Mon, 8 May 2023 23:02:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20230508210239.GU252090@scaer>
References: <20230425070923.1294644-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425070923.1294644-1-raphael.melotte@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683579762;
 bh=bdL/gcBK0Hh6aXXi3SWnGCvdkbaMp9LxgGt1ViIDsDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E20zBjVVvgxk1GJEYf9JICnYUsz3IaGwTd7iXJZGJ2ZhWgSux4Q2A84L7ENBPYXCg
 /5oVyzzvPMgzAtH+yd65ekVTMNNPk8OmVkD9cAA9v8R3ZM/fZRHE6Tnip08Bte8uxL
 8KSJF5S8JMmwu0qnkRSTPIL65LWzc569T7nNg/co0K39iVmg4qk8+Dw0pJAkQoLC6t
 u20k0/LWB34fJlgeCrOto2UjgyXu9SA6vvfLOltTHXQA7TSrMqjfP/CzuCeFIY0N5S
 sG+6bdN59TVJ7rktmT60qiiJsJvBFi6yd3w6E45dd8h1M1qGbCJ5gFK6VWvPYTiu+x
 xLEwzOmK61Cig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E20zBjVV
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: fix building with zlib-ng
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

UmFwaGHDq2wsIEFsbCwKCk9uIDIwMjMtMDQtMjUgMDk6MDkgKzAyMDAsIFJhcGhhw6tsIE3DqWxv
dHRlIHNwYWtlIHRodXNseToKPiBUaGUgY3VycmVudCBtdXBkZiB2ZXJzaW9uIGZhaWxzIHRvIGJ1
aWxkIHdoZW4gemxpYi1uZyBpcyB1c2VkIGFzIHRoZQo+IHpsaWIgaW1wbGVtZW50YXRpb24uIEFk
ZCBhIHBhdGNoIHRvIGZpeCBpdC4KPiAKPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgYnVpbGQg
ZmFpbHVyZSByYWlzZWQgc2luY2UgdGhlIGJ1bXAgdG8KPiB2ZXJzaW9uIDEuMjEuMCBvZiB0aGUg
bXVwZGYgcGFja2FnZSBpbiBjb21taXQKPiAzYzIwMzNjZDJhY2UwNzdlN2RmYWY1OGEyNTg5YjJh
OTNhNWZkN2IwOgo+IAo+IHNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOiBJbiBmdW5jdGlvbiAn
ZGVmbGF0ZV93cml0ZSc6Cj4gc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmM6MzQzOjI3OiBlcnJv
cjogJ1VJTlRfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiAg
IDM0MyB8ICAgICAgICAgbmV3YnVmc2l6ZSA9IG4gPj0gVUlOVF9NQVggPyBVSU5UX01BWCA6IGRl
ZmxhdGVCb3VuZCgmc3RhdGUtPnosIG4pOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fgo+IHNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOjI2OjE6IG5vdGU6ICdV
SU5UX01BWCcgaXMgZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4nOyBkaWQgeW91IGZvcmdl
dCB0byAnI2luY2x1ZGUgPGxpbWl0cy5oPic/Cj4gCj4gRml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzLzg3MTI4ZTk5NjdjZmYyMDA3OGM2NWFiODQ3ODc3YWE0NGNj
NDA5ZDkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxv
dHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCj4gLS0tCj4gIC4uLmlzc2luZy1saW1pdHMuaC1pbmNsdWRlLWZvci1VSU5UX01B
WC5wYXRjaCB8IDcwICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcwIGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbXVwZGYvMDAwMS1BZGQt
bWlzc2luZy1saW1pdHMuaC1pbmNsdWRlLWZvci1VSU5UX01BWC5wYXRjaAo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3It
VUlOVF9NQVgucGF0Y2ggYi9wYWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgt
aW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjk1ZjJmODY2NjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9t
dXBkZi8wMDAxLUFkZC1taXNzaW5nLWxpbWl0cy5oLWluY2x1ZGUtZm9yLVVJTlRfTUFYLnBhdGNo
Cj4gQEAgLTAsMCArMSw3MCBAQAo+ICtGcm9tIGViY2U5ZjFiMTI5ZWJjOGYyYjE3YWZhMDJhNGZm
Y2I5NDUzYzExZDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206ID0/VVRGLTg/cT9S
YXBoYT1DMz1BQmw9MjBNPUMzPUE5bG90dGU/PSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4g
K0RhdGU6IE1vbiwgMjQgQXByIDIwMjMgMTc6Mjc6MzUgKzAyMDAKPiArU3ViamVjdDogW1BBVENI
XSBBZGQgbWlzc2luZyBsaW1pdHMuaCBpbmNsdWRlIGZvciBVSU5UX01BWAo+ICtNSU1FLVZlcnNp
b246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArZW5jb2RlLWJhc2ljLmMgdXNlcyAn
VUlOVF9NQVgnLCB3aGljaCBpcyBhdmFpbGFibGUgaW4gdGhlICdsaW1pdHMuaCcKPiAraGVhZGVy
Lgo+ICsKPiArSW4gc29tZSBjb25maWd1cmF0aW9ucyB0aGF0IGJ1aWxkIHdpdGggemxpYiBmcm9t
IFsxXSwgYnkgY2hhbmNlCj4gK2xpbWl0cy5oIGdldHMgaW5kaXJlY3RseSBpbmNsdWRlZCB3aGVu
IGluY2x1ZGluZyAnei1pbXAuaCcgKHRoZQo+ICtpbmNsdWRlcyBhcmU6ICd6LWltcC5oJyAtPiAn
emxpYi5oJyAtPiAnemNvbmYuaCcgLT4gJ2xpbWl0cy5oJyksIHNvCj4gK3RoZSBidWlsZCBzdWNj
ZWVkcy4KPiArCj4gK1doZW4gdXNpbmcgb3RoZXIgemxpYiBpbXBsZW1lbnRhdGlvbnMgaG93ZXZl
ciAoZm9yIGV4YW1wbGUgZnJvbSBbMl0pLAo+ICtsaW1pdHMuaCBpcyBub3QgbmVjZXNzYXJpbHkg
aW5jbHVkZWQgaW5kaXJlY3RseSwgd2hpY2ggbGVhZHMgdG8gdGhlCj4gK2J1aWxkIGZhaWxpbmcg
aW4gdGhlIGZvbGxvd2luZyB3YXk6Cj4gKwo+ICtzb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMuYzog
SW4gZnVuY3Rpb24gJ2RlZmxhdGVfd3JpdGUnOgo+ICtzb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMu
YzozNDM6Mjc6IGVycm9yOiAnVUlOVF9NQVgnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKQo+ICsgIDM0MyB8ICAgICAgICAgbmV3YnVmc2l6ZSA9IG4gPj0gVUlOVF9NQVgg
PyBVSU5UX01BWCA6IGRlZmxhdGVCb3VuZCgmc3RhdGUtPnosIG4pOwo+ICsgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPiArc291cmNlL2ZpdHovZW5jb2RlLWJhc2lj
LmM6MjY6MTogbm90ZTogJ1VJTlRfTUFYJyBpcyBkZWZpbmVkIGluIGhlYWRlciAnPGxpbWl0cy5o
Pic7IGRpZCB5b3UgZm9yZ2V0IHRvICcjaW5jbHVkZSA8bGltaXRzLmg+Jz8KPiArCj4gK0FkZCB0
aGUgbWlzc2luZyBpbmNsdWRlLCBzbyB0aGF0IHRoZSBidWlsZCBzdWNjZWVkcyBubyBtYXR0ZXIg
aWYgemxpYgo+ICtpbmRpcmVjdGx5IGluY2x1ZGVzICdsaW1pdC5oJyBvciBub3QuCj4gKwo+ICtT
aW1pbGFybHksIGFsc28gYWRkIGl0IGluIG91dHB1dC1wcy5jIHdoZXJlIGl0J3MgYWxzbyBtaXNz
aW5nLgo+ICsKPiArWzFdOiBodHRwczovL3psaWIubmV0Lwo+ICtbMl06IGh0dHBzOi8vZ2l0aHVi
LmNvbS96bGliLW5nL3psaWItbmcKPiArCj4gK1NpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxv
dHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiArVXBzdHJlYW06IGh0dHBzOi8vYnVncy5n
aG9zdHNjcmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwNjY2Nwo+ICstLS0KPiArIHNvdXJjZS9m
aXR6L2VuY29kZS1iYXNpYy5jIHwgMiArKwo+ICsgc291cmNlL2ZpdHovb3V0cHV0LXBzLmMgICAg
fCAyICsrCj4gKyAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ICsKPiArZGlmZiAt
LWdpdCBhL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jIGIvc291cmNlL2ZpdHovZW5jb2RlLWJh
c2ljLmMKPiAraW5kZXggMDNhNGZmNzZiLi44NGYwYzM1ZTYgMTAwNjQ0Cj4gKy0tLSBhL3NvdXJj
ZS9maXR6L2VuY29kZS1iYXNpYy5jCj4gKysrKyBiL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5j
Cj4gK0BAIC0yNCw2ICsyNCw4IEBACj4gKyAKPiArICNpbmNsdWRlICJ6LWltcC5oIgo+ICsgCj4g
KysjaW5jbHVkZSA8bGltaXRzLmg+Cj4gKysKPiArIHN0cnVjdCBhaHgKPiArIHsKPiArIAlmel9v
dXRwdXQgKmNoYWluOwo+ICtkaWZmIC0tZ2l0IGEvc291cmNlL2ZpdHovb3V0cHV0LXBzLmMgYi9z
b3VyY2UvZml0ei9vdXRwdXQtcHMuYwo+ICtpbmRleCBlZjIyYzNjZDYuLjNkYzhlYTE3ZCAxMDA2
NDQKPiArLS0tIGEvc291cmNlL2ZpdHovb3V0cHV0LXBzLmMKPiArKysrIGIvc291cmNlL2ZpdHov
b3V0cHV0LXBzLmMKPiArQEAgLTI0LDYgKzI0LDggQEAKPiArIAo+ICsgI2luY2x1ZGUgInotaW1w
LmgiCj4gKyAKPiArKyNpbmNsdWRlIDxsaW1pdHMuaD4KPiArKwo+ICsgdHlwZWRlZiBzdHJ1Y3Qg
cHNfYmFuZF93cml0ZXJfcwo+ICsgewo+ICsgCWZ6X2JhbmRfd3JpdGVyIHN1cGVyOwo+ICstLSAK
PiArMi4zOS4xCj4gKwo+IC0tIAo+IDIuMzkuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
