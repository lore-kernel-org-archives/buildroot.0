Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114B1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 10:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966F960FCA;
	Wed, 15 Jun 2022 10:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRoQFDtxveO3; Wed, 15 Jun 2022 10:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AFBF60AA5;
	Wed, 15 Jun 2022 10:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20D591BF5A8
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E36240483
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcXvesx0Kue3 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 10:57:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.157])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D69C14017A
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:57:09 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se28.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o1Qhl-000DVB-2H; Wed, 15 Jun 2022 05:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6VJ1doHiZaNOrd2esSqdUrOHb6ymN+Sv2vkoiminqyE=; b=RGpo01ydrPS+S5uFBRX5Zb9z+F
 NK4MGBt/cVfpiaaAGmiRW7UueQ3IcOVbc6LifbZjWjY0O3z92x5wmL/ZeI2N0Vmv3LSq84NasAJKy
 4pe6RkGxbLhjdIMfKgJb6uCRPPb7QZTul1jU3/v6aYYWOfowtbienJonBAGXRZfGAZABZavb0naJq
 dE/I1Bohx/TA8CG432B3aCwAPtoYhWlYr/53fc3VyKb3gPNl+uh5nAQJNTIB0CV8I9VI2h/XNWuUm
 5MXvGG8jeLFDgcHMtLJI3NoDOaKzKctx2fRtS7FnvV5YyCq0+6VkGKc/QXeSWbjy+WsOPpKLIpUfW
 9XqP+4yA==;
