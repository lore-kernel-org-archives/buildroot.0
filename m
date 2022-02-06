Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC40C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 07:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA89860B83;
	Sun,  6 Feb 2022 07:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpCbS0x59krm; Sun,  6 Feb 2022 07:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 173B360B6A;
	Sun,  6 Feb 2022 07:35:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 137671BF3E8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01E0F60B6A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4UmuNr5ffcW for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 07:35:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA93B605A7
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 07:35:15 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u7so13509431lji.2
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 23:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3Yt4lc49fArofHIORNlg149DOssGg+7+e++5DDYCvxA=;
 b=knMkqTh7RO3GBg0ogZaq8FpJ/Usncg5nd6zHRMSMnVsiO0ypdoCGEFRNNUrtcKGK26
 gIeH9pImp6UYR92iwRLXaSB083A/u8le/g+hZLOt1FYJv8OrQwDU6L7t7EtncdvdhKG+
 CWqoaddwb0yvWjtrDsqfDy1kSYu3qhrs0jICquw4fTx4uz7Hmg/jMWTrDGopNpyuuZRQ
 2KdGo/5LvxNhTCqAod3U4goyIYFn2ToM/G+JXEcLXhpaXSApzXlBupE0QKz+Tg7vP+3D
 2XLlHU+rbiRlqGieL6CiwSZQae64bSNnjv8UpnbPqPQqBnI87UleAtGZ9SBmPV0XeC9i
 18gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Yt4lc49fArofHIORNlg149DOssGg+7+e++5DDYCvxA=;
 b=KqmqLHEGsDAbbqIKtYy8+DfIXF8t5afMGIgntXAj+1zTgI6a45AAekZw201ubdyO3L
 lMKo1pakRWY0tsIz6g6BZIHJ+Ga7Pc4rsXAiD1EJUtafYx+mRGT4elvgmYE/FUt91aq+
 Kl+IjH8UH8XwWweZRUelmXG/xSVXZUf1IezRcLnAq30CEaP6/WshfJxUGryWXJg4DGWH
 c2f6S8fLlJ4ao8rYm3RSKZrUaVpO78VnX/Ow8vQq8CiFZkBT+igFMFvywL9uGKZsFDmq
 neEi94EdfFsIy3UHzBfY5BZpLuiHAsxrIDtjGAPGb85sZ8uMEXO6m0illaLes2Gz4dCh
 oKhA==
X-Gm-Message-State: AOAM532cXbMd/7rozb9/dygCptaKqLV1eMUsn9VD7UQZpu1afe7bMLMq
 N7X8Fju3F5nZaf84wixo6hTLHaDS/4s=
X-Google-Smtp-Source: ABdhPJy+shQHN4qmviAOzx/L1tSZOVzLdBrzR23KwAJ5C4izXZZKFFzvFYMv4hxqwZLfn/pimGopug==
X-Received: by 2002:a2e:9d88:: with SMTP id c8mr5034445ljj.151.1644132913647; 
 Sat, 05 Feb 2022 23:35:13 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id f19sm1012332lfa.52.2022.02.05.23.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 23:35:13 -0800 (PST)
