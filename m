Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA10CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 021CD41980;
	Fri, 15 Sep 2023 21:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 021CD41980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKdbQxhuLmtB; Fri, 15 Sep 2023 21:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27ECB404BF;
	Fri, 15 Sep 2023 21:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27ECB404BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A56E11BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B9BB404BF
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B9BB404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoBK-k-1qiY2 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:09:12 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F438400CE
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F438400CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0AE2A2003D3;
 Fri, 15 Sep 2023 23:09:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:09:06 +0200
Date: Fri, 15 Sep 2023 23:09:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230915210906.GC2571@scaer>
References: <20230915192308.1432032-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915192308.1432032-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694812149;
 bh=RWmSvlei8v/004AJj/GAlF7F4QlUwHtfPx9tbXMcLmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FWPdsA2O57zhf5fUW0m26QDwKffKFb4mV1jn4n7KOGzQMqUFu5VNgJW9U2weoKB2z
 rHrAL3R+N2hicu3U6L6KZlgLNfE1GPzUUxm56hVNWrSJ44V7BYJCvUGmljH8nBW5Pr
 8opWn7AbgFrxrIMdKLI4SVPfMj0g122jeratrfjj6nBX9LUwF9jNssseC5g65XYUyw
 eNO6daV8d2X1zA18AmAv7lcLeBYWD2LFTJcOfbpMSPwnTDyzc5YRRveO6GaV6/oHmv
 UbjXVC7nmoKmU/vNllpK+S+zHGbs6cGg51cwrx8T5x/4WaItzF6iMssJkS0H/rCgYz
 LEjdXBaLlpJUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FWPdsA2O
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: fix riscv build
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

