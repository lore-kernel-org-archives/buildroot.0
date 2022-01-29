Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B69C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 11:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADB2E400AF;
	Sat, 29 Jan 2022 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAWxnTRHPDnc; Sat, 29 Jan 2022 11:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C78F40192;
	Sat, 29 Jan 2022 11:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 859161BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7328760AE2
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sAymn_sKdt7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 11:13:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2095D60A91
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 11:13:07 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w25so14780115edt.7
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 03:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MpYrnjPOcUFJiUV75wnVwTtlOy5tzYszKLuamGCt/M4=;
 b=KPkTOzxS9auDvnd+bQbmcNfGjoramQPvagR7L7+VmTFHSL533u9ok+2prCF/7j4Frs
 HKhyuZxmpCiqA6CRHaf3+leVmfLfRumgu/LuD7UWvZkXtbconiHQvUWpxgDD0KlUop2f
 cvmoJ95gXUikVXclf+06CcuYpSzeTzV6B1ZFts4AwCzfjF2X4x1foIeiyq2ZMoGHlNKl
 vnxKztJU5PkEIJalQjvpD/vnbarU0U+0j6lJiL+yiAP7cVFyASXD+Ol+SPVQtKjM8Iik
 lN6vAE+pIMHevMG+Zt07YuKF9+f93TqDpP4XgoOZ3n5Fe7V5dZKMsIBOrFM2CAK3G/tr
 8TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MpYrnjPOcUFJiUV75wnVwTtlOy5tzYszKLuamGCt/M4=;
 b=Ir0OBqT3t/ptYq9KGAt4S/k1KtcI/xh8FRTgjIrb20hWs+6Dt6j48JeZrZ/Z9VaNJm
 X9B6r//zG0tS3Tjh1Z3KYUrEqnkG8COpsJ73FqyqYpwY7BTCQOdU8vsnbjHwpf7g86p9
 JFN5RltrEXgFsHYhYG3a5e6ISh+e76Dys8lvpSytgp7bbLtubODbkQbf1v8kivrepX7l
 0hygIR7z4TJVD7JtqhGf3pJj/LlQQE6Thj4ToGjBVm9A4GDcQA4LO4BtvAriDqOC6Arp
 PCnN9JFGqhGg99CWXym4NKmF9XkfIz74a/hf3rasyyT0lwhN9fyW7etom7lMAy4v/Py2
 Sgxw==
X-Gm-Message-State: AOAM530gdisM3an9OkZ1In3zKOtacBNex6fzT1Ika4CUdTMP2vOSTnmk
 xuI2fveGDzbxm7XBcL8kW5mD1dhRhmKxdgojLnkNVjgK
X-Google-Smtp-Source: ABdhPJwCao9cUvD64Rpn1gWMmgowt5NX/LNUOSsLhwU4c3EhShzWZ/EAEilI4t06fbukq+We9/oNlC4SIFGp0dvy13Y=
X-Received: by 2002:aa7:c906:: with SMTP id b6mr12361155edt.8.1643454784887;
 Sat, 29 Jan 2022 03:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20211106181424.299041-1-peron.clem@gmail.com>
 <20211106181424.299041-2-peron.clem@gmail.com>
 <b016d5c3-4180-d447-9ee6-d8e74d3fa351@benettiengineering.com>
