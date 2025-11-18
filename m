Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF633CEE32A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 15:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E5E4188D;
	Tue, 18 Nov 2025 15:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozxAEvOMpeMq; Tue, 18 Nov 2025 15:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592A341893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 592A341893;
	Tue, 18 Nov 2025 15:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C598158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 15:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 199A7806BC
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 15:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 524LdFE3LriK for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 15:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09C678065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C678065D
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09C678065D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 15:52:49 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 498AEC0039;
 Tue, 18 Nov 2025 16:52:47 +0100 (CET)
Message-ID: <f1f8a97e-f13b-4a9b-a17f-ce723845af9f@grenoble.cnrs.fr>
Date: Tue, 18 Nov 2025 16:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20251118145303.2215064-1-thomas@devoogdt.com>
Content-Language: en-US, fr
In-Reply-To: <20251118145303.2215064-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1763481167;
 bh=Rw6DnVh9+KMGLuhYVwUzzMI2RsZznAMeNQDo4ms7/sM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z6ATWgyiaI0VM+uSxM9iLpSpUK3NLZzepgTDrsfnEYh6WsfwE5eayJspuqjOPzTS6
 WZO2+GaaO7RZn8+ki8QjIjbZcsqpKg/Bv18wPfPybfoB19//09bNUu1URBtJ/E0FhL
 zwYwIk9L3ivUG8+ypHfo2+/ycBpxt/P3NH2IAeqlegb8GJ4+fvHE8INbTI+Km0EMw6
 +Z7HSD6PnubE54nbVpIM5X4q+850K+RKB+cpLaygS+UydbJbnGfgEBJBbWqTUKb+Bj
 BKZMv1cSkgSmbGF4bclHqMwcqiFZT/QXL5T0cdn1ItKXSMTlCRGJnf80L38wqnluj8
 xax70k21cz7zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Z6ATWgyi
Subject: Re: [Buildroot] [PATCH] package/yq: add new package
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiAyMDI1LTExLTE4LCBUaG9tYXMgRGV2b29nZHQgd3JvdGU6Cj4gRnJvbTogVGhv
bWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgo+IAo+IFZlcnNpb24gNC40
NS4yIHdhcyBzZWxlY3RlZCBhcyBuZXdlciB2ZXJzaW9ucyByZXF1aXJlIEdvIDEuMjQgWzFdLAo+
IHdoaWNoIGlzIG5vdCB5ZXQgYXZhaWxhYmxlIGluIEJ1aWxkcm9vdC4KPiAKPiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL21pa2VmYXJhaC95cS9jb21taXQvNWJjMmNkMDNkYTkxMzkxNjBkYjcwOTAx
ZmZiODAwMmJmNmUyNDJkNQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhv
bWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9Db25maWcuaW4gICAgfCAg
MSArCj4gIHBhY2thZ2UveXEvQ29uZmlnLmluIHwgMTAgKysrKysrKysrKwo+ICBwYWNrYWdlL3lx
L3lxLmhhc2ggICB8ICAzICsrKwo+ICBwYWNrYWdlL3lxL3lxLm1rICAgICB8IDEzICsrKysrKysr
KysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3lxL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS95cS95cS5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3lxL3lxLm1rCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRl
eCAxMmYzMjdjYjI3Li4xZGZmZjIwNmQ1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmlu
Cj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMjAzLDYgKzIwMyw3IEBAIG1lbnUgIkRl
dmVsb3BtZW50IHRvb2xzIgo+ICAJc291cmNlICJwYWNrYWdlL3RyZWUvQ29uZmlnLmluIgo+ICAJ
c291cmNlICJwYWNrYWdlL3VuaWZkZWYvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3lh
c20vQ29uZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL3lxL0NvbmZpZy5pbiIKPiAgZW5kbWVu
dQo+ICAKPiAgbWVudSAiRmlsZXN5c3RlbSBhbmQgZmxhc2ggdXRpbGl0aWVzIgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3lxL0NvbmZpZy5pbiBiL3BhY2thZ2UveXEvQ29uZmlnLmluCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kODViM2U1NjAxCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UveXEvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxMCBAQAo+ICtj
b25maWcgQlIyX1BBQ0tBR0VfWVEKPiArCWJvb2wgInlxIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
SE9TVF9HTwoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHlxIGlzIHdyYXBwZXIgZm9yIGpxLiBJ
dCdzIFJFQURNRSBzYXlzIOKAnEJlZm9yZQp1c2luZyBgeXFgLCB5b3UgYWxzbyBoYXZlIHRvIGlu
c3RhbGwgaXRzIGRlcGVuZGVuY3ksIGBqcWAu4oCdCgpTaG91bGRuJ3QgdGhpcyBwYWNrYWdlIHRo
ZW4gc2VsZWN0IEJSMl9QQUNLQUdFX0pRPwoKUmVnYXJkcywKCkVkZ2FyIEJvbmV0LgoKPiArCWhl
bHAKPiArCSAgQSBsaWdodHdlaWdodCBhbmQgcG9ydGFibGUgY29tbWFuZC1saW5lIFlBTUwsIEpT
T04sIElOSQo+ICsJICBhbmQgWE1MIHByb2Nlc3NvciwgeXEgdXNlcyBqcSAoYSBwb3B1bGFyIEpT
T04gcHJvY2Vzc29yKQo+ICsJICBsaWtlIHN5bnRheC4KPiArCj4gKwkgIGh0dHBzOi8vbWlrZWZh
cmFoLmdpdGJvb2suaW8veXEvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveXEveXEuaGFzaCBiL3Bh
Y2thZ2UveXEveXEuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uYmM5ZGNjYWQ4MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3lxL3lxLmhhc2gK
PiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICAzOTI5
NmI1NWUzMzk2MmVmODM4Y2Q4YTFiYzBlOTg1MGU3NzVkZTRjYzM4NDNiZjE1ZjA5OTMyNDA2OWQy
NjMyICB5cS00LjQ1LjItZ28yLnRhci5nego+ICtzaGEyNTYgIDY5N2RiMzRkYWJiMjE1NjJmZTg0
NDg3YTJjY2QwMzFmYmQ0NTM4MmI4OWMyY2JkZWM4ZWYzMTY4MmM0ODYwNDAgIExJQ0VOU0UKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS95cS95cS5tayBiL3BhY2thZ2UveXEveXEubWsKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmI0MmI4ZTY1MmMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS95cS95cS5tawo+IEBAIC0wLDAgKzEsMTMgQEAKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHlxCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArCj4gK1lRX1ZFUlNJT04gPSA0LjQ1LjIKPiArWVFfU0lURSA9ICQoY2FsbCBnaXRo
dWIsbWlrZWZhcmFoLHlxLHYkKFlRX1ZFUlNJT04pKQo+ICtZUV9MSUNFTlNFID0gTUlUCj4gK1lR
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gK1lRX0dPTU9EID0gZ2l0aHViLmNvbS9taWtlZmFy
YWgveXEvdjQKPiArCj4gKyQoZXZhbCAkKGdvbGFuZy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
