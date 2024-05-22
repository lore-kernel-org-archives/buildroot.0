Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC61C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 19:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3919821AB;
	Wed, 22 May 2024 19:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjfMr4r678Nl; Wed, 22 May 2024 19:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FBE82188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FBE82188;
	Wed, 22 May 2024 19:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 153BD1C5F16
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F639606EA
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzRqhUn1j51B for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 19:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7157606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7157606D6
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7157606D6
 for <buildroot@buildroot.org>; Wed, 22 May 2024 19:48:03 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9rwPsYU4SqLIy9rwPsk6JA; Wed, 22 May 2024 21:48:01 +0200
Message-ID: <e9617956-8abe-4331-9639-42c8327c3061@benettiengineering.com>
Date: Wed, 22 May 2024 21:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240520165801.2247467-1-giulio.benetti@benettiengineering.com>
 <d24cbdea-e17f-4f67-a869-9c699224357f@smile.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <d24cbdea-e17f-4f67-a869-9c699224357f@smile.fr>
X-CMAE-Envelope: MS4xfDlca6/jyWRfjiEkBk30RJE8RAoGwOQTsXMMRDWPk4jSMKldg3bZh0KGLrZZqEhM1FQzQeAK8Y57oOOUU4pBqV0o23yy8/QY/5qkgaN6BxQBjh5k1ieR
 M67aTMuO60CywoCgi9lMIpIR90OAiiJjQ6cdMTwsBqquzztS4t3d2n8ENR3j9GZxkqMJ6uCC/tNmOxLJaN6U8c+xEuEygNt8VO2KPk8sIXMC0Pi/4RNm5GNU
 GjP3XBgm/Qb/+vLVj3CdtZGsRAxSE4++weWoERlbkNdiNZwAs6W7AAycuzTg4K/L
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716407281; bh=vHGunstUauDnGKuyLuSyHqkEvy/FU0ME9icEsF202Uw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OAuyjq54PiDrUPn2PGhWaTeSP6/ty8aYNB1p7Ydk08/iDsZNd9BNgeFx48XAYSRZn
 aw7fNzYBhkAOOBvHTzb/KSrngIYoMN+F/tL2x6eMMhq1qQ5jNlK6M4V5PuIU3iuV5G
 vHw4twhVRy6DV0iZZWqIRAO/HChBN0DsBERCn1dbsvHLgKy5ti6ucosPt/uSD1mk8x
 oQi1ShP1xb73YB2FPv5dm4aAQdLoTYKx0+PL/rQuEu24o9JRR/s1jSYqN3QqDpn8jc
 HqGROPhtPhl+77Pk93nr/9IKTZNyCuTea0D19QZGDjvokDf+DcWNFJuEyb7dUbgVPZ
 QRFLObOxNmWWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OAuyjq54
Subject: Re: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig:
 bump to Linux version 6.1.91
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gMjIvMDUvMjQgMTU6MzAsIFJvbWFpbiBOYW91ciB3cm90ZToKPiBI
ZWxsbyBHaXVsaW8sCj4gCj4gTGUgMjAvMDUvMjAyNCDDoCAxODo1OCwgR2l1bGlvIEJlbmV0dGkg
YSDDqWNyaXTCoDoKPj4gRml4ZXM6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvNjg2NTU5NjU0OAo+IAo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHlv
dSBjYW4gZXhwbGFpbiBob3cgdGhlIHZlcnNpb24gYnVtcCBmaXggdGhlIGJ1aWxkIGlzc3VlLgoK
U3VyZSwgSSd2ZSBqdXN0IHNlbnQgYSBWMiBhbmQsCgo+IEluIHRoZSBmdWxsIGJ1aWxkIGxvZyB3
ZSBjYW4gbm90aWNlOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjoK
PiBkcml2ZXJzL2F0YS9saWJhaGNpLmM6IEluIGZ1bmN0aW9uICdhaGNpX2xlZF9zdG9yZSc6Cj4g
Li8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozNTc6NDU6IGVycm9yOiBjYWxsIHRv
Cj4gJ19fY29tcGlsZXRpbWVfYXNzZXJ0XzMwMicgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJy
b3I6IEJVSUxEX0JVR19PTiBmYWlsZWQ6Cj4gc2l6ZW9mKF9zKSA+IHNpemVvZihsb25nKQo+ICAg
IDM1NyB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21w
aWxldGltZV9hc3NlcnRfLAo+IF9fQ09VTlRFUl9fKQo+IAo+IFRoaXMgZXJyb3Igc2VlbXMgdG8g
YmUgZml4ZWQgYnkgImF0YTogYWhjaTogZml4IGVudW0gY29uc3RhbnRzIGZvciBnY2MtMTMiIGZy
b20KPiB2Ni4xLjQ6Cj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTk3ZTI4ZGVhYjhiZmU3MGQ1Njg3
NjUwZjk0NDg0ZjhmOTEwMWU1NjYKCnRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgbWUgdGhlIGNvbW1p
dCBmaXhpbmcgdGhlIGJ1Zy4KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPJkNU
T0BCZW5ldHRpIEVuZ2luZWVyaW5nCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+PiAgIGNvbmZpZ3MvYW1hcnVsYV92eWFzYV9yazMyODhf
ZGVmY29uZmlnIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hbWFydWxhX3Z5YXNhX3JrMzI4
OF9kZWZjb25maWcgYi9jb25maWdzL2FtYXJ1bGFfdnlhc2FfcmszMjg4X2RlZmNvbmZpZwo+PiBp
bmRleCA3OTc2NTM3MjI1Li4wZGQ0N2Y0OThmIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL2FtYXJ1
bGFfdnlhc2FfcmszMjg4X2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL2FtYXJ1bGFfdnlhc2Ff
cmszMjg4X2RlZmNvbmZpZwo+PiBAQCAtMjMsNyArMjMsNyBAQCBCUjJfVEFSR0VUX1VCT09UX1NQ
TF9OQU1FPSJzcGwvdS1ib290LXNwbC1kdGIuYmluIHRwbC91LWJvb3QtdHBsLmJpbiIKPj4gICAj
IEtlcm5lbAo+PiAgIEJSMl9MSU5VWF9LRVJORUw9eQo+PiAgIEJSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1ZFUlNJT049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
Ni4xLjIiCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuOTEi
Cj4+ICAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9Im11bHRpX3Y3Igo+PiAgIEJSMl9MSU5V
WF9LRVJORUxfVUlNQUdFPXkKPj4gICBCUjJfTElOVVhfS0VSTkVMX1VJTUFHRV9MT0FEQUREUj0i
MHgwMjAwMDAwMCIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