SnVsaWVuLCBBbGwsCgpPbiAyMDIzLTA5LTE1IDIxOjIzICswMjAwLCBKdWxpZW4gT2xpdmFpbiBz
cGFrZSB0aHVzbHk6Cj4gbGlianhsIHdhcyBmYWlsaW5nIHRvIGJ1aWxkIGZvciByaXNjdiB0YXJn
ZXRzLCBzaW5jZSBjb21taXQgZmY3YzM3ZTU3Cj4gInBhY2thZ2UvbGlianhsOiBzZWN1cml0eSBi
dW1wIHRvIHZlcnNpb24gMC44LjEiLiBCdWlsZCB3YXMgZmFpbGluZyB3aXRoCj4gb3V0cHV0Ogo+
IAo+ICAgICAvYnVpbGQvbGlianhsLTAuOC4xL2xpYi9qeGwvZW5jX3h5Yi5jYzogSW4gZnVuY3Rp
b24gJ2p4bDo6SW1hZ2UzRiBqeGw6Ok5fU0NBTEFSOjpUcmFuc2Zvcm1Ub0xpbmVhclJHQihjb25z
dCBqeGw6OkltYWdlM0YmLCBjb25zdCBqeGw6OkNvbG9yRW5jb2RpbmcmLCBmbG9hdCwgY29uc3Qg
SnhsQ21zSW50ZXJmYWNlJiwganhsOjpUaHJlYWRQb29sKiknOgo+ICAgICAvYnVpbGQvbGlianhs
LTAuOC4xL2xpYi9qeGwvZW5jX3h5Yi5jYzoyMjM6MjE6IGVycm9yOiB2YXJpYWJsZSAnc3RkOjph
dG9taWM8Ym9vbD4gb2snIGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCj4gICAg
ICAgMjIzIHwgICBzdGQ6OmF0b21pYzxib29sPiBva3t0cnVlfTsKPiAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgIF5+Cj4gCj4gVGhpcyBidWlsZCBmYWlsdXJlIHdhcyBkdWUgdG8gYSBt
aXNzaW5nIDxhdG9taWM+IGhlYWRlciBpbmNsdXNpb24uIEZvcgo+IHNvbWUgcmVhc29uLCB0aGUg
YnVpbGQgZmFpbHVyZSB3YXMgb2JzZXJ2ZWQgb25seSB3aXRoIFJJU0MtViB0b29sY2hhaW5zLgo+
IAo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSBhZGRpbmcgYW4gdXBzdHJlYW0gY29t
bWl0LCBub3QgeWV0IGluIGEKPiBwYWNrYWdlIHJlbGVhc2UuIFNlZSBbMV0uCj4gCj4gRml4ZXM6
Cj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMTIxLzEyMTA3YmM3YWVh
N2FmYWUxZDJmYjkzNWQzMWI0NGVlZTZlYTE1MDEKPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L2xpYmp4bC9saWJqeGwvY29tbWl0LzIyZDEyZDc0ZTdiYzU2YjA5Y2ZiMTk3M2FhODllYzhkNzE0
ZmEzZmMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0t
LQo+IFBhdGNoIHRlc3RlZCBvbiBicmFuY2ggbWFzdGVyIGF0IGNvbW1pdCAzNTU3YTdiIHdpdGgg
Y29tbWFuZHM6Cj4gCj4gICAgIG1ha2UgY2hlY2stcGFja2FnZQo+ICAgICAuLi4KPiAgICAgMCB3
YXJuaW5ncyBnZW5lcmF0ZWQKPiAKPiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4g
ICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVyIFwKPiAgICAgICAgIHRlc3RzLnBhY2thZ2Uu
dGVzdF9saWJqeGwKPiAgICAgLi4uCj4gICAgIE9LCj4gCj4gICAgIHV0aWxzL3Rlc3QtcGtnIC1h
IC1wIGxpYmp4bAo+ICAgICAuLi4KPiAgICAgNDUgYnVpbGRzLCAxMSBza2lwcGVkLCAwIGJ1aWxk
IGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCj4gICAgIAo+
IE5vdGU6IHRoaXMgcGF0Y2ggd2FzIGFsc28gdGVzdGVkIG9uIHRvcCBvZiB0aGUgcGF0Y2ggcHJv
cG9zZWQgYXQ6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDIzMDkxNDIxNTYwNi4zMDk3MzUtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bS8KPiAtLS0KPiAgLi4uaWMtY29udGVudC10by1maXgtZ2NjLWNvbXBpbGF0aW9uLWZvLnBhdGNo
IHwgNDcgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJqeGwvMDAwMi1BZGQtbWlzc2lu
Zy1hdG9taWMtY29udGVudC10by1maXgtZ2NjLWNvbXBpbGF0aW9uLWZvLnBhdGNoCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGlianhsLzAwMDItQWRkLW1pc3NpbmctYXRvbWljLWNvbnRlbnQt
dG8tZml4LWdjYy1jb21waWxhdGlvbi1mby5wYXRjaCBiL3BhY2thZ2UvbGlianhsLzAwMDItQWRk
LW1pc3NpbmctYXRvbWljLWNvbnRlbnQtdG8tZml4LWdjYy1jb21waWxhdGlvbi1mby5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjg1NmIwMDcyOAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpYmp4bC8wMDAyLUFkZC1taXNzaW5nLWF0b21p
Yy1jb250ZW50LXRvLWZpeC1nY2MtY29tcGlsYXRpb24tZm8ucGF0Y2gKPiBAQCAtMCwwICsxLDQ3
IEBACj4gK0Zyb20gNDJlOTQ0YTQ3MTY3MmRhZTg1MjJmYmNmMTYxOTQxODk1YmExNjYzMiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRWFzdGRvbmcgPDMxOTIwOTI1K0lFQVNUQHVz
ZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4KPiArRGF0ZTogVGh1LCAyMyBGZWIgMjAyMyAwNjowODoz
NiArMDgwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIDxhdG9taWM+IGNvbnRlbnQg
dG8gZml4IGdjYyBjb21waWxhdGlvbiBmb3IgUklTQ1YKPiArIGFyY2hpdGVjdHVyZS4gKCMyMjEx
KQo+ICsKPiArKiBBZGQgbWlzc2luZyA8YXRvbWljPiBjb250ZW50IHRvIGZpeCBnY2MgY29tcGls
YXRpb24gZm9yIFJJU0NWIGFyY2hpdGVjdHVyZS4KPiArCj4gKyogYWRkIG5hbWUgdG8gQVVUSE9S
Uwo+ICsKPiArKiBsaW50IGZpeAo+ICsKPiArQ28tYXV0aG9yZWQtYnk6IE1vcml0eiBGaXJzY2hp
bmcgPGZpcnNjaGluZ0Bnb29nbGUuY29tPgo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29t
L2xpYmp4bC9saWJqeGwvY29tbWl0LzIyZDEyZDc0ZTdiYzU2YjA5Y2ZiMTk3M2FhODllYzhkNzE0
ZmEzZmMKPiArU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAr
LS0tCj4gKyBBVVRIT1JTICAgICAgICAgICAgfCAxICsKPiArIGxpYi9qeGwvZW5jX3h5Yi5jYyB8
IDEgKwo+ICsgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1n
aXQgYS9BVVRIT1JTIGIvQVVUSE9SUwo+ICtpbmRleCA0NGRjYzQwOS4uMzM0MDQyMmQgMTAwNjQ0
Cj4gKy0tLSBhL0FVVEhPUlMKPiArKysrIGIvQVVUSE9SUwo+ICtAQCAtMzAsNiArMzAsNyBAQCBE
YW5pZWwgTm92b21lc2vDvSA8ZG5vdm9tZXNreUBnbWFpbC5jb20+Cj4gKyBEYXZpZCBCdXJuZXR0
IDx2YXJnb2xzb2Z0QGdtYWlsLmNvbT4KPiArIERpcmsgTGVtc3RyYSA8ZGlya0BsZW1zdHJhLm9y
Zz4KPiArIERvbiBPbG1zdGVhZCA8ZG9uLmoub2xtc3RlYWRAZ21haWwuY29tPgo+ICsrRG9uZyBY
dSA8eGRvbmcxODFAZ21haWwuY29tPgo+ICsgRXZlbiBSb3VhdWx0IDxldmVuLnJvdWF1bHRAc3Bh
dGlhbHlzLmNvbT4KPiArIEZyZWQgQnJlbm5hbiA8Y29weXBhc3RlQGtpdHRlbnMucGg+Cj4gKyBI
ZWlrbyBCZWNrZXIgPGhlaXJlY2thQGV4aGVyYm8ub3JnPgo+ICtkaWZmIC0tZ2l0IGEvbGliL2p4
bC9lbmNfeHliLmNjIGIvbGliL2p4bC9lbmNfeHliLmNjCj4gK2luZGV4IGM3MzEwNzY1Li4yZmQ1
ZDAyNSAxMDA2NDQKPiArLS0tIGEvbGliL2p4bC9lbmNfeHliLmNjCj4gKysrKyBiL2xpYi9qeGwv
ZW5jX3h5Yi5jYwo+ICtAQCAtNiw2ICs2LDcgQEAKPiArICNpbmNsdWRlICJsaWIvanhsL2VuY194
eWIuaCIKPiArIAo+ICsgI2luY2x1ZGUgPGFsZ29yaXRobT4KPiArKyNpbmNsdWRlIDxhdG9taWM+
Cj4gKyAjaW5jbHVkZSA8Y3N0ZGxpYj4KPiArIAo+ICsgI3VuZGVmIEhXWV9UQVJHRVRfSU5DTFVE
RQo+ICstLSAKPiArMi40MS4wCj4gKwo+IC0tIAo+IDIuNDEuMAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
