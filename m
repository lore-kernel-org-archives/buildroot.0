Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91641C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D310E83388;
	Mon, 11 Apr 2022 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbNZS79rCpER; Mon, 11 Apr 2022 20:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C106F83396;
	Mon, 11 Apr 2022 20:27:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01E5E1BF32D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E376C4018A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 20:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRbHDmkGHKI5 for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 20:27:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96A62400B9
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 20:27:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k23so33222221ejd.3
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0GaZ+J3zisovpOZk88N8h6A0Epg8tZM+VmHbyLM5/No=;
 b=Xviz6Cle3wiKtwJzkbYuOAIvZcrSyBO9Cc1gPnwdcRODKg0xtNZbj0iys8vwGPrR9r
 XA4cJTtDkos2Fep29n8Mfg+fzYSGUECFoqYmkLYi9fF4mqhixaQD0r64NmaiHueuIpfM
 kQP0gP1QGm2CSdDyMrU8LXSu0oZeBrSM0Il27oQu2UPXyj7ckwVmp9i+i6G1aoiRWzMM
 4QcCyNvmb0wswf9Xptxwvu9cbVMvaOQ3SKkBBeC7p09dJI8oYAVOrEu9S6ZEo88MC6Zt
 Hb76w2pXCez/JevkbwJWPTIXeNcXxd6k1uWpQWWcgg0YV3nBAFzsacNambnOVUfXGQ+V
 n5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0GaZ+J3zisovpOZk88N8h6A0Epg8tZM+VmHbyLM5/No=;
 b=Iui9tgDBBDhXBAV1IXP4QioIg5tzcnC+NEQcHYFbfZ9Uyb+ZGXurNxptZa5N3lmICi
 8CJ2MWwyRaSwq+EgRJYbSZU5HMcGLvMUsYne4Tt6TyVRXqgVR8i8R3Vnk8QAPmdYCsZ8
 arwXMPKCULZTVNl46og779FtkZljxtKloO16DOi3HddqUBipqjTHYzmN3KF/BIrKVM/z
 ztD3n6jWCEZHVqfl5ZgncN/x3qCG/cyGQfrlmBiGlmJ+iXbCV41ThDl+Yx/K69v1+CeQ
 T8V6EKEOPOrbzc/Y+RxhGsBHRB9X4D2WyrQA/9NowE9azgB5OGifXj0UlKlq16JvRM5a
 A5sg==
X-Gm-Message-State: AOAM532zUXpP9y7J7IrmeW7624fwGhNMEg8gnmcJ6JjLQVOXc62xsFoO
 En4z+3zXu2BQgibgBlW6FnZdgQ==
X-Google-Smtp-Source: ABdhPJw4+wr51HS+xfNuqyOZHIoJNl5cOjaMKanJHJ8Z6wNt+l9x3F2kwfKRzcT2usw1/IClq/1A1w==
X-Received: by 2002:a17:907:1b06:b0:6e7:f58a:9b91 with SMTP id
 mp6-20020a1709071b0600b006e7f58a9b91mr32596707ejc.291.1649708864597; 
 Mon, 11 Apr 2022 13:27:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dn4-20020a17090794c400b006dbec4f4acbsm12501734ejc.6.2022.04.11.13.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 13:27:44 -0700 (PDT)
Message-ID: <f6bd2af2-be60-ce06-70a0-17d34c60c17b@mind.be>
Date: Mon, 11 Apr 2022 22:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
 <87bkx7h299.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87bkx7h299.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMS8wNC8yMDIyIDIxOjAyLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+Pj4+PiAiQXJu
