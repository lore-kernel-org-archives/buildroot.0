Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F559C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 20:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE13F40465;
	Sun, 15 May 2022 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_Lk1tiJz_QN; Sun, 15 May 2022 20:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD53A40236;
	Sun, 15 May 2022 20:31:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 588131BF419
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 20:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46B4C60FCC
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 20:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dncWD_XtuGAk for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 20:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A56860B4E
 for <buildroot@buildroot.org>; Sun, 15 May 2022 20:31:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e29so8409970wrc.11
 for <buildroot@buildroot.org>; Sun, 15 May 2022 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SMperordkRIzOfhkYM6kaDteaLPDoz0lsQnBG+H7efg=;
 b=VBFZFZv2LmnEeJ0fxP+V6Q+ghFQFBf6C3V2WQzIMYfQBk5xB88YBIXVclsjEOSZpCJ
 eYXKWNLQMBLIA9RJ+ye3c/n+GgJNVpxDvuE0UPfvDEPL5LoYe0p1zCf36ilXze1zmV9E
 dFCANLobQMO4DuwF/ui//gdInf99OUfgwtdmeMOfkpp0IAms8Wy7vs1VKlRgk4OOrEu9
 m/3dOfwimdYmr9rTCrlnDnn7irL4/K3rHPo9lvE8eWqvYnACWHw6YMA31fZPdn4HrF9j
 7fa+Iql/3ajWnT+U860zuux+i7+Rd7tkCkrV4RP11a5KzlsTqMVOn7pFfUVDvzy5zyHJ
 AQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SMperordkRIzOfhkYM6kaDteaLPDoz0lsQnBG+H7efg=;
 b=aR596RD7ctdvc5d6BIkM12zmG2AObG3HZidOI2neC7qnkBKqYcIc619PQUn2+8Ku8Q
 g+vDLqydLyKi2L6uOPqhcRNvqLiaby65aEh8JF/ha/W2Zje209p8Hqqa+IjVALolTmBT
 oQBebPbBIM2qx0lCihnwY/h6b4/Bx8url8scWWoMDV66M4RHMk+N/rE6XjFqhkkVhes7
 PIYvKHAzi8Za9/m5e8tMm0ckRf+ldcnnES3H9O1xOkVGq6XDrBEnuZrS4qHepD3VDbpM
 DV7CPo86I7pJGztHMjiApGfnsCqBnD+wAyQnyz3i6sZoD0K7VjHOGw20XsO1Z2EEle1o
 bFpw==
X-Gm-Message-State: AOAM5338lngpE8y8HJd7s8wiOx8oRAY6JSVaz+5yFHffZUbo9Ef2Wo3u
 ZeDIln3N8DPMXOntLTOqZ90=
X-Google-Smtp-Source: ABdhPJzro+dU1yllMAZE7mcUTatMX89Drp5rPOlbWW74t3SqsIevMUlq6nKW9JSqsElhOrRokniywg==
X-Received: by 2002:adf:f58f:0:b0:20d:782:8b19 with SMTP id
 f15-20020adff58f000000b0020d07828b19mr2529557wro.510.1652646676620; 
 Sun, 15 May 2022 13:31:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c480600b003942a244f40sm10861071wmo.25.2022.05.15.13.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 May 2022 13:31:16 -0700 (PDT)
