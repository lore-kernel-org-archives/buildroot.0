Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33567C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26C1401E2;
	Mon, 12 Dec 2022 16:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26C1401E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX7DUUlCJbkx; Mon, 12 Dec 2022 16:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787DC40200;
	Mon, 12 Dec 2022 16:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787DC40200
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0A91BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27BA84016B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27BA84016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FqURp_wQ_l7 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 16:34:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E550040101
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E550040101
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 16:34:57 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3bf4ade3364so154355547b3.3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufrkt5ODjEcrpJ9m6+n7KmDOeuAg52itbolkYt0BDO0=;
 b=G6npnJsXVQJMBGpmi1LFqfTR5x5LIkHz36dY9wk7UzkpBoDY35D33+qb34IfDkwaHj
 LeyTy6P6gDhCk7f2b1VLp5fIhtUvCLdBAh3hgS4/xWMzr9Gcbed8Tj4DFm0C9S3XHDld
 FLe/M+pKTNrI997IqnJno0/FPSk+Hk0sWhtciq3q08ySjmZ3qbryRmkEX7HKUKosnjoh
 fXlrhY5zMzwRO4ZDPVcrhd+QZ1ffjDSwPPrOzGik0HKXRemyZuysBaHynniJkXKZFvHQ
 YWZNwbSxZzWlOiyj5UtOq/+5X2yTaKsGkWnjHZ4NjQXN9eVP3a1Kz3Xe+Yu+YcJGylng
 I/8w==
X-Gm-Message-State: ANoB5pl3BhiCtyEvRGz12nDdD674Ar2atnNujN8jMKFYX9+ELAAjWUJ5
 SdRzp0tWa6MX7W0zdXO99XJhnZXnC/FHtj+n/pY=
X-Google-Smtp-Source: AA0mqf5W1KaquSafYDjcjgQwAf5W3I7UT4azHuGa1T+w+qneTrIg4ZArp8aAISqeflcE6RpEaNdtBEnKKuUFuJvkAkw=
X-Received: by 2002:a81:b807:0:b0:3b3:3f1d:8623 with SMTP id
 v7-20020a81b807000000b003b33f1d8623mr1695098ywe.96.1670862896713; Mon, 12 Dec
 2022 08:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20221212154111.2865211-1-james.hilliard1@gmail.com>