Received: from [127.0.0.1] (port=54286 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o1Qhi-0004SV-Fd; Wed, 15 Jun 2022 10:56:54 +0000
MIME-Version: 1.0
Date: Wed, 15 Jun 2022 13:56:54 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAPi7W82YatKcPLD7+rHDKhzngo_=cMnSG7GjV8bCebCb7iz2Cw@mail.gmail.com>
References: <20220615074543.41437-1-dimi@tpm.dev>
 <20220615075028.41612-1-dimi@tpm.dev>
 <2c1f96f051686a661c0a6a1fbba07e40@tpm.dev>
 <CAPi7W82YatKcPLD7+rHDKhzngo_=cMnSG7GjV8bCebCb7iz2Cw@mail.gmail.com>
Message-ID: <b747c1dffb31252f1567d80e88707f2f@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00194653579177)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/l+RSTiGhsnfL1+nEfyjgpPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zXBqNSapTpPkqU8rtpw71NFyJHgrHSwCtEjluuUWcpJy6t
 qqQqDjtsvNgVjMorkiNpdtr/zHbEnQMJQw9jU01dAiVLZDqPW14Alsx3B9/9uz61pvrO6HwfG+rB
 B7pDXCGmxNc1+XY5PM6T3YhB1Z6+cVoUGnt75GSZ8R01W54PlMttn5U6JgC86MA0WtuQI9YEybI1
 sOftHmSKUCHCvcq0yXl6FMT6M3aJ/uTYw8+C6f32Pbh8IoWMnTRN/BGQ/k2Kbu4uGlhgkrfHbdZD
 A9RTLsrrQhbj8X91aR7ya6IAIQO2STdBA5Uv2GfAI+eh/+ltON/TTWWZ967bkU57I7RG7DgzTQVm
 jsGWMqZuQKevgUdX9lgZ8EzqS/IY6P98izRREEHiZkQtIZHw9CVYULBCZ66lhh3M+bth9ENpQs5T
 aTYms7xC/xECurYzBZo2eH5S4gXbKfTeztNLeCGba+AGlvk+fp+1BlUr0rwQCOffuxSDr14Ng17a
 K0KVPdLtuNBQKjk9kmwtxjkWY2Gn4kPGpt1STXBVt1dWVEn7ayxguK/4dg0fH+IxuHMdn6Aesq/+
 2RocPUuulq9W1PiTENQsQSonZiFodgo9fgcdxbh+YkYMQ9Z+2Got4ab2H7ZQD9xaGU/y5LAAVorG
 kQz2Sdq7Wzvrlqr/siF7kmk0RghWw4zIacMilJyGVyjpEgOg2D+r4KgxnNw+SR321fWDrmpK+qv6
 G3jaf3Yb4RxjRToPGnoZ/cup2uXSfMpPixnQwqcBIkUL/j1Y48GvmeURQjjE5i4UA+1oqJpF71Z4
 FZpDm4mzlYoAYnBPHhHGmdOLYBGIQ0FFEefQVGEQ1kU10I9FcQrbO7uHDjImfZnzvmupG9VB2dcf
 K+b+Zn4Xrg1X+GLdhCCwjbvSHPNuz2dpCGOdqXbA2PB14sFBTHQi16AFSfy2tebwJIn4LGuGA/Pn
 2/jbN+mC7YtR1CA4KtycBqB5UH+AUUuB4dpnvVGq0uayBqavMuQ7cEx0iSgeZQiJfvWU/aIvRGba
 f7pN8JZ6q+0Tbmzgl5q7Sj5mtbYwvEzfeN7BAl2CeV4os8gLa/VaI9tL9YFG/dWoAfXc5c4PFCnG
 2AtH8UrqTqhBR2Q7J+FcnfEcVpFY6CWf3WjHFvYnm+G90vHYP0867qmSn6HwLgz+eA6scZZwpzkC
 o4WoBCri0m3a/fo74mPtmdv83fHzXZKfUBrrJFUF4fKPESnR/E1fdl+RTjptstkzumf7rxP7qw==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH v4 1/1] package/wolftpm: Add config options
 for TPM 2.0 extra capabilities
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKClRoYW5rIHlvdSBmb3IgdGhpcyBpbnB1dC4KCldoYXQgZG8geW91IG1lYW4g
Ynkgc3VwZXJzZWRlZD8gSSBhbSB1c2luZyAtLWluLXJlcGx5LXRvLiBIb3cgYXJlIHlvdSAKdHlw
aWNhbGx5IHNlbmRpbmcgZm9sbG93LXVwIHBhdGNoIHZlcnNpb25zPwoKSSB0aG91Z2h0IHdlIGFy
ZSB1c2luZyA4MCBjaGFycyBwZXIgbGluZSBsaW1pdCwgSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2gg
CndpdGggNzIgY2hhcnMgcGVyIGxpbmUgbGltaXQuCgpSZWdhcmRzLAoKRGltaQoKT24gMjAyMi0w
Ni0xNSAxMTozNCBBTSwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiBIaSBEaW1pLAo+IAo+IExl
IG1lci4gMTUganVpbiAyMDIyIMOgIDA5OjUzLCBEaW1pIFRvbW92IDxkaW1pQHRwbS5kZXY+IGEg
w6ljcml0IDoKPj4gCj4+IEhpIFRob21hcywKPj4gCj4+IFRoaXMgcGF0Y2ggYWRkcyBuZXcgcGFj
a2FnZSBvcHRpb25zIHRoYXQgZW5hYmxlIGV4dHJhIFRQTSAyLjAKPj4gY2FwYWJpbGl0aWVzLgo+
PiAKPj4gcHM6IFBsZWFzZSBleGN1c2UgdGhlIGV4dHJhIHZlcnNpb25zLCBpdCBzZWVtcyBJIGFt
IHN0aWxsIHNsZWVweSB0aGlzCj4+IG1vcm5pbmcuCj4+IAo+PiBUaGFua3MsCj4+IERpbWkKPj4g
LS0KPj4gRm91bmRlciBvZiBUUE0uZGV2Cj4+IAo+PiBPbiAyMDIyLTA2LTE1IDEwOjUwIEFNLCBE
aW1pIFRvbW92IHdyb3RlOgo+PiA+IEZyb206IERpbWl0YXIgVG9tb3YgPGRpbWlAdHBtLmRldj4K
Pj4gPgo+PiA+IFNvbWUgVFBNIDIuMCBjaGlwcyBvZmZlciBleHRyYSBjYXBhYmlsaXRpZXMuIFRo
aXMgcGF0Y2ggYWRkcyBhZGRpdGlvbmFsCj4+ID4gY29uZmlndXJhdGlvbiBvcHRpb25zIHRvIHRo
ZSB3b2xmdHBtIHBhY2thZ2UsIHNvIHN1Y2ggY2FwYWJpbGl0aWVzIGNhbgo+PiA+IGJlIGF2YWls
YWJsZSB0byB0aGUgdXNlci4gRm9yIGV4YW1wbGUsIHRoZSBTVE1pY3JvZWxlY3Ryb25pY3MgU1Qz
MyBhbmQKPj4gPiBOdXZvdG9uIE5QQ1Q3NTAgYm90aCBvZmZlciBzZWN1cmUgR1BJTy4gRHVlIHRv
IGNoaXAgZGlmZmVyZW5jZXMsCj4+ID4gd29sZlRQTQo+PiA+IHJlcXVpcmVzIGV4cGxpY2l0IGNv
bmZpZ3VyYXRpb24gb3B0aW9ucyB0byBlbmFibGUgdGhlIGV4dHJhCj4+ID4gY2FwYWJpbGl0aWVz
Lgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogRGltaXRhciBUb21vdiA8ZGltaUB0cG0uZGV2Pgo+
PiA+IC0tLQo+PiA+IENoYW5nZXMgdjMgLT4gdjQ6Cj4+ID4gLSBGaXggY29tbWl0IG1lc3NhZ2Uu
IEZvciBzb21lIHJlYXNvbiB0aGUgdXBkYXRlIHdhcyBub3QgaW5jbHVkZWQgaW4KPj4gPiBwYXRj
aCB2My4KPj4gPiBDaGFuZ2VzIHYyIC0+IHYzOgo+PiA+IC0gQmV0dGVyIGNvbW1pdCBtZXNzYWdl
Cj4+ID4gQ2hhbmdlcyB2MSAtPiB2MjoKPj4gPiAtIFJlbW92ZSBhIG5vdCBuZWVkZWQgcGFja2Fn
ZSBkZXNjcmlwdGlvbiBjaGFuZ2UKPiAKPiBZb3Ugc2hvdWxkIHNldCBwcmV2aW91cyBpdGVyYXRp
b25zIGFzIHN1cGVyc2VkZWQgaW4gcGF0Y2h3b3JrOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8KPiAKPj4gPiAtLS0KPj4gPiAgcGFja2FnZS93
b2xmdHBtL0NvbmZpZy5pbiAgfCAxMiArKysrKysrKysrKysKPj4gPiAgcGFja2FnZS93b2xmdHBt
L3dvbGZ0cG0ubWsgfCAxMiArKysrKysrKysrKysKPj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93b2xmdHBtL0NvbmZp
Zy5pbiBiL3BhY2thZ2Uvd29sZnRwbS9Db25maWcuaW4KPj4gPiBpbmRleCAwYjk2NGMzZDdlLi4z
MDI3YjdlMzNkIDEwMDY0NAo+PiA+IC0tLSBhL3BhY2thZ2Uvd29sZnRwbS9Db25maWcuaW4KPj4g
PiArKysgYi9wYWNrYWdlL3dvbGZ0cG0vQ29uZmlnLmluCj4+ID4gQEAgLTIzLDYgKzIzLDE4IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9XT0xGVFBNX1dPTEZDUllQVAo+PiA+ICAgICAgICAgZW5jcnlw
dGlvbi4gRGlzYWJsaW5nIHRoaXMgb3B0aW9uIGlzIG5vdCByZWNvbW1lbmRlZCBhcyBpdAo+PiA+
ICAgICAgICAgY291bGQgY3JlYXRlIGEgc2VjdXJpdHkgYnJlYWNoIGluIG1vc3QgZW52aXJvbm1l
bnRzLgo+PiA+Cj4+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9XT0xGVFBNX1NUMzMKPj4gPiArICAg
ICBib29sICJzdDMzIgo+PiA+ICsgICAgIGRlZmF1bHQgbgo+PiA+ICsgICAgIGhlbHAKPj4gPiAr
ICAgICAgIEVuYWJsZSBzdXBwb3J0IG9mIFRQTSAyLjAgZXh0cmEgZnVuY3Rpb25hbGl0eSBvZmZl
cmVkIGJ5IHRoZQo+PiA+IFNUTWljcm9lbGVjdHJvbmljcyBTVDMzIGNoaXAuCj4gCj4gVGhpcyBs
aW5lIGlzIHRvbyBsb25nIChpdCBzaG91bGQgYmUgd3JhcHBlZCB0byA3MiBjaGFyYWN0ZXJzKS4K
PiBtYWtlIGNoZWNrLXBhY2thZ2Ugd2lsbCB3YXJuIHlvdSBhYm91dCBpdAo+IAo+PiA+ICsKPj4g
PiArY29uZmlnIEJSMl9QQUNLQUdFX1dPTEZUUE1fTlVWT1RPTgo+PiA+ICsgICAgIGJvb2wgIm5w
Y3Q3NTAiCj4+ID4gKyAgICAgZGVmYXVsdCBuCj4+ID4gKyAgICAgaGVscAo+PiA+ICsgICAgICAg
RW5hYmxlIHN1cHBvcnQgb2YgVFBNIDIuMCBleHRyYSBmdW5jdGlvbmFsaXR5IG9mZmVyZWQgYnkg
dGhlCj4+ID4gTnV2b3RvbiBOUENUNzUwIGNoaXAuCj4gCj4gVGhpcyBsaW5lIGlzIGFsc28gdG9v
IGxvbmcuCj4gCj4+ID4gKwo+PiA+ICBjb21tZW50ICJ3b2xmQ3J5cHQgaG9va3MgbmVlZCBhIHRv
b2xjaGFpbiB3LyB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnkiCj4+ID4gICAgICAgZGVwZW5kcyBv
biAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBCUjJfU1RBVElDX0xJQlMKPj4gPgo+PiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tayBiL3BhY2thZ2Uvd29sZnRw
bS93b2xmdHBtLm1rCj4+ID4gaW5kZXggYTRhOWVkY2U4NS4uZDA0MjNjZDA2YiAxMDA2NDQKPj4g
PiAtLS0gYS9wYWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tawo+PiA+ICsrKyBiL3BhY2thZ2Uvd29s
ZnRwbS93b2xmdHBtLm1rCj4+ID4gQEAgLTM1LDQgKzM1LDE2IEBAIGVsc2UKPj4gPiAgV09MRlRQ
TV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXdvbGZjcnlwdAo+PiA+ICBlbmRpZgo+PiA+Cj4+ID4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfV09MRlRQTV9TVDMzKSx5KQo+PiA+ICtXT0xGVFBNX0NPTkZf
T1BUUyArPSAtLWVuYWJsZS1zdDMzCj4+ID4gK2Vsc2UKPj4gPiArV09MRlRQTV9DT05GX09QVFMg
Kz0gLS1kaXNhYmxlLXN0MzMKPj4gPiArZW5kaWYKPj4gPiArCj4+ID4gK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfV09MRlRQTV9OUENUNzUwKSx5KQo+PiA+ICtXT0xGVFBNX0NPTkZfT1BUUyArPSAtLWVu
YWJsZS1udXZvdG9uCj4+ID4gK2Vsc2UKPj4gPiArV09MRlRQTV9DT05GX09QVFMgKz0gLS1kaXNh
YmxlLW51dm90b24KPj4gPiArZW5kaWYKPj4gPiArCj4+ID4gICQoZXZhbCAkKGF1dG90b29scy1w
YWNrYWdlKSkKPiAKPiBCZXN0IFJlZ2FyZHMsCj4gCj4gRmFicmljZQoKLS0gCkZvdW5kZXIgb2Yg
VFBNLmRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
