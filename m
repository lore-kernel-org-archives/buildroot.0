Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61EFC3DA4B
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 03:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F45340297;
	Tue, 16 Jul 2024 03:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js-2cqgF88D8; Tue, 16 Jul 2024 03:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F83B4022F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F83B4022F;
	Tue, 16 Jul 2024 03:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABB91BF3F3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 03:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 554FB4021D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 03:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYzGAuH6NMJL for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 03:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.254.50.220;
 helo=m15.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25104401E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25104401E3
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25104401E3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 03:24:31 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-142 (Coremail) ; Tue, 16 Jul 2024 11:24:19 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 16 Jul 2024 11:24:19 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240712092041.38bab6ac@windsurf>
References: <20240628121740.2810640-1-andyshrk@163.com>
 <20240712092041.38bab6ac@windsurf>
X-NTES-SC: AL_Qu2ZA/2bv0ou7yCYZukZnEobh+Y5UcK2s/ki2YFXN5k0uCbt6AQpenhFF2f97/iQJCSttx+RXxVr4NhKU7dgToXgyj/5F4Mgdkab2s6mC8z8
MIME-Version: 1.0
Message-ID: <54201e1f.3a12.190b991cec0.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3f+Hj55Vm71gtAA--.35195W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h4eXmWXzCBwugABsZ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=XAnaL0eEy4WFrxgZDD3iBgAeAOw+ytmeZQ7nuLrDAFw=; b=k
 ajR+bR4rNNf4XkcR8DVlRoFDPVv0zrNBDlkMo6/lJuD8LDbslCkT/UHOyFLC6Nrx
 TDCe8JiH1xsIg+PMlDAd/KK6MUdTCeLs2S2W6CRJ1dSurVRtwM+sVxT5frH5I5JZ
 Loy+6m+zgYwf4m1gah89IHVQng4Sso387m9xDGra7Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=kajR+bR4
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add Arm mali CSF
 firmwares
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

SGVsbG8gVGhvbWFz77yMClRoYXQncyBzbyBraW5kLCB0aGFua3MuCgpBdCAyMDI0LTA3LTEyIDE1
OjIwOjQxLCAiVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IiA8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyb3RlOgo+SGVsbG8gQW5keSwKPgo+VGhhbmtzIGZvciB5b3VyIHBhdGNoLCBJ
IGFwcGxpZWQgaXQgYWZ0ZXIgYWRqdXN0aW5nIHNvbWUgc21hbGwgdGhpbmdzLgo+U2VlIGJlbG93
Lgo+Cj5PbiBGcmksIDI4IEp1biAyMDI0IDIwOjE3OjQwICswODAwCj5BbmR5IFlhbiA8YW5keXNo
cmtAMTYzLmNvbT4gd3JvdGU6Cj4KPj4gK21lbnUgIkdQVSBGaXJtd2FyZSIKPj4gKwo+PiArY29u
ZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0FSTV9NQUxJX0NTRgo+PiArCWJvb2wgIkFy
bSBNYWxpIENTRiBmaXJtd2FyZSIKPj4gKwloZWxwCj4+ICsJICBGaXJtd2FyZSBmaWxlcyBmb3Ig
QXJtIE1hbGkgMTB0aCBnZW5lcmF0aW9uIEdQVQo+PiArICAgICAgICAgIG5lZWRlZCBieSB0aGUg
bGludXggcGFudGhvciBrZXJuZWwgZHJpdmVyLgo+Cj5UaGlzIGxhc3QgbGluZSB3YXMgaW5kZW50
ZWQgd2l0aCBzcGFjZXMgaW5zdGVhZCBvZiBhIHRhYi4gVGhpcyB3YXMKPnBvaW50ZWQgb3V0IGJ5
ICJtYWtlIGNoZWNrLXBhY2thZ2UiOgo+Cj5XQVJOSU5HOiBwYWNrYWdlL2xpbnV4LWZpcm13YXJl
L0NvbmZpZy5pbjo3MDA6IGhlbHAgdGV4dDogPHRhYj48MiBzcGFjZXM+PDYyIGNoYXJzPiAoaHR0
cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI3dyaXRpbmctcnVsZXMtY29uZmlnLWluKQo+Cj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+PiBpbmRleCAxM2RiYzZk
OThjLi42YTFiOTlmNDM4IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlLm1rCj4+ICsrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmUubWsKPj4gQEAgLTg4Myw2ICs4ODMsMTEgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0g
aW50ZWwvaXB1L3NoaXNwXzI0MDFhMF92MjEuYmluCj4+ICBMSU5VWF9GSVJNV0FSRV9BTExfTElD
RU5TRV9GSUxFUyArPSBMSUNFTlNFLml2c2MKPj4gIGVuZGlmCj4+ICAKPj4gK2lmZXEgKCQoQlIy
X1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfQVJNX01BTElfQ1NGKSx5KQo+PiArTElOVVhfRklSTVdB
UkVfRElSUyArPSBhcm0KPgo+SSB3YXNuJ3QgYSBiaWcgZmFuIG9mIGluY2x1ZGluZyB0aGUgZnVs
bCBhcm0vIGRpcmVjdG9yeSwgYmVjYXVzZSB3aGlsZQo+aXQgZm9yIG5vdyBvbmx5IGNvbnRhaW5z
IHRoaXMgR1BVIGZpcm13YXJlLCBpdCBtaWdodCBjb250YWluIG90aGVyCj50aGluZ3MgaW4gdGhl
IGZ1dHVyZS4gU2luY2UgdGhlIHBhbnRob3IgZHJpdmVyIGxvYWRzIHRoaXM6Cj4KPiAgICAgICAg
c25wcmludGYoZndfcGF0aCwgc2l6ZW9mKGZ3X3BhdGgpLCAiYXJtL21hbGkvYXJjaCVkLiVkLyVz
IiwKPiAgICAgICAgICAgICAgICAgKHUzMilHUFVfQVJDSF9NQUpPUihwdGRldi0+Z3B1X2luZm8u
Z3B1X2lkKSwKPiAgICAgICAgICAgICAgICAgKHUzMilHUFVfQVJDSF9NSU5PUihwdGRldi0+Z3B1
X2luZm8uZ3B1X2lkKSwKPiAgICAgICAgICAgICAgICAgQ1NGX0ZXX05BTUUpOwo+Cj5JIGNoYW5n
ZWQgbGludXgtZmlybXdhcmUubWsgdG8gdGhpczoKPgo+TElOVVhfRklSTVdBUkVfRklMRVMgKz0g
YXJtL21hbGkvYXJjaCovbWFsaV9jc2Zmdy5iaW4KPgo+c28gdGhhdCBpdCBvbmx5IGluc3RhbGxz
IHRoZSBDU0YgZmlybXdhcmUuCj4KPkFwcGxpZWQgd2l0aCB0aG9zZSBjaGFuZ2VzLiBUaGFua3Mh
Cj4KPlRob21hcwo+LS0gCj5UaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj5FbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
aHR0cHM6Ly9ib290bGluLmNvbQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj5odHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
