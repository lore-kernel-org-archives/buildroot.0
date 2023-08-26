Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DCBC83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E0281F40;
	Sat, 26 Aug 2023 19:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E0281F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzzHo9b2dpmO; Sat, 26 Aug 2023 19:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A60E981F76;
	Sat, 26 Aug 2023 19:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60E981F76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 419621BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F484021C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F484021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BS0owDhWr3oz for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:37:58 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC60D40201
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC60D40201
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40061928e5aso18340265e9.3
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 12:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693078677; x=1693683477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODNwc6M1TUCCg20YpVrQ14e20rHC21toONF1oiEgmJ8=;
 b=XB47ZW/5j+wBnkW+PqukVupKwJS5Ai4kLciswaM3F+MhCkqoaHpGRwKugablyJUrDO
 zgDpIXJewXZ7snP6u1MMPZDbL/Kr/pYtD+izzBiKmZMhyMMP83CSgRlSZLVrLcdzFSzT
 Z7rG6m0Kebe0REWa39Fhieo6pz6g8H42KFfVzCiPkxkrQegaP8KnlHy33+Xx7BekQ3Wk
 I6iu7azVagZkUgkYmelvbUIiDSovxoQZITNNoP+Gw8m0ISbpFjfLoA8lbsG6g5e/7leV
 9fN/wXr5nt/ycS8GTbeu9xLcAGtvzGgPRIzDD+8neCJbfwgcBEPIZwHk5/996xQkMTyu
 xmNA==
X-Gm-Message-State: AOJu0Yy+gO0nP4mAZRoDItBQ3zzXOwWDeqR5UyxqxWO0MK+VtTgzmus/
 86CRSByZxRwJoVo8Qnc33c5Ku9IZCFGuO/U7U6c=
X-Google-Smtp-Source: AGHT+IFh7wiVdzhcwF5aMZaqvUKJeSfTtP0DjgTwujbZUgIicXVnlP19Gggf/oANypM0IEQdnXLEQA==
X-Received: by 2002:a7b:c3c2:0:b0:3fe:df1:5b95 with SMTP id
 t2-20020a7bc3c2000000b003fe0df15b95mr17157396wmj.19.1693078676784; 
 Sat, 26 Aug 2023 12:37:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c231500b003fc0505be19sm5780428wmo.37.2023.08.26.12.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Aug 2023 12:37:56 -0700 (PDT)
