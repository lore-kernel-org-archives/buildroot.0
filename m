Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8380C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 07:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5352C60EAF;
	Thu, 13 Jan 2022 07:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4LQYaIYCmpL; Thu, 13 Jan 2022 07:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ECD760BE6;
	Thu, 13 Jan 2022 07:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 871691BF860
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 07:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8158A41643
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 07:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tt9YbQrFQJ7P for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 07:02:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77BF54163E
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 07:02:44 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id m90so9421239uam.2
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 23:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+37t1cB+XMwCUFaqd6RthoBiR2gQyaxxOpR0posmlns=;
 b=YfNoctrVMmosIF7MpH+jygHCFxJtodXTE2igVl3Ctdn8MJwCNBl3QkCxUu3j2SNpVQ
 0u2E+9VipckiIbP2hyJ4Gz68YISpISh5bkZvb7FoqBsFcQ3iJ99ov/yZ6FuCzPU06yCP
 1XkkTb2KfGbabet1AjoAxtsuXHhiLWTJTFBC/7PebRdk3y32zDOPD5qp5KYXpclFstiM
 B2DbYiCM3vCLzRJkyoJlhy4CaGeYwdADLI41VgbVGGiTJZxVQvvsGd4csvBqqASBCW4t
 1WdPzRHMchuUiBI/XCRnAQS/jqDiD7cOXY+uJAI1If04VN8AXyAFvFYkDSgNZsrcr0M5
 AXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+37t1cB+XMwCUFaqd6RthoBiR2gQyaxxOpR0posmlns=;
 b=vwbWUKRsYVH0gAIH3yNiuQGiCCIFwTTmIx4YcZk8j/OkItUS8S/Im/ixuXxMc8lk9h
 7oeCeQkXG8QdRuQyCpKNaKpI8llH6beNUF9W0ODVt1p1Lyk+gbl+PJfRmCOGjmZ7Jgcc
 ptDaAtBcn4PPexIkSkPzWN71fc7FsU/pHTRgIBMhAZ8MryxSH6tuwS9DlKvO1UghMEZh
 p4dHK1CBAgPPca9UhOdsZNi+SP7fZUSdVsJyP++JobaBCAlHHpnzhLTho0BjcWEHqs7R
 YH7VZ/q3azOf8sv9uEz1JCYf0T8smJQFEZAx4KbvYjtoG3Qfvvti79/lgsTuS+V8JhYO
 ZfNw==
X-Gm-Message-State: AOAM532PKzWnsX5U4b35AaWvceuxb8y03pQBG1c52MLURRVwI88zoVHk
 jH1DGAst60buQvj/gcryapA4j+/NYsEiBxBS+sc=
X-Google-Smtp-Source: ABdhPJyfOvAEEGjGjqM+ypkYgvB0/7uQ7SqTija9rPwNSpZ0fuNlr8kittjVkv4qK5z0HQdiDVZVliGq+fVI+5KUPnE=
X-Received: by 2002:a67:c98c:: with SMTP id y12mr1649880vsk.54.1642057363371; 
 Wed, 12 Jan 2022 23:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
 <20220107222613.4124764-5-james.hilliard1@gmail.com>
In-Reply-To: <20220107222613.4124764-5-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 13 Jan 2022 08:00:34 +0100
Message-ID: <CAKcgs2yy-PwKBTAoPb7EEC1e-0W4gYmTMw0AFvaKLZptOZbcQQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 5/5] package/lilv: new package
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