In-Reply-To: <b016d5c3-4180-d447-9ee6-d8e74d3fa351@benettiengineering.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 29 Jan 2022 12:12:53 +0100
Message-ID: <CAJiuCcf7gvvLnF2=MFQG4=Jfhx6xxLBEXADkprwecwZQm4htgQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gTW9uLCAxNyBKYW4gMjAyMiBhdCAxOTo1NCwgR2l1bGlvIEJlbmV0dGkK
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gSGkgQ2zD
qW1lbnQsCj4KPiBPbiAwNi8xMS8yMSAxOToxNCwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+ID4g
bGliZmR0IGZhaWxzIHRvIGNvbXBpbGUgd2l0aCBvbiBDSS4KPiA+IC91c3IvYmluL2xkOiBzY3Jp
cHRzL2R0Yy9kdGMtcGFyc2VyLnRhYi5vOiguYnNzKzB4MTApOiBtdWx0aXBsZSBkZWZpbml0aW9u
IG9mIGB5eWxsb2MnOyBzY3JpcHRzL2R0Yy9kdGMtbGV4ZXIubGV4Lm86KC5ic3MrMHgwKTogZmly
c3QgZGVmaW5lZCBoZXJlCj4gPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBz
dGF0dXMKPiA+Cj4gPiBCdW1wIFUtYm9vdCBhbmQgYWxzbyBLZXJuZWwgYW5kIEFURi4KPgo+IHRo
ZSBjb21taXQgbG9nIGFuZCBzdWJqZWN0IGRvZXNuJ3QgZXhwbGFpbiB0aGF0IHRoZSB2ZXJzaW9u
IGJ1bXBpbmcoYXMgSQo+IHN1c3BlY3QpIGZpeCB0aGUgdWJvb3QgYnVpbGQgZmFpbHVyZShhcyBJ
IGNhbiBpbnRlcnByZXQpLiBDYW4geW91IHBsZWFzZQo+IGltcHJvdmUgY29tbWl0IGxvZyBieSBz
cGVjaWZ5aW5nIHRoYXQgd2hpbGUgYnVtcGluZyh1LWJvb3QgSSB0aGluaykgdGhhdAo+IGVycm9y
IGlzIGZpeGVkPwoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBJIHdpbGwgc2VuZCBhIFYyCgpSZWdh
cmRzLApDbGVtZW50Cgo+Cj4gQW5kIHBsZWFzZSBhZGQ6Cj4KPiBGaXhlczoKPiB0aGUgbGluayBv
ZiB0aGUgQ0kgZmFpbHVyZS4KPgo+IFRoYW5rIHlvdQo+IEJlc3QgcmVnYXJkcwo+IC0tCj4gR2l1
bGlvIEJlbmV0dGkKPiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIGNv
bmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnIHwgMTAgKysrKystLS0tLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYmVlbGlua19nczFf
ZGVmY29uZmlnCj4gPiBpbmRleCAxODcyYWFiZGYwLi5jYTk1M2RmM2VhIDEwMDY0NAo+ID4gLS0t
IGEvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcKPiA+ICsrKyBiL2NvbmZpZ3MvYmVlbGlu
a19nczFfZGVmY29uZmlnCj4gPiBAQCAtMTEsMTEgKzExLDExIEBAIEJSMl9ST09URlNfUE9TVF9C
VUlMRF9TQ1JJUFQ9ImJvYXJkL2JlZWxpbmsvZ3MxL3Bvc3QtYnVpbGQuc2giCj4gPiAgIEJSMl9S
T09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPiA+
ICAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9iZWVsaW5rL2dzMS9nZW5p
bWFnZS5jZmciCj4gPgo+ID4gLSMgS2VybmVsIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWws
IGEgNS41IHNlcmllcwo+ID4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01f
NV81PXkKPiA+ICsjIEtlcm5lbCBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCA1LjE1IHNl
cmllcwo+ID4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNT15Cj4g
PiAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ID4gICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OPXkKPiA+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjUuNCIK
PiA+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1Igo+ID4gICBC
UjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKPiA+ICAgQlIyX0xJTlVY
X0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gPiAgIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19O
QU1FPSJhbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxIgo+ID4gQEAgLTI5LDE0ICsyOSwx
NCBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCj4gPiAgICMgRmlybXdhcmUK
PiA+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4gPiAgIEJSMl9UQVJHRVRf
QVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT049eQo+ID4gLUJSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjIiCj4gPiArQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuNSIKPiA+
ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0ic3VuNTBpX2g2Igo+
ID4KPiA+ICAgIyBCb290bG9hZGVyCj4gPiAgIEJSMl9UQVJHRVRfVUJPT1Q9eQo+ID4gICBCUjJf
VEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiA+ICAgQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fVkVSU0lPTj15Cj4gPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iMjAyMC4wMSIKPiA+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSIyMDIxLjEwIgo+ID4gICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iYmVlbGlu
a19nczEiCj4gPiAgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPiA+ICAgQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19QWVRIT04zPXkKPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