b3V0IiA9PSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyaXRlczoKPiAK
PiBIaSwKPiAKPiAgID4gT24gMTEvMDQvMjAyMiAxNDoyOCwgTWFyY3VzIEhvZmZtYW5uIHdyb3Rl
Ogo+ICAgPj4gSGkgUGV0ZXIsCj4gICA+PiBPbiAwNS4wNC4yMiAxOToyOCwgUGV0ZXIgS29yc2dh
YXJkIHdyb3RlOgo+ICAgPj4+IGNvbW1pdDoKPiAgID4+PiBodHRwczovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTI2NDJlZGIwYWYwOGYwNGZiOThmNGNiNWY4ODg5NWZh
ZGVkNGIzMjUKPiAgID4+Pgo+ICAgPj4+IGJyYW5jaDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5l
dC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL21hc3Rlcgo+ICAgPj4+Cj4gICA+Pj4g
Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6Cj4gICA+Pj4KPiAgID4+PiAtIENW
RS0yMDIyLTIzNjQ4OiBjb250YWluZXJkIENSSSBwbHVnaW46IEluc2VjdXJlIGhhbmRsaW5nIG9m
IGltYWdlIHZvbHVtZXMKPiAgID4+PiBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVyZC9jb250
YWluZXJkL3NlY3VyaXR5L2Fkdmlzb3JpZXMvR0hTQS1jcnAyLXFycjUtOHBxNwo+ICAgPj4+Cj4g
ICA+Pj4gLSBDVkUtMjAyMi0yNDc2OTogRGVmYXVsdCBpbmhlcml0YWJsZSBjYXBhYmlsaXRpZXMg
Zm9yIGxpbnV4IGNvbnRhaW5lcgo+ICAgPj4+IMKgwqAgc2hvdWxkIGJlIGVtcHR5Cj4gICA+Pj4g
aHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9zZWN1cml0eS9hZHZpc29y
aWVzL0dIU0EtYzljcC05Yzc1LTl2OGMKPiAgID4+Pgo+ICAgPj4+IFNpZ25lZC1vZmYtYnk6IFBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiAgID4+PiAtLS0KPiAgID4+PiDC
oCBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoIHwgMiArLQo+ICAgPj4+IMKgIHBh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rwqDCoCB8IDIgKy0KPiAgID4+PiDCoCAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgID4+Pgo+ICAg
Pj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCj4gICA+
Pj4gYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCj4gICA+Pj4gaW5kZXggZDVh
YWZlMmU3MC4uMjNkYWNkZWQ4OCAxMDA2NDQKPiAgID4+PiAtLS0gYS9wYWNrYWdlL2NvbnRhaW5l
cmQvY29udGFpbmVyZC5oYXNoCj4gICA+Pj4gKysrIGIvcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQuaGFzaAo+ICAgPj4+IEBAIC0xLDMgKzEsMyBAQAo+ICAgPj4+IMKgICMgQ29tcHV0ZWQg
bG9jYWxseQo+ICAgPj4+IC1zaGEyNTYKPiAgID4+PiA0MGM5NzY3YWYzZTg3ZjJjMzZhZGYyZjU2
M2YwYTgzNzRlODBiMzBiZDJiN2FhODAwNThjODU5MTI0MDZjZWY0Cj4gICA+Pj4gY29udGFpbmVy
ZC0xLjUuOS50YXIuZ3oKPiAgID4+PiArc2hhMjU2Cj4gICA+Pj4gNmEyODk0MDZjMWMwNTgzNzYz
ZTVhOTc1NGUzMWExZWNlZDU1Y2Q1ZjE2MmE3YmMyYTNhMzE1ZDVlYjA1YzdhMQo+ICAgPj4+IGNv
bnRhaW5lcmQtMS41LjExLnRhci5nego+ICAgPj4gSSBnZXQgYSBkaWZmZXJlbnQgaGFzaCBmb3Ig
dGhpcyBkb3dubG9hZCwgYm90aCB3aXRoaW4gYnVpbGRyb290IGFzCj4gICA+PiB3ZWxsIGFzIGRv
d25sb2FkaW5nIHRoZSBmaWxlIG1hbnVhbGx5IGZyb20gZ2l0aHViOgo+ICAgPj4gRVJST1I6IGNv
bnRhaW5lcmQtMS41LjExLnRhci5neiBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4gICA+PiBFUlJP
UjogZXhwZWN0ZWQ6IDZhMjg5NDA2YzFjMDU4Mzc2M2U1YTk3NTRlMzFhMWVjZWQ1NWNkNWYxNjJh
N2JjMmEzYTMxNWQ1ZWIwNWM3YTEKPiAgID4+IEVSUk9SOiBnb3TCoMKgwqDCoCA6IDAyYjc5ZDVl
MmIwN2I1ZTY0Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIxNDhiZTYK
PiAgID4+IEVSUk9SOiBJbmNvbXBsZXRlIGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAo
TUlUTSkgYXR0YWNrCj4gICA+Pgo+ICAgPj4gRGlkIHRoZSBmaWxlIGNoYW5nZSBpbiB0aGUgbWVh
bnRpbWUgb3IgZGlkIHNvbWV0aGluZyBlbHNlIGdvIHdyb25nIGhlcmU/Cj4gCj4gICA+ICBJdCBh
bHNvIGdvZXMgd3JvbmcgaW4gdGhlIGF1dG9idWlsZGVycyAodGhpcyBvbmUgb24gbWFzdGVyLCBi
ZWZvcmUgSQo+ICAgPiAgbWVyZ2VkIHRoZSBidW1wIHRvIDEuNi4yKSBbMV0KPiAKPiAgID4+IFNo
b3VsZCBzZW5kIGEgcGF0Y2ggY2hhbmdpbmcgdGhlIGhhc2ggdG8KPiAgID4+IDAyYjc5ZDVlMmIw
N2I1ZTY0Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIxNDhiZTY/Cj4g
Cj4gICA+ICBMZXQncyBmaXJzdCBhbGxvdyBQZXRlciB0byBjaGVjayB3aGF0IGV4YWN0bHkgd2Vu
dCB3cm9uZy4gSGUgc2hvdWxkCj4gICA+ICBoYXZlIGEgbG9jYWwgZG93bmxvYWQgd2l0aCB0aGUg
aGFzaCBoZSBwdXNoZWQgc28gaGUgY2FuIGNvbXBhcmUgd2hhdAo+ICAgPiBjaGFuZ2VkLgo+IAo+
ICAgPiAgSSBsb29rZWQgYXQgdGhlIGdpdGh1YiByZXBvLCBhbmQgaXQgc2F5cyB0aGF0IGl0IHdh
cyB0YWdnZWQgb24gTWFyY2gKPiAgID4gIDI0LCBpLmUuIGJlZm9yZSBQZXRlciBkaWQgdGhlIGJ1
bXAgdG8gMS41LjExLiBTbyBpdCBkb2Vzbid0IGxvb2sgbGlrZQo+ICAgPiB0aGV5IHVwZGF0ZWQg
dGhlIHRhZy4KPiAKPiBGdW5reSwgSSBkbyBpbmRlZWQgaGF2ZSB0aGUgb2xkIGhhc2ggaGVyZToK
PiAKPiBzaGEyNTZzdW0gfmRvd25sb2FkL2NvbnRhaW5lcmQvY29udGFpbmVyZC0xLjUuMTEudGFy
Lmd6IGNvbnRhaW5lcmQtMS41LjExLnRhci5nego+IDZhMjg5NDA2YzFjMDU4Mzc2M2U1YTk3NTRl
MzFhMWVjZWQ1NWNkNWYxNjJhN2JjMmEzYTMxNWQ1ZWIwNWM3YTEgIC92YXIvbGliL2Rvd25sb2Fk
cy9jb250YWluZXJkL2NvbnRhaW5lcmQtMS41LjExLnRhci5nego+IDAyYjc5ZDVlMmIwN2I1ZTY0
Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIxNDhiZTYgIGNvbnRhaW5l
cmQtMS41LjExLnRhci5nego+IAo+IEV4dHJhY3RpbmcgdGhlIHRhcmJhbGxzLCBJIHNlZSB0aGUg
Zm9sbG93aW5nIGRpZmY6Cj4gCj4gZGlmZiAtdXJwTiBhL2NvbnRhaW5lcmQtMS41LjExL3ZlbmRv
ci9rOHMuaW8vY2xpZW50LWdvL3BrZy92ZXJzaW9uL2Jhc2UuZ28gYi9jb250YWluZXJkLTEuNS4x
MS92ZW5kb3IvazhzLmlvL2NsaWVudC1nby9wa2cvdmVyc2lvbi9iYXNlLmdvCj4gLS0tIGEvY29u
dGFpbmVyZC0xLjUuMTEvdmVuZG9yL2s4cy5pby9jbGllbnQtZ28vcGtnL3ZlcnNpb24vYmFzZS5n
byAgICAgMjAyMi0wMy0yNCAwMTowOTo0Mi4wMDAwMDAwMDAgKzAxMDAKPiArKysgYi9jb250YWlu
ZXJkLTEuNS4xMS92ZW5kb3IvazhzLmlvL2NsaWVudC1nby9wa2cvdmVyc2lvbi9iYXNlLmdvICAg
ICAyMDIyLTAzLTI0IDAxOjA5OjQyLjAwMDAwMDAwMCArMDEwMAo+IEBAIC01NSw3ICs1NSw3IEBA
IHZhciAoCj4gICAgICAgICAgLy8gTk9URTogVGhlICRGb3JtYXQgc3RyaW5ncyBhcmUgcmVwbGFj
ZWQgZHVyaW5nICdnaXQgYXJjaGl2ZScgdGhhbmtzIHRvIHRoZQo+ICAgICAgICAgIC8vIGNvbXBh
bmlvbiAuZ2l0YXR0cmlidXRlcyBmaWxlIGNvbnRhaW5pbmcgJ2V4cG9ydC1zdWJzdCcgaW4gdGhp
cyBzYW1lCj4gICAgICAgICAgLy8gZGlyZWN0b3J5LiAgU2VlIGFsc28gaHR0cHM6Ly9naXQtc2Nt
LmNvbS9kb2NzL2dpdGF0dHJpYnV0ZXMKPiAtICAgICAgIGdpdFZlcnNpb24gICBzdHJpbmcgPSAi
djAuMC4wLW1hc3RlciszZGY1NGE4NTIzNCIKPiArICAgICAgIGdpdFZlcnNpb24gICBzdHJpbmcg
PSAidjAuMC4wLW1hc3RlciszZGY1NGE4NTIzIgo+ICAgICAgICAgIGdpdENvbW1pdCAgICBzdHJp
bmcgPSAiM2RmNTRhODUyMzQ1YWUxMjdkMWZhMzA5MmI5NTE2OGU0YTg4ZTJmOCIgLy8gc2hhMSBm
cm9tIGdpdCwgb3V0cHV0IG9mICQoZ2l0IHJldi1wYXJzZSBIRUFEKQo+ICAgICAgICAgIGdpdFRy
ZWVTdGF0ZSBzdHJpbmcgPSAiIiAgICAgICAgICAgIC8vIHN0YXRlIG9mIGdpdCB0cmVlLCBlaXRo
ZXIgImNsZWFuIiBvciAiZGlydHkiCj4gCj4gU28gdGhlIGdpdFZlcnNpb24gZmllbGQgbG9zdCBh
IGRpZ2l0LiBObyBpZGVhIGhvdyB0aGlzIGNvdWxkCj4gaGFwcGVuLiBMb29raW5nIGF0IHRoZSBm
aWxlIGluIHRoZSBnaXQgcmVwbyBJIHNlZSB0aGF0IHRoaXMgaXMgbGlzdGVkCj4gYXM6Cj4gCj4g
CWdpdFZlcnNpb24gICBzdHJpbmcgPSAidjAuMC4wLW1hc3RlciskRm9ybWF0OiVIJCIKPiAJZ2l0
Q29tbWl0ICAgIHN0cmluZyA9ICIkRm9ybWF0OiVIJCIgLy8gc2hhMSBmcm9tIGdpdCwgb3V0cHV0
IG9mICQoZ2l0IHJldi1wYXJzZSBIRUFEKQoKICBXZWlyZCwgJUggc2hvdWxkIGV4cGFuZCB0byB0
aGUgZnVsbCBjb21taXQgaGFzaCAtIGxpa2Ugb24gdGhlIGdpdENvbW1pdCAKbGluZS4uLiBIb3cg
dGhlIGhlbGwgZG9lcyBnaXQgYXJjaGl2ZSBleHBhbmQgJUggZGlmZmVyZW50bHkgaW4gb25lIGxp
bmUgYW5kIHRoZSAKb3RoZXI/CgogIEFhaCwgaXQgd2FzIGNoYW5nZWQgZnJvbSAlaCB0byAlSCBp
biBbMV0uCgogIEJ1dCB0aGF0IGVhc2lseSBleHBsYWlucyB0aGUgaXNzdWU6IHRoZSBsZW5ndGgg
b2YgdGhlIGFiYnJldmlhdGVkIGNvbW1pdCBoYXNoIApkZXBlbmRzIG9uIHRoZSBzdGF0ZSBvZiB0
aGUgcmVwby4gVGh1cywgc29tZSBnYyBvbiBnaXRodWIgbWF5IGhhdmUgZHJvcHBlZCBhIApjb25m
bGljdGluZyByZWYgKHNvbWV3aGVyZSBlbHNlKSBzbyB0aGUgbGVuZ3RoIG9mIHRoZSBhYmJyZXZp
YXRlZCBoYXNoIGlzIApyZWR1Y2VkIGFnYWluLgoKICBUaGVyZSdzIG5vdCBtdWNoIHdlIGNhbiBk
byBhYm91dCB0aGlzIEknbSBhZnJhaWQsIG90aGVyIHRoYW4gdXNpbmcgZ2l0IApkb3dubG9hZCBp
bnN0ZWFkIG9mIHRhcmJhbGwgZG93bmxvYWQuIE9yIHVwZGF0aW5nIHRvIGEgdmVyc2lvbiB0aGF0
IGNvbnRhaW5zIFsxXSAKb2YgY291cnNlLgoKICBSZWdhcmRzLAogIEFybm91dAoKWzFdIApodHRw
czovL2dpdGh1Yi5jb20vY29udGFpbmVyZC9jb250YWluZXJkL2NvbW1pdC9lNjM0ZjA0ZDhjZGI2
YzJmOTZlZWEyZTRlNjZkMGU0NTAwYTQ2MjgyCgoKCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2Nv
bnRhaW5lcmQvY29udGFpbmVyZC9ibG9iL21haW4vdmVuZG9yL2s4cy5pby9jbGllbnQtZ28vcGtn
L3ZlcnNpb24vYmFzZS5nbwo+IAo+IFNvIEkgZ3Vlc3Mgc29tZXRoaW5nIGluIGdpdGh1YiBpcyB3
cm9uZ2x5IGV4cGFuZGluZyB0aGlzICRGb3JtYXQ/CgoKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
