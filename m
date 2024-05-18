Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9FFC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 10:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2D76086A;
	Sat, 18 May 2024 10:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjwH0Q8d9oJG; Sat, 18 May 2024 10:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44CBB60875
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44CBB60875;
	Sat, 18 May 2024 10:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 955AD1BF94D
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 10:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8284660875
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 10:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQQfNe04nS0d for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 10:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F51C6086A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F51C6086A
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F51C6086A
 for <buildroot@buildroot.org>; Sat, 18 May 2024 10:00:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5238b7d0494so1763669e87.3
 for <buildroot@buildroot.org>; Sat, 18 May 2024 03:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716026427; x=1716631227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gl9+JDbTgZPmRft3hO4hFOTClxyDujTZX9jEkQQIBHk=;
 b=VVUiFSE8Rpbz4QETen5Sd0wTl1WnrgBEDL+7ZoemItfIvRSZtk9/ZhkKPOlK2DVElC
 4ZFGBQnSVOnZIllVqIIKb1dkK7hjqKs5dAvLpecAFqCq8+CR/PN2KuwV4IjduSzl8C1N
 mKZp5+BjbTvQ7QE75TLslc6zfvDhvUStU8R8MqQBMHsBogC34bKIT1NfCulYHLettvzP
 o7IGTuId2JlDvNKagsS/gUvqsXoFu3HBXScx6zRSH5JbEUkNc/uilSdFr/c0wFfOiLgn
 H/fg/nSK1MPhYZQc/3WIP1GgoRPBBwNAaJeHc58CDiS5E85rzDxPM8iVKvfXC4syuXW5
 ooTg==
X-Gm-Message-State: AOJu0YzwpkrysoPO14yBHZW5loJipO4zM27utm/VbTyxqkFqm0E21f4d
 yMkpxP8En8dyQYaY57HLvKhIdkdzQq7T4FeT20+O1YIsvDcThZqL9AFadZNuA3oBuC09jbqp47A
 vSszze9qt/mTRj+dD+Xyhx8A7t1ibWWQQ
X-Google-Smtp-Source: AGHT+IEqAjhex81HYctVMYWMs0eBizg709ousrsgj5OV4h53NpHDbn6ASZNsWbW8nzuCC6wsLGnWrB8qG3S8qYtllSM=
X-Received: by 2002:a05:6512:10cb:b0:521:b333:743d with SMTP id
 2adb3069b0e04-52331e202b9mr20309435e87.14.1716026426699; Sat, 18 May 2024
 03:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240517120057.3736694-1-yegorslists@googlemail.com>
 <ZkehJQxCJHZRJ1lr@landeda>
In-Reply-To: <ZkehJQxCJHZRJ1lr@landeda>
Date: Sat, 18 May 2024 12:00:12 +0200
Message-ID: <CAGm1_kuhYZ1uCnWquBBnhS89T7antGULc811jzaMAhtiHKFJJg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1716026427; x=1716631227; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gl9+JDbTgZPmRft3hO4hFOTClxyDujTZX9jEkQQIBHk=;
 b=deDxhPC4VApelsimRi10GrmaKii+p2ECqZEDeHavyA9VJ61lnpGrpXCl71zqiWTROE
 mZESyRbRQIxDqqlosGGq9fbg5pIPwbhcuXQnkIpGbziyFM9Za/VXzOiMSuHGP/5GY21G
 FG4v9vRaM7MssKJVYwF7pRKKvC9gb993W3QRz5X/3oQBKkCZbs5q3D9rQn6ClxfIqPNp
 vjseSuDs0G7LrGRwZ+17+6fGLNHOEmJfjppolVeX9+TUXS8c4bFu5MvjickFYoCMbwcG
 Vv3onOH/umbCjoEp3RKAk1+jeY5xO+SS0Eq4lgA5HdYOftM4iscMjEVN3654dXKgQ8T/
 4iYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=deDxhPC4
