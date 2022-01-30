Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2234CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 09:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E1360B4F;
	Sun, 30 Jan 2022 09:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbgCjyDauzQg; Sun, 30 Jan 2022 09:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE35C60B37;
	Sun, 30 Jan 2022 09:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2FC31BF2BF
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 09:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A765160B37
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 09:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqFIcukajGbr for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 09:58:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5FE160640
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 09:58:32 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id y4so10216347uad.1
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 01:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jevqrzWyXIXayytoacrej2415vN0jm4LXJS7ZHrms8I=;
 b=kNOjJKmpz/JdJkdJ7qZynNxMMwhIsAvUYR9tf5bl3d9WsqYFwV8QdmoLLbzz8EQbqt
 px+Qou9ixzz/YrXXnIwcbzwyUP6HDgh/u+kXhnqS0HfqTn4KiFOG4iXO5ubX/urBdDRj
 D9F7/lBoCBDcM8A1rQHiccSN+8Xkg2FlEi3DcvzcSzFuiqPS6bJAQDVvGchTcuZd5h2z
 1eoAkM0XRSfjVPqTdwRuOqDFoAUeOBhXY8kCHRRxW1ChIzjgNqKTM6D6QJizPXs3IKR7
 4lVY/CVBE+b7a5N3gz5nc8YWBjjMb/XkgVoVyBZIz3bzVLFnGqi7qlU6R1YDJcb5kIm8
 nvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jevqrzWyXIXayytoacrej2415vN0jm4LXJS7ZHrms8I=;
 b=r4+/dy+bha9VWc6KpLtcf/itKuWKlfTY4ONC0S86H7XTfO47rnGJA8Zev1xyKr5RKd
 4Fw83y1AAiEetDpAA3wYKVhbB10CBCNtKVhYbkzPyjUTLr2thD1F38ORY2PBgcNOd9gb
 5gw0Z/XI3RfYSd7nNvYty+NE9tmaBEMgJMSygAs0WIFT6dzHTFBVsODT2eUjXYDqmf15
 EGlr0zoglX3dAaPeQeBiMlT79pgzPdfB4clrPDff07+f2xAmS745sZTWE8HevOinT2IR
 YFNt92lKDZEogHi58sIxvJmE4kB/0FDu5VCrx2SO7G/s3xQwV9QeA32zbU3t1E9R4dfq
 4BdQ==
X-Gm-Message-State: AOAM531ze0zksjQZscPW0Qar2CBGcN5tUX131nzQJwNiWMFy58HBrA7j
 sIQxZM/u1chjkhBPJgDqAmEFfv7GoCqI+hmFkYLbsCt9
X-Google-Smtp-Source: ABdhPJybLNKukAMCj9u6B5FtkpLXIREQrCCDZmkY7tKPZfblGDIe3kbsZ0CZPhAC3edAEggjHr3sRuV6WNAttgsI/28=
X-Received: by 2002:ab0:278d:: with SMTP id t13mr6364058uap.69.1643536711610; 
 Sun, 30 Jan 2022 01:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20220115202617.370414-1-gilles.talis@gmail.com>
 <20220126215730.30425623@windsurf>
