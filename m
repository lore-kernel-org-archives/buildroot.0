Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A2CC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374FB81F10;
	Fri,  2 May 2025 10:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BtqPtaYYqMt; Fri,  2 May 2025 10:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7066A81F21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7066A81F21;
	Fri,  2 May 2025 10:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34BA2229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2676860630
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iTdcHK9Z5pG for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6ABB5605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABB5605D1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ABB5605D1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6C991C1112; Fri,  2 May 2025 12:33:02 +0200 (CEST)
Message-ID: <282f8abc-63f1-4ad2-b8a5-9f235c111e93@rnout.be>
Date: Fri, 2 May 2025 12:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
References: <20250415154905.1871596-1-gael.portay+rtone@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415154905.1871596-1-gael.portay+rtone@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9Mp3xgE/p4+O47AgBYO6cf9+fiYwLSXV9oLU5J2C878=;
 b=h7ZEWfNWz8I60xXJFCpsoNND+sX94Rn7fCqplA1oLk222O1da0fI/wo/t96KtHas2T4JIC
 j/AnAM5lzFQ8Yi02ZH7Tl4mOg0Qm1NCoEBerSmTTryzdjEnoPJSBL4pPsja8IZVIFd+E9Y
 fyUZ4OtrhE86niyNk1dowULq2JLb6ilN/sivtE9p4VMOlFd8pnxU5S8BYPxaOvVN0kqORA
 9qWiQALLrSkhQseZr54yFlXjSt7sy9CN4egySQTE+LW1JzG1Aze+g2sgMSFVkeYdJsfqG8
 Skh4FBPV6MG2A0dnupYzHRz6Op51rscpDf5hGi0di/S+d5HzSoQd/2Pc7YIgkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=h7ZEWfNW
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi5: install Raspberry
 Pi 500 device-tree blob
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNC8yMDI1IDE3OjQ5LCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhpcyBpbnN0YWxs
cyB0aGUgZGV2aWNlLXRyZWUgYmxvYiBmb3IgdGhlIFJhc3BiZXJyeSBQaSA1MDAuCj4gCj4gU2ln
bmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+Cgog
IEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0t
LQo+ICAgYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCAgIHwgNCArKystCj4gICBjb25maWdz
L3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJl
cnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKPiBpbmRleCA2
NGYwZTJhMjZmLi5mYjk0NjQ3MTQ4IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3Jl
YWRtZS50eHQKPiArKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0Cj4gQEAgLTExLDYg
KzExLDcgQEAgVGhlc2UgaW5zdHJ1Y3Rpb25zIGFwcGx5IHRvIGFsbCBtb2RlbHMgb2YgdGhlIFJh
c3BiZXJyeSBQaToKPiAgICAgLSB0aGUgbW9kZWwgQjQgKGFrYSBSYXNwYmVycnkgUGkgNCkuCj4g
ICAgIC0gdGhlIG1vZGVsIENNNCAoYWthIFJhc3BiZXJyeSBQaSBDb21wdXRlIE1vZHVsZSA0IGFu
ZCBJTyBCb2FyZCkuCj4gICAgIC0gdGhlIG1vZGVsIEI1IChha2EgUmFzcGJlcnJ5IFBpIDUpLgo+
ICsgIC0gdGhlIG1vZGVsIDUwMCAoYWthIFJhc3BiZXJyeSBQaSA1MDApLgo+ICAgCj4gICBIb3cg
dG8gYnVpbGQgaXQKPiAgID09PT09PT09PT09PT09PQo+IEBAIC02OSw3ICs3MCw3IEBAIG9yIGZv
ciBDTTQgKG9uIElPIEJvYXJkIC0gNjQgYml0KToKPiAgIAo+ICAgICAkIG1ha2UgcmFzcGJlcnJ5
cGljbTRpb182NF9kZWZjb25maWcKPiAgIAo+IC1Gb3IgbW9kZWwgNSBCOgo+ICtGb3IgbW9kZWwg
NSBCIGFuZCA1MDA6Cj4gICAKPiAgICAgJCBtYWtlIHJhc3BiZXJyeXBpNV9kZWZjb25maWcKPiAg
IAo+IEBAIC0xMDksNiArMTEwLDcgQEAgQWZ0ZXIgYnVpbGRpbmcsIHlvdSBzaG91bGQgb2J0YWlu
IHRoaXMgdHJlZToKPiAgICAgICArLS0gYmNtMjcxMS1ycGktY200cy5kdGIgICAgICAgIFsxXQo+
ICAgICAgICstLSBiY20yNzEyLXJwaS01LWIuZHRiICAgICAgICAgWzFdCj4gICAgICAgKy0tIGJj
bTI3MTJkMC1ycGktNS1iLmR0YiAgICAgICBbMV0KPiArICAgICstLSBiY20yNzEyLXJwaS01MDAu
ZHRiICAgICAgICAgWzFdCj4gICAgICAgKy0tIGJvb3QudmZhdAo+ICAgICAgICstLSByb290ZnMu
ZXh0NAo+ICAgICAgICstLSBycGktZmlybXdhcmUvCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFz
cGJlcnJ5cGk1X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwo+IGlu
ZGV4IDhjYmQ1MzNlZWUuLjI1YzU3NGQwZGYgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9yYXNwYmVy
cnlwaTVfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnCj4g
QEAgLTEzLDcgKzEzLDcgQEAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElP
Tj0iJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxsaW51eCw1NzZjYzEKPiAgIEJSMl9MSU5VWF9L
RVJORUxfREVGQ09ORklHPSJiY20yNzEyIgo+ICAgQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJB
R01FTlRfRklMRVM9ImJvYXJkL3Jhc3BiZXJyeXBpL2xpbnV4LTRrLXBhZ2Utc2l6ZS5mcmFnbWVu
dCIKPiAgIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+IC1CUjJfTElOVVhfS0VSTkVM
X0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMi1ycGktNS1iIGJyb2FkY29tL2JjbTI3
MTJkMC1ycGktNS1iIgo+ICtCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRj
b20vYmNtMjcxMi1ycGktNS1iIGJyb2FkY29tL2JjbTI3MTJkMC1ycGktNS1iIGJyb2FkY29tL2Jj
bTI3MTItcnBpLTUwMCIKPiAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkK
PiAgIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9eQo+ICAgQlIyX1BBQ0tBR0VfWFo9
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