Subject: Re: [Buildroot] [PATCH] package/ntp: fix build with GCC 14.x
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDg6MjXigK9QTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBZZWdvciwgQWxsLAo+Cj4gT24g
MjAyNC0wNS0xNyAxNDowMCArMDIwMCwgeWVnb3JzbGlzdHMtLS0gdmlhIGJ1aWxkcm9vdCBzcGFr
ZSB0aHVzbHk6Cj4gPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+Cj4gPgo+ID4gRml4IHB0aHJlYWRfZGV0YWNoKCkgZGV0ZWN0aW9uIHRoYXQgaXMgYnJv
a2VuIHdoZW4gYnVpbGRpbmcKPiA+IHdpdGggR0NDIDE0LnguCj4gPgo+ID4gVGhlIHBhdGNoIGlz
IHRha2VuIGZyb20gYSBHZW50b28gcmVwb3NpdG9yeToKPiA+Cj4gPiBodHRwczovL2dpdHdlYi5n
ZW50b28ub3JnL3JlcG8vZ2VudG9vLmdpdC9kaWZmL25ldC1taXNjL250cC9maWxlcy9udHAtNC4y
LjhfcDE1LWNvbmZpZ3VyZS1jbGFuZzE2LnBhdGNoP2lkPTU2ZWY1Y2UzMzg5MWZlZWMzNGNkMGMz
OWEwYTc3NGE4MWE1ODdkYzcKPiA+Cj4gPiBCb251czogcmVmcmVzaCB0aGUgMDAwMi1udHAtc3lz
Y2FsbHMtZmFsbGJhY2sucGF0Y2ggZmlsZS4KPgo+IFN1cmUsIGJ1dCBpdCdzIHJlbGF0aXZlbHkg
b2J2aW91cywgYnkgbG9va2luZyBhbmQgdGhlIGNoYW5nZXNldCwgdGhhdAo+IHRoZSBwYXRjaCB3
YXMgbW9kaWZpZWQ7IHRoZSBpbnRlcmVzdGluZyBpbmZvcm1hdGlvbiB0byBoYXZlIGluIHRoZQo+
IGNvbW1pdCBsb2cgaXMgd2h5IGl0IHdhcyByZWZyZXNoZWQ6Cj4KPiAgICAgQWRkdGlvbmFsbHks
IHJlZnJlc2ggcGF0Y2ggMDAwMiB0byBmaXggdGhlIG9mZnNldCBvZiBodW5rIDEuCj4KPiA+IFNp
Z25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIHBhY2thZ2UvbnRwLzAwMDItbnRwLXN5c2NhbGxzLWZhbGxiYWNrLnBhdGNo
ICB8ICA5ICsrKystLS0KPiA+ICAuLi4vbnRwLzAwMDMtZml4LXB0aHJlYWQtZGV0YWNoLWNoZWNr
LnBhdGNoICAgfCAyNyArKysrKysrKysrKysrKysrKysrCj4KPiAgICAgJCBtYWtlIGNoZWNrLXBh
Y2thZ2UKPiAgICAgcGFja2FnZS9udHAvMDAwMy1maXgtcHRocmVhZC1kZXRhY2gtY2hlY2sucGF0
Y2g6MDogbWlzc2luZyBVcHN0cmVhbSBpbiB0aGUgaGVhZGVyIChodHRwczovL25pZ2h0bHkuYnVp
bGRyb290Lm9yZy8jX2FkZGl0aW9uYWxfcGF0Y2hfZG9jdW1lbnRhdGlvbikKPgo+IFllcywgeW91
IGRvIHByb3ZpZGUgdGhlIGxvY2F0aW9uIHdoZXJlIHlvdSBncmFiYmVkIHRoZSBwYXRjaCBmcm9t
LCBhbmQKPiB0aGlzIGlzIHZlcnkgZ29vZC4gU3RpbGwsIHdlIG5lZWQgdG8ga25vdyB3aGF0IHRo
ZSB1cHN0cmVhbSBzdGF0dXMgZm9yCj4gdGhhdCBwYXRjaCBpczogaGFzIGl0IGJlZW4gc3VibWl0
dGVkPyBJZiBubywgd2h5PyBJZiB5ZXMsIHdoYXQgaXMgdGhlCj4gVVJMIHRvIHRoZSBQUi9NUiwg
YnVnIHJlcG9ydCwgZW1haWw/Cj4KPiBJdCBpcyBhIGJpdCB1bmZvcnR1bmF0ZSB0aGF0IG50cCB1
c2VzIGJpdGtlZXBlciBhcyBhIFZDUywgd2hpY2ggbWFrZXMgaXQKPiBhIGJpdCBtb3JlIGRpZmZp
Y3VsdCB0byBjb250cmlidXRlIHRvLCBidXQgd2Ugc3RpbGwgbmVlZCB0aGF0IGluCj4gZm9ybWF0
aW9uLi4uCj4KPiBJIHNlZSB0aGF0IHRoZSBsYXN0IGNvbW1pdHMgZGF0ZXMgZnJvbSBqdXN0IGEg
ZmV3IGRheXMgYWdvLCBzbyB0aGUKPiBwcm9qZWN0IGlzIG5vdCBkZWFkLgo+Cj4gQ291bGQgeW91
IHBsZWFzZSBjaGVjayB3aGV0aGVyIHRoaXMgcGF0Y2ggd2FzIHN1Ym1pdHRlZD8gTWF5YmUgdGhl
cmUgaXMKPiBzb21lIGluZm8gYWJvdXQgdGhhdCBpbiB0aGUgZ2VudG9vIGhpc3RvcnkgZm9yIHRo
YXQgcGF0Y2g/Cj4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL250cC8wMDAyLW50cC1zeXNjYWxs
cy1mYWxsYmFjay5wYXRjaCBiL3BhY2thZ2UvbnRwLzAwMDItbnRwLXN5c2NhbGxzLWZhbGxiYWNr
LnBhdGNoCj4gPiBpbmRleCA1MzVmYzkzZGZkLi40NjcwNGI5ZDNmIDEwMDY0NAo+ID4gLS0tIGEv
cGFja2FnZS9udHAvMDAwMi1udHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2gKPiA+ICsrKyBiL3Bh
Y2thZ2UvbnRwLzAwMDItbnRwLXN5c2NhbGxzLWZhbGxiYWNrLnBhdGNoCj4gPiBAQCAtOCwxMCAr
OCwxMSBAQCBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBLbmlnaHQgPGphbWVzLmtuaWdodEByb2Nrd2Vs
bGNvbGxpbnMuY29tPgo+ID4gICBjb25maWd1cmUuYWMgfCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwo+ID4gLS0tLSBhL2NvbmZpZ3VyZS5hYwo+
ID4gLSsrKyBiL2NvbmZpZ3VyZS5hYwo+ID4gLUBAIC0xNTIzLDExICsxNTIzLDExIEBAIEFDX0NB
Q0hFX0NIRUNLKAo+ID4gK0luZGV4OiBudHAtNC4yLjhwMTcvY29uZmlndXJlLmFjCj4gPiArPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ID4gKy0tLSBudHAtNC4yLjhwMTcub3JpZy9jb25maWd1cmUuYWMKPiA+ICsrKysg
bnRwLTQuMi44cDE3L2NvbmZpZ3VyZS5hYwo+ID4gK0BAIC0xNDcyLDExICsxNDcyLDExIEBAIEFD
X0NBQ0hFX0NIRUNLKAo+Cj4gSnVzdCBmaXhpbmcgdGhlIGxpbmUgd291bGQgaGF2ZSBtYWRlIGZv
ciBhIHNtYWxsZXIgZGVsdGEsIHdpdGggbGVzcwo+IHVzZWxlc3MgY2hhbmdlcyBpbiB0aGUgZGlm
ZiBtZXRhZGF0YS4KPgo+IEFsc28sIHRoZSBwYXRjaCB3YXMgKGFsbW9zdCkgZ2l0LWZvcm1hdHRl
ZCwgd2hpY2ggaXMgdGhlIHByZWZlcnJlZCBmb3JtCj4gZm9yIGJ1bmRsZWQgcGF0Y2hlcy4gVW5s
ZXNzIGl0IGlzIHN1Ym1pdHRlZCB0bywgb3IgYmFja3BvcnRlZCBmcm9tIHRoZQo+IHVwc3RyZWFt
IFZDUywgaW4gd2hpY2ggY2FzZSBpdCBzaG91bGQgYmUgaW4gYSBmb3JtYXQgc3VwcG9ydGVkIGJ5
IHRoYXQKPiBWQ1MuIDstKQoKTm93LCBpdCBpcyBvZmZpY2lhbDogaHR0cHM6Ly9idWdzLm50cC5v
cmcvc2hvd19idWcuY2dpP2lkPTM5MjYKCkknbGwgd2FpdCB0aWxsIHRoZSBwYXRjaCBpcyBjb21t
aXR0ZWQgYW5kIHRoZW4gd2lsbCBtYWtlIHYyLgoKWWVnb3IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