In-Reply-To: <20220126215730.30425623@windsurf>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 30 Jan 2022 10:58:20 +0100
Message-ID: <CAKcgs2ypYJD1-HefGER8bWBnhzHBOjSnq7LoXw68u3UEUHQCsw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2] configs/friendlyarm_nanopi_r2s: new
 defconfig
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKdGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKTGUgbWVyLiAyNiBqYW52LiAyMDIy
IMOgIDIxOjU3LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBHaWxsZXMsCj4KPiBPbiBTYXQsIDE1IEphbiAyMDIyIDIx
OjI2OjE3ICswMTAwCj4gR2lsbGVzIFRhbGlzIDxnaWxsZXMudGFsaXNAZ21haWwuY29tPiB3cm90
ZToKPgo+ID4gK0JSMl9hYXJjaDY0PXkKPiA+ICtCUjJfQVJNX0ZQVV9WRlBWND15Cj4gPiArQlIy
X1RBUkdFVF9HRU5FUklDX0hPU1ROQU1FPSJyazMzMjgtbmFub3BpLXIycyIKPiA+ICtCUjJfVEFS
R0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gTmFub3BpIFIyUyBSSzMzMjgiCj4gPiArQlIy
X1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvZnJpZW5kbHlhcm0vbmFub3BpLXIycy9w
b3N0LWJ1aWxkLnNoIgo+ID4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQv
c2NyaXB0cy9nZW5pbWFnZS5zaCIKPiA+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1j
IGJvYXJkL2ZyaWVuZGx5YXJtL25hbm9waS1yMnMvZ2VuaW1hZ2UuY2ZnIgo+ID4gK0JSMl9MSU5V
WF9LRVJORUw9eQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9
eQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+ID4gK0JSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19OQU1FPSJyb2NrY2hpcC9yazMzMjgtbmFub3BpLXIycyIKPiA+ICtCUjJf
TElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPiA+ICtCUjJfTElOVVhfS0VSTkVMX05FRURT
X0hPU1RfT1BFTlNTTD15Cj4gPiArQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gPiArQlIyX1RB
UkdFVF9ST09URlNfRVhUMl80PXkKPiA+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEy
ME0iCj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4gPiArQlIyX1RBUkdF
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0icmszMzI4Igo+ID4gK0JSMl9UQVJHRVRf
QVJNX1RSVVNURURfRklSTVdBUkVfSU1BR0VTPSIiCj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9ORUVEU19BUk0zMl9UT09MQ0hBSU49eQo+ID4gK0JSMl9UQVJHRVRfVUJPT1Q9
eQo+ID4gK0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJuYW5vcGktcjJzLXJrMzMy
OCIKPiA+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15Cj4gPiArQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19QWVRIT04zPXkKPiA+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9CTDMxPXkK
PiA+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9CTDMxX0VMRj15Cj4gPiArQlIyX1RBUkdF
VF9VQk9PVF9GT1JNQVRfQ1VTVE9NPXkKPiA+ICtCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNU
T01fTkFNRT0idS1ib290Lml0YiIKPiA+ICtCUjJfVEFSR0VUX1VCT09UX1NQTD15Cj4gPiArQlIy
X1RBUkdFVF9VQk9PVF9TUExfTkFNRT0iaWRibG9hZGVyLmltZyIKPiA+ICtCUjJfUEFDS0FHRV9I
T1NUX0RPU0ZTVE9PTFM9eQo+ID4gK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+ID4gK0JS
Ml9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKPiA+ICtCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xT
PXkKPgo+IFRoYW5rcyBmb3IgdGhpcyB2Mi4gVW5mb3J0dW5hdGVseSwgdGhlcmUgaXMgb25lIHRo
aW5nIEkgZGlkIG5vdCBub3RpY2UKPiB3aGVuIHJldmlld2luZyB2MTogeW91IHNob3VsZCB1c2Ug
Zml4ZWQgdmVyc2lvbnMgb2YgdGhlIExpbnV4IGtlcm5lbCwKPiBVLUJvb3QgYW5kIFRGLUEuIEhl
cmUgeW91ciBkZWZjb25maWcgdXNlcyB3aGF0ZXZlciBpcyB0aGUgbGF0ZXN0LCB3aGljaAo+IGlz
IG5vdCB0aGUgcG9saWN5IHdlIGhhdmUgY2hvc2VuIGZvciBvdXIgZGVmY29uZmlncy4KPgo+IENv
dWxkIHlvdSBmaXggdGhhdCB1cCBieSB1c2luZyBmaXhlZCB2ZXJzaW9ucz8KWWVzLiBXaWxsIHNl
bmQgYSB2MyBzaG9ydGx5LgoKPgo+IFRoYW5rcyBhIGxvdCEKPgo+IFRob21hcwo+IC0tCj4gVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNv
bQpUaGFua3MhCkdpbGxlcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
