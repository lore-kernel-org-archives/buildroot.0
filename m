Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4765C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CF0416A5;
	Mon,  7 Mar 2022 22:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBy8CAu15XIh; Mon,  7 Mar 2022 22:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8B9410D1;
	Mon,  7 Mar 2022 22:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 510681BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C160404A9
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SN6ALaMA0WUC for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:05:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45A314049B
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:05:17 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o1so20868315edc.3
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oBkCUw2FPRhgTB4KTr9b4vqknRr17S5Vhk7zsxkB494=;
 b=A7a6KNndSGR6OSk4tRKRIbTsCk4/SaBTIrv7Jcd5wZX+9p27wvPL/DmKg+Q//QX+iT
 AFSXMAnLnb6jefbB7Co9LZSAYx2Wq6pK2VR5cCQV4jhGICdZltuETdHxlX+wWyGxbkR4
 X0stiVxn4/vQrknuD2qOVCnwTDDa7r+YWaRGX22hkVDMNIHEOaq5XmfvNIL/TQUkHXCV
 8DDL307w8vqG/yebCGBko3D1d5mlSoi9AxDLMZtmLz/KchDzpmHgbpy+36jzASXWL0HD
 xBxh+pJxl7al2wW+Sc1iwffGttgmiR3Leo0vM3v0UmLUbV8wMHF+jwa2R2vkE7+0SM9B
 g+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oBkCUw2FPRhgTB4KTr9b4vqknRr17S5Vhk7zsxkB494=;
 b=I+fUTihj9RV/nuu/+9Yz5gVadoybnvWVK0jfQs8G4O0Vdqc/L8mpqnFpiWrtJPuP2U
 kltDg9bopTJI001+WcUwoWCJWyndqkZhIgUVKmU9fmXWlzzbyYGZy3gdnflGnvb85/Sx
 Hkppb8jHzlPniss590SzuHdyTuBjB/TgY1o8fGywRcDtOKW80/zjrk/b5OGVwP5EXhqS
 PXr/CVPqRx02h/4MIp/ruKMrTSz+r1LOtU+Vi58Paiue3ITTBmAKd4MnVQwu13hF4PSn
 4KrGyk7978xdQ5mxxa3uVFZ8ffLwo1E6fO8vddZ1nXAZXnJ3cG0LwRxOlHYouiRoeLC3
 0/bA==
X-Gm-Message-State: AOAM531jh163YEdVNeYjnnEfU7525ljvXuAn90EuoWEw7qr/b9lSALhk
 UPrNJyP9cDmAfaAGakE4vc65lQ==
X-Google-Smtp-Source: ABdhPJzrCKJcFMSEV5OzTq3mjmnhRiNiCPVnF1Ydpij7RL9TAZjcOWQiv3Bn6DCNb5uUV7G8kxYJJQ==
X-Received: by 2002:a05:6402:5143:b0:416:1327:4f95 with SMTP id
 n3-20020a056402514300b0041613274f95mr12879510edd.56.1646690715588; 
 Mon, 07 Mar 2022 14:05:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u9-20020aa7db89000000b0041372781e69sm6646387edt.52.2022.03.07.14.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:05:15 -0800 (PST)
Message-ID: <4ab837ef-09f1-d7e7-49cb-bb6ac1f6107c@mind.be>
Date: Mon, 7 Mar 2022 23:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220221230640.2203877-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221230640.2203877-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-treq: fix dependencies
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIyLzAyLzIwMjIgMDA6MDYsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gcHl0aG9uLXRy
ZXEgbmVlZHMgVExTIHN1cHBvcnQgaW4gdHdpc3RlZCBzbyBzZWxlY3QKPiBCUjJfUEFDS0FHRV9Q
WVRIT05fVFdJU1RFRF9UTFMgbW9yZW92ZXIgaXQgZG9lc24ndCBkZXBlbmQgZGlyZWN0bHkgb24K
PiBzZXJ2aWNlX2lkZW50aXR5IGFuZCBweU9wZW5TU0wgc2luY2UgdmVyc2lvbiAxNy4zLjAgYW5k
Cj4gaHR0cHM6Ly9naXRodWIuY29tL3R3aXN0ZWQvdHJlcS9jb21taXQvZWYyYWM3ZWEyYjc0Nzc0
YWRiOWZlZjc2NzVmYWNjNjAxN2JmZGE4OQo+Cj4gRmluYWxseSwgcHl0aG9uLWlkbmEgd2FzIG5l
dmVyIGEgZGlyZWN0IGRlcGVuZGVuY3kgb2YgcHl0aG9uLXRyZXEKPgo+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKIMKgQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBh
Y2thZ2UvcHl0aG9uLXRyZXEvQ29uZmlnLmluIHwgNyArKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uLXRyZXEvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tdHJlcS9Db25maWcuaW4K
PiBpbmRleCBmNzgxYjM3MzA1Li43YzAyYTM1NjM4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0
aG9uLXRyZXEvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9weXRob24tdHJlcS9Db25maWcuaW4K
PiBAQCAtMSwxNiArMSwxMyBAQAo+ICAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9UUkVRCj4g
ICAJYm9vbCAicHl0aG9uLXRyZXEiCj4gLQkjIHB5dGhvbi1weW9wZW5zc2wgLT4gcHl0aG9uLWNy
eXB0b2dyYXBoeQo+ICsJIyB0d2lzdGVkIFRMUyAtPiBweXRob24te3B5b3BlbnNzbCxzZXJ2aWNl
LWlkZW50aXR5fQo+ICAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRf
QVJDSF9TVVBQT1JUUwo+IC0JIyBweXRob24taWRuYSwgcHl0aG9uLXB5b3BlbnNzbCAtPiBweXRo
b24tY3J5cHRvZ3JhcGh5Cj4gICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9BVFRSUyAjIHJ1
bnRpbWUKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fSUROQSAjIHJ1bnRpbWUKPiAgIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0lOQ1JFTUVOVEFMICMgcnVudGltZQo+IC0Jc2VsZWN0
IEJSMl9QQUNLQUdFX1BZVEhPTl9QWU9QRU5TU0wgIyBydW50aW1lCj4gICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX1BZVEhPTl9SRVFVRVNUUyAjIHJ1bnRpbWUKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fU0VSVklDRV9JREVOVElUWSAjIHJ1bnRpbWUKPiAgIAlzZWxlY3QgQlIyX1BBQ0tBR0Vf
UFlUSE9OX1NJWCAjIHJ1bnRpbWUKPiAgIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1RXSVNU
RUQgIyBydW50aW1lCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1RXSVNURURfVExTICMg
cnVudGltZQo+ICAgCWhlbHAKPiAgIAkgIHRyZXEgaXMgYW4gSFRUUCBsaWJyYXJ5IGluc3BpcmVk
IGJ5IHJlcXVlc3RzIGJ1dCB3cml0dGVuIG9uCj4gICAJICB0b3Agb2YgVHdpc3RlZCdzIEFnZW50
cy4gSXQgcHJvdmlkZXMgYSBzaW1wbGUsIGhpZ2hlciBsZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
