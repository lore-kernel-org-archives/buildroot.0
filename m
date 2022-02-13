Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F089C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 05:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92CE60706;
	Sun, 13 Feb 2022 05:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfCFYs_mMVAW; Sun, 13 Feb 2022 05:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 096B460640;
	Sun, 13 Feb 2022 05:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F05B1BF846
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 05:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0A114016F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 05:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjpCyP0uoXVa for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 05:14:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9874D40147
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 05:14:14 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bu29so19117555lfb.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 21:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2UPSNpPBF6pQy+t9mtEjpnpf7i7co0Mw4MOkbrNnF0I=;
 b=QSw6NSbKoTVX+DXuxy4z1COg+f1Ears23dz99S7Y0Z0tH0Czh+knRmOk8sGjEGuutw
 DBYPxiQJrH99Yx7Zi17u1TE18dzpfHm9KHIvtMYS0pjQ3pr/bHj88upHIVMCqJS1e6mr
 ZepgpADr9bJgThNZhqWuWzrkeNp1UnI1CgcLQZYiEvfNRkkeYBVIyAhuC/Vh9gO7oJ3Q
 keZBH0L0FDMtLIvWCeEDNdoxNkwpMIEWGwedB+lAPgKjnRgwThZh0fa6EKj38yk9ON7q
 2TAvFDQLCIgeoRbD7ntOxw0yZ27hqk+eiQKYQS2OKAPQSDeQ26pg/34MpJhmQr0jE+xm
 fOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2UPSNpPBF6pQy+t9mtEjpnpf7i7co0Mw4MOkbrNnF0I=;
 b=5uhXLf4PzCawPCXHciMX2EIq+0JuUVB5NPTbxKUaKmVbNZKmhtPaHPrcoyDyviPHkM
 3sV9h2mIV0qYfpBq9/uq4yCMT1KmTHohrnByKNJXG4Oind6+8yhvSfWBcuIEDk5wuI6A
 Y3XmYKJauJdsaBLo28qAE8EjSx9zuLuUS79br35zGTCrSpff1bJndXjWwtbJeCXY8CpT
 glOvez4jJNLFCYhHTZjzcO/nhh1Ud8ICjQCwEXSl0IzCJ+wrKfHAQ5xs4Z3Cdi6dCNcQ
 ruDcvZ1IfJ1F+30uUJMUe98anfy+SR12ezFvG/Po4HuUodYw/yr5CrmBrAJp/tHv2xB0
 naxA==
X-Gm-Message-State: AOAM5303Tt5rTK0lvQaGBFEtE24O0u4VJxQohkXo2Qt0J2DkTJcgV+Yy
 9P/RUeKnZZFHHZ7K73jJZTp/RhUxl9M=
X-Google-Smtp-Source: ABdhPJxGCRkF+O9InCvMgCjt0uD0ram//UywknIoPhBcnz1yUzGk3xYxrLm5h8RrTnpRyAk8DkRoTw==
X-Received: by 2002:a19:5504:: with SMTP id n4mr3319750lfe.200.1644729252271; 
 Sat, 12 Feb 2022 21:14:12 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.22])
 by smtp.gmail.com with ESMTPSA id o8sm3663886lft.135.2022.02.12.21.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 21:14:11 -0800 (PST)
Message-ID: <9441c983-821e-5f10-27f3-30d5705e365b@gmail.com>
Date: Sun, 13 Feb 2022 08:14:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220206074853.25887-1-kuzminov.sergey81@gmail.com>
 <fb84199d-9c72-d918-46ad-cd811ecbedc9@mind.be>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <fb84199d-9c72-d918-46ad-cd811ecbedc9@mind.be>
Subject: Re: [Buildroot] [PATCH v4] configs/orangepi_zero_defconfig: switch
 to extlinux
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

