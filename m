Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84309C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 22:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5C183ED9;
	Wed,  6 Apr 2022 22:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVAGj1NRy8xh; Wed,  6 Apr 2022 22:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 134F983ED2;
	Wed,  6 Apr 2022 22:32:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC2D1BF3C0
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F341B61168
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWIrv-e19pka for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 22:32:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 337CB61165
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 22:32:35 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e1e5e8d9faso4525571fac.4
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 15:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nkSX30527ifqZh+Z3uYWtEFxPnBT1NfYVE7LNkYCOFo=;
 b=Y8g0aRIl7WSNYu7rsaKMd/m5IMdZChQBAQ6mXxL9mSqxlD2EKemWrESn/cP5ezbcRj
 UeN0QKqWGKwSMmFcz9kp+XOgGyxDOixxfK8LFfxjs5Im8ITf3Tn7SkFyvDqy6XsLIFdT
 q7qYF9j9bT+YOmKH0CeQTt8aAyk9b/GjdLVA+Xzd4k4hP66M33bpD/hj8aIcXRy0Ckbc
 oPoK3tkSF6vH9Lbk1O/BW6aTh07cT888PBaMn9w08PJArmdrRHXKam8Up0T7IwIL3XHh
 zNJ3feK/z0KTHFkzX2MCNpBnn9zqDUmzOVs/pVF8FdxtiJj6lGD/gywbzt1fmJUJwtoY
 PAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nkSX30527ifqZh+Z3uYWtEFxPnBT1NfYVE7LNkYCOFo=;
 b=tdtmAM6tRUYHtFuaH3j4XOAqlNA1xfny677ek5ovyumJRZoTkLixxZkYLuF2N6zQM7
 lzTDgdHmFdDt/89VJTX3EccdMDHTUFK/gca+uhUeGLB3UM5Y4kLOfjyqXvZZO2wujWdR
 FeHVsZ4xPPTvCuHEqRsXf+UdpV73SYApkAJVUPdMk+izQo8J0fouChctdPqZc20JiHZH
 LsGuEWh/wwiRLOsMlV0CH3rqgureNfgx2AJENBmpZP2zW9ej++LkDo41dsLOgwXfEkZQ
 ocjp4gQZLSg9yTd5OAK5rBIYFuAUazQUg+pu1zbmyhsFfeVk5oxuVOv1WOuUdCXStTKf
 izcw==
X-Gm-Message-State: AOAM532o16Aezgk5yRHUf+1qPgz6M9mWpJA3qxYPqCJEPE8qeKV/rQ1n
 +8m910yMcLmUIMlwAFz4/eCbs+GHCqEDWvGK0V4=
X-Google-Smtp-Source: ABdhPJwj/q4c92rgd03bGlhwuAeJ7+UHTSLJdQoTS3IN9ChFWM4zRAxYJ9M27uSdFzUCe8OYpRY48wk2cc2ibvUn0Js=
X-Received: by 2002:a05:6870:2104:b0:e2:96b:be89 with SMTP id
 f4-20020a056870210400b000e2096bbe89mr5092115oae.99.1649284354182; Wed, 06 Apr
 2022 15:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220405233412.4701-1-dpb@corrigendum.ru>
 <08affbae-a2c5-7e17-a9ee-a1f7842c2259@mind.be>
 <6f2c2047-1c19-dc6f-1d77-26f6a7f2615a@corrigendum.ru>