In-Reply-To: <20221212154111.2865211-1-james.hilliard1@gmail.com>
Date: Mon, 12 Dec 2022 17:34:44 +0100
Message-ID: <CAGm1_kuuA1ALfwNkrUdnCwOoS2CaGjSjywyTJJ+oXNMzucbRig@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufrkt5ODjEcrpJ9m6+n7KmDOeuAg52itbolkYt0BDO0=;
 b=MTuu7/AjfhN4vgvGQnNhCG292uDLMjZw0EkvKRJ9DdXE2LNn8e+gRW+5s09W94hj7t
 3yDSabVyeCfseTr189zwK4I+MODhXEqxr9RyjHMP+aWGriBReNbbxAubDMV7sBM97zjH
 VDz0wiJEN6sSy4JdGwsT/skjQuGnr4hHXdjewIaUvzogulMNRr8UZBc54XIWjd2O2G3l
 QjXrabS2ZZ3kMNLNoDl1tXnt9bW0XHvZKkrbFxY5r+qy0xmo1uiXwHYGWr9C9Q5L9W95
 hmNXoIjbIjiE6EtnqI+hRYEh45PvAUUCYuyRRuPB6VI8QoSkCaFvb0FLcNpOkxpY59yD
 7x/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MTuu7/Aj
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-bunch: remove package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgNDo0NiBQTSBKYW1lcyBIaWxsaWFyZAo8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB0aGUgcHl0aG9uMyBidW1wIHRvIHZl
cnNpb24gMy4xMSBpbiBjb21taXQKPiA3Mzg1MDBjMjk2YzhiMTIwNmYyMGU5NGNhM2U3YzU5MzJh
NmEwNDg2IHB5dGhvbi1idW5jaCBoYXMgZmFpbGVkCj4gdG8gYnVpbGQuCj4KPiBUaGlzIGlzIGR1
ZSB0byBvcGVuKCkgd2hpY2ggbm8gbG9uZ2VyIGFjY2VwdHMgJ1UnICjigJx1bml2ZXJzYWwKPiBu
ZXdsaW5l4oCdKSBpbiB0aGUgZmlsZSBtb2RlLgo+Cj4gUmVtb3ZlIHRoaXMgcGFja2FnZSBhcyBp
dCBoYXMgbm90IGhhZCBhIHJlbGVhc2Ugc2luY2UgMjAxMSBhbmQKPiBpcyB1bm1haW50YWluZWQg
dXBzdHJlYW0uCj4KPiBEZXRhaWxzOgo+IGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuMTEvd2hh
dHNuZXcvMy4xMS5odG1sI3BvcnRpbmctdG8tcHl0aG9uLTMtMTEKPgo+IEZpeGVzOgo+ICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzJiYS8yYmE3MmZjOTgzNzYwNWEz
NmVhNjNiYmQzZTZlMTgxYTQwY2RmMzYwCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBZZWdvciBZZWZyZW1v
diA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6
Cj4gICAtIGFkZCBjb21tZW50IGFib3V0IHB5dGhvbi1tdW5jaCByZXBsYWNlbWVudAo+IC0tLQo+
ICBDb25maWcuaW4ubGVnYWN5ICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIHBhY2thZ2Uv
Q29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBwYWNrYWdlL3B5dGhvbi1i
dW5jaC9Db25maWcuaW4gICAgICAgICB8ICA2IC0tLS0tLQo+ICBwYWNrYWdlL3B5dGhvbi1idW5j
aC9weXRob24tYnVuY2guaGFzaCB8ICA1IC0tLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5
dGhvbi1idW5jaC5tayAgIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCj4KPiBkaWZmIC0tZ2l0IGEvQ29uZmln
LmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPiBpbmRleCAyOGM2ODIyNjg5Li42YzI5NjFj
NGY5IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbi5sZWdhY3kKPiArKysgYi9Db25maWcuaW4ubGVn
YWN5Cj4gQEAgLTE0Niw2ICsxNDYsMTMgQEAgZW5kaWYKPgo+ICBjb21tZW50ICJMZWdhY3kgb3B0
aW9ucyByZW1vdmVkIGluIDIwMjMuMDIiCj4KPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9C
VU5DSAo+ICsgICAgICAgYm9vbCAicHl0aG9uLWJ1bmNoIHJlbW92ZWQiCj4gKyAgICAgICBzZWxl
Y3QgQlIyX0xFR0FDWQo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBUaGUgcHl0aG9uLWJ1bmNo
IHBhY2thZ2UgaXMgdW5tYWludGFpbmVkIGFuZCBpcyByZXBsYWNlZAo+ICsgICAgICAgICBieSB0
aGUgcHl0aG9uLW11bmNoIHBhY2thZ2UuCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9O
X00yUgo+ICAgICAgICAgYm9vbCAicHl0aG9uLW0yciByZW1vdmVkIgo+ICAgICAgICAgc2VsZWN0
IEJSMl9MRUdBQ1kKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRl
eCBmMGRjYzQyZGU3Li4wYzM3NzM2OTVhIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysg
Yi9ERVZFTE9QRVJTCj4gQEAgLTIwMTcsNyArMjAxNyw2IEBAIEY6ICAgICAgICBwYWNrYWdlL3Bv
bGljeWNvcmV1dGlscy8KPiAgRjogICAgIHBhY2thZ2UvcHJvZnRwZC8KPiAgRjogICAgIHBhY2th
Z2UvcHJvdG9idWYtYy8KPiAgRjogICAgIHBhY2thZ2UvcHJvdG9idWYvCj4gLUY6ICAgICBwYWNr
YWdlL3B5dGhvbi1idW5jaC8KPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWNvbG9yYW1hLwo+ICBG
OiAgICAgcGFja2FnZS9weXRob24tZmlsZWxvY2svCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi1m
bGFzay1jb3JzLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29u
ZmlnLmluCj4gaW5kZXggOTE0YzM1ODRlOS4uN2YwYzM0NTE5YSAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTk3OSw3ICs5Nzks
NiBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiAgICAgICAgIHNvdXJjZSAicGFj
a2FnZS9weXRob24tYm90dGxlL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9w
eXRob24tYnJvdGxpL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24t
YnNkaWZmNC9Db25maWcuaW4iCj4gLSAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWJ1bmNo
L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY2FjaGVkLXByb3Bl
cnR5L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY2FuL0NvbmZp
Zy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY2Fub3Blbi9Db25maWcuaW4i
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
cHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDg5ZWFlNzQyYjguLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9Db25m
aWcuaW4KPiArKysgL2Rldi9udWxsCj4gQEAgLTEsNiArMCwwIEBACj4gLWNvbmZpZyBCUjJfUEFD
S0FHRV9QWVRIT05fQlVOQ0gKPiAtICAgICAgIGJvb2wgInB5dGhvbi1idW5jaCIKPiAtICAgICAg
IGhlbHAKPiAtICAgICAgICAgQSBkb3QtYWNjZXNzaWJsZSBkaWN0aW9uYXJ5IChhIGxhIEphdmFT
Y3JpcHQgb2JqZWN0cykuCj4gLQo+IC0gICAgICAgICBodHRwOi8vZ2l0aHViLmNvbS9kc2MvYnVu
Y2gKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2gg
Yi9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaAo+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IGNmZGUyZGI2MDMuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw1
ICswLDAgQEAKPiAtIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9idW5j
aC9qc29uCj4gLW1kNSAgMGE4MjlkNjRlOTVlZDk2ZGVmYmNhZTJiZjkwNjFiYjAgIGJ1bmNoLTEu
MC4xLnRhci5nego+IC1zaGEyNTYgIDUwYzc3YTBmYzBjYjM3MmRmZTQ4YjVlMTE5MzdkNWY3MGU3
NDNhZGJmNDI2ODNmM2E2ZDI4NTc2NDVhNzZhYWEgIGJ1bmNoLTEuMC4xLnRhci5nego+IC0jIExv
Y2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+IC1zaGEyNTYgIDU3Y2E5NWM5MjA1OWM4
MzgwNjI1MTkyNDYyOTc5YmQzMjk5NGFhZTNmY2RmOTAyZmY2ZWIxZTQ2N2VlYjA0NjkgIExJQ0VO
U0UudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5t
ayBiL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5tawo+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDE4ZmRjMjIzYmIuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMTQg
KzAsMCBAQAo+IC0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IC0jCj4gLSMgcHl0aG9uLWJ1bmNo
Cj4gLSMKPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAtCj4gLVBZVEhPTl9CVU5DSF9WRVJT
SU9OID0gMS4wLjEKPiAtUFlUSE9OX0JVTkNIX1NPVVJDRSA9IGJ1bmNoLSQoUFlUSE9OX0JVTkNI
X1ZFUlNJT04pLnRhci5nego+IC1QWVRIT05fQlVOQ0hfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lZi9iZi9hNGNmMTc3OWE0ZmZiNGY2MTA5MDNmYTA4ZTE1
ZDFmNGE4YTJmNGUzMzUzYTAyYWZiZTA5N2M1YmY0YTgKPiAtUFlUSE9OX0JVTkNIX1NFVFVQX1RZ
UEUgPSBzZXR1cHRvb2xzCj4gLVBZVEhPTl9CVU5DSF9MSUNFTlNFID0gTUlUCj4gLVBZVEhPTl9C
VU5DSF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKPiAtCj4gLSQoZXZhbCAkKHB5dGhvbi1w
YWNrYWdlKSkKPiAtLQo+IDIuMzQuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
