Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C966C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 11:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB7940912;
	Sat, 29 Jan 2022 11:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MT4RThHDA-5h; Sat, 29 Jan 2022 11:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DCF4090E;
	Sat, 29 Jan 2022 11:22:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD2941BF954
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A66D060AF6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCtLUlV2_IBQ for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 11:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D24360AEC
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 11:22:19 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id Dlo9nminCQUuPDlo9nyJRc; Sat, 29 Jan 2022 12:22:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643455338; bh=KKJPFvZF5JaaiNzX+HgA9y+2vPHIf1RDCusMHgP1oxU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=FuIP8ulpy090o5BDInGXxA/psL0IKIEp3qHow6oym4BfDPe2DfNt2iEWXJzkKOg3M
 Ppb8nY2/fGFKv87O1DLrGGB357llwg5blTpWhssLNFAezBOOsRGectLkOzLNeH4peh
 FcHa7/59MJvQ/4vvkBYQNihf4TP4yFydJH9cCfkcXRH7rHMERyvs5/AlknTER5PnDv
 sCulDgLn7bWPT1E5KILVhaTvLYPS/8CEBOfX2QcnBYavM6DXhr9uHr5x94Nl3ORjjS
 CwP13CDS+Vt6RxXIf6l2PKRk6xjwwt+v62+0HYVLCd6fn0uZ4K01b539OWoIuJdNaz
 2DfaXFbyBlz3Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 29 Jan 2022 12:22:17 +0100
Message-Id: <6757E6B9-1D89-4E85-8C96-87CA1F111835@benettiengineering.com>
References: <20220129111731.736265-2-peron.clem@gmail.com>
In-Reply-To: <20220129111731.736265-2-peron.clem@gmail.com>
To: =?utf-8?Q?Cl=C3=A9ment_P=C3=A9ron?= <peron.clem@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfDrPmmJu/GQg0gvLhoFfQbkDaZb30yru+oan2s0raJ51dzypCkJp1jqcVGYJew5qdaF2bSpJzYdzNLYnicksacBsRjKUsYJ+yotUQgzb/oD7ooVHspwM
 J6YWMAboeksegn7vowjn94pzyPrnRt+GRxPYC5y7Tz6rUZ2C4EqZDwR14tmFSbDhd2Y2y0EYlsXS0FN5PgWrzKe9ikgD/XCiYAs488i29Eynm5p2Gwua5OC4
 tt8zoKP/7x/k7aPsCnfb/w==
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/beelink_gs1: bump to linux
 5.15, atf 2.5 and u-boot 2021.10
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

SGkgQ2zDqW1lbnQsCgo+IElsIGdpb3JubyAyOSBnZW4gMjAyMiwgYWxsZSBvcmUgMTI6MTgsIENs
w6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/
VS1ib290IGxpYmZkdCBmYWlscyB0byBjb21waWxlIG9uIENJLgo+IC91c3IvYmluL2xkOiBzY3Jp
cHRzL2R0Yy9kdGMtcGFyc2VyLnRhYi5vOiguYnNzKzB4MTApOiBtdWx0aXBsZSBkZWZpbml0aW9u
IG9mIGB5eWxsb2MnOyBzY3JpcHRzL2R0Yy9kdGMtbGV4ZXIubGV4Lm86KC5ic3MrMHgwKTogZmly
c3QgZGVmaW5lZCBoZXJlCj4gY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3Rh
dHVzCj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9i
cy8yMDIxNDc4MjA4Cj4gCj4gQXMgdGhpcyBmaXggaGFzIGJlZW4gYWxyZWFkeSB1cHN0cmVhbWVk
IGp1c3QgYnVtcCBVLWJvb3QgcGFja2FnZS4KPiAKPiBMZXQncyBhbHNvIGJ1bXAgS2VybmVsIGFu
ZCBBVEYgYXMgdGhlIGJvYXJkIGlzIHByb3Blcmx5IHN1cHBvcnRlZCB1cHN0cmVhbS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgoKUmV2
aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAtLS0KPiBjb25maWdzL2JlZWxpbmtfZ3Mx
X2RlZmNvbmZpZyB8IDEwICsrKysrLS0tLS0KPiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2JlZWxpbmtfZ3Mx
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCj4gaW5kZXggMTg3MmFh
YmRmMC4uY2E5NTNkZjNlYSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNv
bmZpZwo+ICsrKyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCj4gQEAgLTExLDExICsx
MSwxMSBAQCBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9iZWVsaW5rL2dzMS9w
b3N0LWJ1aWxkLnNoIgo+IEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2Ny
aXB0cy9nZW5pbWFnZS5zaCIKPiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJk
L2JlZWxpbmsvZ3MxL2dlbmltYWdlLmNmZyIKPiAKPiAtIyBLZXJuZWwgTGludXggaGVhZGVycyBz
YW1lIGFzIGtlcm5lbCwgYSA1LjUgc2VyaWVzCj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVB
REVSU19DVVNUT01fNV81PXkKPiArIyBLZXJuZWwgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5l
bCwgNS4xNSBzZXJpZXMKPiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81
XzE1PXkKPiBCUjJfTElOVVhfS0VSTkVMPXkKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS41LjQiCj4g
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTUiCj4gQlIyX0xJTlVY
X0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15Cj4gQlIyX0xJTlVYX0tFUk5FTF9EVFNf
U1VQUE9SVD15Cj4gQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFsbHdpbm5lci9z
dW41MGktaDYtYmVlbGluay1nczEiCj4gQEAgLTI5LDE0ICsyOSwxNCBAQCBCUjJfVEFSR0VUX1JP
T1RGU19FWFQyX1NJWkU9IjEyME0iCj4gIyBGaXJtd2FyZQo+IEJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkU9eQo+IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZF
UlNJT049eQo+IC1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSJ2Mi4yIgo+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSJ2Mi41Igo+IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExB
VEZPUk09InN1bjUwaV9oNiIKPiAKPiAjIEJvb3Rsb2FkZXIKPiBCUjJfVEFSR0VUX1VCT09UPXkK
PiBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiBCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iMjAyMC4wMSIKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
MjAyMS4xMCIKPiBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iYmVlbGlua19nczEi
Cj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNf
UFlUSE9OMz15Cj4gLS0gCj4gMi4zMi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
