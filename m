Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07026C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 936C681A29;
	Tue, 22 Feb 2022 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8klHAIfTcrn; Tue, 22 Feb 2022 10:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79EA81767;
	Tue, 22 Feb 2022 10:41:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0496F1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17BA4019A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIoVjPG__MkQ for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5A3D40137
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:41:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso1430070wmj.2
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FXuouu/35jXEQ3SJugsFIx3aHeRGZv4Gxe76yT0zais=;
 b=Mbls2JcCcjZZ0NIpXj1xd+Xg4oN+lJtf9BCzryta4+D/7uAMHH71CFW2dbFBeJFDXy
 CZws+tExtS76Sqol9Forq7XRm0dzzV3BM0DVVo+8Tj70t93muq5tDlgRLH+x2lRYLNkQ
 ZHVMth/mExmN96hSK/gHM8xsYdUhuLEU5DvbbGdUFR9qDwVZxqd8vx9Ya/Yr4SvpnXex
 V87hQ8cLCF8WcvAq1j22tgjnNTMH+wJ6ReP2oady6qNjNAZVy/YUcK8s1eeWtBPGF7+v
 dWKsfSz2ErsHNMit50pB87Oc5Ou1D676vY5GWlao6gVol+4nrTe+6r4X/QczdPEZVD6Q
 3csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FXuouu/35jXEQ3SJugsFIx3aHeRGZv4Gxe76yT0zais=;
 b=aGCs9+1LkK11QeYcqwTeBFB9s65VPninxySrlp10j5Igaxwa5eU4Npy74FOY/P5Ltw
 mvkpJGuvhkm9JI+2NtQ2L+SjuZcb+d93meOu0y8dadkOM8I8Ip8JNbesByZxAH9HieY0
 F/K/v5kYzpRIN2FKDCAcBP38ki2x2+ffBvo/mk8NWzicTQ/si+Oi2sXCHpolFIQjFeKG
 9UK6Og5wrAcTwwoxU6IpNWh13wQVy8ZXj9NMz9xj3bmLY4zQmf9u8eur3iTrL3+cj0jo
 wUVGK6eUgMNaPwa48qkf9iVYrh0j63rW2DXIF3hhwHFr9g/8qeH4gs1N/GUXc90GMUyW
 dZHg==
X-Gm-Message-State: AOAM5307DmxutC1SgiAPAeDUqkeFbLSNsq/P4EQtNAFtVo2JP69eLxP/
 CQvZ/ltd+LgtoLvAftkXWds=
X-Google-Smtp-Source: ABdhPJxRPMHC0taYsnv3uQMEu60HoPcWlLmccxPEgT6ywHffZQOWNOAd6sMVscm9vh9flt97DRdRng==
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr2789472wmj.98.1645526502745; 
 Tue, 22 Feb 2022 02:41:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b0037e9090fb1esm2171731wms.24.2022.02.22.02.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 02:41:42 -0800 (PST)
Message-ID: <8785e132-e840-c571-7258-943c9da77a7c@gmail.com>
Date: Tue, 22 Feb 2022 11:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220221230640.2203877-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220221230640.2203877-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-treq: fix dependencies
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDIyLzAyLzIwMjIgw6AgMDA6MDYsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBweXRob24tdHJlcSBuZWVkcyBUTFMgc3VwcG9ydCBpbiB0d2lzdGVkIHNv
IHNlbGVjdAo+IEJSMl9QQUNLQUdFX1BZVEhPTl9UV0lTVEVEX1RMUyBtb3Jlb3ZlciBpdCBkb2Vz
bid0IGRlcGVuZCBkaXJlY3RseSBvbgo+IHNlcnZpY2VfaWRlbnRpdHkgYW5kIHB5T3BlblNTTCBz
aW5jZSB2ZXJzaW9uIDE3LjMuMCBhbmQKPiBodHRwczovL2dpdGh1Yi5jb20vdHdpc3RlZC90cmVx
L2NvbW1pdC9lZjJhYzdlYTJiNzQ3NzRhZGI5ZmVmNzY3NWZhY2M2MDE3YmZkYTg5Cj4gCj4gRmlu
YWxseSwgcHl0aG9uLWlkbmEgd2FzIG5ldmVyIGEgZGlyZWN0IGRlcGVuZGVuY3kgb2YgcHl0aG9u
LXRyZXEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbT4KCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhv
bi10cmVxL0NvbmZpZy5pbiB8IDcgKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi10
cmVxL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXRyZXEvQ29uZmlnLmluCj4gaW5kZXggZjc4
MWIzNzMwNS4uN2MwMmEzNTYzOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi10cmVxL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXRyZXEvQ29uZmlnLmluCj4gQEAgLTEsMTYg
KzEsMTMgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9UUkVRCj4gIAlib29sICJweXRo
b24tdHJlcSIKPiAtCSMgcHl0aG9uLXB5b3BlbnNzbCAtPiBweXRob24tY3J5cHRvZ3JhcGh5Cj4g
KwkjIHR3aXN0ZWQgVExTIC0+IHB5dGhvbi17cHlvcGVuc3NsLHNlcnZpY2UtaWRlbnRpdHl9Cj4g
IAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMK
PiAtCSMgcHl0aG9uLWlkbmEsIHB5dGhvbi1weW9wZW5zc2wgLT4gcHl0aG9uLWNyeXB0b2dyYXBo
eQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9BVFRSUyAjIHJ1bnRpbWUKPiAtCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fSUROQSAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT05fSU5DUkVNRU5UQUwgIyBydW50aW1lCj4gLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlU
SE9OX1BZT1BFTlNTTCAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUkVR
VUVTVFMgIyBydW50aW1lCj4gLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NFUlZJQ0VfSURF
TlRJVFkgIyBydW50aW1lCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJWCAjIHJ1bnRp
bWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFdJU1RFRCAjIHJ1bnRpbWUKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFdJU1RFRF9UTFMgIyBydW50aW1lCj4gIAloZWxwCj4g
IAkgIHRyZXEgaXMgYW4gSFRUUCBsaWJyYXJ5IGluc3BpcmVkIGJ5IHJlcXVlc3RzIGJ1dCB3cml0
dGVuIG9uCj4gIAkgIHRvcCBvZiBUd2lzdGVkJ3MgQWdlbnRzLiBJdCBwcm92aWRlcyBhIHNpbXBs
ZSwgaGlnaGVyIGxldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