Message-ID: <446b0d47-87c0-f113-20e4-8595e95b019b@smile.fr>
Date: Sat, 26 Aug 2023 21:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230825224911.3336831-1-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230825224911.3336831-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1693078677; x=1693683477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ODNwc6M1TUCCg20YpVrQ14e20rHC21toONF1oiEgmJ8=;
 b=PIQZm+ZcMK3EfLaLEdN3zcxJS0ufSSC/vbQjsEfeLsj2Wk2OIBeh2+38zXvA5Z50cK
 wyfCre9KtSaenMbO0ZYutzkoci8xcqdHvo/YZG9O+bx+RCNy1skMJxbAxHhdLAQIadNF
 wmdVa95bj96C35SZC4BHYZ2V9LEEnsuhpj3B5hiLatPukxtNuk+jcC5t0qaWdge0rud5
 Tt7FmQgslRzSQ52t84AilUs9dsErDKEnCqTzDJbA3BUtmjr6tcKu7hJYe7xBeC8Sa+u4
 q6hFNS3RalE54OdqP8juUwcqEvfsJsV2aacPhaPbMvQq0GO5dvejsFHnqpaOxrFBqsQs
 L7Vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=PIQZm+Zc
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: bump to version 8.1.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAyNi8wOC8yMDIzIMOgIDAwOjQ5LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IERyb3AgcGF0Y2ggd2hpY2ggaXMgbm93IHVwc3RyZWFtLgo+IAo+IFJlcGxhY2Ug
bm8gbG9uZ2VyIHN1cHBvcnRlZCAtLXdpdGgtZ2l0LXN1Ym1vZHVsZXMgY29uZmlnIG9wdGlvbiB3
aXRoCj4gbmV3IC0tZGlzYWJsZS1kb3dubG9hZCBvcHRpb24uCj4gCj4gUmVwbGFjZSBubyBsb25n
ZXIgc3VwcG9ydGVkIC0tbWVzb24gY29uZmlnIG9wdGlvbiB3aXRoIC0tcHl0aG9uIGNvbmZpZwo+
IG9wdGlvbi4gVGhlIGNvbmZpZ3VyZSBzY3JpcHQgZXhwZWN0cyAtLXB5dGhvbiB0byBwb2ludCB0
byB0aGUgcHl0aG9uCj4gaW50ZXJwcmV0ZXIgd2l0aCB0aGUgbWVzb24gaW5zdGFsbGF0aW9uLgoK
VGhlcmUgaXMgYSBncmVhdCBoZWxwIG9uIHRoZSBRZW11IENoYW5nZWxvZyBhYm91dCBhbnkgbmV3
IGJ1aWxkIGRlcGVuZGVuY2llczoKCmh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2cvOC4x
I0J1aWxkX0RlcGVuZGVuY2llcwoKTGlrZSBmb3IgdGhlIGphY2sgYmFja2VuZCwgSSB3b3VsZCBk
aXNhYmxlIHRoZSBwaXBld2lyZSBiYWNrZW5kIGZvciBob3N0LXFlbXUuClRoZSBwaXBld2lyZSBv
cHRpb25hbCBkZXBlbmRlbmN5IG11c3QgYmUgaGFuZGxlZCBmb3IgcWVtdSBmb3IgdGhlIHRhcmdl
dApvdGhlcndpc2UgdGhlIGJ1aWxkIGlzIG5vdCAicmVwcm9kdWNpYmxlIi4KCldoYXQgYWJvdXQg
dGhlIG5ldyBQeXRob24gYnVpbGQgZGVwZW5kZW5jaWVzIG9uIHB5dGhvbjMtdmVudiA/CgpJIGRp
ZCBhIHJ1bnRpbWUgdGVzdCBhcyBpcyBvbiBtb3N0IG9mIHFlbXUgZGVmY29uZmlnOgpodHRwczov
L2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy85ODI3OTQzNjIKCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4udGFsbC1rZXlib2FyZC1tYXBzLW9u
bHktaWYtbmVjZXNzYXJ5LnBhdGNoIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdl
L3FlbXUvcWVtdS5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdl
L3FlbXUvcWVtdS5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKy0tCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcWVtdS8wMDAzLW1lc29uLWluc3RhbGwta2V5Ym9hcmQtbWFwcy1v
bmx5LWlmLW5lY2Vzc2FyeS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvMDAw
My1tZXNvbi1pbnN0YWxsLWtleWJvYXJkLW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2ggYi9w
YWNrYWdlL3FlbXUvMDAwMy1tZXNvbi1pbnN0YWxsLWtleWJvYXJkLW1hcHMtb25seS1pZi1uZWNl
c3NhcnkucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA4YmE3ZjNjZjE1
Li4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9xZW11LzAwMDMtbWVzb24taW5zdGFsbC1rZXli
b2FyZC1tYXBzLW9ubHktaWYtbmVjZXNzYXJ5LnBhdGNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0x
LDM4ICswLDAgQEAKPiAtRnJvbSA5ZDliNzRmODA2ZjVkYmNhNTNkZjY2MzBjMWEwNTkxZWFlZGQ0
NTAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1Gcm9tOiBDYXJsb3MgU2FudG9zIDxjYXNh
bnRvc0ByZWRoYXQuY29tPgo+IC1EYXRlOiBTdW4sIDEgSmFuIDIwMjMgMjE6MDA6NTcgLTAzMDAK
PiAtU3ViamVjdDogW1BBVENIXSBtZXNvbjogaW5zdGFsbCBrZXlib2FyZCBtYXBzIG9ubHkgaWYg
bmVjZXNzYXJ5Cj4gLQo+IC1UaGV5IGFyZSByZXF1aXJlZCBvbmx5IGZvciBzeXN0ZW0gZW11bGF0
aW9uIChpLmUuIGhhdmVfc3lzdGVtIGlzIHRydWUpLgo+IC0KPiAtVXBzdHJlYW06IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNoLzIwMjMwMzI3MTcy
MTQ3LjE5NjYwNy0xLWNhc2FudG9zQHJlZGhhdC5jb20vCj4gLVNpZ25lZC1vZmYtYnk6IENhcmxv
cyBTYW50b3MgPGNhc2FudG9zQHJlZGhhdC5jb20+Cj4gLVNpZ25lZC1vZmYtYnk6IENhcmxvcyBT
YW50b3MgPHVuaXhtYW5pYUBnbWFpbC5jb20+Cj4gLS0tLQo+IC0gcGMtYmlvcy9rZXltYXBzL21l
c29uLmJ1aWxkIHwgNiArKysrLS0KPiAtIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gLQo+IC1kaWZmIC0tZ2l0IGEvcGMtYmlvcy9rZXltYXBzL21lc29u
LmJ1aWxkIGIvcGMtYmlvcy9rZXltYXBzL21lc29uLmJ1aWxkCj4gLWluZGV4IDE1OGEzYjQxMGMu
LmJmZjMwODMzMTMgMTAwNjQ0Cj4gLS0tLSBhL3BjLWJpb3Mva2V5bWFwcy9tZXNvbi5idWlsZAo+
IC0rKysgYi9wYy1iaW9zL2tleW1hcHMvbWVzb24uYnVpbGQKPiAtQEAgLTQ3LDcgKzQ3LDcgQEAg
aWYgbmF0aXZlX3FlbXVfa2V5bWFwLmZvdW5kKCkKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
YnVpbGRfYnlfZGVmYXVsdDogdHJ1ZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0
OiBrbSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgY29tbWFuZDogW25hdGl2ZV9xZW11X2tl
eW1hcCwgJy1mJywgJ0BPVVRQVVRAJywgYXJncy5zcGxpdCgpXSwKPiAtLSAgICAgICAgICAgICAg
ICAgICAgICAgaW5zdGFsbDogdHJ1ZSwKPiAtKyAgICAgICAgICAgICAgICAgICAgICAgaW5zdGFs
bDogaGF2ZV9zeXN0ZW0sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgIGluc3RhbGxfZGlyOiBx
ZW11X2RhdGFkaXIgLyAna2V5bWFwcycpCj4gLSAgIGVuZGZvcmVhY2gKPiAtIAo+IC1AQCAtNTYs
NCArNTYsNiBAQCBlbHNlCj4gLSAgIGluc3RhbGxfZGF0YShrZXltYXBzLmtleXMoKSwgaW5zdGFs
bF9kaXI6IHFlbXVfZGF0YWRpciAvICdrZXltYXBzJykKPiAtIGVuZGlmCj4gLSAKPiAtLWluc3Rh
bGxfZGF0YShbJ3NsJywgJ3N2J10sIGluc3RhbGxfZGlyOiBxZW11X2RhdGFkaXIgLyAna2V5bWFw
cycpCj4gLStpZiBoYXZlX3N5c3RlbQo+IC0rICBpbnN0YWxsX2RhdGEoWydzbCcsICdzdiddLCBp
bnN0YWxsX2RpcjogcWVtdV9kYXRhZGlyIC8gJ2tleW1hcHMnKQo+IC0rZW5kaWYKPiAtLS0gCj4g
LTIuMzEuMQo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUuaGFzaCBiL3BhY2th
Z2UvcWVtdS9xZW11Lmhhc2gKPiBpbmRleCBlNzE3NDJjMjQzLi41MDZhZmE4YmYzIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lmhhc2gKPiArKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5o
YXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICMgTG9jYWxseSBjb21wdXRlZCwgdGFyYmFsbCB2ZXJp
ZmllZCB3aXRoIEdQRyBzaWduYXR1cmUKPiAtc2hhMjU2ICBlY2Y0ZDMyY2JlZjlkMzk3YmZjOGNj
NTBlNGQxZTkyYTFiMzAyNTNiZjMyZThlZTczYzdhOGRjZjlhMjMyYjA5ICBxZW11LTguMC4zLnRh
ci54ego+ICtzaGEyNTYgIDcxMGMxMDExOThlMzM0ZDQ3NjJlZWY2NWY2NDliYzQzZmE4YTVkZDc1
MzAzNTU0YjhhY2ZlYzNlYjI1ZjBlNTUgIHFlbXUtOC4xLjAudGFyLnh6Cj4gIHNoYTI1NiAgNmYw
NGFlODM2NGQwMDc5YTE5MmIxNDYzNWY0YjFkYTI5NGNlMTg3MjRjMDM0YzM5YTZhNDFkMWIwOWRm
NjEwMCAgQ09QWUlORwo+ICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBl
NTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcuTElCCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBpbmRleCBi
MzQxZDAyMjBkLi44NDE2Njk1OGJiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1r
Cj4gKysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBAQCAtNiw3ICs2LDcgQEAKPiAgCj4gICMg
V2hlbiB1cGRhdGluZyB0aGUgdmVyc2lvbiwgY2hlY2sgd2hldGhlciB0aGUgbGlzdCBvZiBzdXBw
b3J0ZWQgdGFyZ2V0cwo+ICAjIG5lZWRzIHRvIGJlIHVwZGF0ZWQuCj4gLVFFTVVfVkVSU0lPTiA9
IDguMC4zCj4gK1FFTVVfVkVSU0lPTiA9IDguMS4wCj4gIFFFTVVfU09VUkNFID0gcWVtdS0kKFFF
TVVfVkVSU0lPTikudGFyLnh6Cj4gIFFFTVVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQucWVtdS5v
cmcKPiAgUUVNVV9MSUNFTlNFID0gR1BMLTIuMCwgTEdQTC0yLjEsIE1JVCwgQlNELTMtQ2xhdXNl
LCBCU0QtMi1DbGF1c2UsIE90aGVycy9CU0QtMWMKPiBAQCAtMjcyLDcgKzI3Miw3IEBAIGRlZmlu
ZSBRRU1VX0NPTkZJR1VSRV9DTURTCj4gIAkJCS0tcHJlZml4PS91c3IgXAo+ICAJCQktLWNyb3Nz
LXByZWZpeD0kKFRBUkdFVF9DUk9TUykgXAo+ICAJCQktLWF1ZGlvLWRydi1saXN0PSBcCj4gLQkJ
CS0tbWVzb249JChIT1NUX0RJUikvYmluL21lc29uIFwKPiArCQkJLS1weXRob249JChIT1NUX0RJ
UikvYmluL3B5dGhvbjMgXAo+ICAJCQktLW5pbmphPSQoSE9TVF9ESVIpL2Jpbi9uaW5qYSBcCj4g
IAkJCS0tZGlzYWJsZS1hbHNhIFwKPiAgCQkJLS1kaXNhYmxlLWJwZiBcCj4gQEAgLTMxMyw3ICsz
MTMsNyBAQCBkZWZpbmUgUUVNVV9DT05GSUdVUkVfQ01EUwo+ICAJCQktLWVuYWJsZS1hdHRyIFwK
PiAgCQkJLS1lbmFibGUta3ZtIFwKPiAgCQkJLS1lbmFibGUtdmhvc3QtbmV0IFwKPiAtCQkJLS13
aXRoLWdpdC1zdWJtb2R1bGVzPWlnbm9yZSBcCj4gKwkJCS0tZGlzYWJsZS1kb3dubG9hZCBcCj4g
IAkJCS0tZGlzYWJsZS1oZXhhZ29uLWlkZWYtcGFyc2VyIFwKPiAgCQkJJChRRU1VX09QVFMpCj4g
IGVuZGVmCj4gQEAgLTQ1OCw3ICs0NTgsNyBAQCBkZWZpbmUgSE9TVF9RRU1VX0NPTkZJR1VSRV9D
TURTCj4gIAkJLS1ob3N0LWNjPSIkKEhPU1RDQykiIFwKPiAgCQktLWV4dHJhLWNmbGFncz0iJChI
T1NUX1FFTVVfQ0ZMQUdTKSIgXAo+ICAJCS0tZXh0cmEtbGRmbGFncz0iJChIT1NUX0xERkxBR1Mp
IiBcCj4gLQkJLS1tZXNvbj0kKEhPU1RfRElSKS9iaW4vbWVzb24gXAo+ICsJCS0tcHl0aG9uPSQo
SE9TVF9ESVIpL2Jpbi9weXRob24zIFwKPiAgCQktLW5pbmphPSQoSE9TVF9ESVIpL2Jpbi9uaW5q
YSBcCj4gIAkJLS1kaXNhYmxlLWFsc2EgXAo+ICAJCS0tZGlzYWJsZS1icGYgXAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
