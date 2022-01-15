Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD37C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 19:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53DD340502;
	Sat, 15 Jan 2022 19:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08YrmEEnHt_2; Sat, 15 Jan 2022 19:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CCEB4012B;
	Sat, 15 Jan 2022 19:28:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB9CB1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18964012B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUbcna48yC2M for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 19:28:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7233F400A6
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 19:28:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so14389013wmk.1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jZr1+r7xVNohNQhUnMEEW1v8++clS/QRq6t0DM4Mi7E=;
 b=l0K+3CcOL7j/hXWkvKenNvZuCYzlPodztLVhSVy8gMlk11+Qt1dHc6mpRmfV6OvYb0
 cSPOxscdECjVqTFPJXaOLnWSAqZ7WtNV2MhkTb2wyR1QfBY8za9i5E4pAtR59c1xF7Xe
 r8XCPeOQPmjRTwUXAZg5w9oLL4T+LVznSw8VNfCHW/c+GWdzzobcZjr6h6yiyXRT9G8D
 zIL30X3+cME22X9U8B/fg+8iPBorCmU3QuLEM+T27zBsa8SyUgPQSxunuFAYN2Fj7tC0
 VgzMzS4F2s86J74VR0ZObIJVzrdxxCtPn+HXyOZ1H4UEgoYVvpQRfARkD/7ynXonssJX
 aL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jZr1+r7xVNohNQhUnMEEW1v8++clS/QRq6t0DM4Mi7E=;
 b=BE5zElNk5FK/TrytH7s7ZM815O4KNmB+4KWmQ1n6990J+k0g4gpA4jQtjTJutsJe7B
 hHid4+6czGr76li3A8ZQumU62VqfDFbsKedtxIZ8HeePdBAo7wg4BGT7pKwTgFprxwuO
 ypuIG90jXzXtKKnJsU7rLlAsRhtf7kg+fLXPLIsMjMOs8QMP997uhFA2j6+EGQNN4PMe
 9H41Es/G7ozU/mIy9+EMkXXYNPyLKVMsEVhID+oK8IeVOqY4nYRI5ukLezIC7rcagEF6
 3Ne4TPDlIxy8i29H+WB+bFTgKqcnktdaowYhfLa97KZfjfIMMLqEKY73tLQRfufoznlH
 W5OA==
X-Gm-Message-State: AOAM532PuKESiNreHeQc2AUBhjivHKlBMevD0cnOmTImkxQhNuhm1bPY
 75dGdo+hgrrY3tfB69f/6+asxzWUdCI=
X-Google-Smtp-Source: ABdhPJxNAmweq4Khsb7gUcjjaQ3/N+JvNbdGtsprXBpgNaMyfF4lA/aEkcJTwnwgdOJQC+en8t3cZA==
X-Received: by 2002:a5d:644a:: with SMTP id d10mr13734286wrw.355.1642274933724; 
 Sat, 15 Jan 2022 11:28:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id m1sm13815088wrp.81.2022.01.15.11.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 11:28:53 -0800 (PST)
Message-ID: <737f135e-b936-a21c-8775-349d7db7fb88@gmail.com>
Date: Sat, 15 Jan 2022 20:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220115143344.12319-1-romain.naour@gmail.com>
 <20220115143344.12319-2-romain.naour@gmail.com>
 <20220115160517.GQ1945846@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220115160517.GQ1945846@scaer>
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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

