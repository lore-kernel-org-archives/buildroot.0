Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35148C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFECE840D1;
	Mon,  6 Jun 2022 09:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWEvd1Eg1q5v; Mon,  6 Jun 2022 09:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC8984026;
	Mon,  6 Jun 2022 09:45:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA44D1BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E71EE84026
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkolp0nExHLr for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:45:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0EF484017
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:45:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso1771888wml.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mYAfwFehN5ES44h2hPid3iTZwDBRrVbval0bP2+bWpw=;
 b=Ijkz6/4QDQx1Lr4kSTHHeyDsRBr/aWCKDYrnG7HcTSksQmdBw8j3LHNjo7tuHY3MUG
 NKbezDjbaazdRfS9IcB/9Foz9HZWi3yPz+vazFoUx8U+uGOka7vbKRqpnc84/Qz8nAI7
 W6RQqwMOnK95IyU/3IorUh+WrESCl5CPUl63xoNrI97K1EtBM1q9FXnUW1wlCV3DbV32
 Cs6HI7xWkHjDESMlVqv2HLB1IQvFdgjuHv1OwEo6WL+FDRkI1tbR3CdrcF5fdUfAhRCD
 Oi+oe1qIhjMpe3CXyYaSbH8kv8o5jC/ydCssBNeti1ud8+JMO0Kuo13ExnYlE/bDpnFM
 cDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mYAfwFehN5ES44h2hPid3iTZwDBRrVbval0bP2+bWpw=;
 b=0KTUUg/hSS6nWHKchg9oHu7Pn2OgiwOpw8EigPvj1AQtPPp33ZWbEymbBuTZg0u+au
 a3GTn5lkV6AbEv70+sH44mrxcRgfhVzjx815hvOJM9ddbdmp93YQfITibMiXOG5y7lG9
 6YLohK88eTNbs57XzHcfKM+XrgHaxrzZtVbaVRCdyrAHvNhPxZOZG+6yESPRYxH7fhMd
 G444bbr1zKKJJU37cCnrgZCSU/Lakftfgrk6m4qLgy//MJwz6JY2Xy4zwAFaOZ+GgpjZ
 ScQHIO2pPHGHmJt2g/QRiJWX48mOSAUSEIrTXUgPM2SjmVDVZkzcXe4EtNUYI2jAbOSm
 aBvA==
X-Gm-Message-State: AOAM530PqaReet3YBGhJqZuH+7Bn3PfnxN13K2dEWl9Al31Y+zGy/+sP
 I7hfblswNCX/IHaCGLgtzP4=
X-Google-Smtp-Source: ABdhPJwmD4SpEMsr1JJLCQXCMk5DB77S/XGEy369fHJUfP36KNVHCYj2n6S2DfMIlXRNSaTcvtGWpQ==
X-Received: by 2002:a05:600c:ac4:b0:39c:4f54:9c5f with SMTP id
 c4-20020a05600c0ac400b0039c4f549c5fmr3863682wmr.135.1654508743048; 
 Mon, 06 Jun 2022 02:45:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1c2703000000b0039c4b518df4sm5595785wmn.5.2022.06.06.02.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 02:45:42 -0700 (PDT)
