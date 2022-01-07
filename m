Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B91C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E221183DF2;
	Fri,  7 Jan 2022 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfcMGT3aVEkz; Fri,  7 Jan 2022 10:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC4183281;
	Fri,  7 Jan 2022 10:08:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 954971BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84023414C4
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vATbFbs5nm83 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:08:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84888410DC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:08:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so2412635wmn.5
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VEVPVIr5IUvJuaUGBg9n9cdp8K4KWq31exo6W9z1Md8=;
 b=olMaq5BUoYBOuiEY3u2fVNPCmLLFEsGhwtDZG7/050RrJaYxu825M2W+pkQUKaLCxH
 Ca+rrZcsM5LfCF8KwHTLnREDVdBaV06ZbDiIsXUDG67i82MZ33TJhNZOjg/RiRRnxBOm
 3VYHT5NheC+qo5i3YKqET6kQbgPwMZHkTFVgR+gTBbu6kWu6xXdO4Te3V4QwbH8fCJbr
 r3zz55ZMgLeYb2Xt5gUCI6VIvfAfoDalAu4jG3mAYEyKnGuItSptYBM2ApcKef44oajI
 Uo1y09Y1k3H/6BxveaqV36fabZ3F07ykaca8hBBsV4d2Oy//2B0IUxbbbTIAqiLvNdqO
 hHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VEVPVIr5IUvJuaUGBg9n9cdp8K4KWq31exo6W9z1Md8=;
 b=2LAp1Nk/HEru6Km8p4P+ACvXOKubvjxEu5Rbo7MBbI2W8vo+ty7QA+dpWxAkH8m/6D
 rNSAozyr6+Jg16y7Qe4W0CVQeg1+0b2CVUUMl7XRPtVGbvYU+tudAniL8+jkYqkt71FJ
 E6dr3MfXoe+0yGOtFe4atTGj2Tq4hRwkH0Q2X0DIJjrzJxllDx3Cl7347RGNoaKt1lM2
 gsI3wvcDEjDIsL593AGOtVBlat8k/Qum7EoIvk472Q1YG62DzgF5Y4oKBNmYdlRNXbo+
 61tP6i/7TuZtcOomMWWK0AES0wd10M0rHDLp8YzOOlOHm7XdVPwKHCddNUgswsyLDris
 uZYQ==
X-Gm-Message-State: AOAM53191lmYUZKrxRintQG3BzrQgzeXZ5/eDNZ3YmaxXgHbaWaCxKsh
 2nAosOQlAdqi3B/B3SPs/z8cug==
X-Google-Smtp-Source: ABdhPJxGzK1LWhcU/0MhAdq7p1bmhtlh33EV7ud/TzWabGO9Mic7vkWWEAaondd9QqSxNbyo3DA4Lw==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr3783154wma.79.1641550102811; 
 Fri, 07 Jan 2022 02:08:22 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id g6sm4457289wri.67.2022.01.07.02.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:08:22 -0800 (PST)
Message-ID: <0ebbe6b2-2932-862f-52a1-a34ab7d0f11e@smile.fr>
Date: Fri, 7 Jan 2022 11:08:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220107090348.3947187-1-romain.naour@smile.fr>
 <20220107110522.523586ae@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220107110522.523586ae@windsurf>
Subject: Re: [Buildroot] [PATCHv4] package/bat: new package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 David Pierret <david.pierret@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDcvMDEvMjAyMiDDoCAxMTowNSwgVGhvbWFzIFBldGF6em9uaSBhIMOpY3JpdMKgOgo+IEhl
bGxvLAo+IAo+IE9uIEZyaSwgIDcgSmFuIDIwMjIgMTA6MDM6NDggKzAxMDAKPiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4gCj4+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3BrZy1jYXJnby5tayBiL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4+IGluZGV4IGJmMTQzNmE4
NmIuLmUyZmUxMDRjZjMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4+ICsr
KyBiL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4+IEBAIC0xMTAsNiArMTEwLDcgQEAgaWZuZGVmICQo
MilfSU5TVEFMTF9UQVJHRVRfQ01EUwo+PiAgZGVmaW5lICQoMilfSU5TVEFMTF9UQVJHRVRfQ01E
Uwo+PiAgCWNkICQkKEBEKSAmJiBcCj4+ICAJJCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkKDIpX0NB
UkdPX0VOVikgXAo+PiArCQlDQ18kJChzdWJzdCAtLF8sJCQoUlVTVENfVEFSR0VUX05BTUUpKT0k
JChUQVJHRVRfQ0MpIFwKPiAKPiBCdXQgd2UgZG9uJ3QgZXZlbiBwYXNzIHRoaXMgdmFyaWFibGUg
YXQgYnVpbGQgdGltZS4uIHdoeSB3b3VsZCBpdCBiZQo+IG5lZWRlZCBhdCBpbnN0YWxsIHRpbWU/
IER1ZSB0byB0aGUgZmFjdCB0aGF0ICJiYXIiIGJ1aWxkcyBzdHVmZiBkdXJpbmcKPiB0aGUgaW5z
dGFsbCBzdGVwLCBJIHVuZGVyc3RhbmQgdGhhdCB3ZSBtaWdodCBuZWVkIGV4dHJhIHZhcmlhYmxl
IGR1cmluZwo+IHRoZSBpbnN0YWxsYXRpb24gc3RlcCwgYnV0IEkgd291bGQgZXhwZWN0IHRvIG9u
bHkgbmVlZCB2YXJpYWJsZXMgdGhhdAo+IGFyZSBhbHJlYWR5IHBhc3NlZCBkdXJpbmcgdGhlIGJ1
aWxkIHN0ZXAuCgpJdCBzZWVtcyB3ZSBqdXN0IG5lZWQgdG8gYWRkICQkKFRBUkdFVF9DT05GSUdV
UkVfT1BUUykgdG8gX0lOU1RBTExfVEFSR0VUX0NNRFMKCmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9waXBlcm1haWwvYnVpbGRyb290LzIwMjItSmFudWFyeS82MzI2MTMuaHRtbAoKPiAKPiBBbnkg
aWRlYT8KPiAKPiBUaG9tYXMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
