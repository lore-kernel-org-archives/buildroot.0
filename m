Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4A0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 21:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E16914090B;
	Wed, 23 Feb 2022 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-7Eg-1FrZkf; Wed, 23 Feb 2022 21:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5BB7403B3;
	Wed, 23 Feb 2022 21:22:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31AB81BF36F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BACB403B3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RI_bLYlPTPXt for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 21:22:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E1A9400F5
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 21:22:26 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id Mz5bn8dVeXmFAMz5cntlsK; Wed, 23 Feb 2022 22:22:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645651344; bh=JsI9YVQj7PWBZz/0lmk1PERjqqzZCmVgcnF/OxVvFiM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ZGs9za3hE2CBSJcAWi8akdi7NP2RPN7PrTDjzH7fmDv0Q7x2Y8Fo4ow9hj6QS8/37
 W5qeZYlFTtuok7Funcn0+yVgPpi0ZTsl8GWQkiAuw6wvZYBoq14WbRk8L4CzeR6Mhw
 Cv43PEAAk/wvxPfpKLVHlR4IPuu4EwrWdfkA5X9FIH00RljJsQQCBiNz0+LKr6fl3d
 33K9TpwNdn6xDKtsJvKTfddspXd9A/x6zehKngBWxLDOnIM/DQRgA8dKy5FXA4nbkP
 hiFEVr+H8A3dTHpqmkqJgLPQm18Bv5QDxGPwM7LBpi7xrP7SUABSKvuZP/CIrp3Yg0
 HNUhZkKccbcmA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 23 Feb 2022 22:22:23 +0100
Message-Id: <9C91AA22-A5B2-433B-AD37-7000F7D5EB20@benettiengineering.com>
References: <872b9dab-c446-adca-905c-1d5481c00a3b@armadeus.com>
In-Reply-To: <872b9dab-c446-adca-905c-1d5481c00a3b@armadeus.com>
To: fabien.marteau@armadeus.com
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfAew3tWT3SbU1CyHHFVLHhrp2VcxEsat0ryLQE6Qz+Ek+uQUFYq6TD0/9wyKliPBdPyKHc/1FbLKzco+MrNFu2QdH1ZAJSbCl1+yElNlI5VpKJUs3NES
 hbk8lVCO8lJiBJGcEfrRcDUEHjslZr4rot8mWI5BK4uwszr6YpKTTK56X+isp+GIq2/SB7b0Q0+bDMpY2JPzB1pz1Wzi+ntaDEJCU+LYsxzD8FedtkJbrpBe
 PDNcQjMYqUFtYC8yOgIAWQ==
Subject: Re: [Buildroot] zynq_zc706_defconfig target works on zc702 board
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