Message-ID: <227b2afd-d719-c9db-9ea6-a5667119bd4c@gmail.com>
Date: Sun, 15 May 2022 22:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220515110341.173923-1-romain.naour@gmail.com>
 <CADvTj4rsObRzgSQZcK9FJ7nyTg1DCCFfiaOQ21e7-S9227px1g@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CADvTj4rsObRzgSQZcK9FJ7nyTg1DCCFfiaOQ21e7-S9227px1g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-buildroot: error if no
 libc available
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTUvMDUvMjAyMiDDoCAyMTozMiwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTCoDoKPiBPbiBT
dW4sIE1heSAxNSwgMjAyMiBhdCA1OjA0IEFNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEVhY2ggbGliYyBhdmFpbGFibGUgaW4gQnVpbGRyb290IHRv
IGJ1aWxkIGFuIGludGVybmFsIHRvb2xjaGFpbiBoYXZlCj4+IGRlcGVuZGVuY2llcyAoYXJjaGl0
ZWN0dXJlLCBzdGF0aWMgYnVpbGQgb25seSwgbW11IG9ubHkgZXRjLi4uKS4KPj4KPj4gRm9yIGV4
YW1wbGVzLCB1Q2xpYmMtbmcgaXMgdGhlIG9ubHkgdG9vbGNoYWluIHRoYXQgc3VwcG9ydCBzdGF0
aWMgb25seQo+PiBidWlsZHMuIEJ1dCBzaW5jZSB1Q2xpYmMtbmcgZG9lc24ndCBzdXBwb3J0IGFs
bCBhcmNoaXRlY3R1cmUgYXZhaWxhYmxlCj4+IGluIEJ1aWxkcm9vdCAobmlvczIsIHJpc2N2KSwg
d2UgbXVzdCBwcmV2ZW50IHNlbGVjdGluZyBzdGF0aWMgb25seQo+PiBjb25maWd1cmF0aW9uIChC
UjJfU1RBVElDX0xJQlMpIG9uIHN1Y2ggYXJjaGl0ZWN0dXJlcy4KPj4KPj4gRm9yIHN1Y2ggYnJv
a2VuIGNvbmZpZ3VyYXRpb24sIHdlIGNhbiBzdGFydCBidWlsZGluZyBhIHRvb2xjaGFpbiBieQo+
PiBidWlsZGluZyBob3N0LWJpbnV0aWxzIGFuZCBob3N0LWdjYy1maW5hbCB3aXRob3V0IGJ1aWxk
aW5nCj4+IGhvc3QtZ2NjLWluaXRpYWwsIGxpbnV4LWhlYWRlcnMgYW5kIHVjbGliYyBwYWNrYWdl
Lgo+Pgo+PiBUaGUgYnVpbGQgZmFpbCBkdXJpbmcgaG9zdC1nY2MtZmluYWwgYnVpbGQgd2l0aCB0
aGUgZm9sbG93aW5nIGVycm9yOgo+Pgo+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vLi4v
bGliZ2NjL2xpYmdjYzIuYzoyNzoKPj4gLi4vLi4vLi4vbGliZ2NjLy4uL2djYy90c3lzdGVtLmg6
ODc6MTA6IGZhdGFsIGVycm9yOiBzdGRpby5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+
ICAgIDg3IHwgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4+ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+
Cj4+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4+Cj4+IFdlIGNhbid0IGFkZCBhbiB1Q2xpYmMt
bmcgZGVwZW5kZW5jeSBvbiBCUjJfU1RBVElDX0xJQlMgb3B0aW9uIHNpbmNlCj4+IGl0J3MgYWxz
byB1c2VkIGZvciBleHRlcm5hbCB0b29sY2hhaW4gYmFja2VuZC4KPj4gSW5zdGVhZCBhZGQgYSBj
aGVjayBpZiBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9MSUJDIGlzIG5vdCBlbXB0eQo+IAo+IEkg
dGhpbmsgc29tZXRoaW5nIGxpa2UgdGhpcyBpcyBwcm9iYWJseSBiZXR0ZXI6Cj4gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDUwNjA1NDY1
MS4yODUzNDA2LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KClRoYW5rcywKSSBtYXJrZWQg
dGhpcyBwYXRjaCByZWplY3RlZCB0aGVuLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+Pgo+
PiBXaGlsZSBhdCBpdCwgYWRkIGEgS2NvbmZpZyBjb21tZW50IGZvciB0aGUgdXNlci4KPj4KPj4g
Rml4ZXM6Cj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzQyOTY1ZDI4
NjI4NWQ1ZDZjZmJiMzlmNjE5NWM4N2ZhMDVkZDMyODMvCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gQ2M6IEdpdWxpbyBCZW5ldHRp
IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiBDYzogVGhvbWFzIERl
IFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lhLmNvbT4KPj4gQ2M6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4+IC0tLQo+
PiAgdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmluICAgICAgICAgICAgICB8
IDMgKysrCj4+ICB0b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC90b29sY2hhaW4tYnVpbGRy
b290Lm1rIHwgNCArKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmluIGIv
dG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmluCj4+IGluZGV4IDhkOWNmNGNj
NjguLmE5N2IxN2FjYjggMTAwNjQ0Cj4+IC0tLSBhL3Rvb2xjaGFpbi90b29sY2hhaW4tYnVpbGRy
b290L0NvbmZpZy5pbgo+PiArKysgYi90b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25m
aWcuaW4KPj4gQEAgLTEwNyw2ICsxMDcsOSBAQCBjb25maWcgQlIyX1RPT0xDSEFJTl9CVUlMRFJP
T1RfTElCQwo+PiAgICAgICAgIGRlZmF1bHQgImdsaWJjIiAgaWYgQlIyX1RPT0xDSEFJTl9CVUlM
RFJPT1RfR0xJQkMKPj4gICAgICAgICBkZWZhdWx0ICJtdXNsIiAgIGlmIEJSMl9UT09MQ0hBSU5f
QlVJTERST09UX01VU0wKPj4KPj4gK2NvbW1lbnQgIk5vIGxpYmMgYXZhaWxhYmxlIGZvciB0aGlz
IHRhcmdldCEgUGxlYXNlIGNoZWNrIHlvdXIgY29uZmlndXJhdGlvbiIKPj4gKyAgICAgICBkZXBl
bmRzIG9uICFCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9MSUJDCj4+ICsKPj4gIHNvdXJjZSAicGFj
a2FnZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0Igo+PiAgc291cmNlICJwYWNrYWdlL2xp
bnV4LWhlYWRlcnMvQ29uZmlnLmluIgo+PiAgc291cmNlICJwYWNrYWdlL211c2wvQ29uZmlnLmlu
Igo+PiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvdG9vbGNoYWlu
LWJ1aWxkcm9vdC5tayBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYnVpbGRyb290L3Rvb2xjaGFpbi1i
dWlsZHJvb3QubWsKPj4gaW5kZXggYjMwY2MzMzJkMi4uNzY4OGQ0NDYxNSAxMDA2NDQKPj4gLS0t
IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvdG9vbGNoYWluLWJ1aWxkcm9vdC5tawo+
PiArKysgYi90b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC90b29sY2hhaW4tYnVpbGRyb290
Lm1rCj4+IEBAIC02LDYgKzYsMTAgQEAKPj4KPj4gIEJSX0xJQkMgPSAkKGNhbGwgcXN0cmlwLCQo
QlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfTElCQykpCj4+Cj4+ICtpZmVxICgkKEJSMl9UT09MQ0hB
SU5fQlVJTERST09UKTokKEJSX0xJQkMpLHk6KQo+PiArJChlcnJvciAiTm8gbGliYyBhdmFpbGFi
bGUgZm9yIHRoaXMgdGFyZ2V0ISBQbGVhc2UgY2hlY2sgeW91ciBjb25maWd1cmF0aW9uLiIpCj4+
ICtlbmRpZgo+PiArCj4+ICAjIFRyaWdnZXJpbmcgdGhlIGJ1aWxkIG9mIHRoZSBob3N0LWdjYy1m
aW5hbCB3aWxsIGF1dG9tYXRpY2FsbHkgZG8gdGhlCj4+ICAjIGJ1aWxkIG9mIGJpbnV0aWxzLCB1
Q2xpYmMsIGtlcm5lbCBoZWFkZXJzIGFuZCBhbGwgdGhlIGludGVybWVkaWF0ZQo+PiAgIyBnY2Mg
c3RlcHMuCj4+IC0tCj4+IDIuMzUuMwo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
