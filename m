Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3878FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 15:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE438445F;
	Sat,  9 Apr 2022 15:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bT2TnOf3Jpa; Sat,  9 Apr 2022 15:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E00184348;
	Sat,  9 Apr 2022 15:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 601BE1BF3DE
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 15:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A3840320
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 15:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fHZOQid8SoU for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 15:50:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 367A040187
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 15:50:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r13so22789154ejd.5
 for <buildroot@buildroot.org>; Sat, 09 Apr 2022 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DcAFJsvJUCNCkAuhs6jeb2p9HVTSc/ZjdoZfbmr51z0=;
 b=N45SDrOne+vkVZNRDwOSv6vfanwGF0n9nmoIebH2sPzNbDniLZoUYHQ+hqSprOxJ+p
 FACR+NMXuzNfaix4Z24lmTPAtGiXvM+rcJlfj5aQPkhYAxj2WTxzxsWda6qvEu0Mmqbj
 4K/ejMdtE9vaamyKSNOWD2BTKMIcbLy1XDgsqWSj0BLrGhrYSx2E22uJShuQpK/dBNwk
 rmY6wkFzoIXAE9WxTCn8hwQec058LrtPbrUmA9qqLnRrKMWm3sBQL33fgMafUTYHAo9Q
 NrbCJPkmAvswYY2y2Xk7aquUHjF60tSDMPeqginDqm8Pa0h3iU0dTGkNGabNa3Vqtxdf
 jVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DcAFJsvJUCNCkAuhs6jeb2p9HVTSc/ZjdoZfbmr51z0=;
 b=cFy4GUP73gBeFDHe5jFBQTrk2V0O5sQgRUVpxcAy5lex6T+BVAr2wyoRpFpNZBZkXb
 FHKfZJb+0B2I1cAfccG9+74UHlZqTk1ZePsEhA9eUPRkNEb2uh7NquJTXi6oalnKf2X1
 YRqW7R+9TOs+I2vu4oV2/uyG6JKhOYdHa1DOmUgtl6mFmfsW0dIfxcAp0R5LaJLCaQ0a
 jPfZfdTHH42NjPuP4vB8jgtiZ0U3zDbWvCtU1YW7hIclUmAn3PPHlUrHLXPZvolmn108
 wi9iElfv/G7y7AZFC47iXuDWQLVAjGPO41cJg6eFs6TmH2HB9chjFX5OmOPyQnCPlxYt
 kaBw==
X-Gm-Message-State: AOAM533G12JWBcg2csRT9gj1XxDooQWwt6Jdcnyk1ZeohUGp8d5UTuWr
 XHtRxTGVWMtT97N1niPrSFXgrQ==
X-Google-Smtp-Source: ABdhPJw5EGdFKWX/SRjE1EMqRtsOTs0DE3rEaacoXA5Rt/cCGOKh94NM42AhtLqzTpWcrFMgaIPVOw==
X-Received: by 2002:a17:907:1b1f:b0:6e4:b202:db68 with SMTP id
 mp31-20020a1709071b1f00b006e4b202db68mr23786441ejc.294.1649519442057; 
 Sat, 09 Apr 2022 08:50:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a170906769200b006e7fc91251esm6059338ejm.215.2022.04.09.08.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:50:41 -0700 (PDT)
