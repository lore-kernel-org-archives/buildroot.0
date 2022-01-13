Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFE0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 06:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBEBA4090E;
	Thu, 13 Jan 2022 06:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4uG5OAD7ila; Thu, 13 Jan 2022 06:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8191E4053E;
	Thu, 13 Jan 2022 06:54:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD401BF860
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 06:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159DE4053E
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 06:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0leWTSoAmdMl for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 06:54:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA7C94000B
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 06:54:26 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id u6so9461888uaq.0
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 22:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fHDWHfPxajUTJWjA+d8lv5JVH13h954aKGPxBLBybD8=;
 b=MUnNCccR6srmsiCBqDoEDjIqvnTKOG6KBNGXfZdTAy0UN1QyrP9beIxKhAXlRbL/uV
 FnMlxNndxcEh24HvHMpct3CR9EhHVZlGB9dX/2xR/8tGN/kzuXmcAYKUJX549NazbWAJ
 1y5QYIERzW1W1RiZTXDegBTl8R0E+wm52dtLT+Zs8BcZ3S+L1UJJHuC24IBZoVquinL8
 10b52yGYm2L668xQvi3W4dVnXccZ9KT9zrpQjZ4rpBr3mkOnwFgzni3jdaeT6/0qv42y
 vCnFbkJ57oQQ5K9BgInCcDz6nbnxQ3UaUWI+CC/FNK94bWdPA4oVbtpJhLELHeRsXBE/
 o7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fHDWHfPxajUTJWjA+d8lv5JVH13h954aKGPxBLBybD8=;
 b=5I2OG8agjCTGer4qfzztS33eQPec5XRbOmgG2lMu5h8DsiKrC43Qt+O0ijNIaQO1CR
 hy6C0CDX8w+xTuLJOgGrsJOnka8nzCiog8Ui+XLr2F26xD/gZKXPbrLU7yw7uXXx8X80
 xd+AfQvKJ8ndeZcqWb30YIbHNcKVLaLXxuJTe4712irHR2M88Ji9/Hp+zz6OaFYhQDYq
 EvEQ3ippgnMrJdoEKgmdTJcIISs1NveRLL6cMrB/3TGwNEYlusKEQzjXngHALvHbFuTJ
 hOCS8zMEDxqu8jo4aSiXD8nQaycuxsvyYl274y2a1HLumQPdM/GNFDrnCwLnxBncVa2M
 KFFQ==
X-Gm-Message-State: AOAM532EbmFakaSPvINj/PFr9gHzw1VdJiPlP66eccJA7iFTeFwuGy6l
 Vws/RuRfa/5aGt4sgPFEsfZjpfcxAx8f8eRV/go=
X-Google-Smtp-Source: ABdhPJze7oIEeYIi3qHqvNrBOpC+olgnvxTUVYAamQdfs1Uaa+hGI/tm7xUJTosX/+suznweCG7l0UjT8opdS6NXl1U=
X-Received: by 2002:ab0:3c48:: with SMTP id u8mr1842347uaw.30.1642056865506;
 Wed, 12 Jan 2022 22:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
 <20220107222613.4124764-2-james.hilliard1@gmail.com>
