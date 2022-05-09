Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979F0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 11:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D2881B35;
	Mon,  9 May 2022 11:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4eM5hh79BuWV; Mon,  9 May 2022 11:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA60281B10;
	Mon,  9 May 2022 11:00:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBF451BF3A7
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 11:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA80C60B96
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 11:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhX8iUBPkVzI for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 11:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35FD0605DB
 for <buildroot@buildroot.org>; Mon,  9 May 2022 11:00:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id z2so24464673ejj.3
 for <buildroot@buildroot.org>; Mon, 09 May 2022 04:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JwObsPDnJsfl11BMpo7wE6AV6MuFF2wLIkeqRp5e2/s=;
 b=dANPlyPoktvkYIOgMhM283KLrid3kpP1ZKGY6FTDFkQP6lh0qDnSqXPucyNaBj2CgL
 gnKctRqDi4tsMJ4yFqEp2IY65r5kl6bNS0WioskQgcFHyzEfYAEyT0TKJ/WSfjhehDwx
 QIHUMagte8yuzeP2tjhBu4xOQ4j1S1k4G6aM7ZghChiML7/nR+bUebV2AgEcXSgVanzl
 D94WYTqbfUxz7BB1EDNdh8h4vk5MJtVQKz1083iJOpgVnB9x8bHDZXvbEVLUvyBxrEH7
 YOL6UFPQAuOLhYkS0XWsa0B6eQJRhgGdpuQmnDl8+gPpv6nwiSeA3eXV8X4ZTClZRqco
 CvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JwObsPDnJsfl11BMpo7wE6AV6MuFF2wLIkeqRp5e2/s=;
 b=ywVGQzkA8o8wFvN4GoH3Ono1XCFAmvOWXr9cTnmrJVFsA2IAnler1QnDHkdBwezMNB
 G4koAtCWUKDhSa0AgO2KoIDkQ/b0h029BK8kLzkD6uGN/BiAC2heJE+bi7rTBK+MI0ea
 hvJFKl3Cfp8S3TaQA3P01WcVeqxgBgQilPEzNWwCyEY+QzhaRJe9kolZ4OGLDX3naQWS
 0uzdbu/s/N800TzVrbyPbbParvEWzLNzGQrAR5GZ5HZY0j+ZcEtEhw7BsoAKkeWCok37
 cmz8bmr7ztnruSumq1fmm2748dyF16YkP/6Nf7SuFhXR63U0A+KbRNRMzuIFmS83EZIS
 4aMw==
X-Gm-Message-State: AOAM531AIDeGqVUVVlwnNJQxY2YFt5uQD4LUqQQuqZHjA4ZfAHrZ9j9E
 7zOLzTBlag3J/RnO7FpifPYsyA==
X-Google-Smtp-Source: ABdhPJy/FZOaDf6ecmlFEKsmmBW+3J/Al6t6Z7w4m7myAenpIf6h3eF5mQq9Levtc0BrqiqYcfK+mg==
X-Received: by 2002:a17:906:6a0b:b0:6f4:d4d7:7c83 with SMTP id
 qw11-20020a1709066a0b00b006f4d4d77c83mr13383229ejc.667.1652094037209; 
 Mon, 09 May 2022 04:00:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ml12-20020a170906cc0c00b006f3ef214e59sm4971665ejb.191.2022.05.09.04.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 04:00:36 -0700 (PDT)
Message-ID: <f23c0717-9f74-1338-8c9c-e68d68857422@mind.be>
Date: Mon, 9 May 2022 13:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220505120138.493950-1-foss+buildroot@0leil.net>
 <c30dd1d2-4087-edb4-6f62-ffe8d213a48c@mind.be>
 <c02e5e65-9bdf-f13f-d152-e3a1c800277c@theobroma-systems.com>
 <165182787021.1423360.10913459195965786963@Monstersaurus>
 <3c4db24e-541a-a10e-0821-f4e87ef034bf@theobroma-systems.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <3c4db24e-541a-a10e-0821-f4e87ef034bf@theobroma-systems.com>
