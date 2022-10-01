Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13C5C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 17:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C2C4028C;
	Sat,  1 Oct 2022 17:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44C2C4028C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPHLUQ3fho19; Sat,  1 Oct 2022 17:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC0954007E;
	Sat,  1 Oct 2022 17:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0954007E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72B5E1BF57F
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 17:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A8B160E89
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 17:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A8B160E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rY9THb8ha2Wt for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 17:13:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C291760A8C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C291760A8C
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 17:13:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w18so2463946wro.7
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 10:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=az99rgzpSZUS43x9as9Vh74XhbgMeAWvad+Qb0ImXTQ=;
 b=W8c7I+p/REweGnXiv3B8gxhzseYrl1wgw39gyMhD2EM0MixEKQB4SsG/lE8HiuIpDl
 NGSft9Zo6bpKQeyHPJc9qzbaj1IcV5nfIrn3eYPyZGbEkUbysFJMquZmAB8KZ4Q4bNe8
 7PFyRzyTbiUM7SpWwwkq0hZwR2MORHUFu9YWsN3lhRXMGViSAiHX30UXtLBSPQj80nIC
 wO0slEQOjEcGHeOeFJOmSAW0FCGzSpb5QDYnYgjAqYZf7zz6rQzd3wpBOzkHkTN+hACG
 zY8TqJp16wA2wtH+6PfrrbJuQMswGOrwuHHFI3mn7GFIT6bnyAhi4slLbh82UKNOTrbD
 5CEA==
X-Gm-Message-State: ACrzQf0DeTpiG4XBd1WSuD46mopcb7tPfW7PB/H6IfCEGljT81N2jxB2
 ptHKrgvALw5HGll/AXG7u5E=
X-Google-Smtp-Source: AMsMyM4m36dh5hdQ0wGap8nEXt1oDxHxyiQmRzQdiO6wBP9i06LmTsCyersAx61YoI7y0CmYO8kAWw==
X-Received: by 2002:a05:6000:1447:b0:22a:ea42:29f7 with SMTP id
 v7-20020a056000144700b0022aea4229f7mr9414056wrx.38.1664644382783; 
 Sat, 01 Oct 2022 10:13:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003b332a7bf15sm11468632wms.7.2022.10.01.10.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Oct 2022 10:13:02 -0700 (PDT)
