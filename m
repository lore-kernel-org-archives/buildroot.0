Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05909C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F5A60FF4;
	Mon,  4 Apr 2022 17:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLMh5a2VpOLX; Mon,  4 Apr 2022 17:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B295960FE2;
	Mon,  4 Apr 2022 17:40:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 012681BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E54B9825E6
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_zlqokvglbL for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:39:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC2EE825D3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:39:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id f18so6955478edc.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1pTVVy8CcDXgB8CyQcgqf8mZdep4BxgEZDVKrmbbTGM=;
 b=IkZsz8+XYQBFipqkBOHGBb5irlFtrbSestFdjFpizzS1TV4/u3eTzdA7Oq+fTVeVP9
 dvmWUE/91RMTHrl73B5pP8HhnjMxIfOV2DCzElradeXj+hHVjwHIOUTPqth2mTRUMoz4
 Bh8D9BRSyvQDT0JBgMoCzaVbqkz35v+vvFeG7sw1Wo4NHcGaAfysu+qm0BKxqA+J5kOW
 0ygAia0j6Kh3lrgUSTkrMQJFFg7DgrMSuCco7eUJJBVEEEDJhWXgjxdwvdwsdtWUG4hu
 T3D0Jhq9PD+GR9GtNi6CaJfH1CxgcuXl6KPhjvhXrOk0uFSFD9lL+QD8wxm30PtAbI+V
 z8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1pTVVy8CcDXgB8CyQcgqf8mZdep4BxgEZDVKrmbbTGM=;
 b=uR4C7LV0LDXoWKvHMiYXuBhvuimhtqQprPSfgGL8luyHD6YpWetRJWO5inzcM9KXGM
 +79FF9b+gkhwU5CwccKF7IFeHbjMYyFxOcstaKnUvVH1qn9qfawtneACAUHm0epaUBn1
 MzEzHpkcfNyol3DTHgn7O+oLZhLWGgTvmhySOnwPx2KxpOaaF2RzOBt5wjUl02S8e7jX
 vc5UwHw5PvE8l6Z0bJ0L/Cyx9TR0Vr2PsHoD/oyngPj6Jmf/fzct5oVenam7ywawAvJL
 4Dtow7Dw9pYD0du5jop8hIgYFWtPhxya6jKYSprTTE+4UFnGsdH0KLXCZJbUMXbQ1cC6
 TKoQ==
X-Gm-Message-State: AOAM530kZHqij+vVZ44gjSHUhY++nfeZcL9XrfC/JMuEJMc06aprrWYH
 DRiCsM4kBTgzLWA4Pky/RLilr1CFmMnHAQ==
X-Google-Smtp-Source: ABdhPJzux9qxMFQgmg3PHhUSylhU+nvm9xJ5hxLK3uu6KpbdvzZJ8UuQWH2rElobxaajGQtEPDwGjg==
X-Received: by 2002:a05:6402:168a:b0:3fb:600e:4cc3 with SMTP id
 a10-20020a056402168a00b003fb600e4cc3mr1373045edv.32.1649093997157; 
 Mon, 04 Apr 2022 10:39:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a170906340e00b006ce98f2581asm4606302ejb.205.2022.04.04.10.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:39:55 -0700 (PDT)
Message-ID: <ae682126-1025-12e8-d73f-b08d79f35ce2@mind.be>
Date: Mon, 4 Apr 2022 19:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220331201231.26526-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220331201231.26526-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v2] package/libcamera-apps: fix X11 preview
 compile (conversion from Window to EGLNativeWindowType)
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