Subject: Re: [Buildroot] [RFC PATCH] package/libcamera: remove rpath and
 strip debug symbols before signing IPA libs
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNS8yMDIyIDExOjI0LCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBLaWVyYW4s
Cj4gCj4gT24gNS82LzIyIDExOjA0LCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKPj4gUXVvdGluZyBR
dWVudGluIFNjaHVseiAoMjAyMi0wNS0wNiAwOTo1NjozNikKPj4+IEhpIEFybm91dCwKPj4+Cj4+
PiBPbiA1LzUvMjIgMjI6NTcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pj4+IMKgIMKg
SGkgUXVlbnRpbiwKPj4+Pgo+Pj4+IE9uIDA1LzA1LzIwMjIgMTQ6MDEsIFF1ZW50aW4gU2NodWx6
IHdyb3RlOgo+Pj4+PiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jy
b21hLXN5c3RlbXMuY29tPgoKW3NuaXBdCj4+Pj4+ICvCoMKgwqAgTUVTT05fSU5TVEFMTF9ERVNU
RElSX1BSRUZJWD0kKFRBUkdFVF9ESVIpL3Vzci9saWIvbGliY2FtZXJhLwo+Pj4+PiAkKEBEKS9z
cmMvaXBhL2lwYS1zaWduLWluc3RhbGwuc2ggJChARCkvYnVpbGQvc3JjL2lwYS1wcml2LWtleS5w
ZW0KPj4+Pj4gJChhZGRwcmVmaXggaXBhXywkKGFkZHN1ZmZpeCAuc28sJChMSUJDQU1FUkFfUElQ
RUxJTkVTLXkpKSkKPj4+Pj4gK8KgwqDCoCBNRVNPTl9JTlNUQUxMX0RFU1RESVJfUFJFRklYPSQo
VEFSR0VUX0RJUikvdXNyL2xpYjY0L2xpYmNhbWVyYS8KPj4+Pj4gJChARCkvc3JjL2lwYS9pcGEt
c2lnbi1pbnN0YWxsLnNoICQoQEQpL2J1aWxkL3NyYy9pcGEtcHJpdi1rZXkucGVtCj4+Pj4+ICQo
YWRkcHJlZml4IGlwYV8sJChhZGRzdWZmaXggLnNvLCQoTElCQ0FNRVJBX1BJUEVMSU5FUy15KSkp
Cj4+Pj4KPj4+PiDCoCDCoEluc3RlYWQgb2Ygb3ZlcnJpZGluZyBJTlNUQUxMX1RBUkdFVF9DTURT
LCB5b3UgY291bGQgYWxzbyBkbyB0aGUKPj4+PiBhZGRpdGlvbmFsIHN0ZXBzIGluIFBPU1RfSU5T
VEFMTF9UQVJHRVRfSE9PS1MuCj4+Pj4KPj4+Cj4+PiBXYXMgbm90IGF3YXJlIG9mIHRob3NlIGhv
b2tzLCBuZWF0IDopCj4+Cj4+IEFyZSB0aGVzZSBob29rcyBjYWxsZWQgYWZ0ZXIgYW55IG1vZGlm
Y2F0aW9ucyB0byB0aGUgZmlsZXMgYnkgYnVpbGRyb290LAo+PiBvciBiZWZvcmU/Cj4+IMKgPiBJ
ZiBpdCdzIGFmdGVyIHRoZW4gcmVzaWduaW5nIGF0IHRoYXQgcG9pbnQgd291bGQgYmUgcmVhc29u
YWJsZSBJIHRoaW5rLgo+Pgo+IAo+IEFGQUlLLCBiZWZvcmUuCj4gCj4gQnVpbGRyb290IHJ1bnMg
YWxsIHJlcXVlc3RlZCB0YXNrcy9zdGVwcyBmb3IgZWFjaCBwYWNrYWdlLCB0aGVuIHJlbW92ZSBy
cGF0aCBhbmQgCj4gc3RyaXBzIHN5bWJvbHMgaW4gdGFyZ2V0LyBkaXJlY3RvcnkuCj4gCj4gUE9T
VF9JTlNUQUxMX1RBUkdFVF9IT09LUyBpcyBydW4gcmlnaHQgYWZ0ZXIgdGhlIGluc3RhbGwgdGFz
ay9zdGVwIGZvciB0aGUgCj4gcGFja2FnZSBpcyBydW4gKGJhc2ljYWxseSBhZnRlciBuaW5qYSBp
bnN0YWxsIGlzIGV4ZWN1dGVkKS4KPiAKPiBQT1NUX0JVSUxEX0hPT0sgaXMgaGFwcGVuaW5nIHJp
Z2h0IGFmdGVyIHRoZSBidWlsZCB0YXNrL3N0ZXAgKGFmdGVyIG5pbmphIGlzIAo+IGV4ZWN1dGVk
KSBvZiB0aGUgcGFja2FnZSBpcyBydW4uCj4gCj4gV2UgYW55d2F5IG5lZWQgdG8gc3RyaXAgdGhl
IHNobGlicyBtYW51YWxseSBpbiB0aGUgcGFja2FnZSBtYWtlZmlsZSBiZWNhdXNlIAo+IG5vdGhp
bmcgZG9lcyBpdCBhbmQgSSBkb24ndCB0aGluayB0aGVyZSdzIGEgd2F5IHRvIGhvb2sgc29tZXRo
aW5nIGZyb20gYSBwYWNrYWdlIAo+IG1ha2VmaWxlIHRvIGhhcHBlbiBhZnRlciBCdWlsZHJvb3Qg
Im1haW4iIHBvc3QgYnVpbGQgc2NyaXB0IGlzIHJ1biAobm90IHRoZSBvbmUgCj4gaW4gcGFja2Fn
ZSBtYWtlZmlsZXMsIHRoZSBvbmUgcnVuIHJpZ2h0IGJlZm9yZSBjcmVhdGluZyB0aGUgcm9vdGZz
KS4KCiAgQWN0dWFsbHksIHRoZXJlIGlzLCBJIGRpZG4ndCB0aGluayBvZiB0aGF0ISAkKFBLRylf
Uk9PVEZTX1BSRV9DTURfSE9PS1MgZ2V0cyAKZXhlY3V0ZWQgcmlnaHQgYmVmb3JlIHRoZSByb290
ZnMgaXMgY3JlYXRlZC4gTm90ZSB0aGF0IHRoaXMgaXMgZHVyaW5nIHRoZSByb290ZnMgCmNyZWF0
aW9uIHN0ZXAgYW5kIGlzIGRvbmUgaW4gYSB0ZW1wb3JhcnkgZGlyZWN0b3J5IChUQVJHRVRfRElS
IGlzIG92ZXJyaWRkZW4gCndpdGggdGhlIG5hbWUgb2YgdGhhdCB0ZW1wb3JhcnkgZGlyZWN0b3J5
LCBzbyB5b3UgY2FuIHN0aWxsIHVzZSBUQVJHRVRfRElSKS4KCiAgSXQncyBhY3R1YWxseSBtZWFu
dCBmb3Igc3R1ZmYgdGhhdCBuZWVkcyB0byBiZSBydW4gdW5kZXIgZmFrZXJvb3QsIGJ1dCBpdCBj
YW4gCmJlIHVzZWQgZm9yIHRoaXMgYXMgd2VsbC4KCiAgV2l0aCB0aGF0IGFwcHJvYWNoLCB3ZSBz
dGlsbCBoYXZlIHRoZSB1bnN0cmlwcGVkIGxpYnJhcmllcyBpbiBTVEFHSU5HX0RJUiAKKHdoaWNo
IGlzIHVzZWZ1bCBmb3IgZGVidWdnaW5nKSwgYW5kIHdlIGRvbid0IG5lZWQgdG8gcmUtY3JlYXRl
IHRoZSBzdHJpcCAKY29tbWFuZHMuIFRoZSBkaXNhZHZhbnRhZ2VzIGFyZToKLSBjb250ZW50cyBv
ZiB0YXJnZXQgYXJlIG5vdCB1c2FibGUgYXMgaXMgKHNpZ25hdHVyZSB3aWxsIGJlIHdyb25nKTsK
LSB3ZSBzdGlsbCBuZWVkIHRvICJtYW51YWxseSIgY2FsbCBpcGEtc2lnbi1pbnN0YWxsLnNoLgoK
ICBTbyBhbGwgaW4gYWxsLCBJJ20gbm90IHN1cmUgdGhhdCB0aGF0IG9wdGlvbiBpcyBiZXR0ZXIg
dGhhbiB5b3VyIHYyLgoKICAoVGhlcmUgaXMgYWxzbyAkKFBLRylfVEFSR0VUX0ZJTkFMSVpFX0hP
T0tTLCBidXQgdGhvc2UgZ2V0IGNhbGxlZCBiZWZvcmUgCnN0cmlwcGluZywgc28gbm90IHVzZWZ1
bCBoZXJlLikKCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPj4+Cj4+Pj4gwqAgwqBIb3dldmVy
LCBJIHRoaW5rIGl0IG1heSBiZSBzaW1wbGVyIHRvIGRvIHRoZSBzdHJpcHBpbmcgaW4gYQo+Pj4+
IFBPU1RfQlVJTERfSE9PSy4gVGhhdCB3YXksIHlvdSBvbmx5IG5lZWQgdG8gZG8gdGhlIHN0cmlw
OyB0aGUgc2lnbmluZyBpcwo+Pj4+IGRvbmUgaW4gdGhlIGluc3RhbGwgc3RlcCwgc28gaWYgd2Ug
bWFrZSBzdXJlIHRoZSAuc28gaXMgc3RyaXBwZWQgYnkKPj4+PiB0aGVuLCBhbGwgc2hvdWxkIGJl
IHdlbGwsIHJpZ2h0Pwo+Pj4+Cj4+Pgo+Pj4gSWYgaGF2aW5nIHRoZSBzdGFnaW5nIHNobGlicyBz
dHJpcHBlZCBpcyBmaW5lLCB0aGVuIHRoaXMgc2hvdWxkbid0IGJlIGFuCj4+PiBpc3N1ZSBpbmRl
ZWQuCj4+Cj4+IFRoaXMgc291bmRzIGZpbmUgdG8gbWUgdG9vIHRob3VnaC4KPj4KPj4KPj4+Cj4+
Pj4gwqAgwqBGaW5hbGx5LCB0aGVyZSBpcyBvbmUgbGl0dGxlIGNhdmVhdDogaWYgdGhlIGxpYnJh
cmllcyBhcmUgaW5zdGFsbGVkIGluCj4+Pj4gQlIyX1NUUklQX0VYQ0xVREVfRElSUyAoaS5lLiBp
ZiBCUjJfU1RSSVBfRVhDTFVERV9ESVJTIGlzIHNldCB0bwo+Pj4+IC91c3IvbGliKSwgb3IgaWYg
dGhleSBtYXRjaCBCUjJfU1RSSVBfRVhDTFVERV9GSUxFUyAoZS5nLiBpZiBpdCBpcyBzZXQKPj4+
PiB0byAiaXBhXyouc28iKSwgdGhlbiB0aGUgbGlicyB3b3VsZCBiZSBzdHJpcHBlZCB3aGlsZSB0
aGV5IHNob3VsZG4ndCBiZS4KPj4+PiBIb3dldmVyLCBJIGRvbid0IHRoaW5rIHRoYXQncyBhIGJp
ZyBkZWFsLgo+Pj4+Cj4+Pgo+Pj4gRG9lcyBub3QgaHVydCB0byB1c2UgdGhlIHNhbWUgbG9naWMg
YXMgaW4gU1RSSVBfRklORF9DTUQgaW4gbWFpbgo+Pj4gTWFrZWZpbGUsIHNvIHdpbGwgZG8uCj4+
Pgo+IAo+IENhbid0IHVzZSB0aGUgbG9naWMgZm9yIEJSMl9TVFJJUF9FWENMVURFX0RJUlMgYmVj
YXVzZSB0aGUgZGlyIGluIHRoZSBidWlsZCAKPiBkaXJlY3Rvcnkgb2YgbGliY2FtZXJhIGlzIGRp
ZmZlcmVudCBmcm9tIHRoZSBvbmUgaW5zdGFsbGVkIG9uIHRoZSByb290ZnMgKGkuZS4gCj4gYnVp
bGQvc3JjL2lwYS8qL2lwYV8qLnNvIHdoaWxlIG9uIHRoZSB0YXJnZXQgaXQnZCBiZSAKPiAvdXNy
L2xpYns2NCx9L2xpYmNhbWVyYS9pcGFfKi5zbykuCj4gCj4gRm9yIEJSMl9TVFJJUF9FWENMVURF
X0ZJTEVTLCBpZiBqdXN0IGEgZmlsZW5hbWUgc2hvdWxkIGJlIGdpdmVuLCB0aGUgZmluZCAKPiBj
b21tYW5kIHdpbGwgbm90IGNhcmUgYWJvdXQgaW50ZXJtZWRpYXJ5IGRpcmVjdG9yaWVzIHNvIHdl
J3JlIGZpbmUuCj4gCj4gTWVhbndoaWxlLCBJIHJlYWxpc2VkIHRoYXQgU1RSSVBDTUQgaW4gcGFj
a2FnZSBtYWtlZmlsZXMgbWlnaHQgbm90IGJlIHRoZSBzYW1lIAo+IGFzIHRoZSBvbmUgaW4gdGhl
IG1haW4gTWFrZWZpbGUuIE5hbWVseSwgaXQncyAvYmluL3RydWUgaWYgQlIyX1NUUklQX3N0cmlw
IGlzIAo+IHVuc2V0LiBTbyBJJ2xsIG5lZWQgdG8gdXNlIGEgaGFyZGNvZGVkIHZlcnNpb24gaW5z
dGVhZCBvZiBTVFJJUENNRCB2YXJpYWJsZSAKPiB1bmZvcnR1bmF0ZWx5IDovIFRlc3RpbmcgdGhp
cyB0byBtYWtlIHN1cmUgSSBkaWRuJ3QgbWlzcmVhZCB0aGUgY29kZS4KPiAKPiBDaGVlcnMsCj4g
UXVlbnRpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