SGVsbG8gWWFubiwKCkxlIDE1LzAxLzIwMjIgw6AgMTc6MDUsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIyLTAxLTE1IDE1OjMzICswMTAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBBcyBmb3IgdGhlIEJ1aWxkcm9vdCB0ZXN0c3VpdGUs
IG11bHRpcGx5IGV2ZXJ5IGVtdWxhdG9yIHRpbWVvdXQgYnkgMTAKPj4gdG8gYXZvaWQgc3BvcmFk
aWMgZmFpbHVyZXMgaW4gZWxhc3RpYyBydW5uZXJzLgo+Pgo+PiBxZW11X2FybV92ZXhwcmVzc190
el9kZWZjb25maWcgdGVzdGVkIGxvY2FsbHkgd2l0aCBzdWNlc3MuCj4+Cj4+IEZpeGVzOgo+PiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE5NzAwODQw
NDYKPiAKPiBBcmUgeW91IHN1cmUgaW5jcmVhc2luZyB0aGUgdGltZW91dCB3aWxsIGZpeCB0aGlz
IGZhaWx1cmU/IFRoZQo+IGJ1aWxkLXJ1bi5sb2cgY29udGFpbnMgYW5vdGhlciBlcnJvcjoKPiAK
PiAgICAgbG9hZGVkIGZpbGUgekltYWdlIGZyb20gNDA0MDAwMDAgdG8gNDA4Q0FBQkYsIDAwNENB
QUMwIGJ5dGVzCj4gICAgIGxvYWRlZCBmaWxlIHJvb3Rmcy5jcGlvLnVib290IGZyb20gNDQwMDAw
MDAgdG8gNDQzOEZBNEUsIDAwMzhGQTRGIGJ5dGVzCj4gICAgIEtlcm5lbCBpbWFnZSBAIDB4NDA0
MDAwMDAgWyAweDAwMDAwMCAtIDB4NGNhYWMwIF0KPiAgICAgIyMgTG9hZGluZyBpbml0IFJhbWRp
c2sgZnJvbSBMZWdhY3kgSW1hZ2UgYXQgNDQwMDAwMDAgLi4uCj4gICAgICAgIEltYWdlIE5hbWU6
ICAgCj4gICAgICAgIENyZWF0ZWQ6ICAgICAgMjAyMi0wMS0xMyAgMTY6MDY6NTMgVVRDCj4gICAg
ICAgIEltYWdlIFR5cGU6ICAgQVJNIExpbnV4IFJBTURpc2sgSW1hZ2UgKHVuY29tcHJlc3NlZCkK
PiAgICAgICAgRGF0YSBTaXplOiAgICAzNzM0MDMxIEJ5dGVzID0gMy42IE1pQgo+ICAgICAgICBM
b2FkIEFkZHJlc3M6IDAwMDAwMDAwCj4gICAgICAgIEVudHJ5IFBvaW50OiAgMDAwMDAwMDAKPiAg
ICAgICAgVmVyaWZ5aW5nIENoZWNrc3VtIC4uLiBPSwo+ICAgICAjIyBGbGF0dGVuZWQgRGV2aWNl
IFRyZWUgYmxvYiBhdCA0MDAwMDAwMAo+ICAgICAgICBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxv
YiBhdCAweDQwMDAwMDAwCj4gICAgIEVSUk9SOiByZXNlcnZpbmcgZmR0IG1lbW9yeSByZWdpb24g
ZmFpbGVkIChhZGRyPTdmZTAwMDAwIHNpemU9MjAwMDAwKQo+ICAgICAgICBVc2luZyBEZXZpY2Ug
VHJlZSBpbiBwbGFjZSBhdCA0MDAwMDAwMCwgZW5kIDQwMDA1MWY3Cj4gCj4gU28sIHRvIG1lLCB0
aGlzIGlzIG5vdCBhIHRpbWVvdXQgaXNzdWUsIGJ1dCBhbiBhY3R1YWwgYm9vdCBpc3N1ZS4KClRo
ZSBzeXN0ZW0gc3RvcCBpbiB0aGUgbWlkZGxlIG9mIG9wdGVlIHN0YXJ0dXAKCm9wdGVlOiBkeW5h
bWljIHNoYXJlZCBtZW1vcnkgaXMgZW5hYmxlZAoKQWxzbywgSSBnb3QgdGhlIHNhbWUgZXJyb3Ig
bWVzc2FnZSB3aGlsZSB0ZXN0aW5nIGxvY2FsbHkuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgc3VwcG9ydC9zY3JpcHRz
L2Jvb3QtcWVtdS1pbWFnZS5weSB8IDggKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Nj
cmlwdHMvYm9vdC1xZW11LWltYWdlLnB5IGIvc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFn
ZS5weQo+PiBpbmRleCBmYmExNTMzYmI3Li5iYTUwZWE2OWVlIDEwMDc1NQo+PiAtLS0gYS9zdXBw
b3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdlLnB5Cj4+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9i
b290LXFlbXUtaW1hZ2UucHkKPj4gQEAgLTI1LDcgKzI1LDcgQEAgZGVmIG1haW4oKToKPj4gICAg
ICBxZW11X3N0YXJ0ID0gb3MucGF0aC5qb2luKG9zLmdldGN3ZCgpLCAnb3V0cHV0L2ltYWdlcy9z
dGFydC1xZW11LnNoJykKPj4gIAo+PiAgICAgIGNoaWxkID0gcGV4cGVjdC5zcGF3bihxZW11X3N0
YXJ0LCBbJ3NlcmlhbC1vbmx5J10sCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWVv
dXQ9NSwgZW5jb2Rpbmc9J3V0Zi04JywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdGlt
ZW91dD01MCwgZW5jb2Rpbmc9J3V0Zi04JywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW52PXsiUUVNVV9BVURJT19EUlYiOiAibm9uZSJ9KQo+PiAgCj4+ICAgICAgIyBXZSB3YW50IG9u
bHkgc3Rkb3V0IGludG8gdGhlIGxvZyB0byBhdm9pZCBkb3VibGUgZWNobwo+PiBAQCAtMzYsNyAr
MzYsNyBAQCBkZWYgbWFpbigpOgo+PiAgICAgIHRpbWUuc2xlZXAoMSkKPj4gIAo+PiAgICAgIHRy
eToKPj4gLSAgICAgICAgY2hpbGQuZXhwZWN0KFsiYnVpbGRyb290IGxvZ2luOiJdLCB0aW1lb3V0
PTYwKQo+PiArICAgICAgICBjaGlsZC5leHBlY3QoWyJidWlsZHJvb3QgbG9naW46Il0sIHRpbWVv
dXQ9NjAwKQo+PiAgICAgIGV4Y2VwdCBwZXhwZWN0LkVPRiBhcyBlOgo+PiAgICAgICAgICAjIFNv
bWUgZW11bGF0aW9ucyByZXF1aXJlIGEgZm9yayBvZiBxZW11LXN5c3RlbSwgd2hpY2ggbWF5IGJl
Cj4+ICAgICAgICAgICMgbWlzc2luZyBvbiB0aGUgc3lzdGVtLCBhbmQgaXMgbm90IHByb3ZpZGVk
IGJ5IEJ1aWxkcm9vdC4KPj4gQEAgLTU4LDcgKzU4LDcgQEAgZGVmIG1haW4oKToKPj4gICAgICBj
aGlsZC5zZW5kbGluZSgicm9vdFxyIikKPj4gIAo+PiAgICAgIHRyeToKPj4gLSAgICAgICAgY2hp
bGQuZXhwZWN0KFsiIyAiXSwgdGltZW91dD02MCkKPj4gKyAgICAgICAgY2hpbGQuZXhwZWN0KFsi
IyAiXSwgdGltZW91dD02MDApCj4+ICAgICAgZXhjZXB0IHBleHBlY3QuRU9GOgo+PiAgICAgICAg
ICBwcmludCgiQ2Fubm90IGNvbm5lY3QgdG8gc2hlbGwiKQo+PiAgICAgICAgICBzeXMuZXhpdCgx
KQo+PiBAQCAtNjksNyArNjksNyBAQCBkZWYgbWFpbigpOgo+PiAgICAgIGNoaWxkLnNlbmRsaW5l
KCJwb3dlcm9mZlxyIikKPj4gIAo+PiAgICAgIHRyeToKPj4gLSAgICAgICAgY2hpbGQuZXhwZWN0
KFsiU3lzdGVtIGhhbHRlZCJdLCB0aW1lb3V0PTYwKQo+PiArICAgICAgICBjaGlsZC5leHBlY3Qo
WyJTeXN0ZW0gaGFsdGVkIl0sIHRpbWVvdXQ9NjAwKQo+PiAgICAgICAgICBjaGlsZC5leHBlY3Qo
cGV4cGVjdC5FT0YpCj4+ICAgICAgZXhjZXB0IHBleHBlY3QuRU9GOgo+PiAgICAgICAgICBwYXNz
Cj4+IC0tIAo+PiAyLjMxLjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