In-Reply-To: <20220107222613.4124764-2-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 13 Jan 2022 07:52:16 +0100
Message-ID: <CAKcgs2wsGLK8M9RC6JK16pXqPJPg7vxfkL8iQY98CucCiVKdzw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/5] package/sord: new package
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
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbAoKTGUgdmVuLiA3IGphbnYuIDIwMjIgw6AgMjM6MjYsIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAg
REVWRUxPUEVSUyAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4gICAgICB8
ICAxICsKPiAgcGFja2FnZS9zb3JkL0NvbmZpZy5pbiB8ICA4ICsrKysrKysrCj4gIHBhY2thZ2Uv
c29yZC9zb3JkLmhhc2ggfCAgNCArKysrCj4gIHBhY2thZ2Uvc29yZC9zb3JkLm1rICAgfCAyNSAr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb3JkL0NvbmZpZy5pbgo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb3JkL3NvcmQuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9zb3JkL3NvcmQubWsKPgo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVW
RUxPUEVSUwo+IGluZGV4IGQ5OWQ3Nzk4ZGIuLmJjNTRhYjU5MGMgMTAwNjQ0Cj4gLS0tIGEvREVW
RUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTMwMCw2ICsxMzAwLDcgQEAgRjogICAg
ICAgIHBhY2thZ2UvcHl0aG9uLXdlYXN5cHJpbnQvCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi15
YXJsLwo+ICBGOiAgICAgcGFja2FnZS9weXRob24tem9wZmxpLwo+ICBGOiAgICAgcGFja2FnZS9z
ZXJkLwo+ICtGOiAgICAgcGFja2FnZS9zb3JkLwo+ICBGOiAgICAgcGFja2FnZS96Y2h1bmsvCj4K
PiAgTjogICAgIEphbWVzIEtuaWdodCA8amFtZXMua25pZ2h0QGNvbGxpbnMuY29tPgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggMThh
ZTIyZjIyNy4uNjEzM2Q2Y2UzMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsr
KyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTE3MDUsNiArMTcwNSw3IEBAIG1lbnUgIkpTT04v
WE1MIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3JhcGlkeG1sL0NvbmZpZy5pbiIKPiAgICAg
ICAgIHNvdXJjZSAicGFja2FnZS9yYXB0b3IvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJw
YWNrYWdlL3NlcmQvQ29uZmlnLmluIgo+ICsgICAgICAgc291cmNlICJwYWNrYWdlL3NvcmQvQ29u
ZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3Rpbnl4bWwvQ29uZmlnLmluIgo+ICAg
ICAgICAgc291cmNlICJwYWNrYWdlL3Rpbnl4bWwyL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJj
ZSAicGFja2FnZS92YWxpanNvbi9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc29y
ZC9Db25maWcuaW4gYi9wYWNrYWdlL3NvcmQvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45MWRmYjQxZDBiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2Uvc29yZC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDggQEAKPiArY29uZmlnIEJSMl9Q
QUNLQUdFX1NPUkQKPiArICAgICAgIGJvb2wgInNvcmQiCj4gKyAgICAgICBzZWxlY3QgQlIyX1BB
Q0tBR0VfU0VSRAo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBTb3JkIGlzIGEgbGlnaHR3ZWln
aHQgQyBsaWJyYXJ5IGZvciBzdG9yaW5nIFJERiBkYXRhIGluCj4gKyAgICAgICAgIG1lbW9yeS4K
PiArCj4gKyAgICAgICAgIGh0dHBzOi8vZHJvYmlsbGEubmV0L3NvZnR3YXJlL3NvcmQuaHRtbAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NvcmQvc29yZC5oYXNoIGIvcGFja2FnZS9zb3JkL3NvcmQu
aGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYWYxNzVmOTFm
MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3NvcmQvc29yZC5oYXNoCj4gQEAgLTAs
MCArMSw0IEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHNpZ25hdHVy
ZQo+ICsjIGh0dHBzOi8vZG93bmxvYWQuZHJvYmlsbGEubmV0L3NvcmQtMC4xNi44LnRhci5iejIu
YXNjCj4gK3NoYTI1NiAgN2MyODlkMmVhYWJmODJmYTZhYzIxOTEwN2NlNjMyZDcwNDY3MmRjZmI5
NjZlMWE3ZmYwYmJjNGNlOTNmNWUxNCAgc29yZC0wLjE2LjgudGFyLmJ6Mgo+ICtzaGEyNTYgIGUw
NjU2MmQ2YmNmMDM0MWIyYWMyYWQwZjBjYTM2ODAxZDJlYmYzODhkNWVmMjk3MDExNjI1ZTRjMzZl
OTYzZjAgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zb3JkL3NvcmQubWsgYi9wYWNr
YWdlL3NvcmQvc29yZC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uZjgwNTgwNWU5ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3NvcmQvc29yZC5t
awo+IEBAIC0wLDAgKzEsMjUgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsj
IHNvcmQKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArU09SRF9WRVJTSU9O
ID0gMC4xNi44Cj4gK1NPUkRfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQuZHJvYmlsbGEubmV0Cj4g
K1NPUkRfU09VUkNFID0gc29yZC0kKFNPUkRfVkVSU0lPTikudGFyLmJ6Mgo+ICtTT1JEX0xJQ0VO
U0UgPSBJU0MKPiArU09SRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICtTT1JEX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcGtnY29uZiBzZXJkCj4gK1NPUkRfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4g
Kwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1BDUkUpLHkpCj4gK1NPUkRfREVQRU5ERU5DSUVTICs9
IHBjcmUKPiArZW5kaWYKPiArCj4gK1NPUkRfQ09ORl9PUFRTICs9IC0tbm8tY292ZXJhZ2UKPiAr
Cj4gK2lmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICtTT1JEX0NPTkZfT1BUUyArPSAtLXN0
YXRpYyAtLW5vLXNoYXJlZCAtLXN0YXRpYy1wcm9ncwo+ICtlbmRpZgo+ICsKPiArJChldmFsICQo
d2FmLXBhY2thZ2UpKQo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKUmFuIGNvbXBpbGF0aW9uIHRlc3Qgb24gYXJtNjQgd2l0aCBleHRl
cm5hbCB0b29sY2hhaW4uCkFsc28gcmFuIHRoZSB0ZXN0LXBrZyB1dGlsaXR5LgoKVGVzdGVkLWJ5
OiBHaWxsZXMgVGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