SGkgQXJub3V0LAoKMTMuMDIuMjAyMiAwMToxMSwgQXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4gCj4g
Cj4gT24gMDYvMDIvMjAyMiAwODo0OCwgU2VyZ2V5IEt1em1pbm92IHdyb3RlOgo+PiBDaGFuZ2Vz
Ogo+PiAqIEV4Y2x1ZGUgRkFUIHBhcnRpdGlvbiwgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBmb3Ig
VS1Cb290Lgo+PiAqIFN3aXRjaCB0aGUgcm9vdGZzIHBhcnRpdGlvbiBmcm9tIE1CUiB0byBHUFQg
Zm9yIHBhcnRpdGlvbi11dWlkIHRvIHdvcmsuCj4+ICogU3dpdGNoIHRvIGV4dGxpbnV4LCB0aGlz
IGlzIGNvbnZlbmllbnQgZm9yIGRlYnVnZ2luZy4KPj4gKiBDcmVhdGUgY29tbW9uIHNjZW5hcmlv
cyBmb3IgbXVsdGlwbGUgYm9hcmRzIHRvIGNyZWF0ZSBhbiBTRCBpbWFnZTogCj4+IGJvYXJkL29y
YW5nZXBpL2NvbW1vbi4KPj4gKiBBZGQgQlIyX1RBUkdFVF9HRU5FUklDX1JFTU9VTlRfUk9PVEZT
X1JXPXksIHJlbW91bnQgcm9vdCBmaWxlc3lzdGVtIAo+PiByZWFkLXdyaXRlIGR1cmluZyBib290
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS3V6bWlub3YgPGt1em1pbm92LnNlcmdleTgx
QGdtYWlsLmNvbT4KPj4gLS0tCj4+IFYxLT5WMjoKPj4gKiBpbXByb3ZlZCBjb21taXQgbG9nCj4+
ICogcmVtb3ZlZCBjb21tZW50ZWQgbGluZSBpbiBleHRsaW51eC5jb25mCj4+ICogcmVtb3ZlZCBv
bmUgYm9vdCBvcHRpb24gZnJvbSBleHRsaW51eC5jb25mCj4+Cj4+IFYyLT5WMzoKPj4gKiBpbXBy
b3ZlZCBjb21taXQgbG9nCj4+ICogcmVtb3ZlZCBjb21tZW50IGZyb20gYm9hcmQvb3JhbmdlcGkv
Y29tbW9uL2dlbmltYWdlLmNmZwo+Pgo+PiBWMy0+VjQ6Cj4+ICogZml4ZWQgU2lnbmVkLW9mZi1i
eSBwb3NpdGlvbgo+IAo+ICDCoEkgdGhpbmsgSSdtIGdvaW5nIHRvIHVzZSB0aGlzIGNvbW1pdCBt
ZXNzYWdlIGFzIGFuIGV4YW1wbGUgZm9yIHRoZSAKPiBkb2N1bWVudGF0aW9uLi4uIFdlbGwsIGlm
IEkgZXZlciBnZXQgYXJvdW5kIHRvIGl0IDotKQoKR2l1bGlvIEJlbmV0dGkgaGVscGVkIG1lLiBU
aGFua3MgR2l1bGlvLgoKPiBbc25pcF0KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvb3JhbmdlcGlf
emVyb19kZWZjb25maWcgCj4+IGIvY29uZmlncy9vcmFuZ2VwaV96ZXJvX2RlZmNvbmZpZwo+PiBp
bmRleCA1YWFhMTU2NmM1Li45NmYwYzNmNjAwIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL29yYW5n
ZXBpX3plcm9fZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvb3JhbmdlcGlfemVyb19kZWZjb25m
aWcKPj4gQEAgLTIwLDEwICsyMCwxMyBAQCBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkK
Pj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InN1bjhpLWgyLXBsdXMtb3Jh
bmdlcGktemVybyIKPj4gICAKPj4gQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklM
RVM9ImJvYXJkL29yYW5nZXBpL29yYW5nZXBpLXplcm8vbGludXgtZXh0cmFzLmZyYWdtZW50IiAK
Pj4KPj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+PiArQlIyX0xJ
TlVYX0tFUk5FTF9JTlNUQUxMX1RBUkdFVD15Cj4+IMKgICMgRmlsZXN5c3RlbQo+PiDCoCBCUjJf
VEFSR0VUX1JPT1RGU19FWFQyPXkKPj4gwqAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iNjNNIgo+IAo+ICDCoFdoeT8gSW5jcmVhc2Ug
ZnJvbSA2ME0gdG8gNjNNIHNlZW1zIGEgYml0IG9kZC4uLgo+IAo+ICDCoEkgcmVtb3ZlZCB0aGlz
LgoKSW5pdGlhbGx5LCA1MTIgTUIgd2FzIGluIHRoZSBnZW5pbWFnZS5jZmcgY29uZmlndXJhdGlv
bi4gQmVhdXRpZnVsbHkgCm9idGFpbmVkIDEgTUIgKHUtYm9vdCkgKyA2MyBNQiAocm9vdGZzKSA9
IDY0IE1CIChTRCBDYXJkIEltYWdlKSA6KQoKPj4gK0JSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5U
X1JPT1RGU19SVz15Cj4gCj4gIMKgV2UgZG9uJ3QgZG8gdGhpcyBmb3IgYW55IG90aGVyIGRlZmNv
bmZpZy4gSSByZW1vdmVkIHRoaXMuCj4gCj4gCj4gIMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KPiAKPiAgwqBSZWdhcmRzLAo+ICDCoEFybm91dAo+IAo+IAo+PiDCoCAjIEJSMl9UQVJHRVRf
Uk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4+IMKgICMgQm9vdGxvYWRlcgo+PiBAQCAtMzksMTYgKzQy
LDEyIEBAIEJSMl9UQVJHRVRfVUJPT1RfU1BMPXkKPj4gwqAgQlIyX1RBUkdFVF9VQk9PVF9TUExf
TkFNRT0idS1ib290LXN1bnhpLXdpdGgtc3BsLmJpbiIKPj4gwqAgIyBSZXF1aXJlZCB0b29scyB0
byBjcmVhdGUgdGhlIFNEIGltYWdlCj4+IC1CUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTPXkK
Pj4gLUJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfQk9PVF9TQ1JJUFQ9eQo+PiAtQlIyX1BB
Q0tBR0VfSE9TVF9VQk9PVF9UT09MU19CT09UX1NDUklQVF9TT1VSQ0U9ImJvYXJkL29yYW5nZXBp
L29yYW5nZXBpLXplcm8vYm9vdC5jbWQiIAo+Pgo+PiAtQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RP
T0xTPXkKPj4gwqAgQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4+IC1CUjJfUEFDS0FHRV9I
T1NUX01UT09MUz15Cj4+IMKgICMgSW1hZ2UKPj4gK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJ
UFQ9ImJvYXJkL29yYW5nZXBpL2NvbW1vbi9wb3N0LWJ1aWxkLnNoIgo+PiDCoCBCUjJfUk9PVEZT
X1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4+IC1CUjJf
Uk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIAo+PiBib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16
ZXJvL2dlbmltYWdlLmNmZyIKPj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgJChC
SU5BUklFU19ESVIpL2dlbmltYWdlLmNmZyIKPj4gwqAgIyBXaXJlbGVzcyBkcml2ZXIgYW5kIGZp
cm13YXJlCj4+IMKgIEJSMl9QQUNLQUdFX1hSODE5X1hSQURJTz15CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
