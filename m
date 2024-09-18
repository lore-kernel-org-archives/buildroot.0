Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00CECCD18D
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 08:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AD8684757;
	Wed, 18 Sep 2024 08:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSCoiUBbrGgY; Wed, 18 Sep 2024 08:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 647B284753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 647B284753;
	Wed, 18 Sep 2024 08:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 469391BF83E
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 08:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 429B140199
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 08:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAU_Kfb_2rdp for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 08:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7618A40185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7618A40185
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7618A40185
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 08:02:18 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [59.46.133.34] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Wed, 18 Sep 2024 16:02:00 +0800
 (CST)
X-Originating-IP: [59.46.133.34]
Date: Wed, 18 Sep 2024 16:02:00 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 "Christian Stewart" <christian@aperture.us>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CABGWkvq=ca3xYu6+_91-8KtoQqCBOBGexBbJe8wDZGMR3YQUcA@mail.gmail.com>
References: <cover.1725049576.git.yann.morin.1998@free.fr>
 <23841300f5a85914d9c0fc19b24df485ba861efa.1725049576.git.yann.morin.1998@free.fr>
 <CABGWkvq=ca3xYu6+_91-8KtoQqCBOBGexBbJe8wDZGMR3YQUcA@mail.gmail.com>
X-NTES-SC: AL_Qu2ZBPqfuU0p5ieeZOkfmksSgOg6X8CxuP8g3IRWO5x+jDjp9C8pZ1RlBWTPyt2tGiKUjT6xdzxI7tZ8bZdiQIgxnBQ+cUD8l41hWBsLPE0kKQ==
MIME-Version: 1.0
Message-ID: <ac95b02.879a.19204270bbd.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD33zP4iOpmgBEPAA--.20181W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRJejWXAnUBk2QAHse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=kh9oPwcqMvjFPNaObx5MBwTXYBrj+jEGfDfX+wbgWgk=; b=L
 CtKJkyEWQj/EWXWAUDFG9Z1zlQPCRPoHSNxxsg5b6/usL+FD44xjnT5UdW6ow2/q
 +D1wOVzz3qd20oPKABS/eP/BRQlBhXIZocGf1TlMLRpDBVfr89umBCOf4zy5gtly
 mIPDY2tQ/wgCE2cCfhXWL5SftQaPQZRtgT6yExtsCk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=LCtKJkyE
