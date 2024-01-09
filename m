Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C62C4706C
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC2D183E08;
	Tue,  9 Jan 2024 22:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2D183E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qlhZaToJqFo; Tue,  9 Jan 2024 22:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3769083D82;
	Tue,  9 Jan 2024 22:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3769083D82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADE501BF31D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F6C435EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 22:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F6C435EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuQSUA3_fSnT for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 22:00:14 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E425435E0
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 22:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E425435E0
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NK8nrdTuwImN1NK8orZ9oN; Tue, 09 Jan 2024 23:00:10 +0100
Message-ID: <2d3d2290-9d8f-4ba3-bf03-5db0e1d584a0@benettiengineering.com>
Date: Tue, 9 Jan 2024 23:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
 <90fc81f5-d445-4917-bb02-46e2e353642a@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <90fc81f5-d445-4917-bb02-46e2e353642a@benettiengineering.com>
X-CMAE-Envelope: MS4xfIMgN1Yq3bnKmymRQ6AKuYKK3gc+8mlOFIB4vImcDSSxM/zoeNmToQzKUpC4Ks/vf8lhYc8RQuw919Ya22AUXBhiqMThke2WCzLbO1i6edTcTk7dRpSM
 IVHutXU//+r4dXv3Yl2BDlvw9jIHAjNxdToZxdOdW30eq5JLS8jBKpnKMIZY+X4pOuv7dCZ9DJAIEqZNrKC/SA/vRGNI8j/i6TYq/TSxiyjKYFyrJ0QKPbA5
 ooyXUo/uI0go+L6XFubu9uhu8HU0ouHbQBGiA7C0pKTkdhXi9MU9TN5cbv62nKNV
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704837610; bh=KbVUGiMujho3tuKRr78rxAIu2IQTVpmQaZ2yYtILph0=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=mgM3HWjAsG5eCPBpKL6U4P7wav7csVf/YnRWmR4lUrZcrtKetm6/kf047zb3nJ6az
 BBkl/aTE4mPl40klCxVR4jj0CYZPhNdp7qwgJW49tB/G2GdYJdwtu7HnBVvxKhGmdA
 +1L85e91nCe9DI7Vsa3cLvGN8UX92C01oUIc/hdgT7GeKcRyvQycgSwI6xrZUvibUL
 fO9N/OCm74BHWIH4BZihLEQlMhWugrNQrfn7qijxHtg1JYkoT+nh6mL/rWI1tEbBZv
 NWDHyUoYAtZwmZVHHcYXmp5c/bxnE4ZUqoZUyBl0c4ZjOxsefME0wzDrVJSVf8zqSa
 CSvaxxlQTK6Lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mgM3HWjA
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Bump Kernel and
 U-boot
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmVzc2UsCgp0aGlzIHBhdGNoIGhhcyBiZWVuIHN1cGVyc2VkZWQgYnkgVjIgY2FuIHlvdSBw
bGVhc2Ugc2V0IGl0IGluIFBhdGNod29yaz8KCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzExMDkwMzU5NDcuMTg1MjY3NS0xLU1yLkJvc3Nt
YW4wNzVAZ21haWwuY29tLwoKVGhhbmsgeW91IQoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVu
ZXR0aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgpPbiAwOS8xMS8yMyAxMjoyMSwg
R2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gSGkgSmVzc2UsCj4gCj4gT24gMDkvMTEvMjMgMDQ6NTks
IEplc3NlIFRhdWJlIHdyb3RlOgo+PiBCdW1wIExpbnV4IHRvIDYuNiBhbmQgVS1Cb290IHRvIDIw
MjQuMDEtcmMyCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxNci5Cb3NzbWFuMDc1
QGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKgIGNvbmZpZ3MvaW14cnQxMDUwLWV2a19kZWZjb25maWcg
fCA2ICsrKy0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9pbXhydDEwNTAtZXZrX2RlZmNvbmZp
ZyAKPj4gYi9jb25maWdzL2lteHJ0MTA1MC1ldmtfZGVmY29uZmlnCj4+IGluZGV4IGFmMDYwZmI5
ZjQuLjBlYjZmNjI2YzkgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3MvaW14cnQxMDUwLWV2a19kZWZj
b25maWcKPj4gKysrIGIvY29uZmlncy9pbXhydDEwNTAtZXZrX2RlZmNvbmZpZwo+PiBAQCAtNywx
MiArNywxMiBAQCAKPj4gQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3Jp
cHRzL2dlbmltYWdlLnNoIgo+PiDCoCBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIAo+
PiBib2FyZC9mcmVlc2NhbGUvaW14cnQxMDUwZXZrL2dlbmltYWdlLmNmZyIKPj4gwqAgIyBUb29s
Y2hhaW4KPj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKPj4g
K0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKPj4gwqAgIyBLZXJu
ZWwKPj4gwqAgQlIyX0xJTlVYX0tFUk5FTD15Cj4+IMKgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4x
Igo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42Igo+PiDCoCBC
UjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iaW14cnQiCj4+IMKgIEJSMl9MSU5VWF9LRVJORUxf
VUlNQUdFPXkKPj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4+IEBAIC0zMCw3
ICszMCw3IEBAIAo+PiBCUjJfUEFDS0FHRV9CVVNZQk9YX0NPTkZJRz0icGFja2FnZS9idXN5Ym94
L2J1c3lib3gtbWluaW1hbC5jb25maWciCj4+IMKgIEJSMl9UQVJHRVRfVUJPT1Q9eQo+PiDCoCBC
UjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPj4gwqAgQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTj15Cj4+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSIyMDIyLjEwIgo+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iMjAyNC4wMS1yYzIiCj4gCj4gSSB3b3VsZCByZWFsbHkgYXZvaWQgdG8gYnVtcCB0byBhIHJj
IHZlcnNpb24uIFBsZWFzZSB1c2UgdjIwMjMuMTAKPiBvciBsZXQncyB3YWl0IGZvciB2MjAyNC4w
MSB0byBiZSByZWxlYXNlZC4KPiAKPiBUaGFuayB5b3UKPiBCZXN0IHJlZ2FyZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
