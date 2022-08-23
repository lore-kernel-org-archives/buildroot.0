Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2411FC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 12:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79533405C1;
	Tue, 23 Aug 2022 12:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79533405C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2nNf-upV7aW; Tue, 23 Aug 2022 12:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79AD8405B6;
	Tue, 23 Aug 2022 12:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79AD8405B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E84A21BF417
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 12:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C269181499
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 12:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C269181499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEAbmsFBTCds for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 12:46:56 +0000 (UTC)
X-Greylist: delayed 00:15:34 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6353C81498
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6353C81498
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 12:46:55 +0000 (UTC)
Received: from [192.168.31.190] (unknown [123.185.180.94])
 by smtp14 (Coremail) with SMTP id EsCowABXcfKRyARjB6T6BQ--.211S2;
 Tue, 23 Aug 2022 20:31:16 +0800 (CST)
Message-ID: <4931af16-cd09-8bbe-842e-9836bbd1e7c9@163.com>
Date: Tue, 23 Aug 2022 05:31:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220823054811.360322-1-christian@paral.in>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <20220823054811.360322-1-christian@paral.in>
X-CM-TRANSID: EsCowABXcfKRyARjB6T6BQ--.211S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4fWFyxKw43uw1Dtw4ktFb_yoWrWrWDpF
 47Gr15Kr4xK3WfJ3yfGF17Zr1akrZYkF4UGwnrXr1jq3sxJF18Ja4UKa18JrsrWr1UJw4U
 X3Z5CF43Wr4UtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEeMKXUUUUU=
X-Originating-IP: [123.185.180.94]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBdhhmjWDkoVhE3AAAsg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=8CPn8
 Rm3MfgrUlSnm81Y4ZFRExXQgq7Q6j+xo+ZMePM=; b=A2Urs9oFpO8haYTm+C+mn
 27QTr1lulaHRR1PUxbu8PCd6w/9qVubjbOxjXYG6xhlhkd35g40Ow6f4QZqUG48h
 w0bACHH1XHSqrRHn6gCUkBed0bVB7m5Jv1gDUb0sWg6Sz2ooEDPS+xV9SY2sjBBB
 /p6Np72Oe0RspN5ewSFS4I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=A2Urs9oF
Subject: Re: [Buildroot] [PATCH v2 1/1] package/crun: new package
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