Subject: Re: [Buildroot] [PATCH 3/3] system: add tini as init system
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkF0IDIwMjQtMDktMTQgMTc6MDQ6MjYsICJEYXJpbyBCaW5hY2NoaSIgPGRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPkhpIFlhbm4sCj4KPk9uIEZy
aSwgQXVnIDMwLCAyMDI0IGF0IDEwOjI24oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IHdyb3RlOgo+Pgo+PiBUaW5pIGlzIGEgc3BlY2lhbC1wdXJwb3NlIGluaXQg
c3lzdGVtLCBhaW1lZCBhdCBjb250YWluZXJzLgo+Pgo+PiBBZGQgaXQgdG8gdGhlIGNob2ljZSBv
ZiBpbml0IHN5c3RlbXMuCj4+Cj4+IHRpbmkgZG9lcyBub3QgcmVxdWlyZSBtdWNoLCBzbyB3ZSBy
ZS11c2UgdGhlIGRlZmF1bHQgIm5vbmUiIHNrZWxldG9uLgo+Pgo+PiBOb3RlIHRoYXQgdGluaSBp
cyBubyBsb25nZXIgc2VsZWN0YWJsZSBvbiBpdHMgb3duLCB3aGljaCBpdCB1c2VkIHRvIGJlLgo+
PiBUaGlzIGNoYW5nZSB3aWxsIHJlcXVpcmUgdGhhdCBwZW9wbGUgdXNpbmcgdGluaSBiZSBjYXJl
ZnVsIHdoZW4KPj4gdXBncmFkaW5nLCB0aG91Z2gsIGJ1dCB0aGF0IHdpbGwgYmUgdmVyeSBlYXNp
bHkgY2F1Z2h0LCBhcyB0aGUKPj4gY29udGFpbmVycyB3b3VsZCBubyBsb25nZXIgc3RhcnQgYXQg
YWxsLgo+Pgo+PiBXZSBjb3VsZCBhZCBhIGNvbW1lbnQgc3RhdGluZyB3aHksIGJ1dCBubyBvdGhl
ciBpbml0IHN5c3RlbSBoYXMgc3VjaCBhCj4+IGNvbW1lbnQsIHNvIGFkZGluZyBvbmUgZm9yIHRp
bmkgYWxvbmUgd291bGQgYmUgd2VpcmQsIHNvIHdlIGRvbid0IGFkZAo+PiBvbmUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+PiBD
YzogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
PiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPj4g
LS0tCj4+ICBwYWNrYWdlL3RpbmkvQ29uZmlnLmluIHwgIDEgKwo+PiAgc3lzdGVtL0NvbmZpZy5p
biAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90aW5pL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvdGluaS9Db25maWcuaW4KPj4gaW5kZXggNzE5ZTFlMWYyMi4uYmNhOGFkOGU5NiAxMDA2
NDQKPj4gLS0tIGEvcGFja2FnZS90aW5pL0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL3Rpbmkv
Q29uZmlnLmluCj4+IEBAIC0xLDYgKzEsNyBAQAo+PiAgY29uZmlnIEJSMl9QQUNLQUdFX1RJTkkK
Pj4gICAgICAgICBib29sICJ0aW5pIgo+PiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUg
IyBmb3JrKCkKPj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9JTklUX1RJTkkKPj4gICAgICAgICBo
ZWxwCj4+ICAgICAgICAgICB0aW5pIGlzIGEgc2ltcGxlIGJ1dCB2YWxpZCBpbml0IGJpbmFyeSB0
bwo+PiAgICAgICAgICAgYWN0IGFzIFBJRCAxIGZvciBjb250YWluZXJzLgo+PiBkaWZmIC0tZ2l0
IGEvc3lzdGVtL0NvbmZpZy5pbiBiL3N5c3RlbS9Db25maWcuaW4KPj4gaW5kZXggMThjYzM5YWQ5
NC4uZDdkNTlkYjQ3ZCAxMDA2NDQKPj4gLS0tIGEvc3lzdGVtL0NvbmZpZy5pbgo+PiArKysgYi9z
eXN0ZW0vQ29uZmlnLmluCj4+IEBAIC0xNDksNiArMTQ5LDIyIEBAIGNvbW1lbnQgInN5c3RlbWQg
aGlnaGx5IHJlY29tbWVuZHMgTGludXggPj0gNC4xNSIKPj4KPj4gIGNvbW1lbnQgIlNwZWNpYWwg
cHVycG9zZSAocmVhZCBoZWxwKSIKPj4KPj4gK2NvbmZpZyBCUjJfSU5JVF9USU5JCj4+ICsgICAg
ICAgYm9vbCAidGluaSIKPj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICAjIHRpbmkK
Pj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfVElOSQo+PiArICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9TS0VMRVRPTl9JTklUX05PTkUgaWYgQlIyX1JPT1RGU19TS0VMRVRPTl9ERUZBVUxU
Cj4+ICsgICAgICAgaGVscAo+PiArICAgICAgICAgVGluaSAtIEEgdGlueSBidXQgdmFsaWQgaW5p
dCBmb3IgY29udGFpbmVycwo+PiArCj4+ICsgICAgICAgICBUaW5pIGlzIHRoZSBzaW1wbGVzdCBp
bml0IHlvdSBjb3VsZCB0aGluayBvZi4KPj4gKwo+PiArICAgICAgICAgQWxsIFRpbmkgZG9lcyBp
cyBzcGF3biBhIHNpbmdsZSBjaGlsZCAoVGluaSBpcyBtZWFudCB0byBiZSBydW4KPj4gKyAgICAg
ICAgIGluIGEgY29udGFpbmVyKSwgYW5kIHdhaXQgZm9yIGl0IHRvIGV4aXQgYWxsIHRoZSB3aGls
ZSByZWFwaW5nCj4+ICsgICAgICAgICB6b21iaWVzIGFuZCBwZXJmb3JtaW5nIHNpZ25hbCBmb3J3
YXJkaW5nLgo+PiArCj4+ICsgICAgICAgICBodHRwczovL2dpdGh1Yi5jb20va3JhbGxpbi90aW5p
Cj4+ICsKPj4gIGNvbmZpZyBCUjJfSU5JVF9OT05FCj4+ICAgICAgICAgYm9vbCAiQ3VzdG9tIChu
b25lKSIKPj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfU0tFTEVUT05fSU5JVF9OT05FIGlm
IEJSMl9ST09URlNfU0tFTEVUT05fREVGQVVMVAo+PiAtLQo+PiAyLjQ2LjAKPj4KPgo+UmV2aWV3
ZWQtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KPgo+UmVnYXJkcywKPkRhcmlvCj4KCkkgdGhpbmsgdGhpcyBpcyBjb21wbGV0ZWx5ICoqd3Jv
bmcqKi4KClBlb3BsZSB1c3VhbGx5IGRvIG5vdCBwdXQgZG9ja2VyLWluaXQgKHN1Y2ggYXMgdGlu
aS9jYXRhdG9uaXQpIGluIGNvbnRhaW5lciBpbWFnZXMsIGJ1dCBpbiB0aGUgaG9zdCBzeXN0ZW0s
IGFuZCB1c2UgaXQgYnkgYGRvY2tlciBydW4gLS1pbml0YC4gT25seSBpbml0cyBzdWNoIGFzIHN1
cGVydmlzb3IvczYgd2lsbCBiZSBwbGFjZWQgaW4gY29udGFpbmVyIGltYWdlcy4KClJlZ2FyZHMs
ClRJQU4gWXVhbmhhbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