Message-ID: <8857e367-45d4-12b9-ec87-7c9e918c772c@mind.be>
Date: Sat, 9 Apr 2022 17:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220405163540.9277-1-fontaine.fabrice@gmail.com>
 <f9f85a6c-9c40-a36d-faaa-9b86dcbc02ed@mind.be>
 <CAPi7W80yZee_5ZwcxXOHFreV6Z8k8QyzThD_dL-WxC94G97NnA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W80yZee_5ZwcxXOHFreV6Z8k8QyzThD_dL-WxC94G97NnA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libkcapi: fix build with
 BR2_OPTIMIZE_0
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wNC8yMDIyIDIwOjUwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IExlIG1hci4g
NSBhdnIuIDIwMjIgw6AgMTk6MjgsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5i
ZT4gYSDDqWNyaXQgOgo+Pgo+Pgo+Pgo+PiBPbiAwNS8wNC8yMDIyIDE4OjM1LCBGYWJyaWNlIEZv
bnRhaW5lIHdyb3RlOgo+Pj4gT3ZlcnJpZGUgQ09NTU9OX0NQUEZMQUdTIHRvIGZpeCB0aGUgZm9s
bG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aAo+Pj4gQlIyX09QVElNSVpFXzAgcmFpc2VkIHNpbmNl
IGJ1bXAgdG8gdmVyc2lvbiAwLjE0LjAgaW4gY29tbWl0Cj4+PiBjZDcwN2E5MTEyZTM4YjRjZTk4
MzI2Yjk2YzBlZDEyMDU0Y2ExY2NhIGFuZAo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3NtdWVsbGVy
REQvbGlia2NhcGkvY29tbWl0LzBlN2IyYjAzMDA3ODJhY2ExOWMzMjRmMzM1MmYxMDk3NzdiNGM1
MWE6Cj4+Pgo+Pj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xNS9vdXRwdXQt
MS9ob3N0L2k2ODYtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1
cmVzLmg6NDEyOjQ6IGVycm9yOiAjd2FybmluZyBfRk9SVElGWV9TT1VSQ0UgcmVxdWlyZXMgY29t
cGlsaW5nIHdpdGggb3B0aW1pemF0aW9uICgtTykgWy1XZXJyb3I9Y3BwXQo+Pgo+PiAgICBJIGhh
dmVuJ3QgbG9va2VkIGF0IHRoZSBkZXRhaWxzLCBidXQgaW4gdGhpcyBjYXNlIGl0IHNlZW1zIHRv
IG1lIHRoZSBwcm9wZXIKPj4gc29sdXRpb24gaXMgdG8gbWFrZSBzdXJlIF9GT1JUSUZZX1NPVVJD
RSBpcyBub3QgZW5hYmxlZC4KPj4KPj4gICAgQnV0IHBlcmhhcHMgdGhhdCBpcyBleGFjdGx5IHdo
YXQgdGhpcyBwYXRjaCBkb2VzPwo+IAo+IFRoaXMgcGF0Y2ggd2FzIHJlbW92aW5nIHRoZSBmb2xs
b3dpbmcgZmxhZ3MgKGluY2x1ZGluZyAtV2Vycm9yKToKPiBDT01NT05fQ1BQRkxBR1MgPSAtV2V4
dHJhIC1XYWxsIC1wZWRhbnRpYyAtZndyYXB2IC0tcGFyYW0KPiBzc3AtYnVmZmVyLXNpemU9NCAt
TzIgLVdlcnJvciAtc3RkPWdudTk5IC1XY29udmVyc2lvbgoKICAtZndyYXB2IGlzIHNvbWV0aGlu
ZyB0aGF0IGNlcnRhaW5seSBzaG91bGQgKm5vdCogYmUgcmVtb3ZlZC4gLXN0ZD1nbnU5OSBhcyAK
d2VsbC4gLS1wYXJhbSBzc3AtYnVmZmVyLXNpemU9NCBpcyBhIGJpdCBkdWJpb3VzIChJICp0aGlu
ayogaXQgb25seSBoYXMgYW4gCmVmZmVjdCBpZiBTU1AgaXMgZW5hYmxlZCB3aXRoIGFub3RoZXIg
b3B0aW9uKS4gLU8yIGlzIHNvbWV0aGluZyB0aGF0IHdlIHJlYWxseSAKZG8gd2FudCB0byBvdmVy
cmlkZSwgYnV0IGlmIENGTEFHUyBpcyBhZGRlZCBhZnRlciBpdCwgaXQncyBmaW5lLiBBbmQgSSBn
dWVzcyAKdGhhdCdzIHdoYXQgaGFwcGVucywgb3RoZXJ3aXNlIHRoZSBlcnJvciB5b3UncmUgdHJ5
aW5nIHRvIGZpeCB3b3VsZG4ndCBvY2N1ci4KCj4gCj4gSG93ZXZlciwgLURfRk9SVElGWV9TT1VS
Q0U9MiB3YXMgc3RpbGwgc2V0IChpbiBDUFBGTEFHUykKCiAgV2UgcmVhbGx5IG9ubHkgd2FudCBG
T1JUSUZZIGlmIGl0J3MgZW5hYmxlZCBieSBCdWlsZHJvb3QsIGJlY2F1c2Ugb2YgCkJSMl9GT1JU
SUZZX1NPVVJDRV9BUkNIX1NVUFBPUlRTIChhbmQgYmVjYXVzZSBvcHRpbWlzYXRpb25zIG11c3Qg
YmUgZW5hYmxlZCAKYmVmb3JlIGl0IGNhbiBiZSB1c2VkLCBvYnZpb3VzbHkpLgoKCj4gSSBjYW4g
c2VuZCBhIHYyIHRvIHNldCBDUFBGTEFHUyB0byAkKFRBUkdFVF9DUFBGTEFHUykgaWYgeW91IHBy
ZWZlcgo+IHRoaXMgc29sdXRpb24uCgogIFllYWgsIEkgdGhpbmsgdGhhdCdzIHRoZSB3YXkgdG8g
Z28uIEJUVyBpcyBpdCByZWFsbHkgQ1BQRkxBR1M/IC1PMiBhbmQgLWZ3cmFwdiAKcmVhbGx5IGJl
bG9uZyB0byBDRkxBR1MsIG5vdCBDUFBGTEFHUy4gTm90IHRoYXQgaXQgbWF0dGVycyBtdWNoIEkg
Z3Vlc3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+Pgo+PiAgICBSZWdhcmRzLAo+PiAgICBB
cm5vdXQKPj4KPj4+Cj4+PiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCB1cHN0cmVhbSBhbHJlYWR5
IHJlamVjdGVkIGEgUFIgdG8gcmVtb3ZlCj4+PiAtV2Vycm9yOiBodHRwczovL2dpdGh1Yi5jb20v
c211ZWxsZXJERC9saWJrY2FwaS9wdWxsLzEzMgo+Pj4KPj4+IEZpeGVzOgo+Pj4gICAgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zNTE0MWVhMzA0NmY1YTQ1OTNlMGIy
N2VmOTJlNGFjZTZiYzBiZTY2Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgIHBhY2thZ2UvbGli
a2NhcGkvbGlia2NhcGkubWsgfCAxICsKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmtjYXBpL2xpYmtjYXBpLm1rIGIv
cGFja2FnZS9saWJrY2FwaS9saWJrY2FwaS5tawo+Pj4gaW5kZXggNzFkZmJkOWVmZi4uMzUzOTM5
YmIzMSAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvbGlia2NhcGkvbGlia2NhcGkubWsKPj4+ICsr
KyBiL3BhY2thZ2UvbGlia2NhcGkvbGlia2NhcGkubWsKPj4+IEBAIC0xNSw2ICsxNSw3IEBAIExJ
QktDQVBJX0NPTkZfRU5WID0gXAo+Pj4gICAgICAgIGFjX2N2X3BhdGhfREIyUERGPSIiIFwKPj4+
ICAgICAgICBhY19jdl9wYXRoX0RCMlBTPSIiIFwKPj4+ICAgICAgICBhY19jdl9wYXRoX1hNTFRP
PSIiCj4+PiArTElCS0NBUElfTUFLRV9PUFRTID0gQ09NTU9OX0NQUEZMQUdTPSIiCj4+Pgo+Pj4g
ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJLQ0FQSV9FTkNBUFApLHkpCj4+PiAgICBMSUJLQ0FQ
SV9DT05GX09QVFMgKz0gLS1lbmFibGUta2NhcGktZW5jYXBwCj4gCj4gQmVzdCBSZWdhcmRzLAo+
IAo+IEZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