TWF5YmUgd2Ugc2hvdWxkIGV4cGxpY2l0bHkgZW5hYmxlIHRoZXNlIGtlcm5lbCBjb25maWd1cmF0
aW9uczoKCkNPTkZJR19VU0VSX05TICMgc2V0Z3JvdXBzCkNPTkZJR19CTEtfREVWX1RIUk9UVExJ
TkcgIyBpby5tYXgKClRlc3RlZC1ieTogVElBTiBZdWFuaGFvIDx0aWFueXVhbmhhbzNAMTYzLmNv
bT4KCuWcqCA4LzIyLzIyIDIyOjQ4LCBDaHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IOWG
memBkzoKPiBjcnVuIGlzIGEgZmFzdCBhbmQgbG93LW1lbW9yeSBPQ0kgQ29udGFpbmVyIFJ1bnRp
bWUgaW4gQy4KPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2NydW4KPgo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+Cj4KPiAtLS0K
Pgo+IHYxIC0+IHYyOgo+Cj4gICAtIGFkZCBsaWJjYXAgYW5kIHN5c3RlbWQgZmxhZ3MKPiAgIC0g
dXNlIHVwc3RyZWFtIGRvd25sb2FkIHRhci5neiB3aXRoIHN1Ym1vZHVsZXMgYW5kIGdpdCB2ZXJz
aW9uCj4gICAtIG5vIG5lZWQgdG8gdXNlIHRoZSBzdWJtb2R1bGUgZG93bmxvYWQgbWV0aG9kIG5v
ciB0aGUgcGF0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0
aWFuQHBhcmFsLmluPgo+IC0tLQo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICB8ICAxICsKPiAg
IHBhY2thZ2UvQ29uZmlnLmluICAgICAgfCAgMSArCj4gICBwYWNrYWdlL2NydW4vQ29uZmlnLmlu
IHwgIDcgKysrKysrKwo+ICAgcGFja2FnZS9jcnVuL2NydW4uaGFzaCB8ICA0ICsrKysKPiAgIHBh
Y2thZ2UvY3J1bi9jcnVuLm1rICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgIDUgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvY3J1bi9Db25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2NydW4vY3J1bi5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcnVu
L2NydW4ubWsKPgo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4
IGQyYmQwZDgwOWEuLmI5MjgyMWY5YzcgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBi
L0RFVkVMT1BFUlMKPiBAQCAtNTMwLDYgKzUzMCw3IEBAIEY6CXBhY2thZ2UvcHl0aG9uLXB5bGli
ZnRkaS8KPiAgIE46CUNocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+Cj4gICBG
OglwYWNrYWdlL2JhdG1hbi1hZHYvCj4gICBGOglwYWNrYWdlL2NvbnRhaW5lcmQvCj4gK0Y6CXBh
Y2thZ2UvY3J1bi8KPiAgIEY6CXBhY2thZ2UvZGVsdmUvCj4gICBGOglwYWNrYWdlL2RvY2tlci1j
bGkvCj4gICBGOglwYWNrYWdlL2RvY2tlci1lbmdpbmUvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Q29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCBkMWMwOThjNDhmLi5mZDU5MWQ5
ZTUyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25m
aWcuaW4KPiBAQCAtMjU2Nyw2ICsyNTY3LDcgQEAgbWVudSAiU3lzdGVtIHRvb2xzIgo+ICAgCXNv
dXJjZSAicGFja2FnZS9jb3JldXRpbHMvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9j
cHVsaW1pdC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2NwdWxvYWQvQ29uZmlnLmlu
Igo+ICsJc291cmNlICJwYWNrYWdlL2NydW4vQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2Fn
ZS9kYWVtb24vQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9kYzNkZC9Db25maWcuaW4i
Cj4gICAJc291cmNlICJwYWNrYWdlL2Rjcm9uL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9jcnVuL0NvbmZpZy5pbiBiL3BhY2thZ2UvY3J1bi9Db25maWcuaW4KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjVhY2ExMGRjZGIKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9jcnVuL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsNyBAQAo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfQ1JVTgo+ICsJYm9vbCAiY3J1biIKPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9ZQUpMICMgbGlib2Npc3BlYwo+ICsJaGVscAo+ICsJICBjcnVuIGlzIGEgZmFzdCBhbmQgbG93
LW1lbW9yeSBPQ0kgQ29udGFpbmVyIFJ1bnRpbWUgaW4gQy4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0
aHViLmNvbS9jb250YWluZXJzL2NydW4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcnVuL2NydW4u
aGFzaCBiL3BhY2thZ2UvY3J1bi9jcnVuLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLmRlNjEzMTBlMDgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9jcnVuL2NydW4uaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIExvY2FsbHkgY29tcHV0ZWQK
PiArc2hhMjU2ICBhY2QyNDAxMmRhYTk1MWNmMTY3NGIyMGIyZDVmODc5NzVkNWQ2YzhlOGM4MGJm
ZTEyZTRjZmZhMzQ5NWNhZTY3ICBjcnVuLTEuNS50YXIuZ3oKPiArc2hhMjU2ICA4MTc3Zjk3NTEz
MjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBD
T1BZSU5HCj4gK3NoYTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2
NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgQ09QWUlORy5saWJjcnVuCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvY3J1bi9jcnVuLm1rIGIvcGFja2FnZS9jcnVuL2NydW4ubWsKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjIxMGQzYzU4NjAKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9jcnVuL2NydW4ubWsKPiBAQCAtMCwwICsxLDM2IEBACj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBjcnVuCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiArCj4gK0NSVU5fVkVSU0lPTiA9IDEuNQo+ICtDUlVOX1NJVEUgPSBodHRwczov
L2dpdGh1Yi5jb20vY29udGFpbmVycy9jcnVuL3JlbGVhc2VzL2Rvd25sb2FkLyQoQ1JVTl9WRVJT
SU9OKQo+ICtDUlVOX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiB5YWpsCj4gKwo+ICtDUlVO
X0xJQ0VOU0UgPSBHUEwtMi4wKyAoY3J1biBiaW5hcnkpLCBMR1BMLTIuMSsgKGxpYmNydW4pCj4g
K0NSVU5fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5saWJjcnVuCj4gKwo+ICtDUlVO
X0FVVE9SRUNPTkYgPSBZRVMKPiArQ1JVTl9DT05GX09QVFMgKz0gLS1lbmFibGUtZW1iZWRkZWQt
eWFqbD1ubwo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJDQVApLHkpCj4gK0NSVU5fREVQ
RU5ERU5DSUVTICs9IGxpYmNhcAo+ICtlbHNlCj4gK0NSVU5fQ09ORl9PUFRTICs9IC0tZGlzYWJs
ZS1jYXBzCj4gK2VuZGlmCj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlNFQ0NPTVApLHkp
Cj4gK0NSVU5fREVQRU5ERU5DSUVTICs9IGxpYnNlY2NvbXAKPiArZWxzZQo+ICtDUlVOX0NPTkZf
T1BUUyArPSAtLWRpc2FibGUtc2VjY29tcAo+ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfUEFD
S0FHRV9TWVNURU1EKSx5KQo+ICtDUlVOX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1zeXN0ZW1kCj4g
K0NSVU5fREVQRU5ERU5DSUVTICs9IHN5c3RlbWQgaG9zdC1wa2djb25mCj4gK2Vsc2UKPiArQ1JV
Tl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXN5c3RlbWQKPiArZW5kaWYKPiArCj4gKyQoZXZhbCAk
KGF1dG90b29scy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
