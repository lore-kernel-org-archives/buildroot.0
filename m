Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A16C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 18:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2938260BF5;
	Mon, 17 Jan 2022 18:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRz7Dj9IBxLV; Mon, 17 Jan 2022 18:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563E360BBC;
	Mon, 17 Jan 2022 18:54:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E324A1BF2F3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF60D60B99
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVVYbZ5UybzZ for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 18:54:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC9860B8C
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 18:54:16 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9X8xnBZNcBBmw9X8xnvOF8; Mon, 17 Jan 2022 19:54:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642445655; bh=04vqH8IeRWa5Ao6Q+YQCpIdIPqDiVRZ+JdPRtejzqpo=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=XYn4YgNehzOWu25oYLbRG+8nmJHjW/MMD23KvAR6ivgwSIrxrC5UWU8YWtFNiVZN+
 S4i+ttgNjZ4ARTQRCsP+l4Hup6HYmZzHiwuQ3CRHy8NcAovkZbEGf7et0r4dGF04kK
 JDtpUAmLmq64LopJw2FvmUXYtfJNj+PkmpVoF779bjoQ68vtWFoKD6/jkdRTqqIBRU
 50CnMWo+8f2gwhZIj5WdbO5QtWvkZOEwPSdpr/8JzWERt65+raRlrBn+deGjY/YajA
 bLp1jWXR6An3uJmsbFJH8vakvN6FBMGfrx2eWk7yYGAk2K1pU1TfrrTsJfBv2r6Fqs
 p942a5lKaaBGA==
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 buildroot@buildroot.org
References: <20211106181424.299041-1-peron.clem@gmail.com>
 <20211106181424.299041-2-peron.clem@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b016d5c3-4180-d447-9ee6-d8e74d3fa351@benettiengineering.com>
Date: Mon, 17 Jan 2022 19:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211106181424.299041-2-peron.clem@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfLk9SjvP22fFjCdXMMVF4WRTFrqIb4BWfXOKoqU3CFdbfi5brBBqUCZCeaL4BdQjN+f2H5etNZIBW73qxAi6wCWfHWnr2z0kkUKLc3kIMAt+sBhrCT8z
 JoRYOJDqcbaGkylmzeOPat/VSCf6o/pAkUSqoBomrCnEBYyaqGcMtCjoWJGTnkV6va2C9ZEWgH/HvuWkSv/m/nmZF0cIAj1fAZyiHfpD8oDCYWaQPlmowz4M
 8yHtXpkdOYxUPRqZ/Gbkhg==
Subject: Re: [Buildroot] [PATCH 2/2] configs/beelink_gs1: bump to linux 5.15,
 atf 2.5 and u-boot 2021.10
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

SGkgQ2zDqW1lbnQsCgpPbiAwNi8xMS8yMSAxOToxNCwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+
IGxpYmZkdCBmYWlscyB0byBjb21waWxlIHdpdGggb24gQ0kuCj4gL3Vzci9iaW4vbGQ6IHNjcmlw
dHMvZHRjL2R0Yy1wYXJzZXIudGFiLm86KC5ic3MrMHgxMCk6IG11bHRpcGxlIGRlZmluaXRpb24g
b2YgYHl5bGxvYyc7IHNjcmlwdHMvZHRjL2R0Yy1sZXhlci5sZXgubzooLmJzcysweDApOiBmaXJz
dCBkZWZpbmVkIGhlcmUKPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0
dXMKPiAKPiBCdW1wIFUtYm9vdCBhbmQgYWxzbyBLZXJuZWwgYW5kIEFURi4KCnRoZSBjb21taXQg
bG9nIGFuZCBzdWJqZWN0IGRvZXNuJ3QgZXhwbGFpbiB0aGF0IHRoZSB2ZXJzaW9uIGJ1bXBpbmco
YXMgSSAKc3VzcGVjdCkgZml4IHRoZSB1Ym9vdCBidWlsZCBmYWlsdXJlKGFzIEkgY2FuIGludGVy
cHJldCkuIENhbiB5b3UgcGxlYXNlIAppbXByb3ZlIGNvbW1pdCBsb2cgYnkgc3BlY2lmeWluZyB0
aGF0IHdoaWxlIGJ1bXBpbmcodS1ib290IEkgdGhpbmspIHRoYXQgCmVycm9yIGlzIGZpeGVkPwoK
QW5kIHBsZWFzZSBhZGQ6CgpGaXhlczoKdGhlIGxpbmsgb2YgdGhlIENJIGZhaWx1cmUuCgpUaGFu
ayB5b3UKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5n
IHNhcwoKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwu
Y29tPgo+IC0tLQo+ICAgY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcgfCAxMCArKysrKy0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
YmVlbGlua19nczFfZGVmY29uZmlnCj4gaW5kZXggMTg3MmFhYmRmMC4uY2E5NTNkZjNlYSAxMDA2
NDQKPiAtLS0gYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mv
YmVlbGlua19nczFfZGVmY29uZmlnCj4gQEAgLTExLDExICsxMSwxMSBAQCBCUjJfUk9PVEZTX1BP
U1RfQlVJTERfU0NSSVBUPSJib2FyZC9iZWVsaW5rL2dzMS9wb3N0LWJ1aWxkLnNoIgo+ICAgQlIy
X1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+
ICAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9iZWVsaW5rL2dzMS9nZW5p
bWFnZS5jZmciCj4gICAKPiAtIyBLZXJuZWwgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwg
YSA1LjUgc2VyaWVzCj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV81
PXkKPiArIyBLZXJuZWwgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgNS4xNSBzZXJpZXMK
PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKPiAgIEJSMl9M
SU5VWF9LRVJORUw9eQo+ICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gLUJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuNS40Igo+ICtCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1Igo+ICAgQlIyX0xJTlVYX0tFUk5FTF9V
U0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15Cj4gICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JU
PXkKPiAgIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhbGx3aW5uZXIvc3VuNTBp
LWg2LWJlZWxpbmstZ3MxIgo+IEBAIC0yOSwxNCArMjksMTQgQEAgQlIyX1RBUkdFVF9ST09URlNf
RVhUMl9TSVpFPSIxMjBNIgo+ICAgIyBGaXJtd2FyZQo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRT15Cj4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9W
RVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0idjIuMiIKPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01f
VkVSU0lPTl9WQUxVRT0idjIuNSIKPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVf
UExBVEZPUk09InN1bjUwaV9oNiIKPiAgIAo+ICAgIyBCb290bG9hZGVyCj4gICBCUjJfVEFSR0VU
X1VCT09UPXkKPiAgIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+ICAg
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1ZFUlNJT05fVkFMVUU9IjIwMjAuMDEiCj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjIwMjEuMTAiCj4gICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJ
Rz0iYmVlbGlua19nczEiCj4gICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15Cj4gICBCUjJf
VEFSR0VUX1VCT09UX05FRURTX1BZVEhPTjM9eQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