Message-ID: <0177b527-6098-91f9-2c78-e7f898c537f0@gmail.com>
Date: Sun, 6 Feb 2022 10:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <7d81f185-699c-9fc4-f392-07b332ce8184@gmail.com>
 <02663281-0879-462D-8A89-F922E86018A7@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <02663281-0879-462D-8A89-F922E86018A7@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v3] configs/orangepi_zero_defconfig: switch
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKMDYuMDIuMjAyMiAxMDoxMywgR2l1bGlvIEJlbmV0dGk6Cj4gSGkgU2VyZ2V5
LAo+IAo+PiBJbCBnaW9ybm8gNiBmZWIgMjAyMiwgYWxsZSBvcmUgMDA6NTAsIFNlcmdleSBLdXpt
aW5vdiA8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+Pgo+PiDvu78w
Ni4wMi4yMDIyIDAyOjM0LCBHaXVsaW8gQmVuZXR0aToKPj4+Pj4gSWwgZ2lvcm5vIDYgZmViIDIw
MjIsIGFsbGUgb3JlIDAwOjI5LCBTZXJnZXkgS3V6bWlub3Y8a3V6bWlub3Yuc2VyZ2V5ODFAZ21h
aWwuY29tPiAgaGEgc2NyaXR0bzoKPj4+Pgo+Pj4+IO+7v0NoYW5nZXM6Cj4+Pj4gKiBFeGNsdWRl
IEZBVCBwYXJ0aXRpb24sIGl0IGlzIG5vIGxvbmdlciBuZWVkZWQgZm9yIFUtQm9vdC4KPj4+PiAq
IFN3aXRjaCB0aGUgcm9vdGZzIHBhcnRpdGlvbiBmcm9tIE1CUiB0byBHUFQgZm9yIHBhcnRpdGlv
bi11dWlkIHRvIHdvcmsuCj4+Pj4gKiBTd2l0Y2ggdG8gZXh0bGludXgsIHRoaXMgaXMgY29udmVu
aWVudCBmb3IgZGVidWdnaW5nLgo+Pj4+ICogQ3JlYXRlIGNvbW1vbiBzY2VuYXJpb3MgZm9yIG11
bHRpcGxlIGJvYXJkcyB0byBjcmVhdGUgYW4gU0QgaW1hZ2U6IGJvYXJkL29yYW5nZXBpL2NvbW1v
bi4KPj4+PiAqIEFkZCBCUjJfVEFSR0VUX0dFTkVSSUNfUkVNT1VOVF9ST09URlNfUlc9eSwgcmVt
b3VudCByb290IGZpbGVzeXN0ZW0gcmVhZC13cml0ZSBkdXJpbmcgYm9vdC4KPiAKPiBNb3ZlIHlv
dXIgU2lnbmVkLW9mZi1ieSBoZXJlKGJlZm9yZSB0aGUgMyBkYXNoZXMpIGFuZCB0aGF04oCZcyBh
bGwuCj4gVGhpcyBpcyBiZWNhdXNlIGV2ZXJ5dGhpbmcgYmV0d2VlbiB0aGUgIHR3byBzZXRzIG9m
IDMgZGFzaGVzIHdvbuKAmXQgYmUgcGFydCBvZiB0aGUgY29tbWl0Lgo+IFNvIHdlIG5lZWQgeW91
ciBTb0IgaGVyZS4KPiAKPj4+IFlvdXIgU29CIGdvZXMgaGVyZSBhbG9uZyBteSBSZXZpZXdlZC1i
eSBhbmQgVGVzdGVkLWJ5KG9uZSBwZXIgbGluZSkgSeKAmXZlIGdpdmVuIHlvdSBvbiBWMS4KPj4+
PiAtLS0KPiBXaGlsZSBoZXJlIHVudGlsIG5leHQgMyBkYXNoZXMgd29u4oCZdCBiZSBwYXJ0IG9m
IHRoZSBjb21taXQgbG9nLCBidXQgd2UgbmVlZCBpdCBmb3IgTWFpbGluZyBsaXN0IHRvIHRyYWNr
IHRoZSBjaGFuZ2VzLgo+Pj4+IFYxLT5WMjoKPj4+PiAqIGltcHJvdmVkIGNvbW1pdCBsb2cKPj4+
PiAqIHJlbW92ZWQgY29tbWVudGVkIGxpbmUgaW4gZXh0bGludXguY29uZgo+Pj4+ICogcmVtb3Zl
ZCBvbmUgYm9vdCBvcHRpb24gZnJvbSBleHRsaW51eC5jb25mCj4+Pj4KPj4+PiBWMi0+VjM6Cj4+
Pj4gKiBpbXByb3ZlZCBjb21taXQgbG9nCj4+Pj4gKiByZW1vdmVkIGNvbW1lbnQgZnJvbSBib2Fy
ZC9vcmFuZ2VwaS9jb21tb24vZ2VuaW1hZ2UuY2ZnCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBT
ZXJnZXkgS3V6bWlub3Y8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPgo+IAo+IFNvIGlmIHlv
dSBrZWVwIHlvdXIgU29CIGhlcmUgXl5eIHdvbuKAmXQgYmUgcGFydCBvZiB0aGUgY29tbWl0IGFu
ZCB0aGF04oCZcyBub3Qgd2hhdCB3ZSB3YW50Lgo+IAo+Pj4gQW5kIGhlcmUgeW91IHJlbW92ZSB5
b3VyIFNvQiBeXl4KPj4+IFBsZWFzZSBzZW5kIGEgVjQgcG9pbnRpbmcgeW914oCZdmUgZml4ZWQg
eW91ciBTaWduZWQtb2ZmLWJ5IHBvc2l0aW9uIGFuZCB3ZeKAmXJlIGRvbmU6LSkKPj4KPj4gSSBk
b24ndCB1bmRlcnN0YW5kIGhvdyB0byBkbyB3aGF0IHlvdSBhcmUgYXNraW5nLgo+IAo+IEFsbCBj
bGVhciBub3c/Cj4gCj4gS2luZCByZWdhcmRzCj4gR2l1bGlvCj4gCj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpOb3cgSSB1bmRlcnN0YW5kLiBUaGFu
ayB5b3UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
