Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBAFCCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 13:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98322844F7;
	Fri, 10 Oct 2025 13:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6SjyTlzaYqv; Fri, 10 Oct 2025 13:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B352844C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B352844C4;
	Fri, 10 Oct 2025 13:47:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D967226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F07A614DF
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njnxeXE4jNRn for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 13:47:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EC2F60ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC2F60ECB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EC2F60ECB
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:47:34 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 92A302C80CC2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 15:47:32 +0200 (CEST)
Message-ID: <1148a6fa-9de0-444f-9a4e-d6a91c598dc3@bubu1.eu>
Date: Fri, 10 Oct 2025 15:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
 <13eefae6-0fb5-4e32-bca1-0ff35d13a5a0@bubu1.eu> <aOi9aehsauNaVtWI@debian>
Content-Language: en-US
In-Reply-To: <aOi9aehsauNaVtWI@debian>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760104052; bh=2Dkij02iwmaWegR4xyzknS9qfIG9ycHfpzS4teCxPPU=;
 h=Date:From:Subject:To:References:In-Reply-To;
 b=H0HmxUfcG984S95nH3j18Gu6FuVuP+mwV3oQafd7p8wJlEMBsjqwn78WuyXoPeh01
 g3YT8iQ7TslamyoPaT5K57uP9e0dcm19k1v8D+qHNLMv/BiCzFCkxBt1xywPkKFF9P
 3Ftrj7tVDtQ29tbOcu4hd3D4nKPSpEJGuXi98aRRSwhl6GkdcpL/Jn95vxusuBZUPm
 kNHWPJGsU3GcNXUecstx4Vjvf/F2L2N4gge+XnB9s1KC2Wjy+hj7K9Cm2XmHbufUKS
 UyG5u+bhrV1Toi+CO6kC7GMyPMdOovQQMe8ov9ySTNpZqcfac8q9Ed9B6uRxIEXYQb
 uDiWxl0oH0nMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=H0HmxUfc
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMTAvMjUgMTA6MDEsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToKPiBPbiBUaHUsIE9jdCAw
OSwgMjAyNSBhdCAwNzo0MjoxN1BNICswMjAwLCBNYXJjdXMgSG9mZm1hbm4gdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPj4gSGkgVmluY2VudCEKPiAKPiBIaSBNYXJjdXMsCj4gCj4gVGhhbmtzIGZvciBo
YXZpbmcgYSBsb29rLgoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb25zIQoKPiAKPj4KPj4gT24g
MTAvOS8yNSAxNzoyOCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+Pj4gV2hlbiBidWlsZGluZyBp
biBwYXJhbGxlbCB3aXRoIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzCj4+PiAoQlIyX1BFUl9QQUNL
QUdFX0RJUkVDVE9SSUVTPXkpLCBicm1ha2Ugb3V0cHV0IGlzIG9mdGVuIGdhcmJsZWQ6Cj4+Cj4+
IFRoaXMgaGFzIGJvdGhlcmVkIG1lIGZvciBzb29vIGxvbmcsIGJ1dCBJIG5ldmVyIGZvdW5kIG91
dCB3aHkgdGhpcyBpcyBnb2luZwo+PiB3cm9uZy4gRG8geW91IGtub3cgd2h5IHRoaXMgc3BlY2lm
aWNhbGx5IGZhaWxzIHdpdGggUFBEcyAod2hpY2ggSSBhbHdheXMKPj4gZW5hYmxlLCBzbyBJIG5l
dmVyIGtuZXcgdGhpcyB3YXMgbm90IGJyb2tlbiB3aXRob3V0IHRoZW0pPwo+IAo+IFllcywgdGhp
cyBpcyBhIGxpbWl0YXRpb24gb2YgbWFrZSBwYXJhbGxlbCBidWlsZHMuIElmIHdlIGxvb2sgYXQg
dGhlIGJybWFrZQo+ICJwaXBlbGluZSI6Cj4gCj4gICAgICBtYWtlICIke0B9IiBcCj4gCj4gQXQg
dGhpcyBwb2ludCB3ZSBhbHJlYWR5IGhhdmUgYWxsIHRoZSBtZXNzYWdlcyBmcm9tIGFsbCB0aGUg
dGhyZWFkcywgb2Z0ZW4gbWl4ZWQKPiBvbiB0aGUgc2FtZSBsaW5lOgo+IAo+ICAgIGNoZWNraW5n
IGZvciBzdGRpbnQuaC4uLiA+Pj4gaG9zdC1kdGMgMS43LjIgSW5zdGFsbGluZyB0byBob3N0IGRp
cmVjdG9yeQo+IAo+IFRoZSByZXN0IG9mIHRoZSBwaXBlbGluZSBqdXN0IGFkZHMgdGhlIHRpbWVz
dGFtcCwgY29waWVzIGFsbCB0aGUgbWVzc2FnZXMgdG8gdGhlCj4gYnIubG9nIGFuZCBrZWVwcyBv
bmx5IHRoZSBtZXNzYWdlcyB3aXRoIHRoZSAiPj4+IiBtYXJrZXJzIGZvciB0aGUgY29uc29sZQo+
IG91dHB1dDoKPiAKPiAgICAgICY+ID4oIHdoaWxlIHJlYWQgLXIgbGluZTsgZG8KPiAgICAgICAg
ICAgICAgIHByaW50ZiAiJSglWS0lbS0lZFQlSDolTTolUylUICVzXG4iIC0xICIke2xpbmV9Igo+
ICAgICAgICAgICBkb25lIFwKPiAgICAgICAgICAgfHRlZSAtYSBici5sb2cgXAo+ICAgICAgICAg
ICB8Z3JlcCAtLWNvbG91cj1uZXZlciAtRSAnPj4+Jwo+ICAgICAgICAgKQo+IAo+IFRoZSBzaW1w
bGVzdCB0aGluZyB3ZSBjYW4gZG8gYXQgdGhpcyBwb2ludCBpcyB0byBjbGVhbnVwIGEgYml0ICJh
ZnRlciB0aGUgZmFjdCIuCj4gCj4gVGhpcyBpcyBub3QgcGVyZmVjdCwgYnV0IHRoaXMgaXMgZmFy
IHNpbXBsZXIgdGhhbiB3aGF0IGFpYWlhaSBpcyBkb2luZyBmb3IKPiBleGFtcGxlLCB3aXRoIGlu
dGVybWVkaWF0ZSBsb2dmaWxlcyBhbmQgYSBsb2NrOgo+IAo+IGh0dHBzOi8vZ2l0LmluZnJhZGVh
ZC5vcmcvP3A9dXNlcnMvZGVkZWtpbmQvYWlhaWFpLmdpdDthPWJsb2I7Zj1oZWxwZXJzL2FpYWlh
aS1tYWtlLWtlcm5lbDtoPTQzMzhhMjc2NGEwOTRmMjlmNGZlYjM4Y2MzY2NkZDI2MzM2YjFiYTY7
aGI9ZWFkZmI0ZDVjODhkMmRlYzI4NDJiYTg5ODZkZjQyZjExMWQ0YTdhOCNsMTE5Cj4gCj4+Cj4+
Pgo+Pj4gICAgIDIwMjUtMTAtMDhUMTg6Mzk6MTAgPj4+IGhvc3QtZHRjIDEuNy4yIEJ1aWxkaW5n
Cj4+PiAgICAgMjAyNS0xMC0wOFQxODozOToxMSBjaGVja2luZyBmb3Igc3RkaW50LmguLi4gPj4+
IGhvc3QtZHRjIDEuNy4yIEluc3RhbGxpbmcgdG8gaG9zdCBkaXJlY3RvcnkKPj4+ICAgICAyMDI1
LTEwLTA4VDE4OjM5OjEyIGNoZWNraW5nIGZvciBsaW1pdHMuaC4uLiA+Pj4gaG9zdC1nbXAgNi4z
LjAgSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9yeQo+Pj4KPj4+IFJlbW92ZSB0aGUgc3B1cmlv
dXMgc3RyaW5nIGJldHdlZW4gdGhlIHRpbWVzdGFtcCBhbmQgdGhlICI+Pj4iIG1hcmtlciB0bwo+
Pj4gZml4IHRoaXMuCj4+PiBXZSBuZWVkIHNvbWUgZXh0cmEgY2FyZSB0byBwcmVzZXJ2ZSB0aGUg
cHJlY2VkaW5nICJ0ZXJtIGJvbGQiIHNwZWNpYWwKPj4+IGNoYXJhY3RlcnMgc2VxdWVuY2UuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0u
Y29tPgo+Pj4gQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+Pj4g
LS0tCj4+PiAgICB1dGlscy9icm1ha2UgfCAzICsrLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS91dGlscy9i
cm1ha2UgYi91dGlscy9icm1ha2UKPj4+IGluZGV4IGE0YjllN2ZhNzEuLjJhNzRkNTgxNjcgMTAw
NzU1Cj4+PiAtLS0gYS91dGlscy9icm1ha2UKPj4+ICsrKyBiL3V0aWxzL2JybWFrZQo+Pj4gQEAg
LTEyLDcgKzEyLDggQEAgbWFpbigpIHsKPj4+ICAgICAgICAgICAgICAgICBwcmludGYgIiUoJVkt
JW0tJWRUJUg6JU06JVMpVCAlc1xuIiAtMSAiJHtsaW5lfSIKPj4+ICAgICAgICAgICAgIGRvbmUg
XAo+Pj4gICAgICAgICAgICAgfHRlZSAtYSBici5sb2cgXAo+Pj4gLSAgICAgICAgIHxncmVwIC0t
Y29sb3VyPW5ldmVyIC1FICc+Pj4nCj4+PiArICAgICAgICAgfGdyZXAgLS1saW5lLWJ1ZmZlcmVk
IC0tY29sb3VyPW5ldmVyIC1FICc+Pj4nIFwKPj4KPj4gQ291bGQgeW91IGV4cGxhaW4gd2hhdCAt
LWxpbmUtYnVmZmVyZWQgZG9lcyBoZXJlIGFuZCB3aHkgd2UgbmVlZCB0aGlzPyAoVGhlCj4+IG1h
biBwYWdlIHdhc24ndCB0b28gaGVscGZ1bCBpbiBqdXN0IHNwZWNpZnlpbmcgIlVzZSBsaW5lIGJ1
ZmZlcmluZyBvbgo+PiBvdXRwdXQiLgo+IAo+IFRoaXMgdGVsbHMgZ3JlcCB0byBvdXRwdXQgaXRz
IHJlc3VsdHMgbGluZSBieSBsaW5lIGluc3RlYWQgb2YgYnVmZmVyaW5nIGZvciB0b28gbG9uZy4K
PiBXaXRob3V0IHRoaXMgb3B0aW9uLCBicm1ha2Ugb3V0cHV0IGlzIHByaW50ZWQgaW4gImJ1cnN0
cyIsIGFuZCBvbmx5IGZyb20gdGltZXMKPiB0byB0aW1lczsgbm90IHZlcnkgImxpdmUiLgoKQWgs
IHRoaXMgbWFrZXMgc2Vuc2UsIEkgdGhpbmsgSSBoYXZlIG5vdGljZXMgdGhpcyBkZWxheSBoZXJl
IG1vc3RseSBpbiAKQ0ksIHdoZXJlIHNvbWV0aW1lcyB0aGVyZSdzIG5vIG91dHB1dCBmb3IgbWlu
dXRlcy4gVGhpcyBzZWVtcyB0byBpbXByb3ZlIAp0aGF0LgoKVGhpcyBzaG91bGQgcHJvYmFibHkg
bWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gWW91IGNhbiBqdXN0IHJlbW92ZSBp
dCBhbmQgdHJ5IHRvIHNlZSB0aGUgZGlmZmVyZW5jZSwgYXMgdGhpcyBpcyBvdGhlcndpc2UKPiBm
dW5jdGlvbmFsbHkgaWRlbnRpY2FsLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+IAo+
Pgo+Pj4gKyAgICAgICAgIHxzZWQgLUUgJ3MvXihbMC05VDotXXsxOX0pIFtbOnByaW50Ol1dKigu
Kj4+PiApL1wxIFwyLycKPj4+ICAgICAgICAgICApCj4+PiAgICAgICAgcmV0PSR7P30KCk1hcmN1
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
