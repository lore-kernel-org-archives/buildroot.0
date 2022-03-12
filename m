Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BD0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6CC60E6A;
	Sat, 12 Mar 2022 19:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDgJgI38Eqz6; Sat, 12 Mar 2022 19:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB8E60E60;
	Sat, 12 Mar 2022 19:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C63D1BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37FBC40486
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Azdgs2tgIu-F for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 199DB4000B
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:42:55 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bi12so25973226ejb.3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8pyc3PkHR4ydd4GmDWYPXI+qU8cEd5j9Soa63kqsApc=;
 b=MOPNOuDXui8RS/NrZKVoRngo0vMxsZlbbxd0Is+mhuLY2BvcA253SfpfVt4oWyNcVQ
 SRP+99EE3cOFC9bbLetUR8vnKXIheJFtIjmnJfMi62vg7cRsdEq2pdYJFKZqg0IMG1Zh
 R8rIlYzx6QcKBaEKwZvl0C375zfxQuKXUvIuO1gDXAKuVFIv8Lw/iM5uEGeYB3Rvnqgb
 9dLNsqmrDgUhR6rguM8FZAVHXIHyDdZr7xpYxcBwLMw5DZ5pBPEk4c4bhoWfxfbiAYEX
 sEvhg6U3i8IeujiIK5M4caKulRUPvKwTB+xYFXlYa8/rDZ7M1UbEC+8ccws4HUxogsEr
 uaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8pyc3PkHR4ydd4GmDWYPXI+qU8cEd5j9Soa63kqsApc=;
 b=jiWp//kg2qTi04PmTShEr8dhw7lg8ktrBLTVDPrAWfjCN2jycoNwMKZlEFJBvQweta
 8/hyfGEH3bY+yq2DdZzN62LboTPBW2rAb1PPz4E/Jt5neYoBnMZQHvPJNzgE5ZZ+vO+f
 6sMJ+T6y3SiIx8AyN+0LcZm+ie78OO6jrluk0vL8KtWgFYxPHq1dtebcc1No3o1ORkFu
 U41ur4RQv1REDLwAE5n9ZknqgrYmEjMtLrI1lGVNffF4nBCjwUy12EqWKCxuSXz4PxwX
 NelxQu5YBQf/l0vjWOafGh+BIGEntvlBAezdyeHPSEg2KMb1W8apdPke5KXVJih+OlSW
 Nmdw==
X-Gm-Message-State: AOAM532NQce8fu3cXRJK/lHd3HP4rX2KK4YgdkdogMKQG4KjM7w3QmXw
 hktwKdRd1nbsNYaEyIRTl0/jjw==
X-Google-Smtp-Source: ABdhPJwD+WFbu5tMxSxsjM7wRBC2gKZC570KvIqd6ykDBLJ1GoO7z3nW9u6QmOufX8bl38qZt+xJxA==
X-Received: by 2002:a17:907:6d1d:b0:6d8:9fc8:b1e1 with SMTP id
 sa29-20020a1709076d1d00b006d89fc8b1e1mr12974306ejc.466.1647114174166; 
 Sat, 12 Mar 2022 11:42:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a1709067fce00b006db0edb8a80sm4675177ejs.225.2022.03.12.11.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 11:42:53 -0800 (PST)
Message-ID: <3c8878cb-cd8e-d09f-ca63-383b4a96c244@mind.be>
Date: Sat, 12 Mar 2022 20:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220222214931.447344-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222214931.447344-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] Revert "heimdal: disable parallel
 make"
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

Ck9uIDIyLzAyLzIwMjIgMjI6NDksIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgZjY5ODAxMjZmMjZjNjM0MjFkMDRhMzJiNjcxMGQ5ZTNhMzgwNDc2YS4KPgo+IFBhcmFs
bGVsIG1ha2Ugd2FzIGRpc2FibGVkIGJhY2sgaW4gMjAxNzoKPiBodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWY2OTgwMTI2ZjI2YzYzNDIxZDA0YTMyYjY3MTBk
OWUzYTM4MDQ3NmEKPgo+IEJ1aWxkLXRlc3Qgd2l0aCAtajk5IHdhcyBzdWNjZXNzZnVsLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgoKIMKg
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiDCoEl0J3MgdW5mb3J0dW5hdGUgdGhhdCB3ZSBj
b3VsZG4ndCBpZGVudGlmeSB3aHkgaXQgd2FzIGZpeGVkLCBidXQgdGhlIAphdXRvYnVpbGRlcnMg
d2lsbCBjb21wbGFpbiBpZiBpdCBpc24ndC4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0t
Cj4gICBwYWNrYWdlL2hlaW1kYWwvaGVpbWRhbC5tayB8IDEgLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2hlaW1kYWwvaGVpbWRhbC5t
ayBiL3BhY2thZ2UvaGVpbWRhbC9oZWltZGFsLm1rCj4gaW5kZXggY2U1MDljN2FmYS4uYThkODc1
MzFlYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2hlaW1kYWwvaGVpbWRhbC5tawo+ICsrKyBiL3Bh
Y2thZ2UvaGVpbWRhbC9oZWltZGFsLm1rCj4gQEAgLTgsNyArOCw2IEBAIEhFSU1EQUxfVkVSU0lP
TiA9IDcuNy4wCj4gICBIRUlNREFMX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vaGVpbWRhbC9o
ZWltZGFsL3JlbGVhc2VzL2Rvd25sb2FkL2hlaW1kYWwtJChIRUlNREFMX1ZFUlNJT04pCj4gICBI
T1NUX0hFSU1EQUxfREVQRU5ERU5DSUVTID0gaG9zdC1lMmZzcHJvZ3MgaG9zdC1uY3Vyc2VzIGhv
c3QtcGtnY29uZgo+ICAgSEVJTURBTF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtSEVJTURBTF9N
QUtFID0gJChNQUtFMSkKPiAgICMgc3RhdGljIGJlY2F1c2Ugb2YgLWZQSUMgaXNzdWVzIHdpdGgg
ZTJmc3Byb2dzIG9uIHg4Nl82NCBob3N0Cj4gICBIT1NUX0hFSU1EQUxfQ09ORl9PUFRTID0gXAo+
ICAgCS0tZGlzYWJsZS1zaGFyZWQgXApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
