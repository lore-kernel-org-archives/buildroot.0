Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E36C77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 10:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C750F6FFB3;
	Tue,  9 May 2023 10:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C750F6FFB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoX-DoDbYDzK; Tue,  9 May 2023 10:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C347C614BC;
	Tue,  9 May 2023 10:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C347C614BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C56E1BF286
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 10:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6524E40382
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 10:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6524E40382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Lw7oR1FsO0U for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 10:07:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EB984010C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EB984010C
 for <buildroot@buildroot.org>; Tue,  9 May 2023 10:07:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so3677755e9.1
 for <buildroot@buildroot.org>; Tue, 09 May 2023 03:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683626832; x=1686218832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4sQlevvflu02M/n4rAHweD4l4bswEDjylkFn4AiwvqI=;
 b=WQzjcjipMzbNf2S+5IZ8ssmpjhyb5swagwAgVh2+b4otBC6UZrsQGC3ipz16GnmVuX
 ylcC0r6sTe7k/PvBaUo6Dy+tuzCtmZ36NcDk+YDtZIFNPXAzv5kWneA23NfbB/cgFCSC
 32LUDvg7usCpKAqDPgCIO0MuklW39wJ3RJeES5OKEMyhlZlV0sTv8A8K6zbXUeIkPzQA
 QbSnRvFrRENMtxvuIjhS3x3JpwqPxXzIOTKFc0PzXCTS4bcOMVO+T0kj7F45PulH++bd
 xIHniUuoThfOGBajRPzWDNQHWLHpeD1jKk9d1GDR9kkqapqcpBek+/HqvMlax9pE0m7N
 UFpg==
X-Gm-Message-State: AC+VfDzzjwdYQ+UBpclYSIfuZWY5d33hnReV8xKVV49xIF01UaoILtTq
 xotamIrHFgcjekZr9WCMMzzNTw==
X-Google-Smtp-Source: ACHHUZ7RjAtdyDyVX7Ak5LHthEx18qgIxS0M75mAzXaTKfzryimveeZoSwMytlKw8uyEJNAncekUqg==
X-Received: by 2002:a1c:f012:0:b0:3f2:48dc:5e02 with SMTP id
 a18-20020a1cf012000000b003f248dc5e02mr9253042wmb.27.1683626831899; 
 Tue, 09 May 2023 03:07:11 -0700 (PDT)