SGkgRmFiaWVuLAoKPiBJbCBnaW9ybm8gMjMgZmViIDIwMjIsIGFsbGUgb3JlIDIxOjU5LCBGYWJp
ZW4gTWFydGVhdSA8ZmFiaWVuLm1hcnRlYXVAYXJtYWRldXMuY29tPiBoYSBzY3JpdHRvOgo+IAo+
IO+7v0hlbGxvLAo+IAo+IEkganVzdCB0cnlpZWQgdG8gY29tcGlsZSBidWlsZHJvb3QgZm9yIFpD
NzAyIGJvYXJkIHVzaW5nIHRhcmdldCB6eW5xX3pjNzA2X2RlZmNvbmZpZyAoWkM3MDYpLgo+IAo+
IFdpdGggbGFzdCBidWlsZHJvb3QgZ2l0IDoKPiAKPiBtYWtlIHp5bnFfemM3MDZfZGVmY29uZmln
Cj4gc3VkbyBkZCBpZj1vdXRwdXQvaW1hZ2VzL3NkY2FyZC5pbWcgb2Y9L2Rldi9tbWNibGswCj4g
Cj4gQm9vdGluZyB0aGUgYm9hcmQgd2l0aCBTRENhcmQgZnJlc2hseSBmb3JtYXR0ZWQgOgo+IAo+
IDxkZWJ1Z191YXJ0PiBEZWJ1ZyB1YXJ0IGVuYWJsZWQKPiAKPiBVLUJvb3QgU1BMIDIwMTguMDEg
KEZlYiAyMyAyMDIyIC0gMTE6NDM6MTUpCj4gbW1jIGJvb3QKPiBUcnlpbmcgdG8gYm9vdCBmcm9t
IE1NQzEKPiBzcGxfbG9hZF9pbWFnZV9mYXQ6IGVycm9yIHJlYWRpbmcgaW1hZ2UgZnBnYS5iaW4s
IGVyciAtIC0yCj4gc3BsOiBlcnJvciByZWFkaW5nIGltYWdlIGZwZ2EuYmluLCBlcnIgLSAxCj4g
c3BsX2xvYWRfaW1hZ2VfZmF0X29zOiBlcnJvciByZWFkaW5nIGltYWdlIHN5c3RlbS5kdGIsIGVy
ciAtIC0yCj4gcmVhZGluZyB1LWJvb3QuaW1nCj4gcmVhZGluZyB1LWJvb3QuaW1nCj4gCj4gCj4g
VS1Cb290IDIwMTguMDEgKEZlYiAyMyAyMDIyIC0gMTE6NDM6MTUgKzAxMDApIFhpbGlueCBaeW5x
IFpDNzA2Cj4gCj4gTW9kZWw6IFp5bnEgWkM3MDYgRGV2ZWxvcG1lbnQgQm9hcmQKPiBCb2FyZDog
WGlsaW54IFp5bnEKPiBTaWxpY29uOiB2MC4wCj4gSTJDOiAgIHJlYWR5Cj4gRFJBTTogIEVDQyBk
aXNhYmxlZCAxIEdpQgo+IE1NQzogICBzZGhjaUBlMDEwMDAwMDogMCAoU0QpCj4gU0Y6IERldGVj
dGVkIG4yNXExMjhhIHdpdGggcGFnZSBzaXplIDUxMiBCeXRlcywgZXJhc2Ugc2l6ZSAxMjggS2lC
LCB0b3RhbCAzMiBNaUIKPiAqKiogV2FybmluZyAtIGJhZCBDUkMsIHVzaW5nIGRlZmF1bHQgZW52
aXJvbm1lbnQKPiAKPiBJbjogICAgc2VyaWFsQGUwMDAxMDAwCj4gT3V0OiAgIHNlcmlhbEBlMDAw
MTAwMAo+IEVycjogICBzZXJpYWxAZTAwMDEwMDAKPiBOZXQ6ICAgWllOUSBHRU06IGUwMDBiMDAw
LCBwaHlhZGRyIDcsIGludGVyZmFjZSByZ21paS1pZAo+IGV0aDA6IGV0aGVybmV0QGUwMDBiMDAw
Cj4gSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDogIDAKPiBaeW5xPgo+IAo+IFRoZW4gYm9v
dGluZyBMaW51eCA6Cj4gCj4gWnlucT4gYm9vdAo+IERldmljZTogc2RoY2lAZTAxMDAwMDAKPiBN
YW51ZmFjdHVyZXIgSUQ6IDI3Cj4gT0VNOiA1MDQ4Cj4gTmFtZTogU0QxNkcKPiBUcmFuIFNwZWVk
OiA1MDAwMDAwMAo+IFJkIEJsb2NrIExlbjogNTEyCj4gU0QgdmVyc2lvbiAzLjAKPiBIaWdoIENh
cGFjaXR5OiBZZXMKPiBDYXBhY2l0eTogMTQuNCBHaUIKPiBCdXMgV2lkdGg6IDQtYml0Cj4gRXJh
c2UgR3JvdXAgU2l6ZTogNTEyIEJ5dGVzCj4gKiogVW5hYmxlIHRvIHJlYWQgZmlsZSB1RW52LnR4
dCAqKgo+IENvcHlpbmcgTGludXggZnJvbSBTRCB0byBSQU0uLi4KPiByZWFkaW5nIHVJbWFnZQo+
IDM3MzIyNTYgYnl0ZXMgcmVhZCBpbiAyMTIgbXMgKDE2LjggTWlCL3MpCj4gcmVhZGluZyBkZXZp
Y2V0cmVlLmR0Ygo+IDEzNjY3IGJ5dGVzIHJlYWQgaW4gMTQgbXMgKDk1My4xIEtpQi9zKQo+IHJl
YWRpbmcgdXJhbWRpc2suaW1hZ2UuZ3oKPiA5NTE0ODggYnl0ZXMgcmVhZCBpbiA2NSBtcyAoMTQg
TWlCL3MpCj4gIyMgQm9vdGluZyBrZXJuZWwgZnJvbSBMZWdhY3kgSW1hZ2UgYXQgMDIwODAwMDAg
Li4uCj4gICBJbWFnZSBOYW1lOiAgIExpbnV4LTQuOS4wLXhpbGlueAo+ICAgSW1hZ2UgVHlwZTog
ICBBUk0gTGludXggS2VybmVsIEltYWdlICh1bmNvbXByZXNzZWQpCj4gICBEYXRhIFNpemU6ICAg
IDM3MzIxOTIgQnl0ZXMgPSAzLjYgTWlCCj4gICBMb2FkIEFkZHJlc3M6IDAwMDA4MDAwCj4gICBF
bnRyeSBQb2ludDogIDAwMDA4MDAwCj4gICBWZXJpZnlpbmcgQ2hlY2tzdW0gLi4uIE9LCj4gIyMg
TG9hZGluZyBpbml0IFJhbWRpc2sgZnJvbSBMZWdhY3kgSW1hZ2UgYXQgMDQwMDAwMDAgLi4uCj4g
ICBJbWFnZSBOYW1lOgo+ICAgSW1hZ2UgVHlwZTogICBBUk0gTGludXggUkFNRGlzayBJbWFnZSAo
dW5jb21wcmVzc2VkKQo+ICAgRGF0YSBTaXplOiAgICA5NTE0MjQgQnl0ZXMgPSA5MjkuMSBLaUIK
PiAgIExvYWQgQWRkcmVzczogMDAwMDAwMDAKPiAgIEVudHJ5IFBvaW50OiAgMDAwMDAwMDAKPiAg
IFZlcmlmeWluZyBDaGVja3N1bSAuLi4gT0sKPiAjIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxv
YiBhdCAwMjAwMDAwMAo+ICAgQm9vdGluZyB1c2luZyB0aGUgZmR0IGJsb2IgYXQgMHgyMDAwMDAw
Cj4gICBMb2FkaW5nIEtlcm5lbCBJbWFnZSAuLi4gT0sKPiAgIExvYWRpbmcgUmFtZGlzayB0byAx
ZmYxNzAwMCwgZW5kIDFmZmZmNDgwIC4uLiBPSwo+ICAgTG9hZGluZyBEZXZpY2UgVHJlZSB0byAx
ZmYxMDAwMCwgZW5kIDFmZjE2NTYyIC4uLiBPSwo+IAo+IFN0YXJ0aW5nIGtlcm5lbCAuLi4KPiAK
PiBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAweDAKPiAKPiBbLi4uXQo+IAo+IFN0YXJ0
aW5nIG5ldHdvcms6IE9LCj4gCj4gV2VsY29tZSB0byBCdWlsZHJvb3QKPiBidWlsZHJvb3QgbG9n
aW46Cj4gCj4gCj4gSXQgd29ya3MgYXMgaXMgXG8vCj4gCj4gRG8gSSBoYXZlIHRvIG1ha2UgYSBw
YXRjaCB0byBhZGQgdGhlIHRhcmdldD8KClN1cmUsIHlvdSBjYW4gZG8gdGhhdCBhbmQgYWRkIGFu
IGVudHJ5IGluIERFVkVMT1BFUlMgd2l0aCB5b3UgdG8gbWFpbnRhaW4gaXQuCgpCdXQgaGVyZSBJ
IHRoaW5rIHdlIG5lZWQgc3BlY2lmaWMgdGFnIG5hbWVzLCBkdHMgZmlsZXMgZXRjIGZvciB6Yzcw
Mi4KQW5kIHBvc3NpYmx5IGJ1bXAgYWxsIHRoZSB2ZXJzaW9ucyBmb3IgdWJvb3QgYW5kIExpbnV4
LgoKQ2FuIHlvdSBkbyB0aGF0PwoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gRmFiaWVuIE1hcnRlYXUKPiBBcm1hZGV1cyBTeXN0ZW0KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