CgpPbiAzMS8wMy8yMDIyIDIyOjEyLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiAtIGFkZCAwMDIt
cHJldmlldy1maXgtZWdsX3ByZXZpZXctY29tcGlsZS1jb252ZXJzaW9uLWZyb20tV2luZC5wYXRj
aAo+IAo+IEZpeGVzOgo+IAo+ICAgIC4uLi9idWlsZC9saWJjYW1lcmEtYXBwcy0yZDEwMDllM2Jh
ZGNjODA0NzM2MWZmODExNDlhZDZjYmEzYjkxMWI1L3ByZXZpZXcvZWdsX3ByZXZpZXcuY3BwOjMy
OTo2OTogZXJyb3I6IGludmFsaWQgY29udmVyc2lvbiBmcm9tIOKAmFdpbmRvd+KAmSB7YWthIOKA
mGxvbmcgdW5zaWduZWQgaW504oCZfSB0byDigJhFR0xOYXRpdmVXaW5kb3dUeXBl4oCZIHtha2Eg
4oCYZmJkZXZfd2luZG93KuKAmX0gWy1mcGVybWlzc2l2ZV0KPiAgICAgIDMyOSB8ICAgICAgICAg
ZWdsX3N1cmZhY2VfID0gZWdsQ3JlYXRlV2luZG93U3VyZmFjZShlZ2xfZGlzcGxheV8sIGNvbmZp
Zywgd2luZG93XywgTlVMTCk7Cj4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KPiAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfAo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXaW5kb3cge2FrYSBs
b25nIHVuc2lnbmVkIGludH0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMu
cmVwb3J0QGdteC5uZXQ+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgICAtIGFkZCBwYXRj
aCB3aXRoIHByb3BlciB0eXBlIGNhc3QgaW5zdGVhZCBvZiAnLWZwZXJtaXNzaXZlJyBjb21waWxl
cgo+ICAgICAgY29tbWFuZCBsaW5lIG9wdGlvbiAoc3VnZ2VzdGVkIGJ5IEFybm91dCBWYW5kZWNh
cHBlbGxlKQoKICBUaGFua3MgZm9yIHRoZSB3b3JrIQoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIC4uLnByZXZpZXctY29tcGlsZS1j
b252ZXJzaW9uLWZyb20tV2luZC5wYXRjaCB8IDM5ICsrKysrKysrKysrKysrKysrKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9saWJjYW1lcmEtYXBwcy8wMDAyLXByZXZpZXctZml4LWVnbF9wcmV2aWV3LWNvbXBpbGUt
Y29udmVyc2lvbi1mcm9tLVdpbmQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJj
YW1lcmEtYXBwcy8wMDAyLXByZXZpZXctZml4LWVnbF9wcmV2aWV3LWNvbXBpbGUtY29udmVyc2lv
bi1mcm9tLVdpbmQucGF0Y2ggYi9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzLzAwMDItcHJldmlldy1m
aXgtZWdsX3ByZXZpZXctY29tcGlsZS1jb252ZXJzaW9uLWZyb20tV2luZC5wYXRjaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uY2M5MDY5YWE4Ngo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzLzAwMDItcHJldmlldy1maXgtZWds
X3ByZXZpZXctY29tcGlsZS1jb252ZXJzaW9uLWZyb20tV2luZC5wYXRjaAo+IEBAIC0wLDAgKzEs
MzkgQEAKPiArRnJvbSA2MDcxNTc2OWNkNTM2OGE2M2IyYmRjMmU2ZDZiYjZkZjAwMzBhNTRkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0
QGdteC5uZXQ+Cj4gK0RhdGU6IFRodSwgMzEgTWFyIDIwMjIgMjE6NDQ6MjIgKzAyMDAKPiArU3Vi
amVjdDogW1BBVENIXSBwcmV2aWV3OiBmaXggZWdsX3ByZXZpZXcgY29tcGlsZSAoY29udmVyc2lv
biBmcm9tIFdpbmRvdyB0bwo+ICsgRUdMTmF0aXZlV2luZG93VHlwZSkKPiArTUlNRS1WZXJzaW9u
OiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRl
bnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK0ZpeGVzOgo+ICsKPiArICAuLi4vYnVp
bGQvbGliY2FtZXJhLWFwcHMtMmQxMDA5ZTNiYWRjYzgwNDczNjFmZjgxMTQ5YWQ2Y2JhM2I5MTFi
NS9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcDozMjk6Njk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNp
b24gZnJvbSDigJhXaW5kb3figJkge2FrYSDigJhsb25nIHVuc2lnbmVkIGludOKAmX0gdG8g4oCY
RUdMTmF0aXZlV2luZG93VHlwZeKAmSB7YWthIOKAmGZiZGV2X3dpbmRvdyrigJl9IFstZnBlcm1p
c3NpdmVdCj4gKyAgICAzMjkgfCAgICAgICAgIGVnbF9zdXJmYWNlXyA9IGVnbENyZWF0ZVdpbmRv
d1N1cmZhY2UoZWdsX2Rpc3BsYXlfLCBjb25maWcsIHdpbmRvd18sIE5VTEwpOwo+ICsgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+Cj4gKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiArICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgV2luZG93IHtha2EgbG9uZyB1bnNpZ25lZCBpbnR9Cj4gKwo+ICtbVXBz
dHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saWJjYW1lcmEtYXBwcy9wdWxs
LzI4M10KPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0
Pgo+ICstLS0KPiArIHByZXZpZXcvZWdsX3ByZXZpZXcuY3BwIHwgMiArLQo+ICsgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEv
cHJldmlldy9lZ2xfcHJldmlldy5jcHAgYi9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcAo+ICtpbmRl
eCBiOTM2ZTU3Li41OTM1ODNkIDEwMDY0NAo+ICstLS0gYS9wcmV2aWV3L2VnbF9wcmV2aWV3LmNw
cAo+ICsrKysgYi9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcAo+ICtAQCAtMzI2LDcgKzMyNiw3IEBA
IHZvaWQgRWdsUHJldmlldzo6bWFrZVdpbmRvdyhjaGFyIGNvbnN0ICpuYW1lKQo+ICsgCXdtX2Rl
bGV0ZV93aW5kb3dfID0gWEludGVybkF0b20oZGlzcGxheV8sICJXTV9ERUxFVEVfV0lORE9XIiwg
RmFsc2UpOwo+ICsgCVhTZXRXTVByb3RvY29scyhkaXNwbGF5Xywgd2luZG93XywgJndtX2RlbGV0
ZV93aW5kb3dfLCAxKTsKPiArCj4gKy0JZWdsX3N1cmZhY2VfID0gZWdsQ3JlYXRlV2luZG93U3Vy
ZmFjZShlZ2xfZGlzcGxheV8sIGNvbmZpZywgd2luZG93XywgTlVMTCk7Cj4gKysJZWdsX3N1cmZh
Y2VfID0gZWdsQ3JlYXRlV2luZG93U3VyZmFjZShlZ2xfZGlzcGxheV8sIGNvbmZpZywgcmVpbnRl
cnByZXRfY2FzdDxFR0xOYXRpdmVXaW5kb3dUeXBlPih3aW5kb3dfKSwgTlVMTCk7Cj4gKyAJaWYg
KCFlZ2xfc3VyZmFjZV8pCj4gKyAJCXRocm93IHN0ZDo6cnVudGltZV9lcnJvcigiZWdsQ3JlYXRl
V2luZG93U3VyZmFjZSBmYWlsZWQiKTsKPiArCj4gKy0tCj4gKzIuMzUuMQo+ICsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