Message-ID: <cc130d77-786f-9ab6-33f6-d7c69420909f@gmail.com>
Date: Sat, 1 Oct 2022 19:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Anand Gadiyar <gadiyar@ti.com>, buildroot@buildroot.org
References: <20220923205543.1518798-1-gadiyar@ti.com>
 <20220923205543.1518798-2-gadiyar@ti.com>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220923205543.1518798-2-gadiyar@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=az99rgzpSZUS43x9as9Vh74XhbgMeAWvad+Qb0ImXTQ=;
 b=g48dBaMku4qxwBz389mJmMHwnZZHa4NqvMSy0oWeZ/LsYlW+jUUqrtdw0Nb03wPwcS
 o+/q9WTL//7Dmj4kmypwmEgSV8XKnzw11cBCHZoW2wV834AUk5PpD4dhpJX+bvnGHZhH
 g7E9CtIQRKSgOnp9KKppt+pLmAbcEdF2hkVi7u8nfyWT1tQtxpALA8ct6W75m6F80D6l
 sNURYtrdNAKnN0CJD8d5JKaN/lrmmPn7vt8pGAKIikU+GYiur2y6BUOyF3QDRnSlMxK+
 3cQIKBosMiIElPr0a0Q+4laZ6tJiMR666oqd0bgIZiV5r5Qvwm5wBAOK63YlOo+PqXlW
 SY4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g48dBaMk
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/ti-k3-r5-loader: add new package
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Xuanhao Shi <x-shi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5hbmQsCgpMZSAyMy8wOS8yMDIyIMOgIDIyOjU1LCBBbmFuZCBHYWRpeWFyIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBGcm9tOiBYdWFuaGFvIFNoaSA8eC1zaGlAdGkuY29tPgo+
IAo+IFRoaXMgaXMgYSBzZXBhcmF0ZSBVLUJvb3QgcGFja2FnZSB0aGF0IHdvdWxkIGJ1aWxkCj4g
dGhlIGludGVybWVkaWF0ZSBzcGwgYmluYXJ5IGZvciB0aGUgUjUgY29yZSBvbiBUSSdzIGszIGJv
YXJkcy4KPiBVc3VhbGx5LCB0aGUgcmVzdWx0aW5nIHNwbCB3aWxsIGJlIHVzZWQgZm9yIGszLWlt
YWdlLWdlbgo+IHRvIGJ1aWxkIHRoZSBmdWxsIFI1IGJvb3QgYmluYXJ5IHRpYm9vdDMuYmluLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFh1YW5oYW8gU2hpIDx4LXNoaUB0aS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5hbmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+
ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKwo+ICBi
b290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYm9vdC90
aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgICAgfCAxMyArKysrKysrCj4gIGJvb3Qv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoIHwgIDIgKwo+ICBib290L3RpLWsz
LXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysr
KysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gCj4gZGlm
ZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggM2RlNjNlYTcyZi4uNWYz
NmNiZjUzNSAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBA
IC0xMjgsNiArMTI4LDkgQEAgRjoJcGFja2FnZS9kY3Jvbi8KPiAgRjoJcGFja2FnZS9saWJ4bWxy
cGMvCj4gIEY6CXBhY2thZ2UvcHl0aG9uLWRvY29wdC8KPiAgCj4gK046CUFuYW5kIEdhZGl5YXIg
PGdhZGl5YXJAdGkuY29tPgo+ICtGOglib290L3RpLWszLXI1LWxvYWRlci8KPiArCj4gIE46CUFu
ZHLDqSBad2luZyA8bmVydkBkYXduY3Jvdy5kZT4KPiAgRjoJcGFja2FnZS9saWJrcmI1Lwo+ICBG
OglwYWNrYWdlL29wZW5hbC8KPiBAQCAtMzA2Myw2ICszMDY2LDkgQEAgRjoJcGFja2FnZS9weXRo
b24tcHl1c2IvCj4gIE46CVdvamNpZWNoIE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPgo+ICBG
OglwYWNrYWdlL2Z3dXAvCj4gIAo+ICtOOglYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNv
bT4KPiArRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCj4gKwo+ICBOOglZYWlyIEJlbiBBdnJhaGFt
IDx5YWlyYmFAcHJvdG9ubWFpbC5jb20+Cj4gIEY6CXBhY2thZ2UvY2FzeW5jLwo+ICBGOglwYWNr
YWdlL2dsb294Lwo+IGRpZmYgLS1naXQgYS9ib290L0NvbmZpZy5pbiBiL2Jvb3QvQ29uZmlnLmlu
Cj4gaW5kZXggNDA0NzJhZTA3ZC4uY2UxN2IyZGY2YiAxMDA2NDQKPiAtLS0gYS9ib290L0NvbmZp
Zy5pbgo+ICsrKyBiL2Jvb3QvQ29uZmlnLmluCj4gQEAgLTIyLDYgKzIyLDcgQEAgc291cmNlICJi
b290L3M1MDAtYm9vdGxvYWRlci9Db25maWcuaW4iCj4gIHNvdXJjZSAiYm9vdC9zaGltL0NvbmZp
Zy5pbiIKPiAgc291cmNlICJib290L3N1bjIwaS1kMS1zcGwvQ29uZmlnLmluIgo+ICBzb3VyY2Ug
ImJvb3Qvc3lzbGludXgvQ29uZmlnLmluIgo+ICtzb3VyY2UgImJvb3QvdGktazMtcjUtbG9hZGVy
L0NvbmZpZy5pbiIKPiAgc291cmNlICJib290L3Vib290L0NvbmZpZy5pbiIKPiAgc291cmNlICJi
b290L3ZleHByZXNzLWZpcm13YXJlL0NvbmZpZy5pbiIKPiAgCj4gZGlmZiAtLWdpdCBhL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5p
bgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uN2Y1ZmEwYjRjOAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPiBA
QCAtMCwwICsxLDEzIEBACj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUgo+ICsJ
Ym9vbCAidGktazMtcjUtbG9hZGVyIgo+ICsJaGVscAo+ICsJICBTZXBhcmF0ZSBVLUJvb3QgYnVp
bGQgZm9yIFI1IGNvcmVzIG9uIFRJJ3MgazMgYm9hcmRzLgo+ICsJICBVc3VhbGx5IHVzZWQgdG8g
YnVpbGQgdGlib290My5iaW4gd2l0aCBrMy1pbWFnZS1nZW4uCgpVc3VhbGx5IHdlIGFkZCBhICJp
ZiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUiIgaW5zdGVhZCBvZiAiZGVwZW5kcyBvbgpCUjJf
VEFSR0VUX1RJX0szX1I1X0xPQURFUiIgZm9yIGVhY2ggc3ViLW9wdGlvbnMuCgo+ICsKPiArY29u
ZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJECj4gKwlzdHJpbmcgIkJvYXJkIHRv
IGNvbmZpZ3VyZSBmb3IiCj4gKwlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
Cj4gKwloZWxwCj4gKwkgIFNwZWNpZnkgdGhlIGJvYXJkIHRvIGNvbmZpZ3VyZSB0aGUgYm9vdGxv
YWRlciBmb3IuCj4gKwkgIFRoaXMgc2hvdWxkIGJlIHRoZSBuYW1lIG9mIGEgYm9hcmQgdW5kZXIg
Ym9hcmQvdGkKPiArCSAgRm9yIGV4YW1wbGUsICJhbTY0eF9ldm0iLgo+IGRpZmYgLS1naXQgYS9i
b290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2Jvb3QvdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi5mYjZjZTdjMmE2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCj4gQEAgLTAsMCArMSwyIEBACj4gKyMg
TG9jYWxseSBjb21wdXRlZDoKPiArc2hhMjU2ICA2ZDY5ZDVlNDYzNWNiM2ZhNzg1MmJmMTVmODhj
YTM0MmVmNzc0MDE5NmU3MTk2MWQzNTcyZGViNThiYTQ0YmVhICB1LWJvb3QtMjAyMi4xMC1yYzEu
dGFyLmJ6Mgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2Fk
ZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjFlMDlmYWQ5ZjUKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gQEAg
LTAsMCArMSw0NSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgdGktazMt
cjUtbG9hZGVyLm1rCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1RJX0sz
X1I1X0xPQURFUl9WRVJTSU9OID0gMjAyMi4xMC1yYzEKCldlIHByZWZlciB1c2luZyBhIHJlbGVh
c2UgdmVyc2lvbiBub3QgYW4gLXJjIHByZS1yZWxlYXNlLgoKSXMgMjAyMi4wNyBpcyBnb29kIGVu
b3VnaD8KCj4gK1RJX0szX1I1X0xPQURFUl9TSVRFID0gaHR0cHM6Ly9mdHAuZGVueC5kZS9wdWIv
dS1ib290Cj4gK1RJX0szX1I1X0xPQURFUl9TT1VSQ0UgPSB1LWJvb3QtJChUSV9LM19SNV9MT0FE
RVJfVkVSU0lPTikudGFyLmJ6Mgo+ICtUSV9LM19SNV9MT0FERVJfTElDRU5TRSA9IEdQTC0yLjAr
Cj4gK1RJX0szX1I1X0xPQURFUl9MSUNFTlNFX0ZJTEVTID0gTGljZW5zZXMvZ3BsLTIuMC50eHQK
PiArVElfSzNfUjVfTE9BREVSX0NQRV9JRF9WRU5ET1IgPSBkZW54Cj4gK1RJX0szX1I1X0xPQURF
Ul9DUEVfSURfUFJPRFVDVCA9IHUtYm9vdAo+ICtUSV9LM19SNV9MT0FERVJfSU5TVEFMTF9JTUFH
RVMgPSBZRVMKPiArVElfSzNfUjVfTE9BREVSX0RFUEVOREVOQ0lFUyA9IFwKPiArCWhvc3QtcGtn
Y29uZiBcCj4gKwkkKEJSMl9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAo+ICsJaG9zdC1hcm0tZ251
LXRvb2xjaGFpbiBcCj4gKwlob3N0LW9wZW5zc2wKPiArCj4gK1RJX0szX1I1X0xPQURFUl9NQUtF
ID0gJChCUjJfTUFLRSkKPiArVElfSzNfUjVfTE9BREVSX01BS0VfRU5WID0gJChUQVJHRVRfTUFL
RV9FTlYpCj4gK1RJX0szX1I1X0xPQURFUl9LQ09ORklHX0RFUEVOREVOQ0lFUyA9IFwKPiArCWhv
c3QtYXJtLWdudS10b29sY2hhaW4gXAo+ICsJJChCUjJfTUFLRV9IT1NUX0RFUEVOREVOQ1kpIFwK
PiArCSQoQlIyX0JJU09OX0hPU1RfREVQRU5ERU5DWSkgXAo+ICsJJChCUjJfRkxFWF9IT1NUX0RF
UEVOREVOQ1kpCj4gKwo+ICtUSV9LM19SNV9MT0FERVJfQk9BUkQgPSAkKGNhbGwgcXN0cmlwLCQo
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQk9BUkQpKQoKV2UgaGF2ZSB0byBjaGVjayBpZiBC
UjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRCBpcyBub3QgZW1wdHkuCgo+ICtUSV9LM19S
NV9MT0FERVJfS0NPTkZJR19ERUZDT05GSUcgPSAkKFRJX0szX1I1X0xPQURFUl9CT0FSRClfcjVf
ZGVmY29uZmlnCgpJIHRoaW5rIHdlIHNob3VsZCBoYW5kbGUgdGhlIHRpLWszLXI1LWxvYWRlciBk
ZWZjb25maWcgYXMgZm9yIG90aGVyIHBhY2thZ2VzCnVzaW5nIGEgZGVmY29uZmlnLiBXZSBzaG91
bGQgdXNlIGEgS2NvbmZpZyBvcHRpb24gdG8gcHJvdmlkZSB0aGUgdGktazMtcjUtbG9hZGVyCih1
Ym9vdCkgZGVmY29uZmlnIG5hbWUgZnJvbSBCdWlsZHJvb3QgZGVmY29uZmlnIGFuZCBub3QgaGFy
ZGNvZGluZyBhIHN1ZmZpeCBfcjVfCmZyb20gdGhlIHBhY2thZ2UgbWFrZWZpbGUgKC5taykuCgo+
ICtUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTICs9IFwKPiArCUNST1NTX0NPTVBJTEU9JChIT1NU
X0FSTV9HTlVfVE9PTENIQUlOX0lOU1RBTExfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAoKVXNl
IHRoZSAkKEhPU1RfRElSKSBpbnN0ZWFkLgoKPiArCUFSQ0g9YXJtIFwKPiArCUhPU1RDQz0iJChI
T1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lzdGVtIC8sJChI
T1NUX0NGTEFHUykpKSIgXAo+ICsJSE9TVExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIKPiArCj4g
K2RlZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+ICsJJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpICQoVElfSzNfUjVfTE9BREVSX01BS0UpIC1DICQoQEQpICQoVElfSzNfUjVfTE9BREVS
X01BS0VfT1BUUykKPiArZW5kZWYKPiArCj4gK2RlZmluZSBUSV9LM19SNV9MT0FERVJfSU5TVEFM
TF9JTUFHRVNfQ01EUwo+ICsJY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmluICQoQklOQVJJRVNf
RElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ICtlbmRlZgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAr
Cj4gKyQoZXZhbCAkKGtjb25maWctcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