Message-ID: <2e10038a-fd1d-8608-3178-5b0e6b0ae419@gmail.com>
Date: Mon, 6 Jun 2022 11:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
 <20220605194259.2928568-6-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220605194259.2928568-6-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 5/7] arch/Config.in.powerpc: disable some
 variants on ppc64le
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
Cc: Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMDUvMDYvMjAyMiDDoCAyMTo0MiwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gRm9sbG93aW5nIGNvbW1pdAo+IGU1OWIzYWNjMzYw
M2U1NWZiYWVjMjU0MDYyNThlYzljYTk2MjM1NjQgKCJ0b29sY2hhaW4vZ2xpYmM6IFJlc3RyaWN0
Cj4gcHBjNjRsZSBzdXBwb3J0IHRvIHBvd2VyOCIpLCB3aGVuIHNlbGVjdGluZyBwcGM2NGxlIGFz
IHRoZQo+IGFyY2hpdGVjdHVyZSwgaXQgaXMgcG9zc2libGUgdG8gZW5kIHVwIHdpdGggYSBzZWxl
Y3Rpb24gZm9yIHdoaWNoIG5vIEMKPiBsaWJyYXJ5IGlzIHByb3ZpZGVkLgo+IAo+IEluZGVlZDoK
PiAKPiAgLSBnbGliYyBvbmx5IHN1cHBvcnRzIFBvd2VyOAo+ICAtIHVjbGliYyBoYXMgbm8gc3Vw
cG9ydCBmb3IgcHBjNjRsZSBhdCBhbGwKPiAgLSBtdXNsIG9ubHkgc3VwcG9ydHMgcHBjNjRsZSBw
cm9jZXNzb3JzIHRoYXQgaGF2ZSBBbHRpdmVjIHN1cHBvcnQKPiAKPiBUaGVyZWZvcmUsIHRoaXMg
Y29tbWl0IGFkZHMgImRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZSIgdG8gdGhvc2UKPiBQb3dl
clBDIGFyY2hpdGVjdHVyZSB2YXJpYW50cyBmb3Igd2hpY2ggbm8gQyBsaWJyYXJ5IHN1cHBvcnQg
ZXhpc3RzLgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvM2Y2ZmIxYzJkNTY0OGU3OGY3ODU2YmRlYTMxNzFiNWE4OWRmYTJmOS8KCk5vdCBy
ZWxhdGVkIHRvIHRoaXMgcGF0Y2ggYnV0IGl0IHNlZW1zIHRoYXQgdUNsaWJjLW5nIG9ubHkgc3Vw
cG9ydCBwb3dlcnBjCihCUjJfcG93ZXJwYykgd2l0aG91dCBBTFRJVkVDIHN1cHBvcnQgKCFCUjJf
UE9XRVJQQ19DUFVfSEFTX0FMVElWRUMpLgoKQXMgc29vbiBhcyBCUjJfUE9XRVJQQ19DUFVfSEFT
X0FMVElWRUMgaXMgc2V0LCB0aGUgdWNsaWJjLW5nIGJ1aWxkIGR1ZSBhCmNvbmZsaWN0aW5nIHR5
cGVzIGZvciAnZWxmX3ZycmVnX3QnOgoKaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jl
c3VsdHMvMDg0LzA4NGJkMWRmNWNmMTBjODE2NDZkNmVkZjAxZjUzNDdhMzVmYzllNmIvYnVpbGQt
ZW5kLmxvZwoKVGhpcyB3YXMgbm90IG5vdGljZWQgYnkgVG9vbGNoYWluLWJ1aWxkZXIgcHJvamVj
dCBzaW5jZSBpdCBvbmx5IGJ1aWxkIHBvd2VycGMKY29uZmlndXJhdGlvbiB3aXRob3V0IGFsdGl2
ZWMgc3VwcG9ydCAoZTMwMGMzLCA0NDBmcCwgZTUwMG1jKS4KCmh0dHBzOi8vdG9vbGNoYWlucy5i
b290bGluLmNvbS9kb3dubG9hZHMvcmVsZWFzZXMvdG9vbGNoYWlucy9wb3dlcnBjLWUzMDBjMy9m
cmFnbWVudHMvcG93ZXJwYy1lMzAwYzMtLXVjbGliYy0tYmxlZWRpbmctZWRnZS0yMDIwLjA4LTEu
ZnJhZwoKU3VycHJpc2luZ2x5LCBpdCBhbHNvIGZhaWwgd2l0aCBwb3dlcjQgYW5kIHBvd2VyNSB3
aGVyZQpCUjJfUE9XRVJQQ19DUFVfSEFTX0FMVElWRUMgaXMgbm90IHNldCBidXQgd2l0aCB0aGUg
c2FtZSBlcnJvci4KCkl0IHNlZW1zIGJyb2tlbiBzaW5jZSBhbHdheXMsIHdlIHNob3VsZCByZXN0
cmljdCB1Q2xpYmMtbmcgdG8gYWxsIGtub3cgd29ya2luZwpjb25maWd1cmF0aW9uLgoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGFyY2gvQ29uZmlnLmluLnBvd2Vy
cGMgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluLnBvd2VycGMgYi9hcmNoL0NvbmZpZy5pbi5w
b3dlcnBjCj4gaW5kZXggMjcyZjY2ZjRlNy4uYzQ4ZWRkM2JiNCAxMDA2NDQKPiAtLS0gYS9hcmNo
L0NvbmZpZy5pbi5wb3dlcnBjCj4gKysrIGIvYXJjaC9Db25maWcuaW4ucG93ZXJwYwo+IEBAIC0x
NCw2ICsxNCw4IEBAIGNob2ljZQo+ICAJICBTcGVjaWZpYyBDUFUgdmFyaWFudCB0byB1c2UKPiAg
Y29uZmlnIEJSMl9nZW5lcmljX3Bvd2VycGMKPiAgCWJvb2wgImdlbmVyaWMiCj4gKwkjIE5vIEMg
bGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+ICsJZGVwZW5kcyBvbiAh
QlIyX3Bvd2VycGM2NGxlCj4gIGNvbmZpZyBCUjJfcG93ZXJwY180MDEKPiAgCWJvb2wgIjQwMSIK
PiAgCWRlcGVuZHMgb24gIUJSMl9BUkNIX0lTXzY0Cj4gQEAgLTY0LDggKzY2LDEyIEBAIGNvbmZp
ZyBCUjJfcG93ZXJwY182MDRlCj4gIAlkZXBlbmRzIG9uICFCUjJfQVJDSF9JU182NAo+ICBjb25m
aWcgQlIyX3Bvd2VycGNfNjIwCj4gIAlib29sICI2MjAiCj4gKwkjIE5vIEMgbGlicmFyeSBzdXBw
b3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+ICsJZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2
NGxlCj4gIGNvbmZpZyBCUjJfcG93ZXJwY182MzAKPiAgCWJvb2wgIjYzMCIKPiArCSMgTm8gQyBs
aWJyYXJ5IHN1cHBvcnRzIHRoaXMgdmFyaWFudCBvbiBwcGM2NGxlCj4gKwlkZXBlbmRzIG9uICFC
UjJfcG93ZXJwYzY0bGUKPiAgY29uZmlnIEJSMl9wb3dlcnBjXzc0MAo+ICAJYm9vbCAiNzQwIgo+
ICAJZGVwZW5kcyBvbiAhQlIyX0FSQ0hfSVNfNjQKPiBAQCAtMTE4LDggKzEyNCwxMiBAQCBjb25m
aWcgQlIyX3Bvd2VycGNfZTY1MDAKPiAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX0FMVElW
RUMKPiAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyNAo+ICAJYm9vbCAicG93ZXI0Igo+ICsJIyBO
byBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPiArCWRlcGVuZHMg
b24gIUJSMl9wb3dlcnBjNjRsZQo+ICBjb25maWcgQlIyX3Bvd2VycGNfcG93ZXI1Cj4gIAlib29s
ICJwb3dlcjUiCj4gKwkjIE5vIEMgbGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBj
NjRsZQo+ICsJZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4gIGNvbmZpZyBCUjJfcG93ZXJw
Y19wb3dlcjYKPiAgCWJvb2wgInBvd2VyNiIKPiAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFT
X0FMVElWRUMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