SGkgSmFtZXMsIGFsbAoKTGUgdmVuLiA3IGphbnYuIDIwMjIgw6AgMjM6MjcsIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAg
REVWRUxPUEVSUyAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4gICAgICB8
ICAxICsKPiAgcGFja2FnZS9saWx2L0NvbmZpZy5pbiB8IDExICsrKysrKysrKysrCj4gIHBhY2th
Z2UvbGlsdi9saWx2Lmhhc2ggfCAgNCArKysrCj4gIHBhY2thZ2UvbGlsdi9saWx2Lm1rICAgfCAz
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwg
NTEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWx2L0NvbmZp
Zy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWx2L2xpbHYuaGFzaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWx2L2xpbHYubWsKPgo+IGRpZmYgLS1naXQgYS9ERVZF
TE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGY4YWE4MDkyOTQuLmMyMTRhYmUyMDkgMTAwNjQ0
Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTI1NCw2ICsxMjU0
LDcgQEAgRjogICAgICAgIHBhY2thZ2UvZXhmYXRwcm9ncy8KPiAgRjogICAgIHBhY2thZ2UvZ2Vu
c2lvLwo+ICBGOiAgICAgcGFja2FnZS9sdWEtc3RkLWRlYnVnLwo+ICBGOiAgICAgcGFja2FnZS9s
dWEtc3RkLW5vcm1hbGl6ZS8KPiArRjogICAgIHBhY2thZ2UvbGlsdi8KPiAgRjogICAgIHBhY2th
Z2UvbHYyLwo+ICBGOiAgICAgcGFja2FnZS9waXBld2lyZS8KPiAgRjogICAgIHBhY2thZ2UvcHl0
aG9uLWFpb2NvbnNvbGUvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiBpbmRleCA1MWE0MTgwNTY5Li4xY2YyYmI1MjE5IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTM1OCw2
ICsxMzU4LDcgQEAgbWVudSAiQXVkaW8vU291bmQiCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2Uv
bGlic291bmR0b3VjaC9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvbGlic294
ci9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvbGlidm9yYmlzL0NvbmZpZy5p
biIKPiArICAgICAgIHNvdXJjZSAicGFja2FnZS9saWx2L0NvbmZpZy5pbiIKPiAgICAgICAgIHNv
dXJjZSAicGFja2FnZS9sdjIvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL21w
NHYyL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9vcGVuYWwvQ29uZmlnLmlu
Igo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbHYvQ29uZmlnLmluIGIvcGFja2FnZS9saWx2L0Nv
bmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMDg2MTI1
Y2RjOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpbHYvQ29uZmlnLmluCj4gQEAg
LTAsMCArMSwxMSBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfTElMVgo+ICsgICAgICAgYm9vbCAi
bGlsdiIKPiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MVjIKPiArICAgICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9TRVJECj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfU09SRAo+ICsgICAg
ICAgc2VsZWN0IEJSMl9QQUNLQUdFX1NSQVRPTQo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBM
aWx2IGlzIGEgQyBsaWJyYXJ5IHRvIG1ha2UgdGhlIHVzZSBvZiBMVjIgcGx1Z2lucyBhcyBzaW1w
bGUKPiArICAgICAgICAgYXMgcG9zc2libGUgZm9yIGFwcGxpY2F0aW9ucy4KPiArCj4gKyAgICAg
ICAgIGh0dHBzOi8vZHJvYmlsbGEubmV0L3NvZnR3YXJlL2xpbHYuaHRtbAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpbHYvbGlsdi5oYXNoIGIvcGFja2FnZS9saWx2L2xpbHYuaGFzaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYWZhMjBmYzA4Mwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL2xpbHYvbGlsdi5oYXNoCj4gQEAgLTAsMCArMSw0IEBACj4g
KyMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHNpZ25hdHVyZQo+ICsjIGh0dHBz
Oi8vZG93bmxvYWQuZHJvYmlsbGEubmV0L2xpbHYtMC4yNC4xMi50YXIuYnoyLmFzYwo+ICtzaGEy
NTYgIDI2YTM3NzkwODkwYzljMWY4MzgyMDNiNDdmNWIyMzIwMzM0ZmU5MmMwMmE0ZDI2ZWJiZTI2
NjlkYmQ3NjkwNjEgIGxpbHYtMC4yNC4xMi50YXIuYnoyCj4gK3NoYTI1NiAgZTA2NTYyZDZiY2Yw
MzQxYjJhYzJhZDBmMGNhMzY4MDFkMmViZjM4OGQ1ZWYyOTcwMTE2MjVlNGMzNmU5NjNmMCAgQ09Q
WUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbHYvbGlsdi5tayBiL3BhY2thZ2UvbGlsdi9s
aWx2Lm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi42NTE1OTc5
NTNkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGlsdi9saWx2Lm1rCj4gQEAgLTAs
MCArMSwzNCBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgbGlsdgo+ICsj
Cj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtMSUxWX1ZFUlNJT04gPSAwLjI0LjEy
Cj4gK0xJTFZfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQuZHJvYmlsbGEubmV0Cj4gK0xJTFZfU09V
UkNFID0gbGlsdi0kKExJTFZfVkVSU0lPTikudGFyLmJ6Mgo+ICtMSUxWX0xJQ0VOU0UgPSBJU0MK
PiArTElMVl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICtMSUxWX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcGtnY29uZiBsdjIgc2VyZCBzb3JkIHNyYXRvbQo+ICtMSUxWX0lOU1RBTExfU1RBR0lORyA9
IFlFUwo+ICsKPiArTElMVl9DT05GX09QVFMgKz0gXAo+ICsgICAgICAgLS1keW4tbWFuaWZlc3Qg
XAo+ICsgICAgICAgLS1uby1iYXNoLWNvbXBsZXRpb24gXAo+ICsgICAgICAgLS1uby1jb3ZlcmFn
ZQo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9QWVRIT04zKSx5KQo+ICtMSUxWX0RFUEVOREVO
Q0lFUyArPSBweXRob24zCj4gK2Vsc2UKPiArTElMVl9DT05GX09QVFMgKz0gLS1uby1iaW5kaW5n
cwo+ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJTTkRGSUxFKSx5KQo+ICtM
SUxWX0RFUEVOREVOQ0lFUyArPSBsaWJzbmRmaWxlCj4gK2VuZGlmCj4gKwo+ICtpZmVxICgkKEJS
Ml9TVEFUSUNfTElCUykseSkKPiArTElMVl9DT05GX09QVFMgKz0gLS1zdGF0aWMgLS1uby1zaGFy
ZWQgLS1zdGF0aWMtcHJvZ3MKPiArZW5kaWYKPiArCj4gKyQoZXZhbCAkKHdhZi1wYWNrYWdlKSkK
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKClJhbiBjb21waWxhdGlvbiB0ZXN0IG9uIGFybTY0IHdpdGggZXh0ZXJuYWwgdG9vbGNoYWlu
LgpBbHNvIHJhbiB0aGUgdGVzdC1wa2cgdXRpbGl0eSB3aGljaCBkaWQgbm90IGdvIHRocm91Z2gg
Zm9yIHR3bwpjb25maWd1cmF0aW9ucyBkdWUgdG8gZGVwZW5kZW5jeSBmYWlsdXJlLgpCdXQ6ClRl
c3RlZC1ieTogR2lsbGVzIFRhbGlzIDxnaWxsZXMudGFsaXNAZ21haWwuY29tPgphbnl3YXkuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
