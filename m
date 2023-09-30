Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D65E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AD8641595;
	Sat, 30 Sep 2023 15:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD8641595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4HPZOMCvE_8; Sat, 30 Sep 2023 15:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BDD141597;
	Sat, 30 Sep 2023 15:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDD141597
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 803101BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58AB481468
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58AB481468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GqR9pn47C5b for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:31:27 +0000 (UTC)
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 563748148D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563748148D
Received: from smtpclient.apple ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPA
 id mbw9qZb3Nx0xAmbwAqLKyZ; Sat, 30 Sep 2023 17:31:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 30 Sep 2023 17:31:21 +0200
Message-Id: <5256DD48-6F80-4FB4-9E8E-796327057033@benettiengineering.com>
References: <20230930113651.572c4efa@windsurf>
In-Reply-To: <20230930113651.572c4efa@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (21A351)
X-CMAE-Envelope: MS4xfINWzozj0+ohG8SDV4WRQsvwRqr7VYCc8umScrAbgIcBk/8JDxiLxuN/18F3a097cvvFTelbC1Eq/Oi807TXVGk3ppVDBuqJcPnpFL6vOAUs5CH7Rmo1
 /5j42t4UKGIH5O3lldmDdVfDt3e4J8Uegxj0HhihqlRevvfButemQ2v7LQARIas9H5n3svBXV3vGRk4QdOs9PQX8FG150X2rCCvCnzCPMLoJkCLrIJ1tREi1
 kjKfytmF7rbFxdAFVJRgVND6/ir9Tjpax2AX+ga0zyl09l02SxbKH2V0Wlr9+Hh5ME2aYo+5o9mGO7pthhs17g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696087882; bh=vBRo3ehChi3xHgUP+a2vjI8CxCshyBnmZ5SLI8/vWHI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Q4CqCUyBHd1C21ofgY6FRiXvVb9oE7KuyK+6oYGmTxp6k2awd47lc1yQ7Q5h2mSOH
 YZeE8wLUM/KHKtCJdP6pjRoukT3LDvDfDAmUh90lkWQ2FWIMdhYMHxrC0Xnwnhvoqr
 MR9EryJqEJgPuYcj7I6Z+fDjyH+2DZ1TAKnBgBWcE2rvbBRyfp+kX4q5Ti0Uj9onl9
 F3R5fRo0MBkTAhgkkEoWYKa7zkvkto03AgdHY27MQCQOJwPz4AheWzvNXYaKZyI4RQ
 i/QviiwvDgClLtKOz0TsiEWPiUlu6++67TV9QZ6esTttSDCY2rj/GvtHKe6v6Y6KdJ
 0vxKhbsIDwb+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q4CqCUyB
Subject: Re: [Buildroot] [PATCH] configs/bananapi_m2_berry: new defconfig
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDMwIHNldCAyMDIzLCBhbGxlIG9yZSAxMTozNywgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79IZWxs
bywKPiAKPj4gT24gTW9uLCAgNyBBdWcgMjAyMyAwMDoxODoyMSArMDIwMAo+PiBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+IAo+
PiAKPj4gZGlmZiAtLWdpdCBhL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLWJlcnJ5L2Jvb3Qu
Y21kIGIvYm9hcmQvYmFuYW5hcGkvYmFuYW5hcGktbTItYmVycnkvYm9vdC5jbWQKPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uYTgwOGZhMDQwNwo+PiAtLS0gL2Rl
di9udWxsCj4+ICsrKyBiL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLWJlcnJ5L2Jvb3QuY21k
Cj4+IEBAIC0wLDAgKzEsNyBAQAo+PiArc2V0ZW52IGJvb3RhcmdzIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIGVhcmx5cHJpbnRrIHJvb3Q9L2Rldi9tbWNibGswcDIgcm9vdHdhaXQgZHJtLmRlYnVnPTB4
ZmYKPiAKPiBJIGRyb3BwZWQgZWFybHlwcmludGsgYW5kIGRybS5kZWJ1Zz0weGZmIGZyb20gdGhl
cmUsIGFzIGl0J3MgcmVhbGx5IGEKPiBiaXQgdG9vIG11Y2ggZGVidWdnaW5nIG9yaWVudGVkLgo+
IAo+IEluIGFueSBjYXNlLCBpdCdkIGJlIGdyZWF0IHRvIHVzZSBleHRsaW51eC5jb25mIGluc3Rl
YWQgb2YgdGhpcy4KPiAKPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYmFuYW5hcGlfbTJfYmVycnlf
ZGVmY29uZmlnIGIvY29uZmlncy9iYW5hbmFwaV9tMl9iZXJyeV9kZWZjb25maWcKPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uOTU2NTJlNzkzOQo+PiAtLS0gL2Rl
di9udWxsCj4+ICsrKyBiL2NvbmZpZ3MvYmFuYW5hcGlfbTJfYmVycnlfZGVmY29uZmlnCj4+IEBA
IC0wLDAgKzEsMzcgQEAKPj4gK0JSMl9hcm09eQo+PiArQlIyX2NvcnRleF9hNz15Cj4+ICtCUjJf
VE9PTENIQUlOX0VYVEVSTkFMPXkKPj4gK0JSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29t
ZSB0byBCYW5hbmFwaSBNMiBCZXJyeSIKPj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9
InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRf
QVJHUz0iLWMgYm9hcmQvYmFuYW5hcGkvYmFuYW5hcGktbTItYmVycnkvZ2VuaW1hZ2UuY2ZnIgo+
PiArQlIyX0xJTlVYX0tFUk5FTD15Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
PXkKPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS4zOCIKPj4g
K0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJzdW54aSIKPj4gK0JSMl9MSU5VWF9LRVJORUxf
RFRTX1NVUFBPUlQ9eQo+PiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InN1bjhp
LXY0MC1iYW5hbmFwaS1tMi1iZXJyeSIKPj4gK0JSMl9QQUNLQUdFX0tNU0NVQkU9eQo+PiArQlIy
X1BBQ0tBR0VfTUVTQTNEPXkKPj4gK0JSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9M
SU1BPXkKPj4gK0JSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRUdMPXkKPj4gK0JSMl9QQUNLQUdF
X01FU0EzRF9PUEVOR0xfRVM9eQo+PiArQlIyX1BBQ0tBR0VfSFRPUD15Cj4gCj4gSSBkcm9wcGVk
IGttc2N1YmUsIG1lc2EzZCBhbmQgaHRvcCwgYmVjYXVzZSB0aGV5IGRvbid0IHF1YWxpZnkgZm9y
IGEKPiBtaW5pbWFsIGNvbmZpZ3VyYXRpb24uCj4gCj4gQXBwbGllZCB3aXRoIHRob3NlIGNoYW5n
ZXMuCgpUaGFuayB5b3UgVGhvbWFzLCBJ4oCZdmUgZm9yZ290dGVuIGFsbCB0aG9zZSBwb2ludHMg
YmVjYXVzZSBJIHdhcyBkZWJ1Z2dpbmcgTGltYSBvbiBWNDAuCgpCZXN0IHJlZ2FyZHMKR2l1bGlv
Cgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
