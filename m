Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427CCA1007
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 05:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C168783863;
	Wed,  3 Sep 2025 05:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciKsBpZCmpGU; Wed,  3 Sep 2025 05:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D23847CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D23847CC;
	Wed,  3 Sep 2025 05:11:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7E42BA9
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 05:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B5741F49
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 05:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYAVtZUpXkSg for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 05:11:19 +0000 (UTC)
X-Greylist: delayed 520 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Sep 2025 05:11:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BFAE41F6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFAE41F6A
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org;
 envelope-from=srs0=gj5p=3o=kaod.org=clg@ozlabs.org; receiver=<UNKNOWN> 
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BFAE41F6A
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 05:11:18 +0000 (UTC)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4cGr8B0N2Xz4w9h
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 15:02:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cGr886GTtz4w2J;
 Wed,  3 Sep 2025 15:02:32 +1000 (AEST)
Message-ID: <6e35067b-0403-49d9-b706-d47ca3eb519b@kaod.org>
Date: Wed, 3 Sep 2025 07:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joel Stanley <joel@jms.id.au>
Cc: buildroot@buildroot.org
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-2-clg@kaod.org>
 <CACPK8XdQnx822DzoWLGrE6PyfcL=e=ZP4kAaAgOE40+Zazpctg@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Language: en-US, fr
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <CACPK8XdQnx822DzoWLGrE6PyfcL=e=ZP4kAaAgOE40+Zazpctg@mail.gmail.com>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8zLzI1IDAxOjAxLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gT24gU3VuLCAzMSBBdWcgMjAy
NSBhdCAyMjoxMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cj4+Cj4+
IFNpbmNlIExpbnV4IDYuNSBtb3ZlZCAuZHRzIGZpbGVzIHRvIHZlbmRvciBzdWItZGlyZWN0b3Jp
ZXMsIGFkanVzdCB0aGUKPj4gcG9zdC1pbWFnZS5zaCBzY3JpcHQgdG8gdGFrZSBpbnRvIGFjY291
bnQgdGhlICdhc3BlZWQvJyBwcmVmaXggaW4gLmR0cwo+PiBmaWxlIG5hbWVzLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+IAo+IElzIGl0IGN1
c3RvbWFyeSB0byB1c2UgYSBzcGVjaWZpYyB2ZXJzaW9uPyBJZiBub3QsIGxlYXZpbmcgdGhlc2UK
PiBib2FyZHMgdG8gdXNlIHRoZSBkZWZhdWx0cyB3b3VsZCBtYWtlIHNlbnNlIGFuZCBzYXZlIGhh
dmluZyB0byB1cGRhdGUKPiB0aGVtIGluIHRoZSBmdXR1cmUuCgpBbGwga2VybmVscyBhYm92ZSB2
Ni41IG5lZWQgaXQgYW5kIEkgZG91YnQgb25lIHdvdWxkIHdhbnQgdG8gdXNlCmFueXRoaW5nIGJl
bG93IHY2LjYuIHY2LjYgaGFzIGJlZW4gdGhlIGJhc2UgdmVyc2lvbiBvZiB0aGUgU0RLCmFuZCBP
cGVuQk1DIGtlcm5lbCBmb3IgYSB3aGlsZSBub3cuCgpUaGUgenlucSBib2FyZHMgaGF2ZSBhIHNp
bWlsYXIgZml4LgoKPiBSZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4K
CgpUaGFua3MsCgpDLgoKCj4gCj4+IC0tLQo+PiAgIGJvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1p
bWFnZS5zaCAgIHwgNCArKy0tCj4+ICAgY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25m
aWcgfCA2ICsrKy0tLQo+PiAgIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnIHwg
NiArKystLS0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5z
aCBiL2JvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaAo+PiBpbmRleCBlYTY1YTQ5YWZm
ZjAuLjhjOTUzZTAzOGM5ZiAxMDA3NTUKPj4gLS0tIGEvYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0
LWltYWdlLnNoCj4+ICsrKyBiL2JvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaAo+PiBA
QCAtMyw4ICszLDggQEAKPj4gICBCT0FSRF9ESVI9IiQoZGlybmFtZSAkMCkiCj4+ICAgbWtpbWFn
ZT0kSE9TVF9ESVIvYmluL21raW1hZ2UKPj4KPj4gLUJPQVJEX0RUPSQoc2VkIC1uIFwKPj4gLSAg
ICAgICAgICAgJ3MvXkJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJcKFthLXowLTlc
LV0qXCkuKiIkL1wxL3AnIFwKPj4gK0JPQVJEX0RUPSQoc2VkIC1uciBcCj4+ICsgICAgICAgICAg
IC1lICdzfF5CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iKGFzcGVlZC8pPyhbYS16
MC05XC1dKikuKiIkfFwyfHAnIFwKPj4gICAgICAgICAgICAgICR7QlIyX0NPTkZJR30pCj4+Cj4+
ICAgc2VkIC1lICJzLyVCT0FSRF9EVEIlLyR7Qk9BUkRfRFR9LmR0Yi8iIFwKPj4gZGlmZiAtLWdp
dCBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnIGIvY29uZmlncy9hc3BlZWRf
YXN0MjUwMGV2Yl9kZWZjb25maWcKPj4gaW5kZXggMjMxMjI0MmU2NDA2Li5mZmMwZWM4ZDUyYjUg
MTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCj4+ICsr
KyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCj4+IEBAIC0xLDE3ICsxLDE3
IEBACj4+ICAgQlIyX2FybT15Cj4+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VT
VE9NXzVfMTc9eQo+PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE2
PXkKPj4gICBCUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9ImFzcGVlZC1ldmIiCj4+ICAgQlIy
X1RBUkdFVF9HRU5FUklDX0lTU1VFPSJBc3BlZWQgRVZCIgo+PiAgIEJSMl9TWVNURU1fREhDUD0i
ZXRoMCIKPj4gICBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9hc3BlZWQvY29t
bW9uL3Bvc3QtaW1hZ2Uuc2giCj4+ICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4+ICAgQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI1LjE3LjciCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjE2LjQiCj4+ICAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImFzcGVlZF9nNSIK
Pj4gICBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvYXNwZWVk
L2FzdDI1MDAtZXZiL2xpbnV4LmZyYWdtZW50Igo+PiAgIEJSMl9MSU5VWF9LRVJORUxfWFo9eQo+
PiAgIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9J
TlRSRUVfRFRTX05BTUU9ImFzcGVlZC1hc3QyNTAwLWV2YiIKPj4gK0JSMl9MSU5VWF9LRVJORUxf
SU5UUkVFX0RUU19OQU1FPSJhc3BlZWQvYXNwZWVkLWFzdDI1MDAtZXZiIgo+PiAgIEJSMl9QQUNL
QUdFX01URD15Cj4+ICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15Cj4+ICAgQlIyX1RBUkdFVF9S
T09URlNfQ1BJT19YWj15Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZi
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCj4+IGluZGV4
IDEwNGY2ODUyMDBlZi4uNGU0OWM0YWNiZWFiIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL2FzcGVl
ZF9hc3QyNjAwZXZiX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZi
X2RlZmNvbmZpZwo+PiBAQCAtMSwxNiArMSwxNiBAQAo+PiAgIEJSMl9hcm09eQo+PiAgIEJSMl9j
b3J0ZXhfYTc9eQo+PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE3
PXkKPj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xNj15Cj4+ICAg
QlIyX1RBUkdFVF9HRU5FUklDX0hPU1ROQU1FPSJhc3BlZWQtZXZiIgo+PiAgIEJSMl9UQVJHRVRf
R0VORVJJQ19JU1NVRT0iQXNwZWVkIEVWQiIKPj4gICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4+
ICAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0
LWltYWdlLnNoIgo+PiAgIEJSMl9MSU5VWF9LRVJORUw9eQo+PiAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iNS4xNy43Igo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4x
Ni40Igo+PiAgIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJhc3BlZWRfZzUiCj4+ICAgQlIy
X0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9E
VFNfTkFNRT0iYXNwZWVkLWFzdDI2MDAtZXZiIgo+PiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVf
RFRTX05BTUU9ImFzcGVlZC9hc3BlZWQtYXN0MjYwMC1ldmIiCj4+ICAgQlIyX1BBQ0tBR0VfTVRE
PXkKPj4gICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPj4gICBCUjJfVEFSR0VUX1JPT1RGU19D
UElPX1haPXkKPj4gLS0KPj4gMi41MS4wCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