In-Reply-To: <6f2c2047-1c19-dc6f-1d77-26f6a7f2615a@corrigendum.ru>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Apr 2022 16:32:22 -0600
Message-ID: <CADvTj4rL+wky8Dy8YPJkcq4LG4k-swNBKVnyabmp4mEHzEk+Rg@mail.gmail.com>
To: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: remove hardcoded
 paths for host Python
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
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBcHIgNiwgMjAyMiBhdCAxOjU3IFBNINCg0L7QvNCw0L0g0JTQvtC90YfQtdC90LrQ
viA8ZHBiQGNvcnJpZ2VuZHVtLnJ1PiB3cm90ZToKPgo+IDA2LjA0LjIwMjIgMTc6MjQsIEFybm91
dCBWYW5kZWNhcHBlbGxlINC/0LjRiNC10YI6Cj4gPiBPbiAwNi8wNC8yMDIyIDAxOjM0LCDQoNC+
0LzQsNC9INCU0L7QvdGH0LXQvdC60L4gd3JvdGU6Cj4gPj4gV2hlbiBpbnN0YWxsZXIgaXMgdXNl
ZCB0byBpbnN0YWxsIHBhY2thZ2VzIGZvciBob3N0IFB5dGhvbiwgaXQgY2FuIGZpZ3VyZQo+ID4+
IG91dCBieSBpdHNlbGYgd2hpY2ggcGF0aHMgdG8gdXNlLiBXZSBqdXN0IG5lZWQgdG8gdXNlIHRo
ZSBpbnN0YWxsZXIgQ0xJCj4gPj4gaW5zdGVhZCBvZiBvdXIgd3JhcHBlciBzY3JpcHQuCj4gPgo+
ID4gICBKYW1lcywgY291bGQgeW91IGhhdmUgYSBsb29rIGF0IHRoaXMgYW5kIGFkZCBpdCB0byB5
b3VyIHNlcmllcyB0aGF0Cj4gPiByZXdvcmtzIHRoZSBwZXA1MTcgaW5mcmE/IEJlY2F1c2UgSSB0
aGluayBpdCdsbCBjcmVhdGUgY29uZmxpY3RzLgoKUmViYXNlZCBpdCBvbiBteSBmbGl0IGJvb3Rz
dHJhcCBtaWdyYXRpb24gcGF0Y2g6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA0MDYyMjI5MDQuNDIxNjEwLTItamFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbS8KCj4gPgo+ID4gICBBbHNvLCBjYW4gdGhlIGluc3RhbGxlciBiZSB1c2VkIGZv
ciB0YXJnZXQgaW5zdGFsbCBhcyB3ZWxsPwo+Cj4gTm8sIGluc3RhbGxlciBkb2Vzbid0IGtub3cg
dGhlIHNldHRpbmdzIGZvciB0aGUgdGFyZ2V0IFB5dGhvbiwgYW5kIHRoZQo+IGluc3RhbGxlciBD
TEkgaXNuJ3QgZmxleGlibGUgZW5vdWdoIHRvIGNvbmZpZ3VyZSB0aGVzZSBzZXR0aW5ncy4gU28g
YQo+IGN1c3RvbSBzY3JpcHQgaXMgcmVxdWlyZWQuCgpZZWFoLCB1bmZvcnR1bmF0ZWx5IHVwc3Ry
ZWFtIGluc3RhbGxlciBoYXMgYmVlbiBzb21ld2hhdCByZXNpc3RhbnQgdG8KYWRkaW5nIHRoaXMg
c29ydCBvZiBjdXN0b21pemF0aW9uIGZ1bmN0aW9uYWxpdHkgdG8gdGhlIENMSS4KCj4KPiA+Cj4g
PiAgIFJlZ2FyZHMsCj4gPiAgIEFybm91dAo+ID4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6INCg
0L7QvNCw0L0g0JTQvtC90YfQtdC90LrQviA8ZHBiQGNvcnJpZ2VuZHVtLnJ1Pgo+ID4+IC0tLQo+
ID4+ICAgcGFja2FnZS9wa2ctcHl0aG9uLm1rIHwgMTAgKy0tLS0tLS0tLQo+ID4+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA5IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcGtnLXB5dGhvbi5tayBiL3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+ID4+
IGluZGV4IDg2NzM0MWZjN2IuLmFjZDU2MjhmM2IgMTAwNjQ0Cj4gPj4gLS0tIGEvcGFja2FnZS9w
a2ctcHl0aG9uLm1rCj4gPj4gKysrIGIvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4gPj4gQEAgLTE0
NiwxNCArMTQ2LDYgQEAgSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19FTlYgPSBcCj4gPj4gICAgICAg
UFlUSE9OTk9VU0VSU0lURT0xIFwKPiA+PiAgICAgICAkKEhPU1RfQ09ORklHVVJFX09QVFMpCj4g
Pj4gLUhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfSU5TVEFMTF9PUFRTID0gXAo+ID4+IC0gICAgLS1p
bnRlcnByZXRlcj0vYmluL3B5dGhvbiBcCj4gPj4gLSAgICAtLXNjcmlwdC1raW5kPXBvc2l4IFwK
PiA+PiAtCj4gPj4gLS1wdXJlbGliPSQoSE9TVF9ESVIpL2xpYi9weXRob24kKFBZVEhPTjNfVkVS
U0lPTl9NQUpPUikvc2l0ZS1wYWNrYWdlcyBcCj4gPj4gLSAgICAtLWhlYWRlcnM9JChIT1NUX0RJ
UikvaW5jbHVkZS9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikgXAo+ID4+IC0gICAgLS1z
Y3JpcHRzPSQoSE9TVF9ESVIpL2JpbiBcCj4gPj4gLSAgICAtLWRhdGE9JChIT1NUX0RJUikKPiA+
PiAtCj4gPj4KPiA+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4+Cj4gPj4gICAjIGlubmVy
LXB5dGhvbi1wYWNrYWdlIC0tIGRlZmluZXMgaG93IHRoZSBjb25maWd1cmF0aW9uLCBjb21waWxh
dGlvbgo+ID4+ICAgIyBhbmQgaW5zdGFsbGF0aW9uIG9mIGEgUHl0aG9uIHBhY2thZ2Ugc2hvdWxk
IGJlIGRvbmUsIGltcGxlbWVudHMgYQo+ID4+IEBAIC0yMTIsNyArMjA0LDcgQEAgJCgyKV9CQVNF
X0lOU1RBTExfU1RBR0lOR19DTUQgPQo+ID4+ICQoVE9QRElSKS9zdXBwb3J0L3NjcmlwdHMvcHlp
bnN0YWxsZXIucHkgZGlzdC8qCj4gPj4gICBlbHNlCj4gPj4gICAkKDIpX0JBU0VfRU5WID0gJCQo
SE9TVF9QS0dfUFlUSE9OX1BFUDUxN19FTlYpCj4gPj4gICAkKDIpX0JBU0VfQlVJTERfQ01EID0g
LW0gYnVpbGQgLW4gLXcKPiA+PiAtJCgyKV9CQVNFX0lOU1RBTExfQ01EID0gJChUT1BESVIpL3N1
cHBvcnQvc2NyaXB0cy9weWluc3RhbGxlci5weQo+ID4+IGRpc3QvKiAkJChIT1NUX1BLR19QWVRI
T05fUEVQNTE3X0lOU1RBTExfT1BUUykKPiA+PiArJCgyKV9CQVNFX0lOU1RBTExfQ01EID0gLW0g
aW5zdGFsbGVyIGRpc3QvKgo+ID4+ICAgZW5kaWYKPiA+PiAgIGVsc2UKPiA+PiAgICQkKGVycm9y
ICJJbnZhbGlkICQoMilfU0VUVVBfVFlQRS4gVmFsaWQgb3B0aW9ucyBhcmUgJ2Rpc3R1dGlscycs
Cj4gPj4gJ3NldHVwdG9vbHMnLCAncGVwNTE3JyBvciAnZmxpdCcuIikKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