Received: from [192.168.178.20] (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b00307925ff35bsm7203944wrw.49.2023.05.09.03.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 03:07:11 -0700 (PDT)
Message-ID: <7812dded-6b51-a8e9-e506-4eb44297e2ef@mind.be>
Date: Tue, 9 May 2023 12:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230419125200.3533794-1-raphael.melotte@mind.be>
 <20230508214525.GV252090@scaer>
In-Reply-To: <20230508214525.GV252090@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1683626832; x=1686218832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4sQlevvflu02M/n4rAHweD4l4bswEDjylkFn4AiwvqI=;
 b=LujvqnNhrkOG+FGjf6UfMsKLbGLKpkI4uqXveT2ybbrqYb0rhMKLFX8Ik7NjEaok+H
 5kxWu38CStnCNzOfkEQjNQxPSwqNNhsu58kqm2oi8B3JJUMuiRsl9eyq4uC3GJE1LtPf
 ZlXe+5Fn4aPynetgyYBHBhtKfTlmEXXZHaAbLLtw8JXEDEd07QpRpdJfMuUJwXeWptRV
 OaqU7gC7anP9SZpvTi/6loXXr2Twyna1QO9uTeYm8LzOuWjB95y+2cCcGYVpthLfX2Y+
 rXIv5UueK23S5R9CiKDIRLg5ZfpWFoWlWk4oBRvs2BIO+DivI1swn4X86WmNMkroLHPJ
 z1/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LujvqnNh
Subject: Re: [Buildroot] [PATCH 1/1] package: busybox: backport fix for
 missing getrandom()
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiA1LzgvMjMgMjM6NDUsIFlhbm4gRS4gTU9SSU4gd3JvdGU6CjxzbmlwPgo+IEkg
aGFkIHRvIGJhY2twb3J0IHRoaXMgcGF0Y2gsIGFzIGl0IGNhdXNlcyBidWlsZCBmYWlsdXJlczoK
PiAKPiAgICAgICQgY2F0IGRlZmNvbmZpZwo+ICAgICAgQlIyX2FybT15Cj4gICAgICBCUjJfY29y
dGV4X2E3PXkKPiAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICAgICAgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiAKPiAgICAgICQgbWFrZSBidXN5Ym94LWNvbmZpZ3Vy
ZQo+ICAgICAgWy4uLl0KPiAgICAgIC4uLi4vYnVpbGQvYnVzeWJveC0xLjM2LjAvTWFrZWZpbGUu
ZmxhZ3M6MTY1OiAqKiogdW50ZXJtaW5hdGVkIGNhbGwgdG8gZnVuY3Rpb24gJ3NoZWxsJzogbWlz
c2luZyAnKScuICBTdG9wLgoKQXBwYXJlbnRseSB0aGlzIGRlcGVuZHMgb24gdGhlIGhvc3QncyBt
YWtlIHZlcnNpb24gKGZvciByZWZlcmVuY2Ugc2VlIFsxXSkuIEl0J3MgbG9va3MgbGlrZSB0aGUg
bnVtYmVyIHNpZ24gKCcjJykgdGhhdCB0aGUgcGF0Y2ggdXNlcyBpbiB0aGUgc2hlbGwgaW52b2Nh
dGlvbiBtdXN0ICpub3QqIGJlIGVzY2FwZWQgd2l0aCBHTlUgTWFrZSB2ZXJzaW9uIDQuMyssIGJ1
dCAqbXVzdCogYmUgZXNjYXBlZCB3aXRoIHZlcnNpb24gNC4yLjEgYW5kIGVhcmxpZXIuLgpJJ2xs
IHRyeSB0byBmaXggaXQgYW5kIHNlbmQgYSBWMiwgc29ycnkgZm9yIHRoZSBhbm5veWFuY2UuCgpb
MV06IGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvY2dpdC9tYWtlLmdpdC9jb21taXQvP2lk
PWM2OTY2YjMyMzgxMWMzN2FjZWRmZjA1YjU3NmI5MDdiMDZhZWE1ZjQKCj4gCj4gLi4uIHdoaWNo
IGlzIGR1ZXMgdG8gc29tZSBpc3N1ZSBpbiAoc2Nyb2xsIGRvd24pLi4uCj4gCj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2J1c3lib3gvMDAwNy1zZWVkcm5nLWZpeC1nZXRyYW5kb20tZGV0ZWN0aW9u
LWZvci1ub24tZ2xpYmMtbGliYy5wYXRjaCBiL3BhY2thZ2UvYnVzeWJveC8wMDA3LXNlZWRybmct
Zml4LWdldHJhbmRvbS1kZXRlY3Rpb24tZm9yLW5vbi1nbGliYy1saWJjLnBhdGNoCj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjkwY2FjZTc5NjgKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL2J1c3lib3gvMDAwNy1zZWVkcm5nLWZpeC1nZXRyYW5k
b20tZGV0ZWN0aW9uLWZvci1ub24tZ2xpYmMtbGliYy5wYXRjaAo+PiBAQCAtMCwwICsxLDEwNiBA
QAo+PiArRnJvbSBiOGQzMmRiYTc0MWRhZWEyZWQwMWEwZGEzMjA4M2IxYmM5OTRhYTA0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogPT9VVEYtOD9xP1JhcGhhPUMzPUFCbD0yME09
QzM9QTlsb3R0ZT89IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPj4gK0RhdGU6IFR1ZSwgMTgg
QXByIDIwMjMgMTU6NTQ6NDMgKzAyMDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gc2VlZHJuZzogZml4
IGdldHJhbmRvbSgpIGRldGVjdGlvbiBmb3Igbm9uLWdsaWJjIGxpYmMKPj4gK01JTUUtVmVyc2lv
bjogMS4wCj4+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPj4gK0Nv
bnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPj4gKwo+PiArZ2xpYmMgPD0gMi4yNCBkb2Vz
IG5vdCBwcm92aWRlIGdldHJhbmRvbSgpLiBBIGNoZWNrIGZvciBpdCBoYXMgYmVlbgo+PiArYWRk
ZWQgaW4gMjAwYTk2NjlmYmY2ZjA2ODk0ZTQyNDNjY2NjOWZjMTFhMWE2MDczYSBhbmQgZml4ZWQg
aW4KPj4gK2NiNTdhYmI0NmYwNmY0ZWRlOGQ5Y2NiZGFhYzY3Mzc3ZmRmNDE2Y2YuCj4+ICsKPj4g
K0hvd2V2ZXIsIGJ1aWxkaW5nIHdpdGggYSBsaWJjIG90aGVyIHRoYW4gZ2xpYmMgY2FuIGxlYWQg
dG8gdGhlIHNhbWUKPj4gK3Byb2JsZW0gYXMgbm90IGV2ZXJ5IG90aGVyIGxpYmMgaGFzIGdldHJh
bmRvbSgpIGVpdGhlcjoKPj4gKwo+PiArLSB1Q2xpYmMgcHJvdmlkZXMgaXQgZnJvbSB2MS4wLjIg
b253YXJkcywgYnV0IHJlcXVpcmVzIHRvIGRlZmluZQo+PiArX0dOVV9TT1VSQ0UgKGFsbCB2ZXJz
aW9ucyAtIHdlIGFscmVhZHkgZGVmaW5lIGl0IGJ5IGRlZmF1bHQpLCBhbmQKPj4gK3N0ZGRlZiB0
byBiZSBpbmNsdWRlZCBmaXJzdCAod2hlbiB1c2luZyB1Q2xpYmMgPCAxLjAuMzUgLSB3ZSBhbHJl
YWR5Cj4+ICtpbmNsdWRlIGl0IHRocm91Z2ggbGliYmIuaCkuCj4+ICsKPj4gKy0gbXVzbCBsaWJj
IGhhcyBnZXRyYW5kb20oKSwgYnV0IG9ubHkgZnJvbSB2ZXJzaW9uIDEuMS4yMCBvbndhcmRzLiBB
cwo+PiArbXVzbCBkb2VzIG5vdCBwcm92aWRlIF9fTVVTTF9fIG9yIHZlcnNpb24gaW5mb3JtYXRp
b24sIGl0J3Mgbm90Cj4+ICtwb3NzaWJsZSB0byBjaGVjayBmb3IgaXQgbGlrZSB3ZSBkaWQgZm9y
IGdsaWJjLgo+PiArCj4+ICtBbGwgb2YgdGhpcyBtYWtlcyBpdCBkaWZmaWN1bHQgKG9yIGltcG9z
c2libGUgaW4gY2FzZSBvZiBtdXNsKSB0bwo+PiArY2hlY2sgd2hhdCB3ZSBuZWVkIHRvIGRvIHRv
IGhhdmUgZ2V0cmFuZG9tKCkgYmFzZWQgb24gZWFjaCBsaWJjCj4+ICt2ZXJzaW9ucy4KPj4gKwo+
PiArT24gdG9wIG9mIHRoYXQsIGdldHJhbmRvbSgpIGlzIGFsc28gbm90IGF2YWlsYWJsZSBvbiBv
bGRlciBrZXJuZWxzLiBBcwo+PiArYW4gZXhhbXBsZSwgd2hlbiB1c2luZyBhIDMuMTAga2VybmVs
IHdpdGggdUNsaWJjIDEuMC4yNiwgZ2V0cmFuZG9tKCkKPj4gK2lzIGRlY2xhcmVkIHNvIGNvbXBp
bGluZyB3b3JrcywgYnV0IGl0IGZhaWxzIGF0IGxpbmsgdGltZSBiZWNhdXNlCj4+ICtnZXRyYW5k
b20oKSBpcyBub3QgZGVmaW5lZC4KPj4gKwo+PiArVG8gbWFrZSBpdCBlYXNpZXIsIHRha2UgYSBz
aW1pbGFyIGFwcHJvYWNoIHRvIHdoYXQgd2FzIGRvbmUgZm9yIHRoZQo+PiArY3J5cHQgbGlicmFy
eTogdHJ5IHRvIGJ1aWxkIGEgc2FtcGxlIHByb2dyYW0gdG8gc2VlIGlmIHdlIGhhdmUKPj4gK2dl
dHJhbmRvbSgpLgo+PiArCj4+ICtCYXNlZCBvbiB0aGUgbmV3IE1ha2VmaWxlIHZhcmlhYmxlLCB3
ZSBub3cgZWl0aGVyIHVzZSB0aGUKPj4gK2xpYmMtcHJvdmlkZWQgZ2V0cmFuZG9tKCkgd2hlbiBp
dCdzIGF2YWlsYWJsZSwgb3IgdXNlIG91ciBvd24KPj4gK2ltcGxlbWVudGF0aW9uIHdoZW4gaXQn
cyBub3QgKGxpa2UgaXQgd2FzIHRoZSBjYXNlIGFscmVhZHkgZm9yIGdsaWJjIDwKPj4gKzIuMjUp
Lgo+PiArCj4+ICtUaGlzIHNob3VsZCBmaXggY29tcGlsaW5nIHdpdGggbWFueSBsaWJjL2tlcm5l
bCBjb21iaW5hdGlvbnMuCj4+ICsKPj4gK1NpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRl
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPj4gK1Vwc3RyZWFtOiBodHRwOi8vbGlzdHMuYnVz
eWJveC5uZXQvcGlwZXJtYWlsL2J1c3lib3gvMjAyMy1BcHJpbC8wOTAyODUuaHRtbAo+PiArLS0t
Cj4+ICtOb3RlIHRoYXQgSSB3YXMgbm90IGFibGUgdG8gdGVzdCBldmVyeSBzaW5nbGUgY29tYmlu
YXRpb24sIGJ1dCBJIGNvdWxkCj4+ICtjb25maXJtIGl0IGJ1aWxkcyBzdWNjZXNzZnVsbHkgZm9y
Ogo+PiArdUNsaWJjIDEwLjAuMjQsIGxpbnV4IGhlYWRlcnMgMy4xMCAobGliYyBnZXRyYW5kb20g
Tk9UIHVzZWQpCj4+ICt1Q2xpYmMgMS4wLjM2LCBsaW51eCBoZWFkZXJzIDQuOSAobGliYyBnZXRy
YW5kb20gdXNlZCkKPj4gK211c2wgMS4xLjE2LCBsaW51eCBoZWFkZXJzIDQuMTIgKGxpYmMgZ2V0
cmFuZG9tIE5PVCB1c2VkKQo+PiArbXVzbCAxLjIuMSwgbGludXggaGVhZGVycyAobGliYyBnZXRy
YW5kb20gdXNlZCkKPj4gK2dsaWJjIDIuMjUsIGxpbnV4IGhlYWRlcnMgNC4xMCAobGliYyBnZXRy
YW5kb20gdXNlZCkKPj4gKwo+PiArIE1ha2VmaWxlLmZsYWdzICAgICAgfCA3ICsrKysrKysKPj4g
KyBtaXNjdXRpbHMvc2VlZHJuZy5jIHwgOCArKysrLS0tLQo+PiArIDIgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4gKwo+PiArZGlmZiAtLWdpdCBhL01h
a2VmaWxlLmZsYWdzIGIvTWFrZWZpbGUuZmxhZ3MKPj4gK2luZGV4IDFjZWM1YmEyMC4uODhjMTE4
NjJmIDEwMDY0NAo+PiArLS0tIGEvTWFrZWZpbGUuZmxhZ3MKPj4gKysrKyBiL01ha2VmaWxlLmZs
YWdzCj4+ICtAQCAtMTYxLDYgKzE2MSwxMyBAQCBpZmVxICgkKFJUX0FWQUlMQUJMRSkseSkKPj4g
KyBMRExJQlMgKz0gcnQKPj4gKyBlbmRpZgo+PiArCj4+ICsrIyBOb3QgYWxsIGxpYmMgdmVyc2lv
bnMgaGF2ZSBnZXRyYW5kb20sIHNvIGNoZWNrIGZvciBpdC4KPj4gKytIQVZFX0dFVFJBTkRPTSA6
PSAkKHNoZWxsIHByaW50ZiAnI2luY2x1ZGUgPHN0ZGRlZi5oPlxuI2luY2x1ZGUgPHN5cy9yYW5k
b20uaD5cbmludCBtYWluKHZvaWQpe2NoYXIgYnVmWzI1Nl07XG5nZXRyYW5kb20oYnVmLHNpemVv
ZihidWYpLEdSTkRfTk9OQkxPQ0spO30nID5iYl9saWJ0ZXN0LmM7ICQoQ0MpICQoQ0ZMQUdTKSAk
KENGTEFHU19idXN5Ym94KSAtRF9HTlVfU09VUkNFIC1vIC9kZXYvbnVsbCBiYl9saWJ0ZXN0LmMg
Pi9kZXYvbnVsbCAyPiYxICYmIGVjaG8gInkiOyBybSBiYl9saWJ0ZXN0LmMpCj4gCj4gLi4uIHRo
aXMgYmlnIGxpbmUgaGVyZS4uLgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4g
KysKPj4gKytpZmVxICgkKEhBVkVfR0VUUkFORE9NKSx5KQo+PiArK0NGTEFHUyArPSAtREhBVkVf
R0VUUkFORE9NCj4+ICsrZW5kaWYKPj4gKysKPj4gKyAjIGxpYnBhbSBtYXkgdXNlIGxpYnB0aHJl
YWQsIGxpYmRsIGFuZC9vciBsaWJhdWRpdC4KPj4gKyAjIE9uIHNvbWUgcGxhdGZvcm1zIHRoYXQg
cmVxdWlyZXMgYW4gZXhwbGljaXQgLWxwdGhyZWFkLCAtbGRsLCAtbGF1ZGl0Lgo+PiArICMgSG93
ZXZlciwgb24gKm90aGVyIHBsYXRmb3JtcyogaXQgZmFpbHMgd2hlbiBzb21lIG9mIHRob3NlIGZs
YWdzCj4+ICtkaWZmIC0tZ2l0IGEvbWlzY3V0aWxzL3NlZWRybmcuYyBiL21pc2N1dGlscy9zZWVk
cm5nLmMKPj4gK2luZGV4IDNiZjZlMmVhNy4uMmYxZTE4YzMyIDEwMDY0NAo+PiArLS0tIGEvbWlz
Y3V0aWxzL3NlZWRybmcuYwo+PiArKysrIGIvbWlzY3V0aWxzL3NlZWRybmcuYwo+PiArQEAgLTQ0
LDggKzQ0LDEwIEBACj4+ICsgI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5oPgo+PiArICNpbmNsdWRl
IDxzeXMvZmlsZS5oPgo+PiArCj4+ICstLyogRml4IHVwIGdsaWJjIDw9IDIuMjQgbm90IGhhdmlu
ZyBnZXRyYW5kb20oKSAqLwo+PiArLSNpZiBkZWZpbmVkKF9fR0xJQkNfXykgJiYgX19HTElCQ19f
ID09IDIgJiYgX19HTElCQ19NSU5PUl9fIDw9IDI0Cj4+ICsrLyogRml4IHVwIHNvbWUgbGliYyAo
ZS5nLiBnbGliYyA8PSAyLjI0KSBub3QgaGF2aW5nIGdldHJhbmRvbSgpICovCj4+ICsrI2lmIGRl
ZmluZWQgSEFWRV9HRVRSQU5ET00KPj4gKysjaW5jbHVkZSA8c3lzL3JhbmRvbS5oPgo+PiArKyNl
bHNlIC8qIE5vIGdldHJhbmRvbSAqLwo+PiArICNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgo+PiAr
IHN0YXRpYyBzc2l6ZV90IGdldHJhbmRvbSh2b2lkICpidWZmZXIsIHNpemVfdCBsZW5ndGgsIHVu
c2lnbmVkIGZsYWdzKQo+PiArIHsKPj4gK0BAIC01Niw4ICs1OCw2IEBAIHN0YXRpYyBzc2l6ZV90
IGdldHJhbmRvbSh2b2lkICpidWZmZXIsIHNpemVfdCBsZW5ndGgsIHVuc2lnbmVkIGZsYWdzKQo+
PiArIAlyZXR1cm4gLTE7Cj4+ICsgIyBlbmRpZgo+PiArIH0KPj4gKy0jZWxzZQo+PiArLSNpbmNs
dWRlIDxzeXMvcmFuZG9tLmg+Cj4+ICsgI2VuZGlmCj4+ICsKPj4gKyAvKiBBcHBhcmVudGx5IHNv
bWUgaGVhZGVycyBkb24ndCBzaGlwIHdpdGggdGhpcyB5ZXQuICovCj4+ICstLQo+PiArMi4zOS4x
Cj4+ICsKPj4gLS0gCj4+IDIuMzcuMwo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
